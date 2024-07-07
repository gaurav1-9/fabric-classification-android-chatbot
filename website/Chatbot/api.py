from flask import Flask, jsonify, request
from flask_cors import CORS

# text processing
import re
import random
import nltk
from nltk.tokenize import word_tokenize

# image processing
import sys
sys.path.append('D:/code/7th_sem')
# sys.path.append('e:/Programming/VS CODE/Python/7th_sem')
from Classification.Test import VerificationOfMugaAndTassUsingCNN_save_model as ip
from Classification.Filters import flt

app = Flask(__name__)
CORS(app)


def text_processing(text):
    token = word_tokenize(text.lower())
    filtered_tokens = [word for word in token if word.isalnum()]
    normalized_text = [re.sub(r'(.)\1+$', r'\1', word)
                       for word in filtered_tokens]
    return normalized_text


def get_intent(tokens):
    greet_keyword = ['hello', 'hi', 'hey', 'start', 'initiate']
    bye_keyword = ['bye', 'goodbye', 'exit', 'terminate', 'end','close','stop','later']
    image_keyword = ['image', 'upload', 'picture', 'pic', 'img']
    webmaster_keyword = ['gaurav', 'wrishav','gkd']
    time_keyword = ['time','clock','date','month','day']

    intent = 'unknown'
    for token_item in tokens:
        if token_item in greet_keyword:
            intent='greet'
            break
        elif token_item in bye_keyword:
            intent= 'bye'
            break
        elif token_item in image_keyword:
            intent= 'image_upload'
            break
        elif token_item in webmaster_keyword:
            intent='web_master'
            break
        elif token_item in time_keyword:
            intent= 'time'
            break
        else:
            intent= 'unknown'

    return intent


def intent_response(intent):
    selected_value = random.randint(0, 4)
    if intent == 'greet':
        greet_response = [
            [
                ["Hello there!"],
                ["How can I assist you today?"]
            ],
            [
                ["Hi!"],
                ["How can I help you?"]
            ],
            [
                ["Hey, how's it going?"],
                ["What can I do for you?"]
            ],
            [
                ["Hey, nice to meet you!"],
                ["What can I assist you with today?"]
            ],
            [
                ["Hello!"],
                ["How can I be of service to you?"]
            ]
        ]
        return greet_response[selected_value % len(greet_response)], intent
    if intent == 'bye':
        bye_response = [
            ["Bye...happy to help"],
            ["Goodbye! Have a wonderful day ahead."],
            ["Goodbye!"],
            ["Take care and see you soon!"]
        ]
        return bye_response[selected_value % len(bye_response)], intent
    if intent == 'image_upload':
        return '', intent
    if intent == 'time':
        return '', intent
    if intent == 'web_master':
        web_master_response = [
            ['Ooh you know him too?'], 
            ['He is my creator...I owe my existence to him']
        ]
        return web_master_response, intent
    if intent == 'unknown':
        unknown_response = [
            ["I'm sorry, I don't have information on that."],
            ["I don't have the answer to that at the moment."],
            ["That's beyond my current knowledge."],
            ["I'm not equipped to handle that query right now."],
            ["I'm sorry, didn't understood your question"]
        ]
        return unknown_response[selected_value % len(unknown_response)], intent


@app.route("/chat", methods=['GET'])
def chatbot():
    text = request.args.get('text_value')
    processed_words = text_processing(text)
    intent = get_intent(processed_words)
    response, intent = intent_response(intent)

    chat_response = {
        'response_type': intent,
        'bot_response': response
    }
    return jsonify(chat_response)


@app.route("/image", methods=['GET'])
def img_response():
    file_name = request.args.get('image_name')
    image_response = ip.predict_loaded_model(file_name)

    processed_image_response = {
        'image_name': file_name,
        'bot_response': image_response
    }
    return jsonify(processed_image_response)


@app.route("/filter",methods=['GET'])
def filter_response():
    image_file_name = request.args.get('image_name')
    flt_response = flt.img_processing(image_file_name)
    app.logger.info(image_file_name)
    processed_flt_response = {
        'status': 'success'
    }
    return jsonify(processed_flt_response)

if __name__ == '__main__':
    host= '0.0.0.0'
    port=5000
    app.run(debug=True,host=host,port=port)

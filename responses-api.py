import os
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
from Classification import VerificationOfMugaAndTassUsingCNN_save_model as ip

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
    image_keyword = ['image', 'upload', 'picture', 'pic', 'img','textile']
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
                "Hello there!\nHow can I assist you today?",
                "Hi!\nHow can I help you?",
                "Hey, how's it going?\nWhat can I do for you?",
                "Hey, nice to meet you!\nWhat can I assist you with today?",
                "Hello!\nHow can I be of service to you?"
        ]
        return greet_response[selected_value % len(greet_response)], intent
    if intent == 'bye':
        bye_response = [
            "Bye...happy to help",
            "Goodbye!\nHave a wonderful day ahead.",
            "Goodbye!",
            "Take care and see you soon!"
        ]
        return bye_response[selected_value % len(bye_response)], intent
    if intent == 'image_upload':
        return '', intent
    if intent == 'web_master':
        web_master_response = 'Ooh you know him too?\nHe is my creator...\nI owe my existence to him'
        return web_master_response, intent
    if intent == 'unknown':
        unknown_response = [
            "I'm sorry,\nI don't have information on that.",
            "I don't have the answer\nto that at the moment.",
            "That's beyond my current\nknowledge.",
            "I'm not equipped to\nhandle that query right now.",
            "I'm sorry\nI didn't understood your question"
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


# @app.route("/image", methods=['GET'])
# def img_response():
#     file_name = request.args.get('image_name')

#     processed_image_response = {
#         'image_name': file_name,
#         'bot_response': image_response
#     }
#     return jsonify(processed_image_response)
@app.route("/image", methods=['POST'])
def img_response():
    if 'image' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['image']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    filename = os.path.join(r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_img', 'uploadedImage.jpg')
    file.save(filename)
    image_response_CNN = ip.predict_loaded_modelCNN()
    image_response_resNet = ip.predict_loaded_model_resNET()
    image_response_ViT = ip.predict_loaded_ViT_moddel()
    processed_image_response = {
        'bot_response_CNN': image_response_CNN,
        'bot_response_ViT': image_response_ViT[0],
        'bot_response_resNet': image_response_resNet[0],
        'acc_resNet': f"{100*image_response_resNet[1]:.3}",
        'acc_ViT': f"{image_response_ViT[1]:.4}"
    }
    return jsonify(processed_image_response)

if __name__ == '__main__':
    host= '192.168.43.246'
    port=65432
    app.run(debug=True,host=host,port=port)

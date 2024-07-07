import re
import random
import nltk
from nltk.tokenize import word_tokenize

# nltk.download('punkt')
# nltk.download('stopwords')


def text_processing(text):
    token = word_tokenize(text.lower())
    filtered_tokens = [word for word in token if word.isalnum()]
    normalized_text = [re.sub(r'(.)\1+$', r'\1', word)
                       for word in filtered_tokens]
    return normalized_text


def get_intent(tokens):
    greet_keyword = ['hello', 'hi', 'hey', 'start', 'initiate']
    bye_keyword = ['bye', 'goodbye', 'exit', 'terminate', 'end']
    image_keyword = ['image', 'upload', 'picture', 'pic', 'img']
    webmaster_keyword = ['gaurav', 'wrishav','gkd']
    time_keyword = ['time','clock']
    
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
            pintent='web_master'
            break
        elif token_item in time_keyword:
            intent= 'time'
            break
        else:
            intent= 'unknown'
        
    print(intent)
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


if __name__ == "__main__":
    while True:
        text = input("Enter text: ")
        processed_words = text_processing(text)
        intent = get_intent(processed_words)
        # print(intent_response(intent), end="\n\n")
        # print(intent, end="\n\n")
        print(processed_words,intent)

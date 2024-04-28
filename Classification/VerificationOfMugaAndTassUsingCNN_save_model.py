from keras.preprocessing import image
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from sklearn.metrics import roc_curve, auc

import os

def predict_loaded_modelCNN():
    cnn_model_save_path = 'D:/code/7th_sem/Classification/Test/saved_model/cnn_model.h5'
    loaded_model = load_model(cnn_model_save_path)
    input_image_path = r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_img\uploadedImage.jpg'
    img = image.load_img(input_image_path, target_size=(200, 200))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    images = np.vstack([x])

    prediction = loaded_model.predict(images, batch_size=10)

    if prediction[0] < 0.5 :
        print(prediction[0])
        return "This is an image of a Muga Fabric"
    else:
        print(prediction[0])
        return "This is an image of a Tass Fabric"

def predict_loaded_model_resNET():
    resnet_model_path = r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_model\resnet50_transfer_learning_model.h5'
    resnet_model = load_model(resnet_model_path)

    input_image_path = r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_img\uploadedImage.jpg'

    img = image.load_img(input_image_path, target_size=(200, 200))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    images = np.vstack([x])

    prediction = resnet_model.predict(images)
    print(prediction[0])

    return "This is an image of a Muga Fabric",float(prediction[0][prediction.argmax()])

if __name__ == '__main__':
    # Asus
    train_data_dir = 'D:/code/7th_sem/Fabric Dataset/'
    test_data_dir = 'D:/code/7th_sem/Fabric Dataset/'
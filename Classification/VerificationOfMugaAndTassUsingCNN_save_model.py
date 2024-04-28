from keras.preprocessing import image
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
import torch
from torchvision import transforms
from PIL import Image
from torch.utils.data import DataLoader
from torchvision import models, datasets

import os

def predict_loaded_modelCNN():
    cnn_model_save_path = r"D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_model\cnn_model.h5"
    loaded_model = load_model(cnn_model_save_path)
    input_image_path = r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_img\uploadedImage.jpg'
    img = image.load_img(input_image_path, target_size=(200, 200))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    images = np.vstack([x])

    prediction = loaded_model.predict(images, batch_size=10)

    if prediction[0] < 0.5 :
        print(prediction[0])
        return "Muga"
    else:
        print(prediction[0])
        return "Tass"

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

def predict_loaded_ViT_moddel():
    transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
    ])
    
    ViT_model_path = r"D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_model\ViT_savedModel.pth"
    model = models.vision_transformer.vit_b_16(pretrained=False)
    model.load_state_dict(torch.load(ViT_model_path))
    model.eval()

    input_image_path = r'D:\code\8th_Sem\fabric-classification-android-chatbot\Classification\saved_img\uploadedImage.jpg'

    image = Image.open(input_image_path)
    image = transform(image).unsqueeze(0)

    with torch.no_grad():
        outputs = model(image)

    softmax = torch.nn.Softmax(dim=1)
    probabilities = softmax(outputs).cpu().numpy()
    predicted_class = torch.argmax(outputs).item()

    print("{:.2f}".format(probabilities[0][predicted_class]*100),end='%')
    if(predicted_class==0):
        print("Predicted Class: Muga")
        return "Muga",float(probabilities[0][predicted_class])
    else:
        print("Predicted Class: Tass")
        return "Tass",float(probabilities[0][predicted_class])


if __name__ == '__main__':
    pass
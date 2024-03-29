from keras.preprocessing import image
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from sklearn.metrics import roc_curve, auc

import os

def preprocessing(train_data_dir, test_data_dir, model_save_path):
    train_datagen = ImageDataGenerator(
        rescale=1./255,
        rotation_range=40,
        width_shift_range=0.2,
        height_shift_range=0.2,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True,
        fill_mode='nearest')

    validation_datagen = ImageDataGenerator(rescale=1/255)

    train_generator = train_datagen.flow_from_directory(
        train_data_dir,
        target_size=(200, 200),
        batch_size=120,
        class_mode='binary')

    validation_generator = validation_datagen.flow_from_directory(
        test_data_dir,
        target_size=(200, 200),
        batch_size=19,
        class_mode='binary',
        shuffle=False)

    model = tf.keras.models.Sequential([
        tf.keras.layers.Flatten(input_shape=(200, 200, 3)),
        tf.keras.layers.Dense(128, activation=tf.nn.relu),
        tf.keras.layers.Dense(1, activation=tf.nn.sigmoid)])

    model.summary()

    model.compile(optimizer=tf.optimizers.Adam(),
                  loss='binary_crossentropy',
                  metrics=['accuracy'])

    history = model.fit(train_generator,
                        steps_per_epoch=3,
                        epochs=5,
                        verbose=1,
                        validation_data=validation_generator,
                        validation_steps=2)

    model.save(model_save_path)

    return model, validation_generator

def evaluate_model(model, test_data_generator):
    evaluation_result = model.evaluate(test_data_generator)
    print("Evaluation Loss:", evaluation_result[0])
    print("Evaluation Accuracy:", evaluation_result[1])

    test_data_generator.reset()
    preds = model.predict(test_data_generator, verbose=1)
    fpr, tpr, _ = roc_curve(test_data_generator.classes, preds)
    roc_auc = auc(fpr, tpr)
    print("ROC AUC:", roc_auc)

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
from keras.preprocessing import image
from sklearn.metrics import roc_auc_score
from scipy import interp
from sklearn.multiclass import OneVsRestClassifier
from sklearn.preprocessing import label_binarize
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve, auc
from sklearn import svm, datasets
from itertools import cycle
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing.image import ImageDataGenerator
import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import os


def preprocessing(uploaded_file):
    # MSI
    # train_Muga = 'E:/Programming/VS CODE/Python/7th_sem/Fabric Dataset/Train'
    # valid_Muga = 'E:/Programming/VS CODE/Python/7th_sem/Fabric Dataset/Test'

    # Asus
    train_Muga = 'D:/code/7th_sem/Fabric Dataset/Train'
    valid_Muga = 'D:/code/7th_sem/Fabric Dataset/Test'
    train_Muga_names = os.listdir(train_Muga)
    validation_Muga_names = os.listdir(valid_Muga)

    # For Augmentation
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
        # 'E:/Programming/VS CODE/Python/7th_sem/Fabric Dataset',
        'D:/code/7th_sem/Fabric Dataset/',
        classes=['Train', 'Test'],
        target_size=(200, 200),
        batch_size=120,
        class_mode='binary')

    validation_generator = validation_datagen.flow_from_directory(
        # 'E:/Programming/VS CODE/Python/7th_sem/Fabric Datase',
        'D:/code/7th_sem/Fabric Dataset/',
        classes=['Train', 'Test'],
        target_size=(200, 200),
        batch_size=19,
        class_mode='binary',
        shuffle=False)

    model = tf.keras.models.Sequential([tf.keras.layers.Flatten(input_shape=(200, 200, 3)),
                                        tf.keras.layers.Dense(
                                            128, activation=tf.nn.relu),
                                        tf.keras.layers.Dense(1, activation=tf.nn.sigmoid)])

    model.summary()

    model.compile(optimizer=tf.optimizers.Adam(),
                  loss='binary_crossentropy',
                  metrics=['accuracy'])

    history = model.fit(train_generator,
                        steps_per_epoch=3,
                        epochs=5,  # 10,
                        verbose=1,
                        validation_data=validation_generator,
                        validation_steps=2)
    # model.save("/content/drive/MyDrive/Dataset/DatasetMuga/Folder7_Muga_Tass/MugaTass_CNN/")

    model.evaluate(train_generator)

    STEP_SIZE_TEST = validation_generator.n//validation_generator.batch_size
    validation_generator.reset()
    preds = model.predict(train_generator,
                          verbose=1)

    fpr, tpr, _ = roc_curve(train_generator.classes, preds)

    roc_auc = auc(fpr, tpr)

    uploaded_files = [train_Muga+"/"+uploaded_file]
    for fn in uploaded_files:
        path = fn
        img = image.load_img(path, target_size=(200, 200))
        x = image.img_to_array(img)
        x = np.expand_dims(x, axis=0)
        images = np.vstack([x])
        classes = model.predict(images, batch_size=10)
        if classes[0] < 0.5:
            return ("This is an image of a Tass Fabric")
        else:
            return ("This is an image of a Muga Fabric")

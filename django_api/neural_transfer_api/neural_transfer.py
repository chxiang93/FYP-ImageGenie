import os 
import tensorflow as tf
# Load compressed models from tensorflow_hub
os.environ["TFHUB_MODEL_LOAD_FORMAT"] = "COMPRESSED"

import matplotlib.pyplot as plt
import matplotlib
# changing matplotlib runtime configuration parameters
matplotlib.rcParams["figure.figsize"] = (12, 12)
matplotlib.rcParams["axes.grid"] = False

import numpy as np
import PIL.Image
import time
import functools

def tensor_to_image(tensor):
    tensor = tensor * 255
    tensor = np.array(tensor, dtype=np.uint8)
    if np.ndim(tensor) > 3:
        assert tensor.shape[0] == 1
        tensor = tensor[0]
    return tensor

# function to load an image and limit its maximum dimension to 512 pixels
def load_img(img):
    max_dim = 512
    img = tf.image.convert_image_dtype(img, tf.float32)

    shape = tf.cast(tf.shape(img)[:-1], tf.float32)
    long_dim = max(shape)
    scale = max_dim / long_dim

    new_shape = tf.cast(shape * scale, tf.int32)

    img = tf.image.resize(img, new_shape)
    img = img[tf.newaxis, :]
    return img

# function to display image
def imshow(image, title=None):
    if len(image.shape) > 3:
        image = tf.squeeze(image, axis=0)
    plt.imshow(image)
    if title:
        plt.title(title)

def neural_transfer(input_img, style_img):
    print(style_img)

    plt.subplot(1, 3, 1)
    imshow(input_img, 'Content Image')

    plt.subplot(1, 3, 2)
    imshow(style_img, 'Style Image')

    import tensorflow_hub as hub
    hub_model = hub.load('neural_transfer_model')
    stylized_image = hub_model(tf.constant(input_img), tf.constant(style_img))[0]
    transfer_image = tensor_to_image(stylized_image)
    plt.subplot(1, 3, 3)
    plt.imshow(transfer_image)
    plt.title("Transfered Image")

    plt.show()

    return transfer_image

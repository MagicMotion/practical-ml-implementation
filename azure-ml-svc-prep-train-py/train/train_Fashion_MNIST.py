from __future__ import print_function
import warnings
warnings.filterwarnings('ignore')

import os
import numpy as np
from functools import partial
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.datasets import fashion_mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, Flatten
from tensorflow.keras.layers import Conv2D, MaxPooling2D
from tensorflow.keras.callbacks import EarlyStopping, ModelCheckpoint
from tensorflow.keras import backend as K

import azureml.core
from azureml.core.run import Run

print("TensorFlow version:", tf.__version__)
print("Using GPU build:", tf.test.is_built_with_cuda())
print("Is GPU available:", tf.test.is_gpu_available())
print("Azure ML SDK version:", azureml.core.VERSION)

outputs_folder = './outputs'
os.makedirs(outputs_folder, exist_ok=True)

run = Run.get_context()

# Number of classes - do not change unless the data changes
num_classes = 10

# sizes of batch and # of epochs of data
batch_size = 128
epochs = 24

# input image dimensions
img_rows, img_cols = 28, 28

# the data, shuffled and split between train and test sets
(x_train, y_train), (x_test, y_test) = fashion_mnist.load_data()
print('x_train shape
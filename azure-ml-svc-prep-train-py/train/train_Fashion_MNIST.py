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
print("Is GPU available:", tf.test.is_gpu_
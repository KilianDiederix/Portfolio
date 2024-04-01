import idx2numpy
import matplotlib.pyplot as plt


# Paths: 
train_images_path = 'samples/train-images-idx3-ubyte'
train_labels_path = 'samples/train-labels-idx1-ubyte'
test_images_path = 'samples/t10k-images-idx3-ubyte'
test_labels_path = 'samples/t10k-labels-idx1-ubyte'

# Converting idx to numpy
train_images = idx2numpy.convert_from_file(train_images_path)
train_labels = idx2numpy.convert_from_file(train_labels_path)
test_images = idx2numpy.convert_from_file(test_images_path)
test_labels = idx2numpy.convert_from_file(test_labels_path)


# Visualization
def display_images(images, labels, num_images=20):
    # Dimensions for the subplot grid
    num_columns = 5
    num_rows = num_images // num_columns
    
    # Figure with subplot per image
    plt.figure(figsize=(10, 2 * num_rows))
    
    for i in range(num_images):
        plt.subplot(num_rows, num_columns, i+1)
        plt.imshow(images[i], cmap='gray')
        plt.title(f"Label: {labels[i]}")
        plt.axis('off')  # Turn off axis ticks and labels
    plt.tight_layout()
    plt.show()

# Display 20 images from the training set
display_images(train_images, train_labels, num_images=20)

# Display 20 images from the test set
display_images(test_images, test_labels, num_images=20)

# Shape of data
print("Training data shape:", train_images.shape)
print("Training labels shape:", train_labels.shape)
print("Test data shape:", test_images.shape)
print("Test labels shape:", test_labels.shape)


# Preprocess the data
# Normalization
train_images = train_images / 255
test_images = test_images / 255

# Reshape the data
    # For a Convolutional Neural Network
train_images_cnn = train_images.reshape((60000, 28, 28, 1))
test_images_cnn = test_images.reshape((10000, 28, 28, 1))

# Print shapes after normalization and reshaping
print("Reshaped training data shape for CNN:", train_images_cnn.shape)
print("Reshaped test data shape for CNN:", test_images_cnn.shape)

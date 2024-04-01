from mnist import MNIST
import random

mndata = MNIST('samples')

images, labels = mndata.load_training()
#images, labels = mndata.load_testing()


index = random.randrange(0, len(images))
print(mndata.display(images[index]))
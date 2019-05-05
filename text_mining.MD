```py
# step 1. import the following python libraries
from wordcloud import WordCloud, STOPWORDS
from PIL import Image
import urllib
import requests
import numpy as np
import matplotlib.pyplot as plt

# step 2: this comments.txt stored all the feedback from customers
# after reading the txt file, variable `comments` has all the words that's goint to be analyzed 
comments = open(u'txt/comments.txt','r').read()

# step 3: to get the custom shape for the word cloud, we need to look for an image to use as a mask. 
# In this case, the image of a book is used to symbolize the library 
mask = np.array(Image.open(book.png')

# step 4: this function takes in the `comments` and `mask` and generates a wordcloud. 
def generate_wordcloud(words, mask):
    word_cloud = WordCloud(width = 512, height = 512, background_color='white',
                               stopwords=STOPWORDS, mask=mask).generate(comments)
    plt.figure(figsize=(10,8),facecolor = 'white', edgecolor='blue')
    plt.imshow(word_cloud)
    plt.axis('off')
    plt.tight_layout(pad=0)
    plt.show()
    
# step 5: to generate our wordcloud
generate_wordcloud(words, mask)
```

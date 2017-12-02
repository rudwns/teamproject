
# coding: utf-8


import os
from konlpy.tag import Twitter
from konlpy.utils import pprint
import collections
import time
import os
import xlrd
import xlwt
import re
from xlutils.copy import copy


# In[3]:




# In[4]:


from konlpy.tag import Kkma


# In[5]:


kkma = Kkma()


# In[6]:


kkma.sentences('제가 따뜻한 커피들고 기다리고 있을게요!!')


# In[7]:


kkma.nouns('제가 따뜻한 커피들고 기다리고 있을게요!!')


# In[8]:


kkma.pos('제가 따뜻한 커피들고 기다리고 있을게요!!', flatten=True)


# In[9]:


tag_wds=kkma.pos('제가 따뜻한 커피들고 기다리고 있을게요!!',flatten=False)
print(tag_wds)
print(tag_wds[0][0])


# In[10]:


tag_wds


# In[11]:


twitter = Twitter()


# In[12]:


malist=twitter.pos('제가 따뜻한 커피들고 기다리고 있을게욬ㅋㅋㅋ', norm=True, stem=True)


# In[13]:


malist


# In[14]:


malis1t=twitter.pos('근데 오빠는 뭘 좋아해요?', norm=True, stem=True)


# In[15]:


malis1t


# In[16]:


wordlist=kkma.pos('모해?')


# In[17]:


wordlist


# - 트위터 사용해야겠음

# In[18]:


from konlpy.tag import Hannanum


# In[19]:


hannanum = Hannanum()


# In[20]:


hannanum.nouns('제가 따뜻한 커피들고 기다리고 있을게요!!')


# In[21]:


hannanum.nouns('제가 따뜻한 커피들고 기다리고 있을게요!!')


# In[22]:


hannanum.pos('제가 따뜻한 커피들고 기다리고 있을게요!!')


# In[55]:


kkma.morphs('제가 따뜻한 커피들고 기다리고 있을게욬ㅋㅋㅋ!!')


# In[24]:


def tokenize(doc):
    return ['/'.join(t) for t in pos_tagger.pos(doc, norm=True, stem=True)]
    


# In[25]:


train=['메리가 좋다','고양이도 좋다','난 수업이 지루하다','메리는 예쁜 고양이다','난 마치고 메리랑 놀거야']


# In[26]:


from konlpy.tag import Twitter


# In[27]:


import codecs
from bs4 import BeautifulSoup
from konlpy.tag import Twitter


# In[28]:


fp=codecs.open("KakaoTalk_20171201_1048_00_025_딸래미.txt","r",encoding="utf-8")


# train_docs = [(tokenize(row[0]), row[1]) for row in train]
# train_docs

# - 텍스트 불러와서 둘 대화의 주요 키워드 뽑기

# In[29]:


import sys
from collections import Counter


# In[30]:


wordDict = Counter()


# In[31]:


f=open('KakaoTalk_20171201_1048_00_025_딸래미.txt','r',encoding="utf-8")


# In[32]:


i = open('output.txt','w')


# In[33]:


sentences = f.readlines()


# In[34]:


sentences


# In[35]:


for line in sentences:
    print(line)


# - 나와 상대 분리하기

# In[36]:


sentences[0]


# In[37]:


sentences[0][0]


# In[65]:


for i in sentences[0]:
    print(i)

    


# In[71]:


name= ""

for i in sentences[0]:
    name += i
    if i=='님':
        break
        
       
        


# In[74]:


you=name.replace(" 님","")


# In[75]:


you


# In[40]:


for line in sentences:
    malist = twitter.pos(line)
    print(malist)


# In[41]:


word_dic ={}


# In[42]:


for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            if not(word[0] in word_dic):
                word_dic[word[0]] = 0
            word_dic[word[0]] += 1


# In[43]:


keys = sorted(word_dic.items(), key=lambda x:x[1], reverse=True)


# In[44]:


for word, count in keys[:50]:
    print("{0}({1})".format(word,count),end="")


# In[45]:


for word, count in keys[:50]:
    print(word,count)


# for stc in sentences:
#     for word in stc.split():
#         wordDict[word] += 1
# for word, freq in wordDict.most_common(80):
#     x = word + '==' + str(freq) + '\n'
#     print (word, "::::", freq)
#     i.write(x)
# input()

# In[46]:



# In[78]:


posDic2 = []
positives2 = open('posDict.txt','r',encoding="utf-8").read()
posDic2= positives2.split()





# In[91]:


negatives2 = open('negDic.txt','r',encoding="utf-8").read()
negDic2= negatives2.split()




for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            print(word[0])


# - ...흠......호감도...........

# In[93]:


I_point = 50


for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            if word[0]in posDic2:
                I_point = I_point +1
            if word[0]in negDic2:
                I_point = I_point -1


# In[94]:


I_point
print(I_point)



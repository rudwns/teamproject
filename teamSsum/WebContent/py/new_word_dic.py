
# coding: utf-8

# In[10]:





from konlpy.tag import Kkma


# In[2]:


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





# In[9]:


from konlpy.tag import Kkma
from konlpy.utils import pprint
from konlpy.tag import Hannanum
hannanum = Hannanum()


# In[5]:


kkma = Kkma()


# In[14]:


pprint(kkma.sentences(u'네,안녕하세요.반값습니다.'))


# In[18]:


pprint(kkma.nouns(u'질문이나 건의사항은 깃헙 이슈 트래커에 남겨주세요.'))


# In[20]:


pprint(kkma.pos(u'오류보고는 실행환경, 에러메세지와함께 설명을 최대한상세히!^^'))


# In[6]:


kkma.sentences('한국어 분석을 시작합니다 재미있어요~~')


# In[7]:


kkma.nouns('한국어 분석을 시작합니다 재미있어요~~')


# In[8]:


kkma.pos("한국어 분석을 시작합니다 재미있어요~~")


# In[10]:


hannanum.nouns("한국어 분석을 시작합니다 재미있어요~~")


# In[11]:


hannanum.nouns("한국어 분석은 재미있어요~~")


# In[12]:





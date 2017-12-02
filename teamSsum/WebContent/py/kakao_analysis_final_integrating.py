
# coding: utf-8

# In[1]:


get_ipython().system(' pip install JPype1-0.6.2-cp36-cp36m-win_amd64.whl')
get_ipython().system(' pip install konlpy')
get_ipython().system(' pip install xlutils')


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


# In[3]:


def allfiles(path):
    res = []
    for root, dirs, files in os.walk(path):
        rootpath = os.path.join(os.path.abspath(path),root)
        for file in files:
            filepath = os.path.join(rootpath, file)
            res.append(filepath)
    return res


# In[4]:


# -- coding: utf-8 --
#import codecs
from bs4 import BeautifulSoup
from konlpy.tag import Twitter
import sys
from collections import Counter
twitter = Twitter()


# - 텍스트 불러와서 둘 대화의 주요 키워드 뽑기

# In[5]:


f=open('KakaoTalk.txt','r',encoding="utf-8")


# In[6]:


sentences = f.readlines()


# In[7]:


for line in sentences:
    print(line)


# In[8]:


for line in sentences:
    malist = twitter.pos(line)
    print(malist)


# In[9]:


word_dic ={}


# In[10]:


for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            if not(word[0] in word_dic):
                word_dic[word[0]] = 0
            word_dic[word[0]] += 1


# In[11]:


for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun" and len(word[0])>=2:  # 명사추출 # 단어가 두글자 이상인 애들만 추출
            if not(word[0] in word_dic):
                word_dic[word[0]] = 0
            word_dic[word[0]] += 1
                


# In[12]:


keys = sorted(word_dic.items(), key=lambda x:x[1], reverse=True)


# In[13]:


for word, count in keys[:50]:   ## keys[:number]여기 숫자에 따라서 top5 고름!
    print("{0}({1})".format(word,count),end="")


# - 상대방의 주요 키워드 뽑기 1) 상대 대화 분리하기

# In[14]:


name= ""

for i in sentences[0]:
    name += i
    if i=='님':
        break


# In[15]:


you=name.replace(" 님","")


# In[16]:


you_name="["+you+"]"


# In[17]:


you_talk=[]
for s in sentences:
    if you_name not in s:
        you_talk.append(s)


# In[18]:


you_talk=you_talk[4:]


# In[19]:


my_name= ""

for i in you_talk[0]:
    my_name += i
    if i=="]":
        break


# In[20]:


print(my_name)
print(you_name)


# In[21]:


you_talk=[]
for s in sentences:
    if you_name in s:
        you_talk.append(s)


# In[22]:


for i in range(len(you_talk)):
    you_talk[i]=you_talk[i].replace(you_name,"")
    you_talk[0]


# In[23]:


f_time="[오전 "
l_time="[오후 "
time=""
All_time_list=[]
for h in range(1,13):
    for m1 in range(0,6):
        for m2 in range(0,10):
            time = f_time + str(h) + ":" + str(m1) + str(m2) + "]"
            All_time_list.append(time)


# In[24]:


len(All_time_list)


# In[25]:


f_time="[오전 "
l_time="[오후 "
time=""
for h in range(1,13):
    for m1 in range(0,6):
        for m2 in range(0,10):
            time = l_time + str(h) + ":" + str(m1) + str(m2) + "]"
            All_time_list.append(time)


# In[26]:


time


# In[27]:


len(All_time_list)


# - 전체 시간 리스트 딕셔너리화

# In[28]:


All_time_Dic ={}


# In[29]:


for i in range (len(All_time_list)):
    All_time_Dic.update({All_time_list[i]:All_time_list[i]})


# In[30]:


for i in range(len(you_talk)):
    for j in range(len(All_time_list)):
        you_talk[i]=you_talk[i].replace(All_time_list[j],"").replace('\n',"")


# - 상대방의 주요 키워드 뽑기 2) 키워드 추출

# In[31]:


for line in you_talk:
    you_malist = twitter.pos(line)
    print(you_malist)


# In[32]:


you_word_dic ={}


# In[33]:


for line in you_talk:
    you_malist = twitter.pos(line)
    for word in you_malist:
        if word[1]=="Noun" and len(word[0])>=2:  # 명사추출 # 단어가 두글자 이상인 애들만 추출
            if not(word[0] in you_word_dic):
                you_word_dic[word[0]] = 0
            you_word_dic[word[0]] += 1


# In[34]:


keys = sorted(you_word_dic.items(), key=lambda x:x[1], reverse=True)


# In[35]:


you_keyword_top10=[]

for word, count in keys[:50]:## keys[:number]여기 숫자에 따라서 top5 고름!
    print("{0}({1})".format(word,count),end="")


# In[36]:


you_keyword_top10=[]

for word in keys[:15]:## keys[:number]여기 숫자에 따라서 top5 고름!
    if word[0]!='오빠' and word[0]!='누나':
        if len(word[0])>=2: # 조건으로 단어들 빼줌.
            you_keyword_top10.append(word[0])


# In[37]:


you_keyword_top10


# - 키워드가 상품사전에 있는지 확인하기

# In[38]:


from bs4 import BeautifulSoup
import urllib.request as req


# - 네이버 전체 상품 목록 크롤링

# In[39]:


# 상품 사전 크롤링해서 goods_set에 넣기
goods_set = set([])
num = ["1","2","3","4","5","6","7","8","9"]

for i in num:
    url="http://shopping.naver.com/category/category.nhn?cat_id=5000000"+i
    res=req.urlopen(url)
    soup=BeautifulSoup(res,"html.parser")
    Things = soup.select(".category_list a")
    for a in Things:
        name=a.string
        goods_set.add(name)


# - 사전 만들기

# In[40]:


goods_list=list(goods_set)


# In[41]:


goods_dic ={}


# In[42]:


goods_list_key=goods_list


# In[43]:


for i in range (len(goods_list_key)):
    goods_dic.update({goods_list_key[i]:goods_list_key[i]})


# - 사전만들기 2 (커스터마이징)

# In[44]:


import pandas as pd
import numpy as np


# In[45]:


#사용자사전 불러와서 추가 & 사전 완성
custom_dic=pd.read_excel("gift_dic.xlsx")


# In[46]:


for i in range (len(custom_dic.values)):
    goods_dic.update({custom_dic.values[i][0]:custom_dic.values[i][1]})


# - 상대방 단어를 상품사전에서 검색 후 결과 값 저장

# In[47]:


searchword=[]


# In[48]:


for item in you_keyword_top10:
    if item in goods_dic.keys():
        searchword.append(goods_dic[item])
        


# In[49]:


searchword


# In[50]:


# 수정한 함수
def selectWord(searchword):
    you_goods_keyword =[]
    
    if len(searchword)==0: # 상품사전에 검색된 게 없을때
        you_goods_keyword.append(None)
    
    elif len(searchword)==1: # 상품사전에 하나만 검색될 때
        for i in searchword[0].split(","):
            you_goods_keyword.append(i)
        
    elif len(searchword)> 1: # 상품사전에 하나 이상 검색될 때
        for i in range(len(searchword)):
            for j in range(len(searchword[i].split(","))):
                you_goods_keyword.append(searchword[i].split(",")[j])
        
        
        
    return you_goods_keyword


# In[51]:


selectWord(searchword) # 테스트해본거


# - 시간데이터 뽑기 1)이름 리스트 만들기

# In[52]:


name_list =[]
name='['+my_name+']'
for line in sentences:
    if name in line:
        name_list.append(name)


# In[53]:


for line in sentences:
    if my_name in line:
        name_list.append(my_name)
    if you_name in line:
        name_list.append(you_name)


# In[54]:


print(len(name_list))


# - 시간데이터 뽑기 2)시간 리스트 만들기 3)날짜 데이터 만들어 시간리스트에 추가하기

# In[55]:


time_list=[]


# In[56]:


my_time=""
you_time=""


# In[57]:


for line in sentences:
    if '--------------- 'in line:
        date=line.replace('-',"").strip()
        
    if my_name in line:
        my_time=line[len(my_name)+2:len(my_name)+10]
        time_list.append(date+my_time)
    if you_name in line:
        you_time=line[len(you_name)+2:len(you_name)+10]
        time_list.append(date+you_time)


# In[58]:


len(time_list)


# In[59]:


time_list


# -  시간데이터 뽑기 4) 날짜 스트링 전처리

# In[60]:


for i in time_list:
    if ']'in i:
        removedi=i.replace(']'," ")
        indexNum=time_list.index(i)
        time_list.insert(indexNum,removedi)
        del time_list[indexNum+1]


# In[61]:


mod_time_list=[]

for time in time_list:
    mod_time_list.append(time.replace('월요일',"").replace('화요일',"").replace('수요일',"").replace('목요일',"").replace('금요일',"").replace('토요일',"").replace('일요일',"").replace("년","-").replace("월","-").replace("일","").replace("오전 12","00"))


# In[62]:


twentyfour_time_list=[]
for time in mod_time_list:
      twentyfour_time_list.append(time.replace('오후 10','22').replace('오후 11','23').replace('오후 12','12').replace('오후 1','13').replace('오후 2','14').replace('오후 3','15').replace('오후 4','16').replace('오후 5','17').replace('오후 6','18').replace('오후 7','19').replace('오후 8','20').replace('오후 9','21').replace("오전",""))


# In[63]:


replace_time_list=[]
for time in twentyfour_time_list:
    replace_time_list.append(time.replace("- ","-").rstrip())
    


# -  시간데이터 뽑기 5) 스트링을 시간형식데이터로 변환

# In[64]:


import datetime


# In[65]:


Date_time_list =[]
for time in replace_time_list:
    myDatetime = datetime.datetime.strptime(time, '%Y-%m-%d %H:%M')
    Date_time_list.append(myDatetime)


# In[66]:


print(len(Date_time_list))
Date_time_list


# - 평균 답장시간 구하기 1) 상대와 나의 평균 답장 시간 구하기

# In[67]:


#답장한 메시지의 인덱스 구하기
index_list=[]

for i in range(1,len(name_list)):
    if name_list[i-1] != name_list[i]:
        index_list.append(i-1)
        index_list.append(i)
        if i-1==len(name_list):
            break


# In[68]:


# 총 메시지 수
len(name_list)


# In[69]:


answer_name_list=[]
# 답장한 사람
for i in range(len(index_list)):
    print(name_list[index_list[i]])
    answer_name_list.append(name_list[index_list[i]])


# In[70]:


len(index_list)


# In[71]:


print(len(answer_name_list))
answer_name_list


# In[72]:


answer_time_list=[]
# 답장한 시각
for i in range(len(index_list)):
    print(Date_time_list[index_list[i]])
    answer_time_list.append(Date_time_list[index_list[i]])


# In[73]:


len(answer_name_list)


# In[74]:


len(answer_time_list)


# In[75]:


#내가 답장한 시간: my_answer // 상대가 답장한 시간: you_answer
my_answer=[]
you_answer=[]

if name_list[0]==my_name:
    for i in range(0,len(answer_time_list)-2):
        if i%4==0:
            you_answer.append(answer_time_list[i+1]-answer_time_list[i])
            my_answer.append(answer_time_list[i+3]-answer_time_list[i+2])       
else:
    for i in range(0,len(answer_time_list)-2,4):
        if i%4==0:
            my_answer.append(answer_time_list[i+1]-answer_time_list[i]) 
            you_answer.append(answer_time_list[i+3]-answer_time_list[i+2])


# In[76]:


# 비교할 시간(5시간) 만들기
time5=datetime.datetime(2017, 11, 8, 5, 0, 0, 0)-datetime.datetime(2017, 11, 8, 0, 0, 0, 0)
time5


# In[77]:


# 내 답장 시간 중 5시간 넘는 거 거르기
my_answer_filter =[]
for response in my_answer:
    minute=response
    if response >time5:
        my_answer.remove(response)
    my_answer_filter.append(minute)


# In[78]:


a=my_answer_filter[0]-my_answer_filter[0]
for i in my_answer_filter:
    a=a+i
    Imean=a/len(my_answer_filter)


# In[79]:


I_mean=Imean.total_seconds()/60 


# In[80]:


# 내 평균 답장시간(분)
I_mean=round(I_mean,2)
I_mean


# In[81]:


# 상대 답장 시간 중 5시간 넘는 거 거르기
you_answer_temp =[]
for response in you_answer:
    minute=response
    if response >time5:
        continue
    you_answer_temp.append(minute)


# In[82]:


for i in you_answer_temp:
    a=a+i
    youmean=a/len(you_answer_temp)


# In[83]:


# 상대 평균 답장시간
you_mean=0
you_mean=youmean.total_seconds()/60 
you_mean=round(you_mean,2)
you_mean


# - 선톡 비율, 갯수 구하기

# In[84]:


longtermIndex =[]
for i in range(len(Date_time_list)-1):
    if Date_time_list[i+1]-Date_time_list[i] > time5:
        i=i+1
        longtermIndex.append(i)
        


# In[85]:


longtermIndex


# In[86]:


youFirstTalk =0;
myFirstTalk = 0;
for i in range(len(longtermIndex)):
    if name_list[longtermIndex[i]]==you_name:
        youFirstTalk += 1
    if name_list[longtermIndex[i]]==my_name:
        myFirstTalk += 1
        
            


# In[87]:


#나의 선톡 갯수 :myFirstTalk
#상대의 선톡 갯수:youFirstTalk
print(youFirstTalk)
print(myFirstTalk)


# In[88]:


# 나의 선톡 비율

my_firstTalk_ratio=myFirstTalk/(youFirstTalk+myFirstTalk)*100
my_firstTalk_ratio=round(my_firstTalk_ratio,2)
my_firstTalk_ratio


# In[89]:


# 상대의 선톡 비율
you_firstTalk_ratio=youFirstTalk/(youFirstTalk+myFirstTalk)*100
you_firstTalk_ratio=round(you_firstTalk_ratio,2)
you_firstTalk_ratio


# - 메시지 비율 구하기

# In[90]:


my_message = 0
you_message = 0
for i in name_list:
    if i==my_name:
        my_message = my_message+1
    if i==you_name:
        you_message =you_message+1
        


# In[91]:


#내 메시지 비율
my_message_ratio = round(my_message/(my_message+you_message)*100,2)
my_message_ratio


# In[92]:


#상대 메시지 비율
you_message_ratio = round(you_message/(my_message+you_message)*100,2)
you_message_ratio


# - 호감도 보정 1) 선톡비율

# if my_firstTalk_ratio > 60:
#     

# - 선톡 비율에 따라 호감도 보정

# - 대화내용 분석 1) 사전 가져오기

# In[93]:


posDic = []
positives = open('posDict.txt','r',encoding="utf-8").read()
posDic= positives.split()
posDic


# In[94]:


negDic = []
negatives = open('negDic.txt','r',encoding="utf-8").read()
negDic= negatives.split()
negDic


# In[95]:


f=open('KakaoTalk_20171203_0438_02_442_이지홍.txt','r',encoding="utf-8")


# In[96]:


sentences = f.readlines()


# In[97]:


for line in sentences:
    print(line)


# In[98]:


my_talk=[]
for s in sentences:
    if my_name in s:
        my_talk.append(s)


# In[99]:


my_talk


# In[100]:


for i in range(len(my_talk)):
    for j in range(len(time_list)):
        my_talk[i]=my_talk[i].replace(my_name,"")


# In[101]:


time_list


# In[102]:


my_talk


# In[103]:


for i in range(len(my_talk)):
    for j in range(len(time_list)):
        my_talk[i]=my_talk[i].replace(time_list[j],"").replace('\n',"")


# In[104]:


for line in my_talk:
    my_malist = twitter.pos(line)
    print(my_malist)


# In[105]:


my_word_dic ={}


# - 대화내용 분석 2) 호감도 분석 1) 내가 상대에게 가진 호감도

# In[106]:


I_point = 50
pos_point = 0
neg_point = 0
count= 0


for line in my_talk:
    print(line)
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1
        if word[1]=="verb": # 동사추출. 얘 왜 변화가 없지. 사전에 단어가 없남
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1
        if word[1]=="KoreanParticle": # 명사추출
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1


# In[107]:


I_point


# In[108]:


pos_point


# In[109]:


neg_point


# In[110]:


count


# In[111]:


# 내가 상대에게 가진 호감도
if count==0:
    my_text_point=50
else:
    my_text_point = (pos_point+neg_point)*50/count+I_point


# In[112]:


my_text_point


# - 대화내용 분석 2) 호감도 분석 2) 상대가 나에게 가진 호감도

# In[113]:


I_point = 50
pos_point = 0
neg_point = 0
count= 0

for line in you_talk:
    malist = twitter.pos(line)
    for word in malist:
        if word[1]=="Noun": # 명사추출
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1
        if word[1]=="verb": # 동사추출. 얘 왜 변화가 없지. 사전에 단어가 없남
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1
        if word[1]=="KoreanParticle": # 명사추출
            if word[0]in posDic:
                pos_point +=1
                count+=1
            if word[0]in negDic:
                neg_point -=1
                count+=1


# In[114]:


if count==0:
    you_text_point=50
else:
    you_text_point = (pos_point+neg_point)*50/count+I_point


# In[115]:


# 상대가 나에게 가진 호감도
you_text_point 


# -  DB 연결 & 저장 1) 상대 키워드 중 크롤링할 단어 저장

# In[116]:


gift_list=[]

if len(selectWord(searchword))==1:
    gift_list.append(selectWord(searchword)[0])
    
elif len(selectWord(searchword))==2:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    
elif len(selectWord(searchword))==3:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    gift_list.append(selectWord(searchword)[2])
    
elif len(selectWord(searchword))==4:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    gift_list.append(selectWord(searchword)[2])
    gift_list.append(selectWord(searchword)[3])
    
elif len(selectWord(searchword))>=5:
    for i in range(len(selectWord(searchword))):
        gift_list.append(selectWord(searchword)[i])
        if len(gift_list)>=5:
            break


# In[117]:


import cx_Oracle 


# In[118]:


con = cx_Oracle.connect('web/123@localhost:1521/xe')


# In[ ]:


cur = con.cursor()


# In[ ]:


cur.execute("delete from gift_keyword")


# In[ ]:


con.commit()


# In[ ]:


cur = con.cursor()


# In[ ]:


cur.execute("select id from request")


# In[ ]:


con.commit()


# In[ ]:


user=cur.fetchone()


# In[ ]:


user=str(user).replace("('","").replace("',)","")


# In[ ]:


user


# In[ ]:


cur = con.cursor()


# In[ ]:


sql="insert into gift_keyword(id, word_rank1, word_rank2, word_rank3, word_rank4, word_rank5) values( : user_id, :word1, :word2, :word3, :word4, :word5)"


# In[ ]:


if len(gift_list)==1:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=None, word3=None, word4=None, word5=None)
elif len(gift_list)==2:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=None, word4=None, word5=None)
elif len(gift_list)==3:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=None, word5=None)    
elif len(gift_list)==4:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=gift_list[3], word5=None)
elif len(gift_list)==5:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=gift_list[3], word5=gift_list[4])


# In[ ]:


con.commit()


# In[ ]:


cur = con.cursor()


# In[ ]:


cur.execute("select * from gift_keyword")


# In[ ]:


cur.fetchall()


# DB 연결 & 저장 2) 텍스트 분석 호감도 결과 저장

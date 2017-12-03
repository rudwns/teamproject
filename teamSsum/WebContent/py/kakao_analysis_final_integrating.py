# -*- coding: ms949 -*-
# -*- coding: cp949 -*-
# -*- coding: UTF-8 -*-
'''
Created on 2017. 12. 3.

@author: pc-06
'''

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
import cx_Oracle


def allfiles(path):
    res = []
    for root, dirs, files in os.walk(path):
        rootpath = os.path.join(os.path.abspath(path), root)
        for file in files:
            filepath = os.path.join(rootpath, file)
            res.append(filepath)
    return res


# -- coding: utf-8 --
# import codecs
from bs4 import BeautifulSoup
from konlpy.tag import Twitter
import sys
from collections import Counter
twitter = Twitter()

f = open('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\FileSavedFolder\\KakaoTalk.txt', 'r', encoding="utf-8")

sentences = f.readlines()

for line in sentences:
    malist = twitter.pos(line)

word_dic = {}

for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1] == "Noun":  # �������
            if not(word[0] in word_dic):
                word_dic[word[0]] = 0
            word_dic[word[0]] += 1

for line in sentences:
    malist = twitter.pos(line)
    for word in malist:
        if word[1] == "Noun" and len(word[0]) >= 2:  # ������� # �ܾ �α��� �̻��� �ֵ鸸 ����
            if not(word[0] in word_dic):
                word_dic[word[0]] = 0
            word_dic[word[0]] += 1

keys = sorted(word_dic.items(), key=lambda x:x[1], reverse=True)

for word, count in keys[:50]:  # # keys[:number]���� ���ڿ� ���� top5 ��!
    print("{0}({1})".format(word, count), end="")

name = ""

for i in sentences[0]:
    name += i
    if i == '��':
        break

you = name.replace(" ��", "")

you_name = "[" + you + "]"

you_talk = []
for s in sentences:
    if you_name not in s:
        you_talk.append(s)

you_talk = you_talk[4:]

you_name = you_name.replace("\ufeff", "")

my_name = ""
for i in range(len(you_talk)):
    for j in you_talk[i]:
        my_name += j
        print(j)
        if j == "]":
            break
        
    if you_name != my_name:
        break
    else:
        my_name = ""
        continue

print(my_name)
print(you_name)

you_talk = []
for s in sentences:
    if you_name in s:
        you_talk.append(s)

for i in range(len(you_talk)):
    you_talk[i] = you_talk[i].replace(you_name, "")
    you_talk[0]

f_time = "[���� "
l_time = "[���� "
time = ""
All_time_list = []
for h in range(1, 13):
    for m1 in range(0, 6):
        for m2 in range(0, 10):
            time = f_time + str(h) + ":" + str(m1) + str(m2) + "]"
            All_time_list.append(time)

len(All_time_list)

f_time = "[���� "
l_time = "[���� "
time = ""
for h in range(1, 13):
    for m1 in range(0, 6):
        for m2 in range(0, 10):
            time = l_time + str(h) + ":" + str(m1) + str(m2) + "]"
            All_time_list.append(time)

time

len(All_time_list)

All_time_Dic = {}

for i in range (len(All_time_list)):
    All_time_Dic.update({All_time_list[i]:All_time_list[i]})

for i in range(len(you_talk)):
    for j in range(len(All_time_list)):
        you_talk[i] = you_talk[i].replace(All_time_list[j], "").replace('\n', "")

for line in you_talk:
    you_malist = twitter.pos(line)
    print(you_malist)

you_word_dic = {}

for line in you_talk:
    you_malist = twitter.pos(line)
    for word in you_malist:
        if word[1] == "Noun" and len(word[0]) >= 2:  # ������� # �ܾ �α��� �̻��� �ֵ鸸 ����
            if not(word[0] in you_word_dic):
                you_word_dic[word[0]] = 0
            you_word_dic[word[0]] += 1

keys = sorted(you_word_dic.items(), key=lambda x:x[1], reverse=True)

you_keyword_top10 = []

for word, count in keys[:50]:  # # keys[:number]���� ���ڿ� ���� top5 ��!
    print("{0}({1})".format(word, count), end="")

you_keyword_top10 = []

for word in keys[:15]:  # # keys[:number]���� ���ڿ� ���� top5 ��!
    if word[0] != '����' and word[0] != '����':
        if len(word[0]) >= 2:  # �������� �ܾ�� ����.
            you_keyword_top10.append(word[0])

you_keyword_top10

from bs4 import BeautifulSoup
import urllib.request as req

# ��ǰ ���� ũ�Ѹ��ؼ� goods_set�� �ֱ�
goods_set = set([])
num = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

for i in num:
    url = "http://shopping.naver.com/category/category.nhn?cat_id=5000000" + i
    res = req.urlopen(url)
    soup = BeautifulSoup(res, "html.parser")
    Things = soup.select(".category_list a")
    for a in Things:
        name = a.string
        goods_set.add(name)

goods_list = list(goods_set)

goods_dic = {}

goods_list_key = goods_list

for i in range (len(goods_list_key)):
    goods_dic.update({goods_list_key[i]:goods_list_key[i]})

import pandas as pd
import numpy as np

# ����ڻ��� �ҷ��ͼ� �߰� & ���� �ϼ�

custom_dic = pd.read_excel("C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\dic\\gift_dic.xlsx")

for i in range (len(custom_dic.values)):
    goods_dic.update({custom_dic.values[i][0]:custom_dic.values[i][1]})

searchword = []

for item in you_keyword_top10:
    if item in goods_dic.keys():
        searchword.append(goods_dic[item])

searchword


# ������ �Լ�
def selectWord(searchword):
    you_goods_keyword = []
    
    if len(searchword) == 0:  # ��ǰ������ �˻��� �� ������
        you_goods_keyword.append(None)
    
    elif len(searchword) == 1:  # ��ǰ������ �ϳ��� �˻��� ��
        for i in searchword[0].split(","):
            you_goods_keyword.append(i)
        
    elif len(searchword) > 1:  # ��ǰ������ �ϳ� �̻� �˻��� ��
        for i in range(len(searchword)):
            for j in range(len(searchword[i].split(","))):
                you_goods_keyword.append(searchword[i].split(",")[j])
        
    return you_goods_keyword


selectWord(searchword)  # �׽�Ʈ�غ���

name_list = []
name = '[' + my_name + ']'
for line in sentences:
    if name in line:
        name_list.append(name)

for line in sentences:
    if my_name in line:
        name_list.append(my_name)
    if you_name in line:
        name_list.append(you_name)

print(len(name_list))

time_list = []

my_time = ""
you_time = ""

for line in sentences:
    if '--------------- 'in line:
        date = line.replace('-', "").strip()
        
    if my_name in line:
        my_time = line[len(my_name) + 2:len(my_name) + 10]
        time_list.append(date + my_time)
    if you_name in line:
        you_time = line[len(you_name) + 2:len(you_name) + 10]
        time_list.append(date + you_time)

len(time_list)

time_list

for i in time_list:
    if ']'in i:
        removedi = i.replace(']', " ")
        indexNum = time_list.index(i)
        time_list.insert(indexNum, removedi)
        del time_list[indexNum + 1]

mod_time_list = []

for time in time_list:
    mod_time_list.append(time.replace('������', "").replace('ȭ����', "").replace('������', "").replace('�����', "").replace('�ݿ���', "").replace('�����', "").replace('�Ͽ���', "").replace("��", "-").replace("��", "-").replace("��", "").replace("���� 12", "00"))

twentyfour_time_list = []
for time in mod_time_list:
      twentyfour_time_list.append(time.replace('���� 10', '22').replace('���� 11', '23').replace('���� 12', '12').replace('���� 1', '13').replace('���� 2', '14').replace('���� 3', '15').replace('���� 4', '16').replace('���� 5', '17').replace('���� 6', '18').replace('���� 7', '19').replace('���� 8', '20').replace('���� 9', '21').replace("����", ""))

replace_time_list = []
for time in twentyfour_time_list:
    replace_time_list.append(time.replace("- ", "-").rstrip())

import datetime

Date_time_list = []
for time in replace_time_list:
    myDatetime = datetime.datetime.strptime(time, '%Y-%m-%d %H:%M')
    Date_time_list.append(myDatetime)

print(len(Date_time_list))
Date_time_list

# ������ �޽����� �ε��� ���ϱ�
index_list = []

for i in range(1, len(name_list)):
    if name_list[i - 1] != name_list[i]:
        index_list.append(i - 1)
        index_list.append(i)
        if i - 1 == len(name_list):
            break

# �� �޽��� ��
len(name_list)

answer_name_list = []
# ������ ���
for i in range(len(index_list)):
    print(name_list[index_list[i]])
    answer_name_list.append(name_list[index_list[i]])

len(index_list)

print(len(answer_name_list))
answer_name_list

answer_time_list = []
# ������ �ð�
for i in range(len(index_list)):
    print(Date_time_list[index_list[i]])
    answer_time_list.append(Date_time_list[index_list[i]])

len(answer_name_list)

len(answer_time_list)

# ���� ������ �ð�: my_answer // ��밡 ������ �ð�: you_answer
my_answer = []
you_answer = []

if name_list[0] == my_name:
    for i in range(0, len(answer_time_list) - 2):
        if i % 4 == 0:
            you_answer.append(answer_time_list[i + 1] - answer_time_list[i])
            my_answer.append(answer_time_list[i + 3] - answer_time_list[i + 2])       
else:
    for i in range(0, len(answer_time_list) - 2, 4):
        if i % 4 == 0:
            my_answer.append(answer_time_list[i + 1] - answer_time_list[i]) 
            you_answer.append(answer_time_list[i + 3] - answer_time_list[i + 2])

# ���� �ð�(5�ð�) �����
time5 = datetime.datetime(2017, 11, 8, 5, 0, 0, 0) - datetime.datetime(2017, 11, 8, 0, 0, 0, 0)
time5

# �� ���� �ð� �� 5�ð� �Ѵ� �� �Ÿ���
my_answer_filter = []
for response in my_answer:
    minute = response
    if response > time5:
        my_answer.remove(response)
    my_answer_filter.append(minute)

a = my_answer_filter[0] - my_answer_filter[0]
for i in my_answer_filter:
    a = a + i
    Imean = a / len(my_answer_filter)

I_mean = Imean.total_seconds() / 60 

# �� ��� ����ð�(��)
I_mean = round(I_mean, 2)
I_mean

# ��� ���� �ð� �� 5�ð� �Ѵ� �� �Ÿ���
you_answer_temp = []
for response in you_answer:
    minute = response
    if response > time5:
        continue
    you_answer_temp.append(minute)

for i in you_answer_temp:
    a = a + i
    youmean = a / len(you_answer_temp)

# ��� ��� ����ð�
you_mean = 0
you_mean = youmean.total_seconds() / 60 
you_mean = round(you_mean, 2)
you_mean

longtermIndex = []
for i in range(len(Date_time_list) - 1):
    if Date_time_list[i + 1] - Date_time_list[i] > time5:
        i = i + 1
        longtermIndex.append(i)

longtermIndex

youFirstTalk = 0;
myFirstTalk = 0;
for i in range(len(longtermIndex)):
    if name_list[longtermIndex[i]] == you_name:
        youFirstTalk += 1
    if name_list[longtermIndex[i]] == my_name:
        myFirstTalk += 1

# ���� ���� ���� :myFirstTalk
# ����� ���� ����:youFirstTalk
print(youFirstTalk)
print(myFirstTalk)

# ���� ���� ����

my_firstTalk_ratio = myFirstTalk / (youFirstTalk + myFirstTalk) * 100
my_firstTalk_ratio = round(my_firstTalk_ratio, 2)
my_firstTalk_ratio

# ����� ���� ����
you_firstTalk_ratio = youFirstTalk / (youFirstTalk + myFirstTalk) * 100
you_firstTalk_ratio = round(you_firstTalk_ratio, 2)
you_firstTalk_ratio

my_message = 0
you_message = 0
for i in name_list:
    if i == my_name:
        my_message = my_message + 1
    if i == you_name:
        you_message = you_message + 1

# �� �޽��� ����
my_message_ratio = round(my_message / (my_message + you_message) * 100, 2)
my_message_ratio

# ��� �޽��� ����
you_message_ratio = round(you_message / (my_message + you_message) * 100, 2)
you_message_ratio

posDic = []
positives = open('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\dic\\posDict.txt', 'r', encoding="utf-8").read()
posDic = positives.split()
posDic

negDic = []
negatives = open('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\dic\\negDic.txt', 'r', encoding="utf-8").read()
negDic = negatives.split()
negDic

f = open('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\FileSavedFolder\\KakaoTalk.txt', 'r', encoding="utf-8")

sentences = f.readlines()

my_talk = []
for s in sentences:
    if my_name in s:
        my_talk.append(s)

my_talk

for i in range(len(my_talk)):
    for j in range(len(time_list)):
        my_talk[i] = my_talk[i].replace(my_name, "")

time_list

my_talk

for i in range(len(my_talk)):
    for j in range(len(time_list)):
        my_talk[i] = my_talk[i].replace(time_list[j], "").replace('\n', "")

for line in my_talk:
    my_malist = twitter.pos(line)

my_word_dic = {}

I_point = 50
pos_point = 0
neg_point = 0
count = 0

for line in my_talk:

    malist = twitter.pos(line)
    for word in malist:
        if word[1] == "Noun":  # �������
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1
        if word[1] == "verb":  # ��������. �� �� ��ȭ�� ����. ������ �ܾ ����
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1
        if word[1] == "KoreanParticle":  # �������
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1

I_point

pos_point

neg_point

count

# ���� ��뿡�� ���� ȣ����
if count == 0:
    my_text_point = 50
else:
    my_text_point = (pos_point + neg_point) * 50 / count + I_point

my_text_point

I_point = 50
pos_point = 0
neg_point = 0
count = 0

for line in you_talk:
    malist = twitter.pos(line)
    for word in malist:
        if word[1] == "Noun":  # �������
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1
        if word[1] == "verb":  # ��������. �� �� ��ȭ�� ����. ������ �ܾ ����
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1
        if word[1] == "KoreanParticle":  # �������
            if word[0]in posDic:
                pos_point += 1
                count += 1
            if word[0]in negDic:
                neg_point -= 1
                count += 1

if count == 0:
    you_text_point = 50
else:
    you_text_point = (pos_point + neg_point) * 50 / count + I_point

# ��밡 ������ ���� ȣ����
you_text_point 
gift_list = []

if len(selectWord(searchword)) == 1:
    gift_list.append(selectWord(searchword)[0])
    
elif len(selectWord(searchword)) == 2:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    
elif len(selectWord(searchword)) == 3:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    gift_list.append(selectWord(searchword)[2])
    
elif len(selectWord(searchword)) == 4:
    gift_list.append(selectWord(searchword)[0])
    gift_list.append(selectWord(searchword)[1])
    gift_list.append(selectWord(searchword)[2])
    gift_list.append(selectWord(searchword)[3])
    
elif len(selectWord(searchword)) >= 5:
    for i in range(len(selectWord(searchword))):
        gift_list.append(selectWord(searchword)[i])
        if len(gift_list) >= 5:
            break

you_text_point = ("%.2f" % you_text_point)
my_text_point = ("%.2f" % my_text_point)


for i in range(len(my_talk)):
    for j in range(len(All_time_list)):
        my_talk[i]=my_talk[i].replace(All_time_list[j],"").replace('\n',"")



our_talk=[]
for i in range(len(you_talk)):
    our_talk.append(you_talk[i])
    

for i in range(len(my_talk)):
    our_talk.append(my_talk[i])
    
print(len(my_talk))
print(len(you_talk))
print(len(our_talk))

our_talk_str=""
for i in range(len(our_talk)):
    our_talk_str = our_talk_str+our_talk[i]+" "


import nltk
from konlpy.corpus import kolaw
from konlpy.tag import Twitter;t  = Twitter()

import matplotlib.pyplot as plt

from wordcloud import WordCloud

token  = t.nouns(our_talk_str)
print(token)

ko = nltk.Text(token, name = '�м�')
a = ko.vocab().most_common(100)

from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="C:/ProgramData/Anaconda3/Lib/site-packages/pytagcloud/fonts/NanumGothic.ttf").get_name()
rc('font', family=font_name)

import matplotlib.pyplot as plt
import platform

from matplotlib import font_manager,rc
if platform.system() == 'Darwin':
    rc('font', family == 'AppleGothic')
elif platform.system() == 'Windows' :
    font_name = font_manager.FontProperties(fname="C:/ProgramData/Anaconda3/Lib/site-packages/pytagcloud/fonts/NanumGothic.ttf").get_name()
    rc('font', family=font_name)
else : 
    print('kj')
    
from pylab import figure, axes, pie, title, savefig

data = ko.vocab().most_common(300)
tmp_data = dict(data)

wordcloud = WordCloud(font_path='C:/ProgramData/Anaconda3/Lib/site-packages/pytagcloud/fonts/NanumGothic.ttf', relative_scaling=0.2,background_color='white',).generate_from_frequencies(tmp_data)

plt.figure(figsize=(10,10))
plt.imshow(wordcloud)
plt.axis("off")
fig = plt.gcf() #���� figure�� �ҷ�����
fig.set_size_inches(5, 5) #ũ�� �ٲٱ�(inch ����)


fig.savefig("C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\graph\\word_cloud.png")


import matplotlib.pyplot as plt
import numpy as np
from matplotlib import font_manager, rc
from matplotlib import style
from PIL import Image

font_name = font_manager.FontProperties(fname="C:/ProgramData/Anaconda3/Lib/site-packages/pytagcloud/fonts/NanumGothic.ttf").get_name()
rc('font', family=font_name)
style.use('ggplot')

top = ko.vocab().most_common(10)

list_key= []
for a in top :
    list_key.append(a[0])
    
val_key= []
for a in top :
    val_key.append(a[1])
    
labels = list_key
ratio = val_key

plt.pie(ratio, labels=labels, shadow=False, startangle=90,autopct='%1.1f%%')
fig = plt.gcf() #���� figure�� �ҷ�����
fig.set_size_inches(5, 5) #ũ�� �ٲٱ�(inch ����)


fig.savefig('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\graph\\keyword.png')
    
labels_unme = ['��','����']
ratio_unme = [my_firstTalk_ratio,you_firstTalk_ratio]

fig = plt.figure()

    
plt.pie(ratio_unme, labels=labels_unme, shadow=False, startangle=90,autopct='%1.1f%%')

fig = plt.gcf() #���� figure�� �ҷ�����

fig.set_size_inches(5, 5) #ũ�� �ٲٱ�(inch ����)



fig.savefig('C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\graph\\sendtime.png')
    
    




import cx_Oracle 

con = cx_Oracle.connect('web/123@localhost:1521/xe')

cur = con.cursor()

cur.execute("delete from gift_keyword")

con.commit()

cur = con.cursor()

cur.execute("select id from request")

con.commit()

user = cur.fetchone()

user = str(user).replace("('", "").replace("',)", "")

user

cur = con.cursor()

sql = "insert into gift_keyword(id, word_rank1, word_rank2, word_rank3, word_rank4, word_rank5) values( : user_id, :word1, :word2, :word3, :word4, :word5)"

if len(gift_list) == 1:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=None, word3=None, word4=None, word5=None)
elif len(gift_list) == 2:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=None, word4=None, word5=None)
elif len(gift_list) == 3:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=None, word5=None)    
elif len(gift_list) == 4:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=gift_list[3], word5=None)
elif len(gift_list) == 5:
    cur.execute(sql, user_id=user, word1=gift_list[0], word2=gift_list[1], word3=gift_list[2], word4=gift_list[3], word5=gift_list[4])

con.commit()

cur = con.cursor()

cur.execute("select * from gift_keyword")

cur.fetchall()

cur = con.cursor()

cur.execute("delete from report")

con.commit()

cur = con.cursor()

report_sql = "insert into report values(:user_id,:i_aff,:you_aff,:i_resp,:you_resp)"

cur.execute(report_sql, user_id = user, i_aff = my_text_point, you_aff = you_text_point, i_resp = I_mean, you_resp = you_mean)

con.commit()
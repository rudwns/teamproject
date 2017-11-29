'''
Created on 2017. 11. 29.

@author: JIHONG
'''

from bs4 import BeautifulSoup
import urllib.request as req

url="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%98%81%ED%99%94"
res=req.urlopen(url)

soup=BeautifulSoup(res,"html.parser")

movie_title = soup.select(".thmb a img")

movie_title_list = []

for a in movie_title:
    title=a.attrs['alt']
    movie_title_list.append(title)

movie_title_list

movie_img = soup.select(".thmb a img")

movie_img_list = []

for a in movie_img:
    image=a.attrs['src']
    movie_img_list.append(image)

movie_img_list



import cx_Oracle 

conn = cx_Oracle.connect('web/123@localhost:1521/xe')

cur = conn.cursor()

cur.execute("delete from movie")

sql_insert="INSERT INTO movie VALUES(: title, : image)"

for i in range(len(movie_title_list)):
    cur.execute(sql_insert,title = movie_title_list[i], image=movie_img_list[i])

conn.commit()

cur.execute("select * from movie")

for record in cur:
    print(record)
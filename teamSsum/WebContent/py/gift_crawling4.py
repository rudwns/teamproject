'''
Created on 2017. 11. 30.

@author: pc-2
'''

from bs4 import BeautifulSoup
import urllib.request
import cx_Oracle

con = cx_Oracle.connect('web/123@localhost:1521/xe')

cur = con.cursor()

cur.execute("select id from request")

my_id=cur.fetchone()

my_id=str(my_id).replace("('","").replace("',)","")

my_id

sql="select word_rank4 from gift_keyword where id=( : user_id)"

cur.execute(sql,user_id=my_id)

con.commit()

gift=cur.fetchone()

gift_str=str(gift)

type(gift_str)

gift_str

from urllib import parse
gift=parse.quote(gift_str.replace("('","").replace("',)",""))

gift

url="http://www.ssg.com/search.ssg?target=all&query="+gift

url

response = urllib.request.urlopen(url)

soup = BeautifulSoup(response,'html.parser')

gift_addr= soup.select("span.subject")

gift_list=[]

for a in gift_addr:
    if len(gift_list)<5:
        name=a.string
        name=str.strip(name.replace("\n","").replace("\t",""))

        gift_list.append(name)

print(gift_list)

len(gift_list)

gift_img = soup.select("div.thumbnail > a > img")

gift_img_list=[]

for a in gift_img:
    if len(gift_img_list)<5:
        image=a.attrs['src']
        gift_img_list.append(image)

gift_img_list

len(gift_img_list)

gift_href = soup.select("div > div > div.thumbnail > a")

gift_href_list=[]

for a in gift_href:
    if len(gift_href_list)<5:
        gift_link="http://www.ssg.com"+a.attrs['href']
        gift_href_list.append(gift_link)

gift_href_list

len(gift_href_list)

cur = con.cursor()


sql="insert into gift values(: name,: img,: link)"

for i in range(len(gift_list)):
    cur.execute(sql, name = gift_list[i], img = gift_img_list[i], link = gift_href_list[i])

con.commit()

cur = con.cursor()

cur.execute("select * from gift")

con.commit()
# -*- coding: ms949 -*-
'''
Created on 2017. 11. 29.

@author: JIHONG
'''

from bs4 import BeautifulSoup
import urllib.request as req

from bs4 import BeautifulSoup
import urllib.request as req

url="http://ticket.interpark.com/TiKi/Special/TPRegionReserve.asp?Region=42041&RegionName=%B1%A4%C1%D6"
res=req.urlopen(url)

soup=BeautifulSoup(res,"html.parser")

culture_title = soup.select(".txt a")

culture_title_list = []

for a in culture_title:
    
    title=a.string
    culture_title_list.append(title)


len(culture_title_list)

place = soup.select(".place a")

culture_place_list =[]

for a in place:
    place=a.string
    culture_place_list.append(place)
    

len(culture_place_list)

date = soup.select(".date")



culture_date_list =[]

for a in date:
    date=a.string
    culture_date_list.append(date)
    

print(len(culture_date_list))
print(type(culture_date_list[0]))
culture_date_list

index_list=[]

for i in range (len(culture_date_list)):
    s=culture_date_list[i]
    if (s.find('기간')>=0):
        index_list.append(i)

index_list

del culture_date_list[index_list[0]]
del culture_date_list[index_list[1]-1]
del culture_date_list[index_list[2]-2]
del culture_date_list[index_list[3]-3]
del culture_date_list[index_list[4]-4]

culture_date_list

culture_link_list =[]

link = soup.select(".txt a")

for a in link:
    
    href=a.attrs['href']
    culture_link_list.append(href)
    

len(culture_link_list)

temp = []
for i in range(len(culture_title_list)):
    temp.append(culture_title_list[i]+"/"+culture_place_list[i]+"/"+culture_date_list[i]+"/"+culture_link_list[i])
    

temp

import cx_Oracle 

conn = cx_Oracle.connect('web/123@localhost:1521/xe')
 

cur = conn.cursor()

cur.execute("delete from show")

sql_insert="INSERT INTO show VALUES(: title, : place, : day, : href)"

for i in range(len(culture_title_list)):
    cur.execute(sql_insert,title = culture_title_list[i], place=culture_place_list[i], day=culture_date_list[i], href=culture_link_list[i])

conn.commit()

cur.execute("select * from show")

for record in cur:
    print(record)
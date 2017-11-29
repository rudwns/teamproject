'''
Created on 2017. 11. 29.

@author: JIHONG
'''

from bs4 import BeautifulSoup
import urllib.request

url="http://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT011005"

response = urllib.request.urlopen(url)

soup = BeautifulSoup(response,'html.parser')

two_weather = soup.select("#content > table.tbl_weather.tbl_today3 > tbody > tr > td > div > ul > li.nm > span")
two_day = soup.select("#content > table.tbl_weather.tbl_today3 > thead > tr  span")
week_weather = soup.select("#content > table.tbl_weather.tbl_today4 > tbody > tr > td > div > ul > li.nm > span")
week_day = soup.select("#content > table.tbl_weather.tbl_today4 > tbody > tr > th > span")
week_situation = soup.select("#content > table.tbl_weather.tbl_today4 > tbody > tr > td > div > ul > li.info ")

two_day_list=[]
two_weather_list=[]
week_day_list=[]
week_weather_list=[]
week_situation_list=[]

for day in two_day:
    span = day.string
    print("weather",span)
    two_day_list.append(span)    
print("\t")

for weather in two_weather:
    span = weather.string
    print("temp",span)
    two_weather_list.append(span)
print("\t")



for day in week_day:
    span = day.string
    print("weather",span)
    week_day_list.append(span)
print("\t")

for weather in week_weather:
    span = weather.string
    print("temp",span)
    week_weather_list.append(span)
print("\t")
    
for situation in week_situation:
    span = situation.string
    print("situ",span)
    week_situation_list.append(span)
print("\t")


url="http://news.nate.com/weather?areaCode=11F20501"

response = urllib.request.urlopen(url)

soup = BeautifulSoup(response,'html.parser')

one_situation = soup.select("#contentsWraper > div.weather_main_today_wrap > div.weather_today > div.today_wrap > div > div.left_today > p")


situation_list=[]

for situation in one_situation:
    li = situation.string
    print("situ",li)
    situation_list.append(li)
print("\t")

situation_list.append(week_situation_list[0])
situation_list.append(week_situation_list[1])
situation_list.append(week_situation_list[2])
situation_list.append(week_situation_list[4])
situation_list.append(week_situation_list[6])
situation_list.append(week_situation_list[8])


for i in range(len(week_day_list)):
    week_day_list[i]=week_day_list[i].replace('(','').replace(')', '').replace('/', '.')


import cx_Oracle

con = cx_Oracle.connect('web/123@localhost:1521/xe')

cur = con.cursor()

cur.execute("delete from WEEK_WEATHER")

con.commit()

cur = con.cursor()

sql_insert="INSERT INTO WEEK_WEATHER VALUES(: day, : weather, : min_temp, : max_temp)"

cur.execute(sql_insert,day = two_day_list[0],weather = situation_list[0], min_temp=two_weather_list[0], max_temp=two_weather_list[1] )
cur.execute(sql_insert,day = two_day_list[1],weather = situation_list[1], min_temp=two_weather_list[2], max_temp=two_weather_list[3] )
cur.execute(sql_insert,day = week_day_list[0],weather = situation_list[2], min_temp=week_weather_list[0], max_temp=week_weather_list[1] )
cur.execute(sql_insert,day = week_day_list[1],weather = situation_list[3], min_temp=week_weather_list[2], max_temp=week_weather_list[3] )
cur.execute(sql_insert,day = week_day_list[2],weather = situation_list[4], min_temp=week_weather_list[4], max_temp=week_weather_list[5] )
cur.execute(sql_insert,day = week_day_list[3],weather = situation_list[5], min_temp=week_weather_list[6], max_temp=week_weather_list[7] )
cur.execute(sql_insert,day = week_day_list[4],weather = situation_list[6], min_temp=week_weather_list[8], max_temp=week_weather_list[9] )

con.commit()

cur.execute("select * from WEEK_WEATHER")

for record in cur:
    print(record)
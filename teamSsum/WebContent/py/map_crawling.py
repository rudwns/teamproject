'''
Created on 2017. 11. 29.

@author: pc-06
'''
import urllib.request
from bs4  import BeautifulSoup
url = "https://www.diningcode.com/list.php?page=1&chunk=10&query=%EA%B4%91%EC%A3%BC+%EB%8D%B0%EC%9D%B4%ED%8A%B8%EC%BD%94%EC%8A%A4"
response = urllib.request.urlopen(url)
soup = BeautifulSoup(response,'html.parser')









for a in range(1,10) :
        url = "https://www.diningcode.com/list.php?page="+str(a)+"&chunk=10&query=%EA%B4%91%EC%A3%BC+%EB%8D%B0%EC%9D%B4%ED%8A%B8%EC%BD%94%EC%8A%A4"
        response = urllib.request.urlopen(url)
        soup = BeautifulSoup(response,'html.parser')
        address = soup.select(".dc-restaurant-info-text ")
        for result in address:
            
            print(result.text)
            print("\t")



for a in range(1,10) :
        url = "https://www.diningcode.com/list.php?page="+str(a)+"&chunk=10&query=%EA%B4%91%EC%A3%BC+%EB%8D%B0%EC%9D%B4%ED%8A%B8%EC%BD%94%EC%8A%A4"
        response = urllib.request.urlopen(url)
        soup = BeautifulSoup(response,'html.parser')
        title = soup.select("div.dc-restaurant-name a ")
        for result in title:
            
            print(result.text)
            print("\t")

import urllib.request
from bs4  import BeautifulSoup
test = ()

list_c = []
for a in range(1,10) :
        url = "https://www.diningcode.com/list.php?page="+str(a)+"&chunk=10&query=%EA%B4%91%EC%A3%BC+%EB%8D%B0%EC%9D%B4%ED%8A%B8%EC%BD%94%EC%8A%A4"
        response = urllib.request.urlopen(url)
        soup = BeautifulSoup(response,'html.parser')
        title = soup.select("div.dc-restaurant-name a")
        address = soup.select(".dc-restaurant-info-text")   
        z = []
        b = []
        c = []
        for i in range(30):
            if i%3 == 0:
                z.append(address[i].text)
            elif i%3 == 1:
                b.append(address[i].text)
            elif i%3 == 2:
                c.append(address[i].text)
        test =(title,z,b,c)
        for i in range(0,10):
            print(title[i].text+"\t")
            print(z[i]+"\t")
            print(b[i]+"\t")
            print(c[i]+"\t")
            doc3 = title[i].text +"\n"+z[i]+"\n" + b[i]+"\n" + c[i] + "\n"
            for w in doc3.split(sep='\n') :
                list_c.append(w)
                
print(list_c[1])

list_a = []
list_b = []


for a in range(10) :
        url = "https://www.diningcode.com/list.php?page="+str(a)+"&chunk=10&query=%EA%B4%91%EC%A3%BC+%EB%8D%B0%EC%9D%B4%ED%8A%B8%EC%BD%94%EC%8A%A4"
        response = urllib.request.urlopen(url)
        soup = BeautifulSoup(response,'html.parser')
        title = soup.select("div.dc-restaurant-name a ")
        for result in title:
            doc = result.text
            for w in doc.split(sep='\n') :
                list_a.append(w)
        for result2 in address:
            doc2 = result2.text
            for w in doc2.split(sep='\n') :
                list_b.append(w)


import pandas as pd

frame = pd.DataFrame({'title' : list_c} )
print(frame)

list_title = []
list_mood = []
list_address = []
list_phone = []
list_null = []
list_we = ['35.1546849,126.85440659999995','35.1497943,126.92547480000007','35.1495229,126.92465420000008','35.1903388,126.82328239999993','35.190389,126.8195858','35.1545865,126.85391340000001','35.2166195,126.84381810000002','35.1894776,126.8273391','35.1898086,126.8181601','35.1498554,126.94514720000006','35.1232179,126.88438180000003','35.15129640000001,126.92409859999998','35.1545303,126.84950660000004','35.1495543,126.92432450000001','35.1545865,126.85391340000001','35.1478056,126.91492270000003','35.145612,126.84363259999998','35.17746440000001,126.91257789999997','35.1218351,126.91697320000003','35.14375649999999,126.84197330000006','35.1563261,126.84782730000006','35.15125099999999,126.84996980000005','35.1904229,126.81877499999996','35.14512150000001,126.84049989999994','35.1597624,126.88034770000002','35.1537188,126.85052659999997','35.1467745,126.91795869999999','35.1491464,126.92529239999999','35.215135,126.84571400000004','35.1385919,126.91525899999999','35.1387442,126.91525810000007','35.1765006,126.91295850000006','35.1408964,126.91501219999998','35.1626777,126.88330210000004','35.154993,126.85391319999997','35.1485629,126.91624939999997','35.1377265,126.91364099999998','35.18486,126.83398060000002','35.1399599,126.9154241','35.151195,126.85461729999997','35.1597624,126.88034770000002','35.1362737,126.91820189999999','35.147667,126.91465019999998','35.1480681,126.92617789999997','35.1898115,126.8111075','35.1491624,126.92638409999995','35.1918398,126.8298131','35.1982251,126.8265061','35.1516054,126.92600629999993','35.1611052,126.87992980000001','35.1395805,126.91653739999992','35.144952,126.84058570000002','35.151452,126.92345009999997','35.1488896,126.84894510000004','35.1377996,126.91535509999994','35.1407119,126.91666069999997','35.1380534,126.912407','35.1477933,126.9178882','35.1385919,126.91525899999999','35.090543,126.95244009999999','35.14375649999999,126.84197330000006','35.1558753,126.84780840000008','35.149114,126.84894409999993','35.1481026,126.91810250000003','35.148202,126.92664149999996','35.1233072,126.88185069999997','35.216044,126.84831299999996','35.1239946,126.86868909999998','35.1911728,126.81858629999999','35.175749,126.91427820000001','35.1499918,126.9243649','35.1476128,126.92627390000007','35.144902,126.83885250000003','35.16641660000001,126.86834220000003','35.1456476,126.91430939999998','35.1241127,126.90760660000001','35.1910311,126.83092009999996','35.1597624,126.88034770000002','35.1916772,126.8210999','35.1530599,126.84995860000004','35.1508005,126.94416479999995','35.1395805,126.91653739999992','35.1563356,126.8110517','35.1161455,126.84737089999999','35.1924216,126.828961','35.1924216,126.828961','35.1481988,126.91434019999997','35.1521543,126.85540719999995','35.1468933,126.918541','35.1109859,126.8958811']
list_pic = [
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57216/52079/57216_52079_80_0_8768_20161122113318579_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52794/51070/52794_51070_80_0_5735_201612521942666_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57117/54464/57117_54464_77_0_374_201592017212361_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51456/50655/51456_50655_89_0_4348_201732134532670_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57657/56312/57657_56312_80_0_9990_2016522213030641_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59621/53964/59621_53964_80_0_5524_2016111320186602_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52890/52731/52890_52731_80_0_5372_20171394530740_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/58020/51522/58020_51522_80_0_2698_2016125211418651_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50568/50525/50568_50525_86_5_6979_201641582253718_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55817/58407/55817_58407_86_5_2489_2016225223332417_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51427/57906/51427_57906_86_0_895_20161121192519394_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50648/54567/50648_54567_80_0_6385_2016125211050468_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50394/50656/50394_50656_80_0_4493_201612117472647_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51982/59833/51982_59833_77_0_1971_201652113439573_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51549/51368/51549_51368_86_0_9942_20161122154737552_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55731/59608/55731_59608_80_0_1122_20171385940413_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50481/51044/50481_51044_85_0_3205_201641523756804_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50884/53470/50884_53470_76_0_7794_20167514231396_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52956/50991/52956_50991_76_0_2726_201652319034582_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50740/52647/50740_52647_76_0_1048_20165249498645_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59017/53140/59017_53140_77_0_2733_20155564835924_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50809/51895/50809_51895_89_0_4858_2016117232546196_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50284/58185/50284_58185_89_0_9672_201641672834490_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59736/57438/59736_57438_89_0_9958_20161121191350746_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59852/51134/59852_51134_80_0_6264_2017328142257172_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55754/59857/55754_59857_85_0_4132_2016318233041424_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55210/50727/55210_50727_77_0_1315_20151114151910128_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50856/52772/50856_52772_80_0_3283_2016125211125827_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51560/58359/51560_58359_80_0_95_20161121183922741_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/54508/53722/54508_53722_80_0_7008_2017528165652842_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51630/53594/51630_53594_80_0_9658_201773023556144_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55026/51705/55026_51705_80_0_9183_2017328201835935_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/58052/52184/58052_52184_80_0_2197_2017528122540320_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50621/54338/50621_54338_80_0_7906_20161214204738203_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57849/52674/57849_52674_80_0_39_2017224115456146_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55096/51198/55096_51198_80_0_8702_2017730173353850_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/58294/53570/58294_53570_80_0_3126_201722321346890_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51576/50763/51576_50763_86_0_9598_20161122121721547_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56964/52530/56964_52530_89_0_2146_201732135857282_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51229/56241/51229_56241_80_0_7673_201631864122126_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52328/57323/52328_57323_76_0_1618_20167452550288_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59670/52741/59670_52741_80_0_7719_2017102251019978_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/54984/59831/54984_59831_89_0_7775_20141223192710831_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51691/59564/51691_59564_80_0_5578_20161122154928394_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55126/56365/55126_56365_80_0_9860_20171365254373_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/53296/55202/53296_55202_86_5_2574_201572720433236_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59583/53573/59583_53573_80_0_8510_20151024221431793_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56952/55080/56952_55080_77_0_3219_20147113165666_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50237/52366/50237_52366_86_5_7596_2015122012503372_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55435/55667/55435_55667_80_0_3989_20172238301428_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57658/50448/57658_50448_89_0_3777_2017228124439457_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50765/54939/50765_54939_80_0_6892_2016117154042529_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/58809/51046/58809_51046_80_0_8846_2017911183113535_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51692/55730/51692_55730_85_0_3201_2016318225347714_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57021/50752/57021_50752_76_0_6450_20167516111656_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/55372/55542/55372_55542_80_0_5033_201611221432735_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/54415/56016/54415_56016_85_0_15_20161122122728203_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56469/56606/56469_56606_76_0_4131_20167519420429_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59752/57097/59752_57097_80_0_3939_201722742917355_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/53341/54873/53341_54873_80_0_112_20172242041317_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59374/51336/59374_51336_89_0_7211_201652313510958_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59187/50486/59187_50486_85_0_1897_201582181714822_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52405/56205/52405_56205_89_0_5114_201631717941988_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56251/58403/56251_58403_80_0_6323_2016112217299223_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56246/55919/56246_55919_80_0_3946_20161121181127338_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59772/59916/59772_59916_89_0_2676_201474181231618_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52069/51958/52069_51958_89_0_1336_20158224116457_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59668/56314/59668_56314_89_0_2777_201611221759923_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51076/51653/51076_51653_80_0_707_2016117155754455_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59594/56379/59594_56379_86_5_2605_2015127205117127_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/51617/58583/51617_58583_86_0_8209_2016824104541309_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50189/52522/50189_52522_80_0_8324_201612521113611_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56595/50406/56595_50406_80_0_219_2017630233519920_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59801/56599/59801_56599_85_0_766_201554164154461_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/50648/57183/50648_57183_85_0_3881_201512312541452_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56470/59435/56470_59435_80_0_4283_201722311150764_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57216/52079/57216_52079_80_0_8768_20161122113339256_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56278/54521/56278_54521_80_0_2079_20161122137094_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56288/54198/56288_54198_85_0_3076_201641512182588_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/53321/59777/53321_59777_86_5_7834_201625195028244_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/57328/52385/57328_52385_89_0_5489_20173285637443_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59704/53324/59704_53324_80_0_9911_2017630235150980_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56664/53086/56664_53086_80_0_4239_2017731144021749_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/58434/52661/58434_52661_86_5_486_2014911151845492_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59908/52309/59908_52309_80_0_6755_201722522524676_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52576/55241/52576_55241_86_5_3987_201631820474626_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59669/53334/59669_53334_80_0_6946_2017225152438532_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/54336/54721/54336_54721_85_0_2626_2016226162324388_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56275/50569/56275_50569_80_0_6069_2016112218938208_300x200.jpg',
    'https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52421/54924/52421_54924_80_0_9794_201722523535347_300x200.jpg'
    
    
]

for i in range(0,len(list_c)):
    if(i%10 == 0 or i%10 == 5) :
        list_title.append(list_c[i])
    elif(i%10 == 1 or i%10 == 6) :
        list_mood.append(list_c[i])
    elif(i%10 == 2 or i%10 == 7) :
        list_address.append(list_c[i])
    elif(i%10 == 3 or i%10 == 8) :
        list_phone.append(list_c[i])
    else :
        list_null.append(list_c[i])


import cx_Oracle


con = cx_Oracle.connect('web/123@localhost:1521/xe')

cur = con.cursor()

cur.execute("delete from restov5")

con.commit()

cur = con.cursor()

sql_insert="INSERT INTO restov5 VALUES(: title, : mood, : address, : phone, : we, : img)"

for a in range(0,len(list_title)):
    cur.execute(sql_insert,title = list_title[a], mood=list_mood[a], address=list_address[a], phone=list_phone[a] , we=list_we[a],img = list_pic[a] )

con.commit()

cur.execute("select * from restov5")
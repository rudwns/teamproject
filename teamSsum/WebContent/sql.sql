CREATE TABLE show(
    title VARCHAR2(100),
    place VARCHAR2(100),
    days VARCHAR2 (100),
    link VARCHAR2(100)
);

drop table show;
select * from show

CREATE TABLE movie(
    title VARCHAR2(200),
    image VARCHAR2(200)
);

select * from movie	

select * from request

insert into request values("ljh")

create table week_weather(
	day VARCHAR2(20), 
	WEATHER VARCHAR2(20), 
	MIN_TEMP VARCHAR2(20), 
	MAX_TEMP VARCHAR2(20)
  );
  
  create table gift(
	tltle VARCHAR2(200), 
	img VARCHAR2(200), 
	link VARCHAR2(200)
  );
  
  create table gift_keyword(
	id VARCHAR2(20), 
	word_rank1 VARCHAR2(20), 
	word_rank2 VARCHAR2(40), 
	word_rank3 VARCHAR2(40), 
	word_rank4 VARCHAR2(40), 
	word_rank5 VARCHAR2(40)
  );
  
  create table request(
	id VARCHAR2(20)
  );
  insert into GIFT_KEYWORD values('경준','핸드폰','방향제','키링','지갑','향수');
  select * from gift_keyword
  
  insert into REQUEST values('경준')

  
select * from week_weather
  
create table ssum_member(
	id varchar(50) primary key,
	pw varchar(50),
	nickname varchar(50),
	personnumber varchar(50),
	sex varchar(50)

);

select * from ssum_member

create table fileboard (
num number,
writer varchar(50),
title varchar(50),
fileName varchar(50),
day varchar(30)
)

create table report (
id varchar(20),
i_affection number,
you_affection number,
i_resptime number,
you_resptime number
)

select * from report

drop table report

// 시퀀스생성
create sequence file_num
start with 1
increment by 1;

insert into SSUM_MEMBER values('pkj','123','hello','123','man')




create table board(
	num number,
	title varchar(50),
	nickname varchar(50),
	content varchar(200),
	day date,
	hit number,
	likeer number,
	hate number
)
alter table board add hate number;
delete from board;
select * from board;
drop table board;

create sequence board_num
start with 1
increment by 1;
dorp sequence board_num;

create table review(
	num number,
	nickname varchar(50),
	day date,
	content varchar(200)
)
select * from review;
delete from review;

select * from gift

create table report(
id varchar(20),
word_rank1 varchar(20)
)

insert into report values('ljh','향수')
insert into report values('ljh1011','춥다')

select * from report



create table gift(
title varchar(200),
img varchar(200),
link varchar(200)

);

drop table gift
select * from restov5;
create table restov5(
title varchar(80),
mood varchar(200),
address varchar(150),
phone varchar(80),
we varchar(130),
img varchar(250)
);
drop table restov5
select * from restov5


select * from all_table;

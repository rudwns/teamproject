CREATE TABLE show(
    title VARCHAR2(50),
    place VARCHAR2(50),
    days VARCHAR2 (50),
    link VARCHAR2(100)
);

select * from show

CREATE TABLE movie(
    title VARCHAR2(100),
    image VARCHAR2(100)
);

select * from movie

create table week_weather(
	day VARCHAR2(20), 
	WEATHER VARCHAR2(20), 
	MIN_TEMP VARCHAR2(20), 
	MAX_TEMP VARCHAR2(20)
  );
  
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

select * from fileboard

// ����������
create sequence file_num
start with 1
increment by 1;

insert into SSUM_MEMBER values('pkj','123','hello','123','man')


create table book_info(
	num number,
	title varchar(50),
	author varchar(50),
	publisher varchar(50),
	possible number
)

select * from book_info;

delete from book_info;

drop table book_member;
drop table book_info;
drop sequence book_num;


create table board(
	num number,
	title varchar(50),
	nickname varchar(50),
	content varchar(200),
	day date,
	hit number
)
delete from board;
select * from board;
drop table board;

create sequence board_num
start with 1
increment by 1;





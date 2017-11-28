CREATE TABLE show(
    title VARCHAR2(50),
    place VARCHAR2(50),
    days VARCHAR2 (50),
    link VARCHAR2(100)
);

create table week_weather(
	day VARCHAR2(20), 
	MIN_TEMP VARCHAR2(20), 
	MAX_TEMP VARCHAR2(20)
  );




create table ssum_member(
   id varchar(50) primary key,
   pw varchar(50),
   nickname varchar(50),
   personnumber varchar(50),
   sex varchar(50)

);
select * from ssum_member;

insert into book_member values('smart','1234','Admin','smart@smhrd.or.kr','062-350-1234');
insert into book_member values('pkj','1234','haha','rudwns0810@naver.com','010-8929-1461');
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

create sequence book_num
start with 1
increment by 1;

insert into book_info values(book_num.nextval,'82���������','������','������',0);
insert into book_info values(book_num.nextval,'���� �ִ� ����','����� �̽ñ���','������',0);
insert into book_info values(book_num.nextval,'���� ������ �԰� �;�','���̳� ���','�ҹ̵̹��',0);
insert into book_info values(book_num.nextval,'�������� ����','�迵��','���е���',0);
insert into book_info values(book_num.nextval,'���ѻ꼺','����','�а���',0);

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





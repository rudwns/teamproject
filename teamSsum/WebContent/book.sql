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

insert into book_info values(book_num.nextval,'82년생김지영','조남주','민음사',0);
insert into book_info values(book_num.nextval,'남아 있는 나날','가즈오 이시구로','민음사',0);
insert into book_info values(book_num.nextval,'너의 췌장을 먹고 싶어','스미노 요루','소미미디어',0);
insert into book_info values(book_num.nextval,'살인자의 기억법','김영하','문학동네',0);
insert into book_info values(book_num.nextval,'남한산성','김훈','학고재',0);

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





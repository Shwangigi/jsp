create table member(
   id varchar2(10) not null,
   pass varchar2(10) not null,
   name varchar2(30) not null,
   regidate date default sysdate not null, -- 생성날짜
   primary key(id)
) -- 회원용 테이블

drop table member;
drop table board;

select * from member;

select * from board;

create table board(
  num number primary key, -- 게시물 번호(시퀀스)
  title varchar2(200) not null, --- 제목
  content varchar2(2000) not null, -- 내용
  id varchar2(10) not null, -- 작성자 -> member=id
  postdate date default sysdate not null,-- 작성일
  visitcount number(6)  -- 조회수
)

--외래키 설정(부모 memmber->자식 board)
alter table board add constraint board_member_fk foreign key(id) references member(id);

--시퀀스 설정 (자동번호 주입)
create sequence seq_board_num 
   increment by 1 -- 증가값 1
   start with 1 -- 시작값 1
   minvalue 1 -- 최소값 1
   nomaxvalue -- 최대값 없음
   nocycle-- 반복없음
   nocache;-- 미리 만들지 않음
   
   select * from member where id='kkw' and pass='1234';
   
      id varchar2(10) not null,
   pass varchar2(10) not null,
   name varchar2(30) not null,
   sex varchar2(5) not null,
   birthday varchar2(20) not null,
   email varchar2(30) not null,
   phone varchar2(20) not null,
   adress varchar2(50) not null,
   regidate date default sysdate not null, -- 생성날짜
   
insert into member(id,pass, name) 
values ( 'kkw','1234', '김기원');
insert into member(id,pass, name) 
values ( 'kks','1236', '양승환');
insert into member(id,pass, name) 
values ( 'kkq','1235', '안희준');
insert into member(id,pass, name) 
values ( 'ahj','1235', '조건재');
insert into member(id,pass, name) 
values ( 'jgj','1235', '신용재');

insert into board(num, title, content, id, postdate, visitcount)
values (seq_board_num.nextval, '제목1','내용1', 'kkw',sysdate,0);
insert into board(num, title, content, id, postdate, visitcount)
values (seq_board_num.nextval, '제목2','내용2', 'kks',sysdate,0);
insert into board(num, title, content, id, postdate, visitcount)
values (seq_board_num.nextval, '제목3','내용3', 'kkq',sysdate,0);
insert into board(num, title, content, id, postdate, visitcount)
values (seq_board_num.nextval, '제목4','내용4', 'ahj',sysdate,0);
insert into board(num, title, content, id, postdate, visitcount)
values (seq_board_num.nextval, '제목5','내용5', 'jgj',sysdate,0);

   

select count(*) from board where title like'%제목%'

select B.*, M.* from member M inner join board B on M.id = B.id where num = 2;

update board set visitcount = visitcount+1 where num=2;

select * from (
                select Tb.*, rownum rNum from (
                                            select  * from board order by num desc
                                                )Tb
               ) where rNum between 1 and 10;
               
create table myfile(
   idx number primary key,
   name varchar2(50) not null,
   title varchar2(200) not null,
   cate varchar2(30),
   ofile varchar2(100) not null, -- 원본파일명
   sfile varchar2(100) not null, -- 저장파일명
   postdate date default sysdate not null
);

select * from myfile;

drop table myfile;
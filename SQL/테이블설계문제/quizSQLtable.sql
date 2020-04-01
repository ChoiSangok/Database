-- 회원등급 테이블

create table grade (
    grade number,
    gradename varchar2(100) );
    
alter table grade
add constraint grade_pk
    primary key(grade) ;


    
-- 회원신고 테이블   

create table report (
    report number,
    report_dat DATE,
    report_reason varchar(500) );
    
    
alter table report
add constraint report_pk
    primary key (report );
    
    
    
    

--유저 내용
create table userTb(
    userno NUMBER,
    userid VARCHAR2(50),
    userpw VARCHAR2(100),
    gender VARCHAR2(1),
    email VARCHAR2(100),
    phone VARCHAR2(11),
    grade NUMBER,
    report NUMBER ) ; 
    

alter table userTb
add constraint userTb_pk
    primary key (userno);
    
   
alter table userTb
add constraint userTb_fk
    foreign key (grade)
    REFERENCES grade(grade);
    
    

alter table userTb
add constraint userTb_fk_01
    foreign key (report )
    references report(report);
    


    

    
-- 게시판 종류


create table board_cate(
    cateno number,
    cate_name varchar2(100),
    cate_dat date );
    
    
alter table board_cate
add constraint board_cate_pk
    primary key (cateno);
    
 
 -- 게시판 테이블
 
create table board(
    boardno number,
    cateno number,
    title varchar2(200),
    content varchar2(200),
    insert_dat date,
    update_dat date,
    hit number,
    has_file varchar(1),
    userno number );
    
alter table board
add constraint board_pk
    primary key (boardno) ;

alter table board
add constraint board_fk_01
    foreign key (cateno)
    references board_cate(cateno);
    

alter table board
add constraint board_fk_02
    foreign key(userno)
    references userTb(userno);

alter table board
add constraint board_check
    check (has_file in ('y','n') );

    
-- 첨부파일 테이블

create table filetb (
    fileno number,
    boardno number,
    filename varchar2(500),
    filepath varchar2(500),
    filesize number,
    filetype varchar2(20) );
    
alter table filetb
add constraint filetb_pk
    primary key(fileno);
    
alter table filetb
add constraint filetb_fk
    foreign key (boardno)
    REFERENCES board(boardno);
    

create table commenttb (
    commentno number,
    boardno number,
    userno number,
    content varchar(500),
    insert_dat date );
    
    
alter table commenttb
add constraint commenttb_pk
    primary key(commentno);
    
alter table commenttb
add constraint commenttb_fk_01
    FOREIGN key(boardno)
    REFERENCES board ( boardno );
    
alter table commenttb
add constraint commenttb_fk_02
    foreign key (userno)
    references userTb(userno);
    

-- 테이블 한번에 지우기

alter table userTb
drop constraint userTb_fk;

alter table userTb
drop constraint userTb_fk_01;

drop table grade;
drop table report;

alter table board
drop constraint board_fk_01;

alter table board
drop constraint board_fk_02;

drop table board_cate;

alter table filetb
drop constraint filetb_fk;

drop table filetb;

alter table commenttb
drop constraint commenttb_fk_01;

drop table board;

alter table commenttb
drop constraint commenttb_fk_02;

drop table userTb;

drop table commenttb;





    
    

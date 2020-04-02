create table myBoard ( -- myBoard table 생성
    boardno NUMBER,
    title VARCHAR2(300) );
    
alter table myBoard         -- primary key boardno
add CONSTRAINT myBoard_pk
    primary key(boardno);
    
    
create sequence SEQ_MyBoard; -- SEQ_MyBoard 시퀀스 생성


create table AttachFile ( --AttachFile 생성
    fileno NUMBER,
    boardno NUMBER,
    filename VARCHAR2(200) );




alter table AttachFile
add constraint AttachFile
    foreign key( boardno )  --외래키 보드 넘버
    REFERENCES myBoard(boardno) ;

create sequence SEQ_AttachFile; -- SEQ_AttachFile 생성


insert into myBoard( boardno, title )
values (SEQ_MyBoard.nextval,'안녕하세요');

insert into myBoard( boardno, title )
values (SEQ_MyBoard.nextval,'내가 등장');

insert into AttachFile( fileno, boardno, filename )
values (SEQ_AttachFile.nextval,SEQ_MyBoard.currval,'Hello.jpg');

insert into AttachFile( fileno, boardno, filename )
values (SEQ_AttachFile.nextval,SEQ_MyBoard.currval,'sangokgi.jpg');


-- 하나씩 확인코드
select * from myBoard;

select * from AttachFile;


-- 확인코드
SELECT * FROM myboard mb, AttachFile af WHERE mb.boardno = af.boardno;









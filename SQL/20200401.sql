
-- ALTER TABLE 테스트용 테이블 생성

CREATE TABLE alter_test (
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT alter_test_pk PRIMARY KEY( empno) );
    
    
-- 풀어서쓰는방법
--create table alter_test(
--    empno number(4),
--    ename varchar2(30) );
--    
--alter table alter_test
--    add constraint alter_test_pk
--    primary key (empno) ;

DESC alter_test; -- 데이터확인


SELECT * FROM alter_test;

-- 데이터 삽입
INSERT INTO alter_test
SELECT empno, ename FROM emp;


-- emp, sal 컬럼 추가하기

DESC emp;

ALTER TABLE alter_test
ADD ( sal NUMBER(7,2) );

DESC alter_test; -- sal 잘 들어갔나 확인 ~

SELECT* FROM alter_test;



-- job emp 에 들어있는  job컬럼 추가힉

ALTER TABLE alter_test
ADD( JOB VARCHAR2(9) );

DESC alter_test; -- job 잘들어갔나 확인~

-- sal job 에  emp 테이블의 데이터를 반영하기
-- empno 가 같은 데이터를 찾아서 반영할 것 ~!

UPDATE alter_test 
SET sal = ( -- 다중행서브쿼리
    SELECT sal FROM emp E 
    WHERE E.empno= alter_test.empno );

UPDATE alter_test 
SET JOB = (
    SELECT JOB FROM emp E 
    WHERE E.empno= alter_test.empno );

-- 두 개를 한번에 조회
UPDATE alter_test
SET ( sal, JOB ) =  (
    SELECT sal, JOB FROM emp E
    WHERE E.empno=alter_test.empno );

SELECT * FROM alter_test;

SELECT empno FROM alter_test;





-- alter_test.job : varchar2(9) -> number

ALTER TABLE alter_test
MODIFY ( JOB NUMBER ); -- 데이터가 존재하면 불가


-- job 컬럼의 모든 데이터를 null로 수정

update alter_test
set job = null; -- 데이터를 null로 채워주고

ALTER TABLE alter_test
MODIFY ( JOB NUMBER ); -- 다시 해주면 가능~ 


desc alter_test; -- 잘바뀌었나 확인하는 단계

alter table alter_test
modify( job not null ); -- null 값을 가지고 있어서 안된다

alter table alter_test
modify ( ename not null ); -- not null 제약사항 부여

alter table alter_test
modify ( ename null ); -- not null 제약사항 회수

desc alter_test;


alter table alter_test;


-- 컬럼 삭제
alter table alter_test
drop column job;

-- 컬럼 비활성화 ( 복구 불가능 )

alter table alter_test
set unused ( sal );

select * from alter_test;

-- 비활성화된 컬럼 정보 자료사전 ( 개수만 나온다 )
select * from user_unused_col_tabs;


alter table cons_15 set unused ( data );
alter table cons_14 set unused ( data );
alter table cons_12 set unused ( data );


-- 비활성화된 컬럼 정리하기 ( 완전 삭제 )
alter table alter_test drop unused columns;



-- 컬럼명 변경
-- altertest.empno -> alter_test.eno

alter table alter_test
rename column empno to eno;

select * from alter_test;
desc alter_test;


-- 테이블명 변경
-- alter_test -> alter_tb

alter table alter_test
rename to alter_tb;

select * from alter_tb;


select * from alter_tb;

-- 데이터 삭제 dml  delete

-- delete alter_tb;
-- rollback;


-- 데이터 삭제 truncate - ddl

truncate table alter_tb;

select * from alter_tb; -- 조회쿼리 -- 롤백해도 돌아오지 않음

-- 테이블 삭제 alter_tb

drop table alter_tb;

-- 삭제확인 
desc alter_tb;

select * from tabs
where tablename=upper('alter_tb');


-- 사용자가 생성한 테이블들 정보 자료사전 - user_tables

select * from user_tables
where table_name=upper('alter_tb');




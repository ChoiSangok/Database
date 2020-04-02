
 -- 인덱스 자료사전
 
select * from user_indexes
where table_name=upper('emp');
 
 

--인덱스 컬럼 자료사전

select * from user_ind_columns
where table_name =upper('emp');


--인덱스 생성

create index idx_salgrade
on salgrade(grade);



--인덱스가중복되는 값으로 데이터 삽입

insert into salgrade values(5,1000,15000);

select * from salgrade;


--인덱스 재생성구문
alter index idx_salgrade rebuild;


-- 삭제 
drop index idx_salgrade;






-- UNIQUE 인덱스

create unique index idx_salgrade on salgrade( grade );

select * from salgrade;


select * from salgrade;
    update salgrade set grade=6 
    where  losal =1000;
    

    
select * from user_indexes
where table_name = upper('salgrade');
    
insert into salgrade values ( 6,10000,12000);


--부서별 조회 

select * from emp
where deptno=20;

 -- NONUNIQUE 인덱스 생성
 
create index idex_emp_deptno on emp (deptno);


-- 부서 내 이름으로 조회

select * from emp
where deptno=10
    and ename=upper('miller');
    

-- 복합 컬럼 인덱스 ( COMPOSITE UNIQUE INDEX )
CREATE unique index idx_emp_deptno_ename
on emp( deptno, ename);

-- 자료사전 확인

select * from user_indexes
where table_name = upper('emp');

select * from user_ind_columns
where table_name = upper('emp')
order by index_name, column_position;









-- 뷰 VIEW

SELECT * from (
    select * from emp
    where empno < 2000 );

-- scott 사용자 계정에 뷰 생성 권한 ( create view )이 없어서 
-- 수행할 수 없음 (Insufficient Privileges )


create view test_view
as (
    --서브쿼리 
    select * from emp
    where empno < 2000
    );





-- scott 에서 뷰 생성 권한 부여하기 ( system 계정 사용 )




GRANT CREATE VIEW
TO scott;

create view test_view
as (
    --서브쿼리 
    select * from emp
    where empno < 2000
    );

select * from test_view;

-- 뷰 자료사전 조회

select * from user_views;


-- 뷰 서브쿼리 수정

create or replace view test_view
as (
    select empno, ename from emp
    where empno<2000 );


select * from user_views;

-- 데이터삽입
insert into test_view ( empno, ename )
values(500, 'AAA');



SELECT * FROM TEST_VIEW;
SELECT * FROM emp;



insert into test_view
values( 7000, 'BBB');


-- WITH CHECK OPTION 부여하기
CREATE OR REPLACE view test_view
as (
    select empno, ename from emp
    where empno<2000 )
    
with check option;


insert into test_view values(8000,'CCC'); -- 안들어가짐
insert into test_view values(600,'ddd'); -- 잘들어감


select * from test_view;
select * from emp
where empno=8000;






-- 시퀀스 

create sequence seq_emp;


-- 시퀀스 자료사전 조회
select * from user_sequences;




select length('banana') from dual;
select seq_emp.currval from dual;
select seq_emp.nextval from dual; --nextval를 먼저해야지 currval이 나옴


insert into emp(empno, ename )
values ( seq_emp.nextval, 'Dava1' );
select * from emp;



-- 조건( 옵션 ) 부여해서 시퀀스 생성하기

CREATE SEQUENCE test_seq
START WITH 2001
minvalue 2001
maxvalue 3000
increment by 100;

select test_seq.nextval from dual;

select test_seq.currval from dual;


--cache 크기보다 한 cycle의 크기가 작음 -> 적용 안됨
alter sequence test_seq
cycle;

-- cache ㅋ기보다 한 cycle의 크기가 작음 - >적용안됨
alter sequence test_seq
cycle
cache 5;

select * from user_sequences
where sequence_name=upper('test_seq');





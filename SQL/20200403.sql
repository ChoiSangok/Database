
-- 주석 , Comment
 SELECT * FROM emp;
 

SELECT * FROM user_tab_comments; -- 테이블 주석 자료사전
SELECT * FROM user_col_comments; -- 컬럼 주석 자료사전

-- ********************* 중요 *********************
COMMENT ON TABLE emp IS '사원정보 테이블';

COMMENT ON COLUMN emp.empno IS '사원번호';
COMMENT ON COLUMN emp.ename IS '사원이름';
COMMENT ON COLUMN emp.JOB IS '직무';
COMMENT ON COLUMN emp.mgr IS '담당자';
COMMENT ON COLUMN emp.hiredate IS '입사일자';
COMMENT ON COLUMN emp.sal IS '급여';
COMMENT ON COLUMN emp.comm IS '상여금';
COMMENT ON COLUMN emp.deptno IS '부서번호';

SELECT * FROM user_tab_comments -- 테이블 주석 자료사전
WHERE table_name =UPPER('emp');

SELECT * FROM user_col_comments -- 컬럼 주석 자료사전
WHERE table_name =UPPER('emp');







-- 권한
SELECT * FROM dba_sys_privs; -- 관리자 계정으로 해야지만 보임 admin으로 하면 된당
SELECT * FROM user_sys_privs;


SELECT * FROM dba_sys_privs
WHERE grantee=UPPER('scott');
SELECT * FROM user_sys_privs;



-- role 조회

SELECT * FROM dba_role_privs
WHERE grantee=UPPER('scott');




-- role에 부여된 시스템 권한
SELECT * FROM dba_sys_privs
WHERE grantee=UPPER('resource');




-- role에 부여된 시스템 권한
SELECT * FROM dba_sys_privs
WHERE grantee IN(UPPER('resource'),UPPER('connect')) ORDER BY grantee,PRIVILEGE; 




--role 을 포함한 시스템 권한 조회하기

SELECT * FROM dba_sys_privs
WHERE grantee IN (
    SELECT granted_role FROM dba_role_privs
    WHERE grantee=UPPER('scott') )
UNION
SELECT * FROM dba_sys_privs
WHERE grantee=UPPER('scott');




--사용자계정생성

CREATE USER TEST IDENTIFIED BY 1234;


GRANT CREATE SESSION 
TO TEST;

-- test 에게 db접속 권한 회수하ㅣㄱ
revoke create session
from test;

-- 롤을 이용한 권한 부여

--resource : 기본 객체 생성 권한
-- connect : db 로그온 권한

-- 여러 권한 나열 가능

grant resource, connect 
to test;


-- ( soctt 사용 )

create role role1;


--( system 계정 사용)

grant create role
to scott;


select * from all_users;

grant role1
to test;

-- 안된다
grant create role
to test;


-- system 계정 이용
-- 일반사용자 옵션을 주는것 

GRANT CREATE ROLE
TO scott
with admin option; -- 권리자급 권한 부여


-- (scott 계정 이용 )
grant create role
to test;


--------------------------------

-------------------롤 권한 부여 실습 QUIZ-------------------



--scott 계정을 이용하여 role 생성
CREATE USER TEST2 IDENTIFIED BY 1234;


create role role_test;


--롤에 권한 부여
grant create table
to role_test;

grant create session 
to role_test;

grant create view
to role_test;

--role_test 를 test2에 부여
grant role_test
to test2;










--테이블 스페이스, tablespace
-- 테이블이 저장되는 공간 ( 파일 ) 

-- test2 전용 tablespace 생성하기

-- ( system 계정으로 수행할 것 )

-- 테이블 스페이스 생성
-- 기본크기 100M, 부족하면 10M까지 확장, 최대 500M


create tablespace test2_db
datafile 'C:\oraclexe\app\oracle\oradata\test2.db'
size 100M
autoextend on next 10M
MAXSIZE 500M;



--테이블스페이스를 사용자계정에 적용하기

ALTER USER TEST2
DEFAULT TABLESPACE TEST2_DB -- 기본테이블스페이스 지정
QUOTA UNLIMITED ON TEST2_DB -- 테이블스페이스 용량 할당량 ( 전부 )
TEMPORARY TABLESPACE TEMP; -- 임시테이블로 TEMP 저장



--테이블 스페이스 삭제

DROP TABLESPACE test2_db
including contents and datafiles --실데이터와 dbf파일 삭제
cascade constraints; --의존성을 가지는 모든 제약사항 삭제



--scott 계정 이용
grant select,insert
on dept
to test, test2;


revoke select
on dept
from test, test2;








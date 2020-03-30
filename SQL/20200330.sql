
SELECT * FROM emp;

DESC emp;

SELECT empno, ename, JOB, mgr,
    hiredate, sal, comm, deptno
    
FROM emp;

--INSERT  -- 방법 1

INSERT INTO emp( empno, ename, JOB, mgr, hiredate, sal, comm, deptno )

VALUES (1005,'CHOI','CLERK', 1003, '16/4/19' , 800, NULL, 30);
    
    
SELECT *
FROM emp;


-- INSERT 방법 2

INSERT INTO emp
VALUES ( 0419, 'sangok', 'manager', 7777, '96/04/19',800,NULL,20);

SELECT * FROM emp WHERE empno<2000;



SELECT 1, 2, 'a', 'b' 
FROM dual;

SELECT 1003,'MATHEW','SALESMAN',NULL,
    sysdate, 1500,100,30
FROM dual;

--서브쿼리로 values 말고 insert문 삽입
INSERT INTO emp
SELECT 1003,'MATHEW','SALESMAN',NULL,
    sysdate, 1500,100,30
FROM dual;

SELECT * FROM emp WHERE empno<2000;


-- insert이용 데이터 삽입
INSERT INTO emp

SELECT 1011,'EDWARD','MANAGER',NULL,NULL,NULL,NULL,NULL
FROM dual;

INSERT INTO emp (empno, ename, sal)
VALUES( 1015,'RICHARD',2000);

INSERT INTO emp( empno, ename, JOB)
VALUES ( 1012, 'edward', 'manager');

SELECT * FROM emp WHERE empno<=2000;

--commit --커밋, 데이터 변경사항을 영구적으로 적용


SELECT * FROM emp;

-- delete emp; -- 테이블 전체 삭제
-- rollback; --롤백, 데이터 변경사항을 되돌리기

-- 신중하게 씁시다~

-- 테이블 생성( select 구문의 결과를 사본테이블로 생성 )


CREATE TABLE emp_research
AS
SELECT * FROM emp;


-- 테이블확인
SELECT * FROM emp_research;

-- 테이블 삭제
DROP TABLE emp_research;

SELECT * FROM emp;


-- 빈 테이블 복사

SELECT * FROM emp
WHERE empno =7369;

SELECT * FROM emp
WHERE 1=1; -- 1:1 true 표현 


-- 빈 테이블 복사
CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp_research;


-- 20번 부서의 모든데이터를 INSERT

INSERT INTO emp_research
SELECT * FROM emp WHERE deptno=20;

-- 확인코드
SELECT * FROM emp_research;

--30 번 부서의 모든 데이터를 empno, ename 만 insert

INSERT INTO emp_research(empno, ename)
SELECT empno, ename FROM emp WHERE deptno=30;

SELECT * FROM emp_research;


-- 모든 데이터 삭제

DELETE emp_research;

INSERT ALL
WHEN deptno=20
    THEN INTO emp_research
WHEN deptno=30
    THEN INTO emp_research ( empno, ename ) 
    VALUES ( empno, ename)
SELECT * FROM emp;

SELECT * FROM emp_research;



CREATE TABLE emp_hire
AS
SELECT * FROM emp WHERE 1=0;

SELECT * FROM emp_hire;


CREATE TABLE emp_sal ( empno, ename, sal)
AS
SELECT * FROM emp WHERE 1=0;

DELETE emp_hire;
DELETE emp_sal;





-- 퀴즈
-- 데이터 없이 emp_hire 테이블 생성


-- 테이블 삽입 empno, ename , hiredate
CREATE TABLE emp_hire_re
AS
SELECT empno, ename, hiredate FROM emp WHERE 1=0;

-- insert all이용
INSERT ALL
WHEN hiredate < TO_DATE('81-06-01')
    THEN INTO emp_hire_re ( empno, ename, hiredate)
    VALUES ( empno, ename, hiredate)
SELECT empno, ename, hiredate FROM emp;

SELECT * FROM emp_hire_re;



-- 테이블 삽입 emp_sal_re
CREATE TABLE emp_sal_re
AS
SELECT empno, ename, sal FROM emp WHERE 1=0;


INSERT ALL
WHEN sal > 2000
    THEN INTO emp_sal_re (empno, ename, sal )
    VALUES ( empno, ename, sal)
SELECT * FROM emp;

SELECT * FROM emp_sal_re;

-- COMMIT; --영구적으로 적용
-- ROLLBACK ; -- 돌아오는것




-- 테이블 삭제

DELETE emp_hire_re;
DELETE emp_sal_re;

--rollback;

SELECT * FROM emp_sal_re

-- delete emp_sal_re
WHERE empno=7839;


SELECT * FROM emp
-- delete emp
WHERE empno=7369;

ROLLBACK;


--UPDATE
SELECT * FROM emp

-- update emp set ename='mc', job='donald'

WHERE empno=1001;

-- commit;

SELECT * FROM emp;




-- emp_hire  테이블의 전체 데이터의 입사일을 현재시간으로 변경

SELECT * FROM emp_hire_re;
-- update emp_hire_re set hiredate=sysdate;

SELECT * FROM emp_hire_re;
SELECT to_char(hiredate, 'YYYY/MM/DD HH24:MI:SS') FROM emp_hire_re;


--emp_sal_re 사원들 급여 550 인상
SELECT * FROM emp_sal_re;
-- update emp_sal_re set sal=sal+550;

SELECT * FROM emp_sal_re;


SELECT * FROM emp_sal_re;


-- merge

CREATE TABLE emp_merge
AS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(10,20);

SELECT * FROM emp_merge
ORDER BY deptno, empno;


-- emp 테이블에서 20, 30부서 사원들을 조회 ( merge )
-- emp_merge 테이블과 데이터 병합 ( merge )
-- 이미 테이블에 존재하는 데이터라면 sal 만 30 % 인상 UPDATE
-- 테이블에 존재하지 않는 데이터라면 삽입 ( INSERT ) 


MERGE INTO emp_merge M
USING (
    SELECT empno, ename, sal, deptno
    FROM emp
    WHERE deptno IN(20,30)
)E

ON( M.empno=E.empno )

WHEN MATCHED THEN --존재하는 데이터 , 20부서
    UPDATE SET M.sal = M.sal *1.3
    where e.sal>1500
WHEN NOT MATCHED THEN -- 존재하지 않는 데이터, 30 부서
    INSERT ( M.empno, M.ename, M.deptno, M.sal)
    VALUES ( E.empno, E.ename, E.deptno, E.sal)
    where e.sal>1000;


SELECT * FROM emp_merge
ORDER BY deptno;



-- 자료형 

CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5) );

DESC type_test_01;


-- data 1 : number - 이 보장할수있는 숫자의 개수 38개 
INSERT INTO type_test_01 ( data1 )
VALUES ( 1111111111222222222233333333334444444444 );
INSERT INTO type_test_01 ( data1 )
VALUES ( 11111111112222222222333333333344444444445555555555 );

SELECT data1 FROM type_test_01;


--data2 : NUMBER(10)

INSERT INTO type_test_01 ( data2 )
VALUES (12345);
INSERT INTO type_test_01 (data2)
VALUES(12345678901234567890);
INSERT INTO type_test_01(data2)
VALUES (1234.5678); --소수점 이하 반올림
SELECT data2 FROM type_test_01;

-- data3 : number ( 5,2) 
INSERT INTO type_test_01(data3)
VALUES ( 23.56);


INSERT INTO type_test_01(data3)
VALUES ( 23.5678); -- 소수점 셋째자리 반올림

INSERT INTO type_test_01(data3)
VALUES ( 1234.56); --안됨, 정수부 자리 너무 많음

INSERT INTO type_test_01(data3)
VALUES ( 34.5);

SELECT data3 FROM type_test_01 WHERE data3 IS NOT NULL;


-- data4 : number(4,5) - 0.0xxxx

INSERT INTO type_test_01 ( data4 ) 
VALUES(1234); -- 정수입력 불가

INSERT INTO type_test_01 ( data4 ) 
VALUES(0.1234); -- 안됨 소수점 첫째자리가 0이어야함


INSERT INTO type_test_01 ( data4 ) 
VALUES(0.0234);

INSERT INTO type_test_01 ( data4 ) 
VALUES(0.0123456789); -- 소수점반올림

SELECT data4 FROM type_test_01 WHERE data4 IS NOT NULL;




--VARCHAR (N) : 문자
CREATE TABLE type_test_02 (
    DATA VARCHAR2(10) );
    
DESC type_test_02;

-- 데이터 삽입해보기, 에러나는 데이터는!?

--'1234567890'
--'123456789012345' --에러
--'일이삼사오육칠팔구십' --에러
--'일이삼'

INSERT INTO type_test_02( DATA )
VALUES ('1234567890');

INSERT INTO type_test_02( DATA )
VALUES ('123456789012345'); -- 15

INSERT INTO type_test_02( DATA )
VALUES ('일이삼사오육칠팔구십'); -- 30 

INSERT INTO type_test_02( DATA )
VALUES ('일이삼');


SELECT * FROM type_test_02;

CREATE TABLE type_test_03 (

    data1 VARCHAR2(10 BYTE) , --10 바이트
    data2 VARCHAR2(10 CHAR) ); --10개문자

INSERT INTO type_test_03( data1, data2 )
VALUES('일이삼', '일이삼사오육칠팔구십' );

INSERT INTO type_test_03( data1, data2 )
VALUES('1234567890', '1234567890' );

SELECT * FROM type_test_02;




-- CHAR (N ) : 고정 길이 문자 

CREATE TABLE type_test_04(
    data1 CHAR,
    data2 CHAR(20),
    data3 CHAR(20 CHAR) );
    
INSERT INTO type_test_04
VALUES('Y','1234567890','일이삼사오육칠팔구십');

SELECT * FROM type_test_04;








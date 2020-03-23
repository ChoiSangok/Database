
-- 사용자 계정의 테이블 조회
--( tabs 자료사전 )
-- 실행 ctrl + enter

SELECT * FROM tabs;

-- 테이블의 구조 ( 스키마 ) 간단히 확인

DESC emp;

--테이블의 데이트 확인
SELECT * FROM emp;

-- 주석 , Comment
-- 한줄 주석 단축키  : ctrl+/



-- SELECT * FROM emp;

SELECT * FROM emp;

SELECT * FROM dept;

SELECT * FROM salgrade;

SELECT * FROM bonus;

-- 부분 컬럼( 지정한 컬럼 ) 조회

SELECT 
    empno, ename, job 
FROM emp;

-- 조회되는 컬럼명에 별칭( alias ) 을 적용하기
SELECT
    empno AS "사번", -- T사원번호
    ename "이름"-- 사원이름 AS 써도 되고 그냥 해도 된다
FROM emp;


desc emp;
SELECT empno, ename, job, mgr FROM emp;
SELECT * FROM emp;

-- WHERE 절 ( 조건절 )

-- 영업사원들만 조회
SELECT
    *
FROM emp
WHERE job='SALESMAN';

-- 전체 사원들 중 급여가 2000이 넘는 사원

SELECT
    *
FROM emp
where SAL>2000;

-- 급여가 2500 이 넘고 관리자가 아닌 사원

SELECT
    *
FROM emp
WHERE sal>2500 
    AND job !='manager';
    --AND job <> 'manager';
    
-- BETWEEN a AND b
-- 사원번호가 7700 - 7900 인 사원 조회

SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;

-- 사원이름이 'ALLEN' ~ 'KING' 사이인 사원 조회

-- 대소문자 ALT+'
SELECT
    empno, ename
FROM emp
WHERE ename BETWEEN 'ALLEN' AND 'KING';
-- WHERE NOT(ename BETWEEN 'ALLEN' AND 'KING';
-- WHERE ename NOT BETWEEN 'ALLEN' AND 'KING';

-- IN( list )

SELECT empno, ename FROM emp
WHERE NOT ( empno IN ( 7369,7521,7654,7777,8888,7878) );

SELECT empno, ename FROM emp
WHERE empno NOT IN ( 7369,7521,7654,7777,8888,7878);


SELECT empno, ename FROM emp
WHERE ename IN('SMITH','ALLEN','KING','ALICE');


--LIKE

SELECT
    empno, ename 
FROM emp
--WHERE ename like '%R%' ; -- 이름에 R를 포함하는 사원
--WHERE ename LIKE '_A%'; -- 두번째가 A인 사원
--where ename like '%RD'; --마지막이 RD인 사원
--where ename not like '%R%'; -- 이름에 R을 포함하지 않은 사원
WHERE ename like '%R%'
    or ename like '%L%';
    
    
SELECT empno, ename from emp
--where empno like '7654';
where empno='7654'; -- 동등비교 할때는 like 대신에 = 를 쓰는것이 맞다

--서식없이 동등비교(equal) 를 할 때는
--like 연산자를 사용하면 안된다( Full - Scan 발생한다 )
SELECT empno, ename from emp
where empno like '7654';






SELECT
    *
FROM emp
--WHERE mgr = null;
WHERE mgr IS NULL;



--QUIZ

SELECT
    *
FROM emp;

--1
SELECT ename
FROM emp
WHERE deptno=30 AND JOB='SALESMAN';

--2
SELECT ename
FROM emp
WHERE deptno=30 AND JOB!='SALESMAN';
--and job <> 'SALESMAN'

--3
SELECT ename
FROM emp
WHERE deptno !=30 AND JOB !='SALESMAN';
--WHERE NOT(deptno =30 and job ='SALESMAN');

--4
SELECT ename
FROM emp
WHERE empno BETWEEN 7782 AND 7900;

--5
SELECT ename
FROM emp
WHERE ename >='A' AND ename <'D';

--WHRER ename BETWEEN 'A' AND 'C'; -- 이러면 CLARK이 안나옴 
--WHERE ename BETWEEN 'A'
--    AND 'D'; -- AND 'C~'; --비추천
   
--5-1 
SELECT ename
FROM emp
WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%'; -- 비추천 full scan  이 될 위험이 많음


--6
SELECT ename
FROM emp
WHERE deptno IN(10,30);




-- ORDER BY
select * from emp


--order by empno;

order by ename desc;


-- 부서번호 오름차순, 이름 내림차순, 동명이인 사번 오름차순
SELECT * FROM emp

ORDER BY deptno ASC, ename desc,empno;



SELECT empno, ename, comm
FROM emp
ORDER BY comm DESC NULLS LAST; --null 에 대한 추가정리
--ORDER BY comm ASC NULLS FIRST; -- NULL 이 앞으로

SELECT empno, ename, comm from emp
where comm is not null
order by comm desc nulls last, ename, empno;

 -- 조회되지 않는 컬럼을 이용해서라도 정렬기준으로 삼을 수 있다
 
select empno, ename, comm from emp
order by sal desc, comm desc;


 -- DISTINCT 키워드
 SELECT DISTINCT deptno 
 FROM emp
 ORDER BY deptno;
 

SELECT empno, ename 
FROM emp;

SELECT DISTINCT empno, ename 
FROM emp;


--직무 종류 확인하기

select distinct job
from emp
order by job;


SELECT distinct
    deptno, job
from emp
order by deptno, job;







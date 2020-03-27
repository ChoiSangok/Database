-- IN 연산자
-- SALESMAN
SELECT sal
FROM emp
WHERE JOB=UPPER('salesman');


SELECT * FROM emp
WHERE sal IN(1250,1500,1600);


SELECT * FROM emp
WHERE sal IN(
            SELECT DISTINCT sal
            FROM emp
            WHERE JOB=UPPER('salesman'));
            


-- 사장의 부서정보를 확인

SELECT deptno FROM emp
WHERE JOB= UPPER('president');

SELECT * FROM emp
WHERE deptno IN (
         SELECT deptno FROM emp
         WHERE JOB= UPPER('president') );
         
         
    
-- ANY 연산자

SELECT * FROM emp
WHERE sal =ANY(
    SELECT DISTINCT sal
    FROM emp
    WHERE JOB= UPPER('salesman'));
    
    
SELECT * FROM emp
WHERE sal < ANY( --최대(최고)값보다 작은 데이터가 조회된다

    SELECT DISTINCT sal
    FROM emp
    WHERE JOB= UPPER('salesman'))
ORDER BY sal;    
    

SELECT * FROM emp
WHERE sal < ( -- 최소( 최저 ) 값보다 큰 데이터가 조회된다
    SELECT MAX(sal)
    FROM emp
    WHERE JOB= UPPER('salesman'))
ORDER BY sal;




--ALL

SELECT * FROM emp
WHERE sal =ALL ( -- 결과 모두와 같은 때 조회됨, 쓸모없음
    SELECT DISTINCT sal
    FROM emp
    WHERE JOB= UPPER('salesman'))
ORDER BY sal;



SELECT * FROM emp
WHERE sal <ALL ( -- 최소 최저값보다 작은 데이터 조회된다
    SELECT DISTINCT sal
    FROM emp
    WHERE JOB= UPPER('salesman'))
ORDER BY sal;



SELECT * FROM emp
WHERE sal >ALL ( -- 최대 최고값보다 큰 데이터가 조회된다
    SELECT DISTINCT sal
    FROM emp
    WHERE JOB= UPPER('salesman'))
ORDER BY sal;


SELECT * FROM emp
WHERE sal>ALL(1250,1500,1600)
ORDER BY sal;


--EXISTS

-- 매니저들 사원번호

SELECT DISTINCT mgr FROM emp ORDER BY mgr;

-- 매니저 역할을 수행하고 있는 사원들의 정보

SELECT * FROM emp
WHERE empno IN(
    SELECT DISTINCT mgr
    FROM emp
    )
ORDER BY empno;


SELECT * FROM emp E
WHERE EXISTS (
    SELECT DISTINCT mgr
    FROM emp M
    WHERE E.empno=M.mgr
    )
ORDER BY empno;


-- 소속인원이 존재하는 부서들의 정보

SELECT * FROM dept D
WHERE EXISTS(
    SELECT * FROM emp E
    WHERE D.deptno=E.deptno
    )
    
ORDER BY deptno;

-- 평소에는 exists보다는 in를 많이 씀
SELECT * FROM dept D
WHERE deptno IN(
    SELECT deptno
    FROM emp E )
    
ORDER BY deptno;



-- 다중 열 서브쿼리

-- 부서별 최고 임금을 받는 사원을 조회하기

SELECT MAX(sal) FROM emp;

SELECT deptno, MAX(sal) 
FROM emp
GROUP BY deptno;


--dname 나오게 하는 방법 조인#1

SELECT E.deptno, dname, empno, ename, sal
FROM emp E
INNER JOIN dept D
    ON E.deptno=D.deptno
WHERE (E.deptno, sal) IN(
   SELECT deptno, MAX(sal)
   FROM emp
   GROUP BY deptno
   )
ORDER BY deptno;


--스칼렛서브쿼리 이용 #2
SELECT E.deptno, 
        (select dname from dept d
            where e.deptno=d.deptno) dname, 
        empno, ename, sal
FROM emp E
INNER JOIN dept D
    ON E.deptno=D.deptno
WHERE (E.deptno, sal) IN(
   SELECT deptno, MAX(sal)
   FROM emp
   GROUP BY deptno
   )
ORDER BY deptno;




-- 집합연산자

-- UNION : 합집합

SELECT empno, ename, JOB ,0 "deptno"
FROM emp
WHERE JOB='SALESMAN'
UNION
SELECT empno, ename, JOB, deptno
FROM emp
WHERE JOB='MANAGER'
ORDER BY empno;


--UNION ALL : 합집합, 중복을 허용

SELECT empno, ename, sal 
FROM emp
WHERE sal<2000
UNION
SELECT empno, ename, sal
FROM emp
WHERE sal<1000
ORDER BY sal;


--INTERSECT : 합집합, 중복을 허용

SELECT empno, ename, sal 
FROM emp
WHERE sal<2000
INTERSECT
SELECT empno, ename, sal
FROM emp
WHERE sal<1000
ORDER BY sal;








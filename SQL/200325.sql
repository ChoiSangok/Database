-- to_number

SELECT 
    '123.67' "1",
    to_number('123.67') "2",
    to_number ('123.67','99999.99') "3",
--    to_number ('123.67','99999.9') "4" --서식이 맞지 않으면 거부
    to_number('123.67','99999.99999') "5"
FROM dual;


SELECT 
    67890 + 11111 "1",
    '67890' + 11111 "2",
    to_number( '67890') + 11111 "3",
--    '67,890' +11111 "4",
    to_number('67,890','999,999')+11111 "5"    
FROM dual;


SELECT 
    '$78,789' "1",
    to_number('$78,789','$999,999,999')+10000 "2"
FROM dual;


-- to_date

SELECT 
--    '19/10/7' + 5 "1"
    TO_DATE('19/10/7')+90 "2"
FROM dual;

SELECT 
    '12 1 11' "1",
    TO_DATE('12 1 11') "2",
    TO_DATE('12 1 11','YY MM DD') "3",
    TO_DATE('12 1 11','MM DD YY') "3"
    
FROM dual;


-- 단일행 함수~~

-- NVL

SELECT
    *
FROM emp;

SELECT empno, ename, nvl(comm,0) comm
FROM emp
ORDER BY comm DESC, ename;


-- NVL2
-- comm 이 NULL 이면 sal 로 치환
-- comm  이 null 이 아니면 sal + comm 로 치환

SELECT ename, sal, comm,sal+comm
FROM emp;


-- null 데이터는 존재하지 않는 데이터로 생각해서
-- 연산, 함수의 데이터 등으로 사용하면 아무것도 수행하지 않는다

SELECT ename, nvl2(comm,sal+comm, sal) pay 
FROM emp;


--NULLIF

SELECT 
    nullif(10,20) "1",
    nullif(20,10) "2",
    nullif(10,10) "3"
    
FROM dual;

-- job 컬럼에서 'SALESMAN' 을 찾는다 -> NULL변환
-- NULL 값을 NVL 을 이용해 '영업' 변환

SELECT empno, ename, JOB,
    nullif(JOB, 'SALESMAN') n_if,
    nvl(nullif(JOB, 'SALESMAN'),'영업') job_kor
FROM emp;



--DECODE

SELECT * FROM dept;

SELECT empno, ename, deptno,
    decode (deptno,
    10,'회계팀',
    20,'연구팀',
    30,'영업팀',
    40,'운영팀',
        '부서없음') dname
        
FROM emp;

-- CASE 구문

SELECT  empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'  
        ELSE '부서없음'
    END dname
FROM emp;



SELECT  empno, ename, deptno,
    CASE 
        WHEN JOB=UPPER('president') THEN '사장'
        WHEN deptno=10 THEN '회계팀'
        WHEN deptno= 20 THEN '연구팀'
        WHEN deptno=30 THEN '영업팀'
        WHEN deptno=40 THEN '운영팀'  
        ELSE '부서없음'
    END dname
FROM emp;


-- COUNT

SELECT * 
FROM emp;

SELECT COUNT(*) cnt FROM emp;

SELECT empno FROM emp;

SELECT 
    COUNT(empno) cnt_empno
FROM emp;

SELECT mgr FROM emp;
SELECT
    COUNT(mgr) mgr_cnt
FROM emp;

SELECT comm FROM emp ORDER BY comm;

SELECT
    COUNT(comm)
FROM emp;


SELECT * FROM emp;
SELECT 1 FROM emp;

SELECT COUNT(*) FROM emp;
SELECT COUNT(1) FROM emp;

--sum

SELECT SUM(sal) tot_sal  FROM emp;

--avg

SELECT round(AVG(sal ),2 )avg_sal FROM emp;

--max

SELECT MAX(sal) max_sal FROM emp;

--min 
SELECT MIN(sal) min_sal FROM emp;

SELECT MAX(ename) FROM emp;


SELECT
    MAX(hiredate),
    MIN(hiredate)
FROM emp;


SELECT * FROM emp
ORDER BY deptno;


-- 전체 sal에 대한 합계

SELECT SUM(sal) FROM emp;

--부서별 금여 합계

SELECT 
    deptno,
    SUM(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;


--부서별 인원수

SELECT 
    deptno,
    COUNT(*) cnt
FROM emp
GROUP BY deptno;


SELECT 
    deptno,
    JOB
FROM emp
ORDER BY deptno, JOB;

-- 부서별 + 직무별 사원수

SELECT 
    deptno,
    JOB, 
    ename,
    COUNT(*) cnt
FROM emp
GROUP BY deptno, JOB,ename
ORDER BY deptno, JOB;








--조회컬럼 
--deptno, dname, cnt, tot_sal, avg_sal

--dname -> 한글로
--cnt ,tot_sal,avg_sal ->부서별 통계
-- avg_sal ->소수점 2자리까지

SELECT

    deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        ELSE '부서없음'
    END dname,
    
    COUNT(*) cnt,
    SUM(sal) tot_sal,
    round(AVG(sal),2) avg_sal
    
FROM emp

GROUP BY deptno, CASE deptno WHEN 10 THEN '회계팀' WHEN 20 THEN '연구팀' WHEN 30 THEN '영업팀' ELSE '부서없음' END
order by deptno;





select 
    deptno,
    round(avg(sal),2) avg_sal
from emp
group by deptno
HAVING AVG(sal)>2000
order by deptno;

-------------------------------------------------------------



SELECT * 
from emp
where empno=7369;

SELECT
    *
FROM dept
where deptno=20;


-- 

SELECT * FROM emp;



select * from emp, dept
where emp.deptno= dept.deptno;





--조인 JOIN 
-- 두 테이블의 모든 정보 결합하기

SELECT * from emp,dept;

--join
-- emp :8 cols 12 rows
-- dept : 3 cols 4 rows
-- emp x dept :11 cols (8+3) 48 rows( 12*4 )


-- emp, dept 테이블 둘 모두에서 deptno 값이 같은 행만 추출

select * from emp, dept
where emp.deptno = deptno.deptno;


-- 테이블 이름에 alias 적용
SELECT empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인조건
    and empno>7800; -- 일반 조회 조건
    

-- INNER JOIN

SELECT empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno -- 조인조건
    
WHERE empno>7800; -- 일반 조회 조건


-- NON EQUI JOIN ,비등가 조인

select * from emp;
select * from salgrade;

select ename, sal, grade
from emp
inner join salgrade
    on sal BETWEEN losal and hisal -- 조인조건

order by grade, sal, ename;


-- SELF JOIN 

select * from emp empoyee;
select * from emp manager;



select empno, ename from emp empoyee;
select distinct mgr from emp manager;



select 
    e.empno , e.ename , e.mgr ,m.empno, m.ename 
from emp e, emp m

where e.mgr=m.empno; --조인조건



select 
    e.empno , e.ename , e.mgr ,m.empno, m.ename 
from emp e
inner join emp m

on e.mgr=m.empno;--조인조건





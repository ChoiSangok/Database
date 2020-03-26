SELECT * FROM emp;

SELECT * FROM dept;


--카테시안 곱,cross join

SELECT * FROM emp, dept;

SELECT * FROM emp
CROSS JOIN dept;


-- NATURAL JOIN

SELECT * FROM emp
NATURAL JOIN dept
ORDER BY deptno, empno;


--오라클 전용 구문,  OUTER JOIN
SELECT empno, ename, D.deptno, dname
FROM emp E, dept D
WHERE E.deptno(+) =D.deptno --조인조건 -- (+) outerjoin 연산자
ORDER BY deptno, empno;



-- ANSI 표준구문, OUTER JOIN

SELECT empno, ename, D.deptno, dname
FROM emp E
RIGHT OUTER JOIN dept D --outer join 할때는 left right 사용 해주어야함

    ON E.deptno =D.deptno --조인조건 -- (+) outerjoin 연산자
ORDER BY deptno, empno;


SELECT empno, ename, D.deptno, dname
FROM dept D, emp E
WHERE D.deptno=E.deptno(+) --조인조건 -- (+) outerjoin 연산자
ORDER BY deptno, empno;



SELECT empno, ename, D.deptno, dname
FROM dept D
LEFT OUTER JOIN emp E
    ON D.deptno=E.deptno --조인조건 -- (+) outerjoin 연산자
ORDER BY deptno, empno;







SELECT 
    E.empno, E.ename, E.mgr, M.ename mgr_name
FROM emp E, emp M
WHERE E.mgr=M.empno(+);

-- ansi 표준구문

SELECT 
    E.empno, E.ename, E.mgr, M.ename mgr_name
FROM emp E
LEFT OUTER JOIN emp M
    ON E.mgr=M.empno(+);


-- FULL OUTER JOIN
CREATE TABLE test1 ( NO NUMBER ) ; -- 테이블 생성
CREATE TABLE test2 ( NO NUMBER ); -- 테이블 생성

DELETE test1; -- 테이블 데이터 전체삭제
DELETE test2;

INSERT INTO test1 VALUES(10); -- 데이터삽입
INSERT INTO test1 VALUES(20);
INSERT INTO test1 VALUES(30);

INSERT INTO test2 VALUES(10); -- 데이터삽입
INSERT INTO test2 VALUES(20);
INSERT INTO test2 VALUES(40);

SELECT * FROM test1;
SELECT * FROM test2;



SELECT * FROM test1, test2 
--where test1.no = test2.no;-- inner join, equi join, 내부조인
--where test1.no(+) = test2.no; -- right outer join null 이생기면서 test2에 값이 하나더 보여짐
WHERE test1.NO=test2.NO(+); --left outer join 오른쪽 널 생기면서 test1이 가지고있는 값 하나더 보여짐

--where test1.no(+) = test2.no(+); -- 수행되지 않음!


SELECT * FROM test1
FULL OUTER JOIN test2
    ON test1.NO=test2.NO
ORDER BY test1.NO;


--서브쿼리

--king 의 부서번호 조회

SELECT deptno 
FROM emp
WHERE ename = UPPER('king');

--10번의 부서의 정보 확인
SELECT *
FROM dept
WHERE deptno=10;


--서브쿼리
SELECT *
FROM dept
WHERE deptno=(
        SELECT deptno
        FROM emp
        WHERE ename=UPPER('king')
        );
        
        
        
-- 조인
--select d.deptno, dname, loc -- 방법 1
SELECT D.*                   -- 방법 2
FROM emp E, dept D
WHERE E.deptno= D.deptno
    AND ename=UPPER('king');


-- 평균임금보다 급여를 많이 받는 사원들 조회하기

--where 절에서 그룹함수 사용할수없다
SELECT * FROM emp
WHERE sal >AVG(sal);

-- 잘못된 경우 : having 만 쓸 수 없다

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) < sal;


-- 서브 쿼리로 해결

SELECT AVG(sal)
FROM emp;

SELECT empno, ename,sal
FROM emp
WHERE sal> (
    SELECT AVG(sal)
    FROM emp
    );


SELECT empno, ename, sal, (SELECT round(AVG(sal),2) FROM emp ) AVG
FROM emp
WHERE sal > (
    SELECT AVG(sal) 
    FROM emp 
    );


-- 가장 최근에 입사한 사원

select ename, hiredate
from emp
where hiredate = (
    SELECT MAX(hiredate) from emp
    
    );

-- 잘못된 경우

select empno, ename, hiredate, max(hiredate)
from emp;


-- 전체 평균 임금보다 부서별 평균임금이 높은 부서

select avg(sal) avg_sal
from emp;

select deptno
from dept;

select deptno, (select avg(sal) from dept), ( select avg(sal) avg_sal from emp) AVG
from dept 
group by deptno;

--where AVG> (
--        select avg(sal)
--        FROM EMP
--        );
        

select deptno, round(avg(sal),2)
from emp
group by deptno
having avg(sal) > (
    select avg(sal) from emp ) --전ㄴ체 평균
order by deptno;

-- ekfms qkdqj
select deptno
from dept;


-- 스칼라 서브쿼리
select 
    empno, ename, deptno, 
    (select dname from dept d where d.deptno= e.deptno) dname,
    (select loc from dept d where d.deptno=e.deptno) loc
    
from emp e;


-- 부서별 인원 구하기
-- 40번 부사는 0명 이라고 출력
-- 1 .서브쿼리
-- 2. 조인 이용해서 작성
-- deptno, dname , ent_employee


select deptno
from dept;

-- 서브쿼리
select 
    deptno, dname,
    (select count(empno) from emp e where d.deptno=e.deptno) cnt_emplyee
from dept d;

-- 조인

select distinct d.deptno, d.dname,
    count(empno) cnt_emplyee
from emp e, dept d
where e.deptno(+)= d.deptno
group by d.deptno, d.dname
order by d.deptno;

select d.deptno, dname , count(empno) cnt_employee
from emp e
right outer join dept d 
    on e.deptno=d.deptno
group by d.deptno , dname
order by deptno;



-- order by 서브쿼리 쓰기

select empno, ename, sal, deptno
from emp e

order by (
    select loc from dept d
    where e.deptno=d.deptno ) desc;

-- join

select empno, ename, sal, e.deptno
from emp e, dept d
where e.deptno=d.deptno
order by loc;


-- rownum
 -- 조회되는 결과에 행 번호를 붙이는 키워드

select rownum, empno, ename
from emp;

select rownum, emp.*
from emp;

select rownum, e.*
from emp e;

--rownum 의 잘못된 사용법
--      select 절에서 rownum 을 수행한 후 order by절 수행함
--      -> order by 로 정렬한 상태가 rownum 에 반영되지 않는다

select rownum r, e.*
from emp e
order by sal desc;


--order by 문제 해결

-- 잘못된 사용법
--      rownum 은 1번부터 연속된 값을 부여한다
--      조건절에서 1부터가 아닌 중간값을 조회하면 찾지 못함

select rownum sal_rank, e.* 
from (
    select * 
    from emp
    order by sal desc, empno
    
    ) e
-- rownum 을 했을때ㅑ 1-3등은 나오지만 5-8은 안나온다
where rownum between 5 and 8;



--where 절 문제 해결

select * from (
    select rownum sal_rank, e.* 
    from (
        select * 
        from emp
        order by sal desc, empno
    
        ) e 
)r
where sal_rank between 5 and 8;


--top - n 분석
--rownum 을 이용한 top - n 분석 
select *
from ( 
    select rownum rnum, tmp.*
    from (
    select * from 테이블명 -- 조회하는 쿼리
    order by 컬럼명 --정렬기준 설정
    ) tmp
)r
where rnum 값 비교 조건문;


-- 입사날짜가 가장 오래된 3명 조회하기




select ename, hiredate
from (
    select rownum hire, e.*
    from (
        select *
        from emp
        order by hiredate asc, empno
        )e
)r
where hire between 1 and 3;
















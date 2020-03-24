
-- 데이터 연결 연산자 ||

select 
    ename || 'is' ||job employee
from emp;




-- ' ' 표현된 문자 안에서 ' 를사용하고 싶으면 '' 를 사용 

SELECT
    ename || '''s job is ' || job AS EMPLOYEE
FROM emp;





-- SQL Functions

select ename, length(ename) len-- length 문자열의 길이 
from emp; --Single Row 단일행 함수 



select count(*) --count 조회되는 결과의 갯수를 알려줌 -- Group Functions
from emp;


--DUAL 테이블
select 1 from emp;
select 1 + 2 from emp;

select 1 from dual;
select 1+2 from dual;


select 1+2 first, 6*5 second, 5-7 third 
FROM dual;


--숫자함수문제

-- abs() - 절대값 반환
-- round() - 반올림

select abs(-44) from dual;
select abs(-985.527) from dual;
select abs(sal) from emp;


--반올림
-- 12.523 -> 소수점이하 반올림
-- -12.723 -> 소수점이하 반올림
-- 12.567 -> 소수점 3째자리에서 반올림
-- 12345 -> 1의 자리에서 반올림
-- 56789 -> 10의 자리에서 반올림
SELECT round(12.523) FROM dual;
SELECT round(-12.723) FROM dual;
SELECT round(12.567,2) FROM dual;
SELECT round(12345,-1) FROM dual;
SELECT round(56789,-2) FROM dual;


--버림 truncate
-- 12.456 -> 소수점이하 버림
-- 12.456 -> 소수점 3째자리에서 버림
-- 12345 -> 1의자리에서 버림
-- 56789 -> 10의자리에서 버림
SELECT TRUNC(12.456) FROM dual;
SELECT TRUNC(12.456,2) FROM dual;
SELECT TRUNC(12345,-1) FROM dual;
SELECT TRUNC(12345,-2) FROM dual;


--나머지
-- 13을 8로 나눈 나머지
SELECT MOD(13,8) FROM dual;


--올림
-- 12.345 올림 -> 13
-- -12.567 올림 -> -12
SELECT ceil(12.345) FROM dual;
SELECT ceil(-12.345) FROM dual;


--내림
-- 12.567 내림 -> 12
-- 12.123 내림 -> 12
-- -12.567 내림 -> -13
-- -12.123 내림 -> -13
SELECT floor(12.456) FROM dual;
SELECT floor(12.123) FROM dual;
SELECT floor(-12.567) FROM dual;
SELECT floor(-12.123) FROM dual;


--제곱
-- 3의 4제곱 -> 81
-- 3의 -1 제곱 -> 0.33333333333
SELECT POWER(3,4) FROM dual;
SELECT POWER(3,-1) FROM dual;


--제곱근
-- 9의 제곱근 -> 3
-- 11의 제곱근 -> 3.3166...
SELECT sqrt(9) FROM dual;
SELECT sqrt(11) FROM dual;



-- 문자함수
-- length()

SELECT 
    LENGTH('Apple') len1,
    length('안녕') len2,
    length('오라클 hello') len3
FROM dual;

-- lengthb()
-- byte 로 끊어줌 
-- 한글은 3byte 영어 1byte

SELECT 
    lengthb('Apple') len1,
    lengthb('안녕') len2,
    lengthb('오라클 hello') len3
FROM dual;

-- 캐릭터셋( 인코딩 ) 확인
select * from nls_database_parameters
where parameter = 'NLS_CHARACTERSET';


-- 문자 함수 문제
-- 'hELlo' 모두 대문자로 변환 -> HELLO
-- 'hELlo' 모두 소문자로 변환 -> hello
-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello
select upper('hELlo') from dual;
select lower('hELlo') from dual;
select initcap('hELlo') from dual;

select * from tabs;

-- 'Alice Bob'의 문자열 길이 -> 9
-- '안녕하세요'의 문자열 길이 -> 5
select length('Alice Bob') from dual;
select length('안녕하세요') from dual;


-- 'Alice Bob' 문자열 바이트 수 -> 9
-- 'ACE 안녕하세요'문자열 바이트 수 -> 19
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)
select lengthb('Alice Bob') from dual;
select lengthb('ACE 안녕하세요') from dual;


-- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
-- '안녕하세요'에서 '하'문자열의 위치 -> 3
-- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3
select instr('ABCDEFGHI','D') from dual;
select instr('ABCDEFGHI','DEF') from dual;
select instr('ABCDEFGHI','DF') from dual;
select instr('안녕하세요','하')from dual;
select instrb('안녕하세요','하') from dual;
select instr('ABCABCDDD','C') from dual; -- 처음찾은 3번째만 나옴



--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
--'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
--'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
--'안녕하세요오라클'에서 3번째 부터 자르기
select substr('Oracle SQL Developer',5) from dual;
select substr('Oracle SQL Developer',5,5) from dual;
select substr('오라클 SQL',3,5) from dual;
select substrb('오라클 SQL',3,5) FROM dual; -- 3,5 바이트로 띄어쓰기로 공백이 생길수있다
select substr('안녕하세요오라클',3,5) from dual;
select substrb('안녕하세요오라클',3,5) from dual; -- b은 바이트


select * from tabs
where table_name = upper('emp');


-- 패딩 Padding
-- 문자를 표현하기 위해서 공간을 확보하고
-- 문자를 채워넣고 빈 공간이 남으면 설정한 문자로 채운다
-- 같은 간격으로 공간 

--LEFT PADDING : lpad()
select lpad('SQL' , 10) FROM dual;
select lpad(ename,10) from emp;

select ename from emp;

select lpad('SQL',10,'*') FROM emp;
select lpad(ename,10,'*-') from emp;
select lpad('ABCDEFGH',5) FROM dual;


-- right padding : rpad()

select rpad('SQL',10,'*') FROM dual;
select rpad('SQL',10) FROM dual;

--trim 
--데이터 양 끝단에 있는 ' '( 띄어쓰기, 공백) 을 
-- 제거하는 함수

select '    SQL     ',
    ltrim('     SQL     '),
    rtrim('     SQL     '),
    ltrim(rtrim('      SQL      '))
from dual;


--날짜 함수, DATETIME


SELECT sysdate from dual;

-- 날짜 시간 타입 -> 문자 타입( 서식 지정 )
SELECT 
    to_char (sysdate,'YYYY/MM/DD HH24:MI:SS') now
from dual;


--MONTHS_BETWEEN :개월 수 차이

select
    months_between('20-01-01','20-02-01') A,
    months_between('20-02-15','20/02/01') B,
   ROUND( months_between(SYSDATE,'20/02/01'),2) C
    
from dual;

SELECT 
    next_day(sysdate,'금')
from dual;


--trunc(number)
-- TRUNC(datetime) -  뒤에 시간 분 초 날려버림 / 시간을 지정(00시 00분 00 초 ) 


SELECT
    sysdate,
    to_char (sysdate,'YYYY/MM/DD HH24:MI:SS'),
    to_char (trunc(sysdate),'YYYY/MM/DD HH24:MI:SS')
FROM dual;

--보이는 결과는 같지만
-- 시간이 포함되어있어 서로 다른 값을 가진다

select 
    sysdate,
    TRUNC(sysdate)
from dual;



-- to_char(number)
-- to_char(number, fmt) : 서식문자를 이용한 변환

select 
    12345 "0",
    to_char(12345) as "1", -- '12345'
    length(to_char(12345)) "3",
    length(12345) "4" ,-- 자동형변환 대부분 문자랑 숫자 사이에서 일어남
    to_char(12345,'99') "5",
    to_char(12345,'9999999999') "5",
    to_char(12345,'0000000000') "6" ,-- 0으로 채워짐
    to_char(12345,'9990000000') "7"  -- 0으로 채워짐
   
 
from dual;


select 
    to_char(12345.6789)"1",
    to_char(12345.6789,'99999.9') "2",
    to_char(12345.6789,'9,999,999.99') "3",
    to_char(12345.6,'9,999,999.999') "4"
from dual;
    



select 
    to_char(12345) "1",
    to_char(12345,'$99999999') "2",
    to_char(12345,'$999') "3",
   trim( to_char(12345,'L99,999,999') ) "4" -- LOCATLE
from dual;



--to_char(datetime)


SELECT

--    sysdate
--    to_char(sysdate, 'SCC') --21세기
--    to_char(to_date('369/1/7'),'SCC') --날짜 변환 to_date

--    to_char(sysdate,'YEAR'), --년도 나타내는 3가지 방법
--    to_char(sysdate,'year'), -- YEAR, year, Year : 년도
--    to_char(sysdate,'Year')

--    to_char(sysdate,'YYYY'), --YYYY,YY,YYY,Y : 숫자 년도, Y 의 개수는 년도를 표현하는 자릿 수 
--    to_char(sysdate,'YY'),
--    to_char(sysdate,'YYY'),
--    to_char(sysdate,'Y'),
--    to_char(sysdate,'YYYYY') -- YYYY Y 4개짜리 1개짜리 쓴거랑 같은 의미
    
--    to_char(sysdate,'MM'), --MM : 숫자 월
--    to_char(sysdate,'MONTH'), --MONTHM, MON : 문자 월
--    to_char(sysdate,'MON')
    
-- 분기응용
--    to_char(sysdate,'Q') --Q : 쿼터, 분기
--FROM dual;
--
--select * from emp
--where to_char(hiredate,'Q')=3; -- 3분기에  결제된 내용을 볼 수 있음
--WHERE hiredate >= '81/07/01' and hiredate <'81/10/01';



--    to_char(sysdate, 'DD'),   -- 월 기준 날짜
--    to_char(sysdate, 'D'),    -- 주 기준 날짜
--    to_char(sysdate, 'DDD')   -- 년 기준 날짜

--    to_char(sysdate,'DAY'), --DAY : 요일
--    to_char(sysdate,'DY')   --DY : 요일 약자
    
--    to_char(sysdate, 'HH'),     -- 12 시간 표기법 시간
--    to_char(sysdate, 'HH12'),   -- 12시간 표기법 시간
--    to_char(sysdate, 'HH24')    -- 24시간 표기법 시간
    
--    to_char(sysdate,'MI'), --분
--    to_char(sysdate,'SS'), --초
    
--    to_char(sysdate,'AM'), -- 오전 오후 맞는 시간이 나옴
--    to_char(sysdate,'PM'),
--    to_char(sysdate,'A.M.'),
--    to_char(sysdate,'P.M.')

    to_char(systimestamp,'FF') -- 밀리초 

FROM dual;


--systimestamp, sysdate 차이
select 
    systimestamp, sysdate -- 기본적인 데이터타입에 대한 차이가 있음

from dual;



select
    to_char(systimestamp,'FF'),
    to_char(systimestamp,'FF1'),
    to_char(systimestamp,'FF2'), --** 자주씀
    to_char(systimestamp,'FF3')
    
FROM dual;


select

    to_char(sysdate, 'YYYY/MM/DD DAY HH24:MT:SS')
    
FROM dual;




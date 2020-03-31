-- DATE

CREATE TABLE type_test_05 (
    DATA DATE);
    
INSERT INTO type_test_05
VALUES ( sysdate );

INSERT INTO type_test_05
VALUES ('2020/11/21');

SELECT * FROM type_test_05;

-- 년도를 음수로 사용할 때에는 단독으로 사용 불가
INSERT INTO type_test_05
VALUES ('-2020/11/21');

--to_date 의 서식 s는 날짜에 포함된 부호를 인식한다
INSERT INTO type_test_05
VALUES (TO_DATE('-2020/11/21','syyyy/mm/dd') );


SELECT to_char(DATA,'syyyy/mm/dd hh24:mi:ss') DATA
FROM type_test_05;

-----------------------------------------------------------------


INSERT INTO type_test_05
VALUES ( TO_DATE('12/7/9','yy/mm/dd' ));

INSERT INTO type_test_05
VALUES ( TO_DATE('12/7/9','rr/mm/dd' ));

SELECT to_char(DATA,'yyyy/mm/dd') 
FROM type_test_05;

-----------------------------------------------------------------

INSERT INTO type_test_05
VALUES ( TO_DATE('94/7/9','yy/mm/dd' ));

INSERT INTO type_test_05
VALUES ( TO_DATE('94/7/9','rr/mm/dd' ));

SELECT to_char(DATA,'yyyy/mm/dd') 
FROM type_test_05;



-- LONG 자료형

CREATE TABLE type_test_06(
    DATA LONG);

INSERT INTO type_test_06
VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi nunc, rutrum eu vulputate vel, suscipit a ipsum. Etiam quam elit, tincidunt in ligula vel, ultrices blandit turpis. In ut cursus nisl. Morbi tempus at nisi sed consectetur. Vestibulum suscipit commodo dui, et condimentum felis consequat vel. Duis molestie nunc sit amet odio iaculis, ac molestie erat pulvinar. Aliquam sit amet dapibus enim. Nulla fringilla, magna nec viverra rutrum, orci lacus scelerisque tortor, tempor tempus lacus risus quis est. Proin et scelerisque neque. Integer tortor tellus, consectetur sed accumsan vitae, gravida vestibulum ipsum. Donec maximus, risus a accumsan tempus, libero arcu sollicitudin enim, eu viverra lacus lorem nec ipsum. Nulla mattis id sapien et vehicula. Sed gravida orci sit amet sapien posuere, sed hendrerit dolor consectetur. Etiam mattis consectetur turpis nec faucibus. Proin porta velit lorem, ut condimentum dolor luctus vel.');

SELECT * FROM type_test_06;



INSERT INTO type_test_06

VALUES('라이너 그리워 이름을 풀이 위에 나는 묻힌 잔디가 계십니다. 말 릴케 이런 많은 오면 것은 위에 하나에 별 있습니다. 하나에 지나고 추억과 자랑처럼 이런 계십니다.

파란 말 아스라히 나는 새겨지는 계십니다. 아름다운 내일 마리아 내 봅니다.

아름다운 밤을 계절이 아직 그리워 별빛이 봅니다. 이네들은 별을 한 동경과 나는 못 거외다.');

SELECT * FROM type_test_06;



--CLOB 문자 Character

CREATE TABLE type_test_07(
    DATA CLOB);
    
    
INSERT INTO type_test_07
VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi nunc, rutrum eu vulputate vel, suscipit a ipsum. Etiam quam elit, tincidunt in ligula vel, ultrices blandit turpis. In ut cursus nisl. Morbi tempus at nisi sed consectetur. Vestibulum suscipit commodo dui, et condimentum felis consequat vel. Duis molestie nunc sit amet odio iaculis, ac molestie erat pulvinar. Aliquam sit amet dapibus enim. Nulla fringilla, magna nec viverra rutrum, orci lacus scelerisque tortor, tempor tempus lacus risus quis est. Proin et scelerisque neque. Integer tortor tellus, consectetur sed accumsan vitae, gravida vestibulum ipsum. Donec maximus, risus a accumsan tempus, libero arcu sollicitudin enim, eu viverra lacus lorem nec ipsum. Nulla mattis id sapien et vehicula. Sed gravida orci sit amet sapien posuere, sed hendrerit dolor consectetur. Etiam mattis consectetur turpis nec faucibus. Proin porta velit lorem, ut condimentum dolor luctus vel.

Suspendisse potenti. Sed lacinia leo at quam viverra, id tempus tellus gravida. Suspendisse potenti. Fusce non malesuada est, at elementum mauris. Proin gravida porttitor tempor. Vestibulum sed iaculis nisi. In congue nunc non ante rutrum fermentum. Vestibulum ut ex consectetur, ultrices arcu nec, placerat sapien. Praesent suscipit vulputate odio, ac euismod est porttitor sit amet. Nulla accumsan varius risus at vulputate. Maecenas euismod porttitor nunc, vel consectetur quam pellentesque ac. Nunc felis elit, rhoncus eu nibh at, commodo blandit elit. Quisque aliquam neque orci, vel condimentum augue maximus in. Integer imperdiet est vel arcu finibus hendrerit. Aliquam erat volutpat.

Aliquam et malesuada quam. Quisque viverra ultrices quam sed suscipit. Aenean vehicula odio velit, non egestas tellus ultrices at. Donec euismod lorem eget odio lacinia placerat. Pellentesque commodo, augue vel ullamcorper semper, eros nibh bibendum urna, ut consequat tortor nibh sollicitudin tortor. Aliquam cursus nunc eget enim ullamcorper dapibus fermentum non felis. Aenean vestibulum hendrerit velit. Aliquam tincidunt sapien metus, quis pretium orci aliquet et.');



INSERT INTO type_test_07
VALUES('멀리 많은 어머님, 위에 걱정도 쉬이 때 있습니다. 별 속의 나는 이국 덮어 이름과 잠, 어머니 별 까닭입니다. 다 당신은 가슴속에 이름자를 이름을 어머니, 그리워 차 있습니다. 강아지, 어머니 이런 부끄러운 있습니다. 북간도에 새워 별빛이 멀리 무성할 어머님, 있습니다. 풀이 가난한 하나에 했던 벌레는 지나고 까닭이요, 애기 있습니다.

토끼, 소녀들의 이네들은 가을 봅니다. 계집애들의 써 된 다 풀이 계십니다. 나의 소학교 이름자 같이 풀이 그러나 가을 거외다. 잔디가 하나에 가득 위에도 이름과, 별에도 밤을 써 까닭입니다. 새워 벌레는 이름과, 나는 내린 버리었습니다. 어머니, 한 풀이 듯합니다. 내린 소학교 하나에 어머니, 겨울이 시인의 패, 책상을 까닭입니다.

덮어 흙으로 별에도 어머님, 동경과 이 그리워 못 까닭입니다. 하나에 하나의 무성할 추억과 계십니다. 말 하나에 아스라히 겨울이 릴케 부끄러운 듯합니다. 별 무덤 불러 지나고 밤을 청춘이 거외다. 마디씩 청춘이 하나에 하나 풀이 하나의 쉬이 있습니다. 별에도 별 무덤 지나고 어머님, 경, 멀리 이국 이런 봅니다.

나의 별이 풀이 어머니, 라이너 추억과 위에도 동경과 까닭입니다. 써 하나에 가난한 말 봅니다. 다 이름자 봄이 시와 부끄러운 밤을 이름과 버리었습니다. 이름자 쉬이 이네들은 버리었습니다. 별 슬퍼하는 우는 어머님, 거외다. 다 하나에 하나의 별 별 어머니, 이름과 까닭입니다.

없이 하나에 시와 내일 풀이 어머니 이름과, 같이 계십니다. 된 사랑과 덮어 차 옥 계십니다. 이런 것은 아름다운 거외다. 어머니, 묻힌 하나에 있습니다. 위에도 남은 가을 시인의 사람들의 별 이네들은 시와 강아지, 버리었습니다. 아름다운 많은 우는 것은 아무 너무나 릴케 이 비둘기, 까닭입니다. 잠, 가득 옥 밤이 별빛이 아무 까닭입니다.');


SELECT * FROM type_test_07;


-- CLOB 데이터 전체 조회

SELECT dbms_lob.substr(DATA, LENGTH(DATA),1)
FROM type_test_07;




-- 제약사항

-- NOT NULL

CREATE TABLE cons_01(
    DATA VARCHAR2(10) NOT NULL);
    
    
-- 테이블이 정보 조회 ( 만들어진거 확인 )
DESC cons_01;


-- 제약조건 자료사전
SELECT * FROM user_constraints
WHERE table_name = UPPER('cons_01');

INSERT INTO cons_01
VALUES(NULL);





--제약조건이 부여된 컬럼 정보 자료사전

SELECT * FROM user_cons_columns
WHERE table_name = UPPER('cons_01');


-- 테이블 정보자료사전에는 제약사항이 나오지 않는다
-- 테이블 정보 자료사전
SELECT * FROM TAB;


-- 테이블 정보 자료사전( 상세 )
SELECT* FROM tabs;


--DB의 모든 테이블 정보 자료사전
SELECT * FROM all_tables;




-- NOT NULL 제약조건에 이름 붙여서 설정하기

CREATE TABLE cons_02 (
    DATA VARCHAR2(10) CONSTRAINT cons_02_nn NOT NULL );
    
SELECT * FROM user_constraints
WHERE table_name=UPPER('cons_02');


-- 제약조건 없이 테이블 생성

CREATE TABLE cons_03(
    DATA VARCHAR2(10) );
    
-- not null 제약조건은 컬럼의 데이터타입에 결합되어있다
-- not null 제약조건을 반영할 때에는 데이터타입을 변경해야한다

ALTER TABLE cons_03
--add | modify | drop 셋 중 1개 
MODIFY DATA NOT NULL;

DESC cons_03;


-- 제약조건 추가 -- UNIQUE
--테이블 따로 만들고
-- 제약조건 따로 만들고


ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uk UNIQUE ( DATA) ;



INSERT INTO cons_03 VALUES( NULL );
INSERT INTO cons_03 VALUES( 'a');
INSERT INTO cons_03 VALUES( 'A' );
SELECT * FROM cons_03;

CREATE TABLE cons_04(
    DATA VARCHAR2(10) CONSTRAINT cons_uk UNIQUE );
    
    
    
CREATE TABLE cons_05(
    DATA VARCHAR2(10),
  
    CONSTRAINT cons05_uk UNIQUE (DATA) );




-- CHECK

CREATE TABLE cons_06(
    DATA NUMBER CHECK(DATA >=1 AND DATA<=100) );
    
    
INSERT INTO cons_06 VALUES(30); 
--insert into cons_06 values(200);  -- 에러



   --자료사전 검색-- 
SELECT * FROM user_constraints
WHERE table_name=UPPER('cons_06');

SELECT * FROM user_cons_columns
WHERE constraint_name = UPPER('sys_c007031');



-- cons_07 테이블 생성
-- 컬럼  data number

--alter 구문을 이용하여  data에 제약사항 check 추가하기
--1000 2000 3000 4000 만 입력 가능하도록 만들기

-- check where 에서 쓰는 조건이랑 같음ㅁ
CREATE TABLE cons_07(
    DATA NUMBER(10) );


ALTER TABLE cons_07
ADD CONSTRAINT cons_07_check 
    CHECK (DATA IN (1000,2000,3000,4000));

ALTER TABLE cons_07
DROP CONSTRAINT cons_07_check;

ALTER TABLE cons_07
MODIFY DATA CHECK ( DATA IN (1000,2000,3000,4000) );

INSERT INTO cons_07 VALUES(5500);
INSERT INTO cons_07 VALUES(4000);

SELECT * FROM cons_07 ;



-- default

CREATE TABLE cons_08 (
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10) );
    
    
    -- 제약사항 자료사전에 default 설정은 나오지 않음
SELECT * FROM user_constraints
WHERE table_name = UPPER('cons_08');

-- 테이블 칼럼 상세 정보 자료사전
SELECT * FROM user_tab_columns
WHERE table_name=UPPER('cons_08');


ALTER TABLE cons_08
MODIFY data2 DEFAULT sysdate;

ALTER TABLE cons_08
MODIFY data3 DEFAULT 'hi' NOT NULL;


INSERT INTO cons_08
VALUES( NULL, NULL, 'AA');

SELECT * FROM cons_08;

INSERT INTO cons_08 ( data1 ) 
VALUES ( 6666);






-- default 주의사항
INSERT INTO cons_08; --values 있어야함

INSERT INTO cons_08 VALUES(); --values에 값이 꼭 들어가야함

-- 모든 컬럼의 default 를 한번에 동작되게 하는 방법은 없다



--PRIMARY KEY 

CREATE TABLE cons_09 (
    NO NUMBER CONSTRAINT cons_09_pk PRIMARY KEY ,
    DATA VARCHAR2(20) NOT NULL );


CREATE TABLE cons_10 (
    NO NUMBER PRIMARY KEY ,
    DATA VARCHAR2(20) NOT NULL );


CREATE TABLE cons_11 (
    NO NUMBER ,
    DATA VARCHAR2(20) NOT NULL,
    CONSTRAINT cons_11_pk PRIMARY KEY ( NO ) );



CREATE TABLE cons_12 (
    NO NUMBER ,
    DATA VARCHAR2(20) NOT NULL );


ALTER TABLE cons_12
ADD CONSTRAINT cons_12_pk PRIMARY KEY (NO);


   -- 처음만들때 설정해서 할수있ㅇ뮤ㅜ
   
--CREATE TABLE cons_13(
--    trade_date date,
--    trade_no number, constraint cons_13_pk 
--    primary key ( trade_date, trade_no)
--   );



CREATE TABLE cons_13(
    trade_date date,
    trade_no number
   );

alter table cons_13
add constraint cons_13_pk 
    primary key ( trade_date, trade_no);
    
alter table cons_13
drop constraint cons_13_pk ;-- 조건제거








--FOREIGN KEY

--primary key 확인

select * from user_constraints
where table_name = upper('cons_12');

-- 포함시키는 방법 1

create table cons_14 (
    num number,
    data varchar2(50),
    constraint cons_14_fk
        foreign key (num) -- 자기테이블의 fk
        references cons_12 ( no )); --참조 테이블의 pk



 -- alter 로 따로 만드는 방법 2
 
create table cons_15 (
    num number,
    data varchar2(50) );

alter table cons_15
add constraint cons_15_fk
    FOREIGN KEY (NUM) -- 자기테이블의 fk
    references cons_12(no); --참조 테이블의 pk
    
--  on delete set null 
--  on delete cascade -- 행을 지윰 위험

select * from emp;

select * from dept;



------------------------------






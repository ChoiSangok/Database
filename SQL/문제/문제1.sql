--1. 성별이 남자인 오씨성을 가진 환자 조회
4	오환자2
5	오대식
6	오창규
7	오환자3

select pat_name name
from patient
where pat_name like '오%'
    and pat_gender!='F';


--2. 성별이 남자인 오씨성을 가진 환자중 1979년생이 아닌 조회
5	오대식
6	오창규

select pat_name name
from patient
where pat_name like '오%'
    and not (pat_birth between 19790000 and 19799999);

--3. 생년월일이 1980년생 부터 1989년생 까지 환자 중 여자만 조회
1	오환자1
3	박환자
23	김성희
24	차은비
25	차은희
42	지유

select pat_name
from patient
where pat_birth between 19800000 and 19899999
    and pat_gender ='F';

--4. 환자이름이 4자이며 '오성'으로 끝나는 환자 중 생년월일이 2004년생 남자 환자만 조회
13	남궁오성

select pat_name
from patient
where pat_name LIKE '__오성'
    and pat_birth between 20040000 and 20049999;



--5. 2000년생 여자 중 이름 뒤 두글자가 '환자'로 끝나지 않는 환자조회
28	한아름

select pat_name
from patient
where not (pat_name like '%환자')
    and pat_birth between 20000000 and 20009999
    and pat_gender='F';
   


--6. 환자이름이 4자인사람 중에 휴대폰 번호가 등록되어있지 않은 환자조회
4	오환자2
7	오환자3
45	황보희라

select pat_name
from patient
where pat_name like '____'
    and pat_tel is null;


   







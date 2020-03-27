--1. 2012년 1월 3일 내원환자 중 
-- 정형외과(코드:05xx)와 성형외과(코드:08xx)와 이비인후과(코드:13xx)
-- 환자조회
32	박환자
33	권이나
37	강성
42	지유
43	허민지


select pat_code,pat_name
from patient p
where pat_code in(
    select pat_code
    from treat t
    where (trt_year=2012 and trt_date=0103) AND doc_code in(
                select doc_code
                from treat t
                where doc_code in (
                        select doc_code
                        from doctor d
                        where dep_code like '05%' or dep_code like '08%' or dep_code like '13%')
                )
    )

order by pat_code;



--2. 2012년 1월 3일 내원환자 중 내원 진료시간이 09:00 ~ 12:00 이고
-- 진료과가 정형외과(코드:05xx)와 성형외과(코드:08xx)와 이비인후과(코드:13xx)
-- 가 아닌 환자조회
30	권환자
35	황환자
39	고기리
40	유희애

select pat_code,pat_name
from patient p
where pat_code in(
    select pat_code
    from treat t
    where (trt_year=2012 and trt_date=0103) AND 
            (trt_time between 0900 and 1200) and doc_code in(
                select doc_code
                from treat t
                where doc_code in (
                        select doc_code
                        from doctor d
                        where not (dep_code like '05%' or dep_code like '08%' or dep_code like '13%'))
                )
    )

order by pat_code;


--3. 2014년 1월 1일 내원환자 중 5명만 출력
-- (진료시간순서 상 마지막 진료환자 5명)

5	오대식
19	우별희
21	송주희
24	차은비
27	안성댁



SELECT P.pat_code,pat_name
FROM patient P,(
    SELECT ROWNUM RANK,pat_code
    FROM (
        SELECT pat_code
        FROM TREAT WHERE trt_year=2014 AND trt_date=0101
        order by trt_time desc
        )T   
    )R
WHERE P.pat_code=R.pat_code AND RANK <=5
order by p.pat_code;




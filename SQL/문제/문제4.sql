
--1. 2014년 1월 2일 내원환자 전체 정보조회
--   환자번호, 환자이름, 생년월일, 성별, 진료의사명, 진료과명
-- 스칼라 서브쿼리로 표현

select tre.pat_code, -- 호나잔번호
    ( select pat_name from patient pat where pat.pat_code=tre.pat_code) pat_name, --이름
    ( select pat_birth from patient pat where pat.pat_code=tre.pat_code) pat_birth, --생년월일
    ( select pat_gender from patient pat where pat.pat_code=tre.pat_code) pat_gender, --성별
    ( select doc_name from doctor doc where tre.doc_code=doc.doc_code) doc_name, --진료의사명
    ( select dep_name from department dep, doctor doc where tre.doc_code=doc.doc_code
                                                    and doc.dep_code= dep.dep_code) dep_name --진려ㅛ과이름
                                                    

from treat tre
where trt_year=2014 
    and trt_date=0102
order by pat_code;



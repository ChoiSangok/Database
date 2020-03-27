--1. 2013년 1월 25일 내원한 환자중 다음의 정보조회
-- 진료과명, 진료의사명, 접수시간, 환자번호, 환자이름, 생년월일, 성별
--(진료과, 진료의, 접수시간으로 내림차순 정렬)

SELECT dep.dep_name,doc.doc_name, tre.trt_time , pat.pat_name,
        pat.pat_birth,pat.pat_gender
FROM DEPARTMENT dep
INNER JOIN DOCTOR doc ON dep.dep_code=doc.dep_code
INNER JOIN TREAT tre ON tre.doc_code=doc.doc_code
INNER JOIN PATIENT pat ON pat.PAT_code=tre.pat_code
WHERE tre.trt_year=2013 and tre.trt_date=0125
ORDER BY dep.dep_name,doc.doc_name,tre.TRT_time;



--2. 2013년 12월 25일 내원한 환자의 다음 정보조회
--내원일자, 환자번호, 환자이름, 생년월일, 성별
--*단 2014년 이후로 입원했던적이 있다면 입원일자, 입원시간도 출력
--(진료시간 기준 정렬)
-- OUTER JOIN (+)



SELECT tre.pat_code, pat.pat_name, pat.pat_birth, pat.pat_gender,
        INP.inp_date,INP.inp_time
FROM TREAT tre
INNER JOIN patient pat ON tre.pat_code=pat.pat_code
LEFT OUTER JOIN inpatient INP
    ON pat.pat_code=INP.pat_code
WHERE tre.trt_year=2013 AND tre.trt_date=1225
ORDER BY tre.trt_time;














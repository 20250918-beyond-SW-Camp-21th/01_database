SELECT
       a.category_name 하위분류
     , b.category_name 상위분류
  FROM tbl_category a
  LEFT JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT
       a.category_name 하위분류
     , b.category_name 상위분류
  FROM tbl_category a
  RIGHT JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT
       a.category_name 하위분류
     , b.category_name 상위분류
  FROM tbl_category a
  JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT category_name FROM tbl_category WHERE ref_category_code IS NULL;
SELECT category_name,ref_category_code FROM tbl_category WHERE ref_category_code IS NOT NULL;

-- employee에서 다중 테이블 join
-- 사원명, 부서명, 직급명 조회
SELECT
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
	 , c.JOB_NAME
  FROM employee a
  LEFT JOIN department b ON a.dept_code = b.dept_id
  LEFT JOIN job c ON a.job_code = c.job_code;

-- 사원명, 근무 지역명, 근무 국가명 조회
SELECT
       a.EMP_NAME 
    ,  c.LOCAL_NAME
    ,  d.NATIONAL_NAME 
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE  = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
  JOIN nation d ON c.NATIONAL_CODE  = d.NATIONAL_CODE;

SELECT
       a.SALARY
     , a.SAL_LEVEL
     , b.MIN_SAL
     , b.MAX_SAL
  FROM employee a
  LEFT JOIN sal_grade B ON a.SAL_LEVEL = b.SAL_LEVEL;

SELECT
       a.bonus
     , a.sal_level
     , a.EMP_NAME
  FROM employee a
  ORDER BY sal_level ASC;

SELECT
       a.EMP_NAME
     , a.PHONE
  FROM employee a;

-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN
-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT 
       a.title
     , b.channel_name 
  FROM videos a
  JOIN creators b ON a.creator_id = b.creator_id;
-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE
-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT 
       a.title 
     , a.view_count 
     , b.channel_name
  FROM videos a
  JOIN creators b
  WHERE b.channel_name LIKE '맛있는 요리'; 

-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN
-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여,
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)
 
SELECT
       b.username
     , c.title 
  FROM watch_histories a
  JOIN users b ON a.user_id = b.user_id
  JOIN videos c ON a.user_id = b.USER_id
  LIMIT 10;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY
-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리, 
-- 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.

SELECT 
      c.title
    , c.category
    , a.watch_datetime 
  FROM watch_histories a
  JOIN USERS b ON a.user_id = b.user_id
  JOIN videos c ON c.video_id = a.video_id
  WHERE b.username = '기술전문가'
  ORDER BY a.watch_datetime ASC;
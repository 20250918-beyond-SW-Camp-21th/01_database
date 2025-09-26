-- =================================
-- JOIN
-- =================================
-- 두 개 이상의 테이블의 레코드를 연결해서 가상테이블(relation) 생성
-- 연관성을 가지고 있는 컬럼을 기준(데이터)으로 조합

-- # relation을 생성하는 2가지 방법
-- 1. join : 특정컬럼 기준으로 행과 행을 연결한다.(가로)
-- 2. union: 컬럼과 컬럼을 연결한다.(세로)
-- join은 두 테이블의 행 사이의 공통된 데이터를 기준으로 선을 연결해서 새로운 하나의 행을 만든다.

-- JOIN 구분
-- 1. Equi JOIN : 일반적으로 사용하는 Equality Condition(=)에 의한 조인
-- 2. Non-Equi JOIN : 동등조건(=)이 아닌 BETWEEN AND, IS NULL, 
-- 									 IS NOT NULL, IN, NOT IN, != 등으로 사용

-- Equi JOIN 구분
-- 1. INNER JOIN(내부조인) : 교집합(일반적으로 사용하는 JOIN)
-- 2. OUTER JOIN(외부조인) : 합집합
-- LEFT(OUTER) JOIN (왼쪽 외부 조인)
-- RIGHT(OUTER) JOIN (오른쪽 외부 조인)
-- FULL(OUTER) JOIN (완전외부조인)
-- 3. CROSS JOIN
-- 4. SELF JOIN(자가 조인)
-- 5. MULTIPLE JOIN(다중 조인)

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 1. inner join : 두 테이블의 교집합을 반환
--  (1) ON: join 할 테이블의 컬럼명이 동일하거나 동일하지 않거나 할 때 사용 가능
SELECT
	   tm.menu_name
	 , tm.menu_price
	 , tc.category_name 
  FROM tbl_menu tm
  JOIN tbl_category tc ON tm.category_code = tc.category_code;

-- (2) using: join할 테이블의 컬럼명이 동일한 경우만 사용 가능
SELECT
	   *
  FROM tbl_menu tm
  JOIN tbl_category tc USING (category_code);

-- employeee 와 department join
SELECT
	   e.emp_name
	 , d.dept_title
  FROM employee e
  JOIN department d ON e.dept_code = d.dept_id;

-- 2. left[outer] join
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환
SELECT
	   e.emp_name
	 , d.dept_title
  FROM employee e
  LEFT JOIN department d ON e.dept_code = d.dept_id;

-- 3. right[outer] join
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환
SELECT
	   e.emp_name
	 , d.dept_title
  FROM employee e
  RIGHT JOIN department d ON e.dept_code = d.dept_id;

-- 4. cross join : 두 테이블의 가능한 모든 조합을 반환하는 조인
SELECT
	   e.emp_name
	 , d.dept_title
  FROM employee e
 CROSS JOIN department d;

-- 5. self join : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
SELECT
	   e.emp_name
	 , d.emp_name
  FROM employee e
  LEFT JOIN employee d ON e.manager_id = d.emp_id;

SELECT 
	   a.category_name 하위분류
	 , b.category_name 상위분류
  FROM tbl_category a
  LEFT JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT category_name FROM tbl_category WHERE ref_category_code IS NULL;

-- employee 다중 테이블 join
-- 사원명, 부서명, 직급명 조회

SELECT
	   e.emp_name
	 , d.dept_title
	 , j.job_name
  FROM employee e
  LEFT JOIN department d ON e.dept_code = d.dept_id
  JOIN job j USING(job_code);

-- 사원명, 근무 지역명, 근무 국가명 조회
-- employee location nation
SELECT
	   e.emp_name
	 , l.local_name
	 , n.national_name
  FROM employee e 
  LEFT JOIN department d ON e.dept_code = d.dept_id
  JOIN location l ON d.location_id = l.local_code
  JOIN nation n USING(national_code)
  
  
-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 모든 비디오의 제목과 해당 비디오를 올린 
-- 크리에이터의 채널명을 함께 조회하세요.
SELECT
	   v.title 제목
	 , c.channel_name 채널명
  FROM videos v
  JOIN creators c ON v.creator_id = c.creator_id

-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE

-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT
	   v.title 제목
	 , v.view_count 조회수 
  FROM videos v
  JOIN creators c ON v.creator_id = c.creator_id
  WHERE c.channel_name = '맛있는 요리'
  
-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN
  
-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여, 
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)
SELECT
	   u.username 사용자
	 , v.title 제목
  FROM watch_histories wh
  JOIN users u ON wh.user_id = u.user_id
  JOIN videos v ON wh.video_id = v.video_id
  LIMIT 10;
  
-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리, 
-- 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.
SELECT
	   v.title 제목
	 , v.category 카테고리
	 , wh.watch_datetime '언제 시청했는지'
  FROM videos v
  JOIN watch_histories wh ON wh.video_id = v.video_id
  JOIN users u ON u.user_id = wh.user_id 
 WHERE u.username = '기술전문가'
 ORDER BY wh.watch_datetime DESC;

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.
SELECT
	   v.title
	 , c.channel_name
  FROM subscriptions s 
  JOIN users u ON u.user_id = s.user_id
  JOIN creators c ON c.creator_id = s.creator_id
  JOIN videos v ON v.creator_id = c.creator_id
 WHERE u.username = '겜프로';
-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.
SELECT 
	   u.username 
  FROM users u 
  LEFT JOIN video_likes vl ON u.user_id = vl.user_id 
  WHERE vl.like_id IS NULL;

-- 문제 31: 특정 데이터가 없는 항목 찾기
-- 주제: LEFT JOIN

-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.
SELECT
	   c.channel_name
  FROM creators c
  LEFT JOIN videos v ON c.creator_id = v.creator_id 
  WHERE v.video_id IS NULL;
-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 모든 사용자의 username을 중복 없이 조회하세요.
 SELECT
 	    DISTINCT u.username
   FROM videos v
   JOIN watch_histories wh ON v.video_id = wh.video_id 
   JOIN users u ON u.user_id = wh.user_id 
  WHERE v.title LIKE '%레시피%';



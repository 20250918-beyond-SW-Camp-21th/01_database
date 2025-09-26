-- ====================
-- JOIN
-- ====================
-- 두 개 이상의 테이블의 레코드를 연결해서 가상테이블(relation) 생성
-- 연관성을 가지고 있는 컬럼을 기준(데이터)으로 조합

-- # relation을 생성하는 2가지 방법
-- 1. join : 특정컬럼 기준으로 행과 행을 연결한다.(가로)
-- 2. union: 컬럼과 컬럼을 연결한다.(세로)
-- join은 두 테이블의 행 사이의 공통된 데이터를 기준으로 선을 연결해서 새로운 하나의 행을 만든다.

-- JOIN 구분
-- 1. Equi JOIN : 일반적으로 사용하는 Equality Condition(=)에 의한 조인
-- 2. Non-Equi JOIN: 동등조건(=)이 아닌 BETWEEN AND, IS NULL, 
--                   IS NOT NULL, IN, NOT IN, != 등으로 사용

-- Equi JOIN 구분
-- 1. INNER JOIN(내부조인) : 교집합(일반적으로 사용하는 JOIN)
-- 2. OUTER JOIN(외부조인) : 합집합
-- LEFT(OUTER) JOIN  (왼쪽 외부 조인)
-- RIGHT(OUTER) JOIN (오른쪽 외부 조인)
-- FULL(OUTER) JOIN (완전외부조인)
-- 3. CROSS JOIN(모든 항목에 대해 조인)
-- 4. SELF JOIN(자가 조인)
-- 5. MULTIPLE JOIN(다중 조인)

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 1. inner join : 두 테이블의 교집합을 반환
--    ON: join할 테이블의 컬럼명이 동일하거나 동일하지 않거나 사용 가능한 키워드
SELECT  
        a.menu_name 
      , b.category_name  
      , a.menu_price
    FROM tbl_menu a     -- from 뒤에 있는 table이 base테이블.
    JOIN tbl_category b
    ON a.category_code = b.category_code;
    
-- (2) using: join할 테이블의 컬럼명이 동일한 경우에만 사용 -> using은 잘 안씀.
SELECT  
        a.menu_name 
      , b.category_name  
      , a.menu_price
    FROM tbl_menu a
    JOIN tbl_category b USING(category_code);

-- employee와 department join
SELECT
        a.EMP_NAME 
      , b.DEPT_TITLE 
    FROM employee a
    JOIN department b ON a.DEPT_CODE = b.DEPT_ID ;

-- 2. left[outer] join
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환
SELECT  
        a.EMP_NAME 
      , b.DEPT_TITLE 
    FROM employee a
    LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID;

-- 3. right[outer] join
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환
SELECT  
--         a.EMP_NAME 
--       , b.DEPT_TITLE 
        *
    FROM employee a
    RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID;

-- 4. cross join : 두 테이블의 가능한 모든 조합을 반환하는 조인
SELECT
        a.EMP_NAME 
      , b.DEPT_TITLE 
    FROM employee a 
    CROSS JOIN department b -- 9개 부서에 24명의 사원이므로 9x24 - 216개의 행 나옴
    
-- 5. self join : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
SELECT  
        a.EMP_NAME 사원명
      , b.EMP_NAME 관리자명
    FROM employee a
    LEFT JOIN employee b ON a.MANAGER_ID = b.EMP_ID ;
     -- 그냥 join하면 담당 관리자가 없는 사원명은 나오지 않음.(총 16명)
    -- left join하면 null로 모든 사원명이 나옴.(총 24명)
    
SELECT 
        a.category_name 하위분류
      , b.category_name 상위분류
    FROM tbl_category a
    JOIN tbl_category b ON a.ref_category_code = b.category_code ;
    -- left join하면 하위분류의 모든 항목, 즉 식사, 음료, 디저트가 하위분류에 나타남.

SELECT category_name FROM tbl_category WHERE ref_category_code IS NULL;

-- employee에서 다중 테이블 조인
-- 사원명(employee), 부서명(department), 직급명(job)
SELECT
        a.EMP_NAME 사원명
      , b.DEPT_TITLE 부서명
      , c.JOB_NAME 직급명
    FROM employee a
    LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID
    JOIN job c ON a.JOB_CODE = c.JOB_CODE; -- 여기서 left해도 지금은 의미 없음
    
-- 사원명, 부서명, 근무 지역명, 근무 국가명 조회
SELECT 
        a.EMP_NAME      사원명
      , b.DEPT_TITLE    부서명
      , c.LOCAL_NAME    근무지역명
      , d.NATIONAL_NAME 근무국가명
    FROM employee a
    JOIN department b ON a.DEPT_CODE = b.DEPT_ID 
    JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE 
    JOIN nation d ON c.NATIONAL_CODE = d.NATIONAL_CODE ;

-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 모든 비디오의 제목과 
-- 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT  
        a.title 비디오제목
      , b.channel_name 채널명
    FROM videos a
    INNER JOIN creators b ON a.creator_id = b.creator_id;


-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE

-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT  
        a.title 비디오제목
      , a.view_count 조회수
    FROM videos a
    INNER JOIN creators b ON a.creator_id = b.creator_id 
  WHERE b.channel_name = '맛있는 요리';


-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여, 
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. 
-- (결과가 많을 수 있으니 상위 10개만 조회)
SELECT 
        b.username 사용자
      , c.title 비디오제목
    FROM watch_histories a
    INNER JOIN users b ON a.user_id = b.user_id 
    INNER JOIN videos c ON b.user_id = c.creator_id 
  LIMIT 10;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리,
-- 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요.
-- 결과는 시청한 시간이 최신인 순서로 정렬하세요.
SELECT  
        b.title 비디오제목
      , b.category 카테고리
      , c.watch_datetime 시청시간
    FROM users a
    INNER JOIN videos b ON a.user_id = b.creator_id 
    INNER JOIN watch_histories c ON b.creator_id = c.user_id 
  WHERE a.username = '기술전문가'
  ORDER BY c.watch_datetime DESC ;


-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과
-- 그 채널명을 조회하세요.
SELECT  
        c.title 
      , d.channel_name 
    FROM users a
    JOIN subscriptions b ON a.user_id = b.user_id 
    JOIN videos c ON b.creator_id = c.creator_id 
    JOIN creators d ON c.creator_id = d.creator_id 
  WHERE a.username = '겜프로';

-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.
  SELECT 
          a.username 
      FROM users a
      LEFT JOIN video_likes b ON a.user_id = b.user_id 
    WHERE b.like_id IS NULL; 
  

-- 문제 31: 특정 데이터가 없는 항목 찾기
-- 주제: LEFT JOIN

-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.
SELECT
        a.channel_name 
    FROM creators a 
    LEFT JOIN videos b ON a.creator_id = b.creator_id
  WHERE b.video_id IS NULL;



-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한
-- 모든 사용자의 username을 중복 없이 조회하세요.
SELECT 
--         DISTINCT a.username
*
    FROM users a
    INNER JOIN videos b ON a.user_id = b.creator_id 
--     INNER JOIN watch_histories c ON b.creator_id = c.user_id
    INNER JOIN watch_histories c ON b.video_id = c.video_id 
  WHERE b.title LIKE '%레시피%';
SELECT 
--    DISTINCT c.username 
*
  FROM videos a
 INNER JOIN watch_histories b ON a.video_id = b.video_id 
 INNER JOIN users c ON b.user_id = c.user_id 
 WHERE a.title LIKE '%레시피%';



    
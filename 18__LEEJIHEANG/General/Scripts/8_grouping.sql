-- 8.grouping

-- group by: 결과 집합을 특정 열의 값에 따라 그룹화
-- having : group by 절과 함께 사용하며 그룹의 조건을 적용

-------------------------------------------------------
-- 
--

-- 문제 21: 정확한 글자 수로 패턴 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)
-- 문제: users 테이블에서 사용자 이름(username)이 '테스트사용자' 
-- 다음에 정확히 한 글자가 더 붙는 사용자(예: 테스트사용자1, 테스트사용자2)를 모두 조회하세요.

SELECT
       username
  FROM users
WHERE username LIKE '테스트사용자_';



-- 문제 22: 여러 값을 동시에 제외하기
-- 주제: WHERE (부정 리스트 검색 NOT IN)
-- 문제: 국적이 '대한민국', '미국', '일본'이 아닌 사용자의 사용자명과 국적을 조회하세요.
SELECT
       username
     , country
  FROM users
  WHERE country NOT IN ('대한민국','미국','일본');




SELECT username, country
FROM users
WHERE country NOT IN ('대한민국', '미국', '일본');

-- 문제 23: 값이 없는(NULL) 데이터 검색하기
-- 주제: WHERE (NULL 값 검색 IS NULL)
-- 문제: creators 테이블에서 채널 설명(channel_description)이 등록되지 않은 (값이 NULL인) 크리에이터가 있는지 찾아보세요.
SELECT
       channel_name, channel_description
  FROM creators
  WHERE channel_description IS NULL;



SELECT channel_name, channel_description
FROM creators
WHERE channel_description IS NULL;

-- 문제24: 여러 종류의 조건문 종합하기
-- 주제: WHERE (종합 논리 조건)
-- 문제: users 테이블에서, 국적이 '영국'이거나 '프랑스'이면서, 동시에 사용자 이름에 '사용자'라는 단어가 포함되지 않는 사용자를 조회하세요.

SELECT *
FROM users a
JOIN nation b ON a.user_id = b.USER_id;

WHERE
JOIN
GROUP BY
HAVING
ORDER BY







SELECT 
       username 
  FROM users
  WHERE country IN ('영국', '프랑스')
  AND username NOT LIKE '%사용자%';



SELECT username, country
FROM users
WHERE
    country IN ('영국', '프랑스')
    AND username NOT LIKE '%사용자%';


------------------
-- 8.grouping

-- group by: 결과 집합을 특정 열의 값에 따라 그룹화
-- having : group by 절과 함께 사용하며 그룹의 조건을 적용

-- 그룹함수 : count, sum, avg, min, max
-- 여러개의 값중에 한개를 반환

-- 카테고리별 메뉴의 수를 구하고자 한다.

SELECT 
       category_code 
     , COUNT(*)
  FROM tbl_menu
 GROUP BY category_code;
-- COUNT 함수의 특성
SELECT
       COUNT(*)       -- '*'는 모든행 null 까지 포함!
     , COUNT(category_code) -- 컬럼명 기재 시 값이 있는 행만 카운트
     , COUNT(ref_category_code) -- null 값은 카운트 하지 않는다.
  FROM tbl_category;

-- sum: 숫자 합계 계산
SELECT
       menu_name
     , category_code
     , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code;

-------------------------------------------------------
-- 6 select 조회컬럼...
-- 1.  from 조회할 대상 테이블(베이스테이블)
-- 2.  join 조회 대상 테이블 ...
-- 3. where 테이블 행을 조건으로 필터링
-- 4. group by 대상 컬럼으로 결과 집합
-- 5.having 그룹핑 결과를 조건으로 필터링
-- 7. order by 정렬 기준

-- avg : 숫자 평균 계산
SELECT
       menu_name
     , category_code
     , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code;

-- min , max는 모든 데이터 타입을 대상으로 사용 가능

SELECT
       MIN(EMP_ID)
     , MAX(EMP_ID)
     , MIN(HIRE_DATE)
     , MAX(HIRE_DATE)
  FROM employee;

-- group by에서 2개 이상의 그룹 생성

SELECT
       menu_price
     , category_code
     , count(*)
  FROM tbl_menu
  GROUP BY menu_price, category_code;

-- 카테고리별로 메뉴 가격 평균이 10000원 이상인 카테고리의
-- 카테고리 코드, 카테고리명, 평균 메뉴 가격 조회

SELECT
       a.category_code
     , b.category_name
     , AVG(menu_price)
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code
 GROUP BY category_code
HAVING AVG(menu_price) >= 10000;
  
-- rollup : 중간 집계 함수로 group by 와 함께 사용
-- group by 절의 첫번째 기준 컬럼에 대한 중간 집계 + 총 집계 값이
-- result set에 포함된다.
SELECT
       category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY category_code
 WITH ROLLUP;

SELECT
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;


-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT 
       b.title
     , c.username
  FROM video_likes a
 RIGHT JOIN videos b ON a.video_id = b.video_id 
 LEFT JOIN users c ON a.user_id = c.user_id
 ORDER BY b.title;

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.

SELECT
       a.title
     , a.category 
FROM videos a
LEFT JOIN video_likes b ON b.video_id IS NULL
WHERE category IN ('IT/테크','교육');

SELECT
       a.title
     , a.category
  FROM videos A
  LEFT JOIN video_likes b ON a.video_id = b.video_id 
 WHERE category IN ('IT/테크','교육')
   AND b.like_id IS NULL;

-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY
-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 결과를 채널명 가나다순으로 정렬하세요.

SELECT 
       c.title
     , d.channel_name
  FROM users a
  JOIN video_likes b ON a.user_id = b.user_id
  JOIN videos c ON b.video_id = c.video_id
  JOIN creators d ON d.creator_id = c.creator_id
 WHERE a.country = '대한민국'
 ORDER BY d.channel_name ASC;

-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.
SELECT 
       a.category 
     , COUNT(*) video_count
  FROM videos a
 GROUP BY a.category;

-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN
-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT
       b.channel_name
     , sum(a.view_count)
     , avg(a.view_count)
  FROM videos a
  JOIN creators b ON b.creator_id = a.creator_id  
 GROUP BY b.channel_name
 ORDER BY SUM(a.view_count) DESC;

  
  

 -- 문제 38: 그룹화된 결과에 조건 적용하기
 -- 주제: GROUP BY, HAVING
 -- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.

SELECT
       creator_id
     , count(video_id)
  FROM videos
 GROUP BY creator_id
HAVING COUNT(video_id) >=3;

-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING
-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.

SELECT
       a.channel_name
    ,  AVG(c.view_count) 
  FROM creators a
  JOIN users b ON b.user_id = a.user_id
  JOIN videos c ON c.creator_id = a.creator_id
 WHERE country = '대한민국'
 GROUP BY a.channel_name
 HAVING AVG(c.view_count ) >= 500000;
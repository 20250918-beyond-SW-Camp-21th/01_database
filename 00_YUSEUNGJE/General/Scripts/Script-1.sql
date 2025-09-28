-- 문제 1: 모든 데이터 조회하기
-- 주제: SELECT, FROM

-- 문제: users 테이블에 있는 모든 사용자의 모든 정보를 조회하세요.

SELECT * FROM users;


-- 문제 2: 특정 조건의 데이터 선택하기
-- 주제: SELECT (특정 컬럼), WHERE

-- 문제: '게임' 카테고리에 해당하는 모든 비디오의 제목과 조회수를 조회하세요.

SELECT title, view_count
FROM videos
WHERE category = '게임';


-- 문제 3: 숫자 비교 조건 사용하기
-- 주제: WHERE (숫자 비교)

-- 문제: 조회수(view_count)가 1,000,000 (백만) 회를 초과하는 모든 비디오의 creator_id, title, view_count를 조회하세요.

SELECT creator_id, title, view_count
FROM videos
WHERE view_count > 1000000;

-- 문제 4: 결과 정렬하기
-- 주제: ORDER BY

-- 문제: users 테이블의 모든 사용자를 가입일(registration_date)이 최신인 순서대로 정렬하여 모든 정보를 조회하세요.

SELECT *
FROM users
ORDER BY registration_date DESC;

-- 문제 5: 여러 조건 동시에 만족시키기
-- 주제: WHERE (복수 조건 AND)

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.

SELECT title, category, view_count
FROM videos
WHERE category = 'IT/테크' AND view_count >= 500000;


-- 문제 6: 상위 N개 결과만 보기
-- 주제: ORDER BY, LIMIT

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요.

SELECT title, view_count
FROM videos
ORDER BY view_count DESC
LIMIT 5;


-- 문제 7: 중복 없이 결과 보기
-- 주제: DISTINCT

-- 문제: videos 테이블에 존재하는 모든 비디오 카테고리의 종류를 중복 없이 조회하세요.

SELECT DISTINCT category
FROM videos;


-- 문제 8: 특정 패턴의 문자열 검색하기
-- 주제: WHERE (패턴 검색 LIKE)

-- 문제: 비디오 제목에 '리뷰'라는 단어가 포함된 모든 비디오의 제목을 조회하세요.
SELECT title
FROM videos
WHERE title LIKE '%리뷰%';


-- 문제 9: 여러 값 중 하나와 일치하는 데이터 검색
-- 주제: WHERE (리스트 검색 IN)

-- 문제: creators 테이블에서 creator_id가 1, 3, 5, 7인 크리에이터의 채널명과 creator_id를 조회하세요.

SELECT channel_name, creator_id
FROM creators
WHERE creator_id IN (1, 3, 5, 7);


-- 문제 10: 특정 범위의 데이터 검색하기
-- 주제: WHERE (범위 검색 BETWEEN)

-- 문제: 조회수가 500,000 이상 1,000,000 이하인 비디오의 제목과 조회수를 조회하세요.

SELECT title, view_count
FROM videos
WHERE view_count BETWEEN 500000 AND 1000000;

-- 문제 11: NULL이 아닌 데이터만 확인하기
-- 주제: WHERE (NULL 값 확인)

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.
SELECT channel_name
FROM creators
WHERE channel_description IS NOT NULL;


-- 문제 12: 복잡한 논리 조건 조합하기
-- 주제: WHERE (논리 연산자 AND, OR 조합)

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.

SELECT
    title,
    category,
    duration_seconds
FROM
    videos
WHERE
    (category = 'IT/테크' OR category = '교육')
    AND duration_seconds >= 3600;

-- 문제 13: 여러 기준으로 정렬하기
-- 주제: ORDER BY (다중 컬럼 정렬)

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.
SELECT
    category,
    title,
    view_count
FROM
    videos
ORDER BY
    category ASC,
    view_count DESC;

-- 문제 14: 조건에 맞는 데이터 개수 세기
-- 주제: 집계 함수 (COUNT)

-- 문제: '대한민국' 국적을 가진 사용자는 총 몇 명인지 계산하세요.
SELECT COUNT(*) AS '대한민국 국적 사용자 수'
FROM users
WHERE country = '대한민국';
 
-- 문제 15: 합계와 평균 계산하기
-- 주제: 집계 함수 (SUM, AVG)

-- 문제: '요리' 카테고리 비디오들의 총 조회수 합계와 평균 조회수를 계산하세요. (평균 조회수는 소수점 이하는 버립니다.)

SELECT
    SUM(view_count) AS total_views,
    FLOOR(AVG(view_count)) AS average_views
FROM
    videos
WHERE
    category = '요리';


-- 문제 16: 최대값과 최소값 찾기
-- 주제: 집계 함수 (MAX, MIN)

-- 문제: '게임' 카테고리 비디오 중 **가장 재생 시간이 긴 비디오의 시간(초)**과 **가장 짧은 비디오의 시간(초)**을 조회하세요.
SELECT
    MAX(duration_seconds) AS '가장 긴 시간(초)',
    MIN(duration_seconds) AS '가장 짧은 시간(초)'
FROM
    videos
WHERE
    category = '게임';

-- 문제 17: 결과 구간 선택하기 (페이지네이션)
-- 주제: LIMIT with OFFSET

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요. 
SELECT username, email
FROM users
ORDER BY user_id
LIMIT 10 OFFSET 10;

-- 문제 18: 특정 목록을 제외한 데이터 검색
-- 주제: WHERE (부정 리스트 검색 NOT IN)

-- 문제: 'IT/테크', '게임', '교육' 카테고리를 제외한 나머지 카테고리의 비디오 제목과 카테고리를 조회하세요.
SELECT title, category
FROM videos
WHERE category NOT IN ('IT/테크', '게임', '교육');


-- 문제 19: 특정 위치의 글자 수로 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '겜'으로 시작하고 총 세 글자인 사용자를 조회하세요.
SELECT username
FROM users
WHERE username LIKE '겜__';

-- 문제 20: 기본기 종합 복습
-- 주제: WHERE, ORDER BY, LIMIT 종합

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.
SELECT user_id, username, country
FROM users
WHERE country IN ('대한민국', '미국')
ORDER BY username ASC
LIMIT 5;
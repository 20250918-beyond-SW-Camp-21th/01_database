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
ORDER BY registration_date DESC


-- 문제 5: 여러 조건 동시에 만족시키기
-- 주제: WHERE (복수 조건 AND)

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.
SELECT title, category, view_count 
FROM videos
WHERE category = 'IT/테크' AND view_count > 500000;



-- 문제 6: 상위 N개 결과만 보기
-- 주제: ORDER BY, LIMIT

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요.
SELECT title, view_count 
FROM videos
ORDER BY view_count DESC
LIMIT 5



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

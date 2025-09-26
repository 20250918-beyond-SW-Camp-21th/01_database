-- 문제 11: NULL이 아닌 데이터만 확인하기
-- 주제: WHERE (NULL 값 확인)

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.
SELECT channel_name
FROM creators
WHERE channel_description IS NOT NULL;

-- 문제 12: 복잡한 논리 조건 조합하기
-- 주제: WHERE (논리 연산자 AND, OR 조합)

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.
SELECT title, category, duration_seconds
FROM videos
WHERE (category = 'IT/테크' OR category = '교육') AND duration_seconds  > 3600


-- 문제 13: 여러 기준으로 정렬하기
-- 주제: ORDER BY (다중 컬럼 정렬)

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.
SELECT category, title, view_count
FROM videos
ORDER BY category ASC, view_count DESC;

-- 문제 14: 특정 패턴을 제외한 데이터 검색
-- 주제: WHERE (NOT LIKE)

-- 문제: 크리에이터의 채널 설명(channel_description)에 '튜토리얼'이라는 단어가 포함되지 않은 채널의 이름을 조회하세요.
SELECT channel_name
FROM creators
WHERE channel_description NOT LIKE '%튜토리얼%';

-- 문제 15: 특정 범위를 벗어나는 데이터 검색
-- 주제: WHERE (NOT BETWEEN)

-- 문제: 재생 시간(duration_seconds)이 10분(600초)에서 30분(1800초) 사이가 아닌 비디오의 제목과 재생 시간을 조회하세요.
SELECT title, duration_seconds
FROM videos
WHERE duration_seconds NOT BETWEEN 600 AND 1800;

-- 문제 16: 더 복잡한 논리 조건 조합하기
-- 주제: WHERE (복합 논리 조건 (), AND, OR)

-- 문제: '여행' 카테고리 비디오 중 조회수가 500,000 이상인 경우 또는 '음악' 카테고리 비디오 중 재생 시간이 5분(300초) 이하인 경우를 모두 조회하세요. (결과에는 제목, 카테고리, 조회수, 재생 시간을 포함하세요.)
SELECT title, category, view_count, duration_seconds
FROM videos
WHERE (category = '여행' AND view_count > 500000) OR (category = '음악' AND duration_seconds < 300);

-- 문제 17: 결과 구간 선택하기 (페이지네이션)
-- 주제: LIMIT with OFFSET

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요.
SELECT username, email
FROM users
ORDER BY user_id
LIMIT 10, 10;

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
WHERE username LIKE ('%겜__')

-- 문제 20: 기본기 종합 복습
-- 주제: WHERE, ORDER BY, LIMIT 종합

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.
SELECT user_id, username, country 
FROM users
WHERE country IN ('대한민국', '미국')
ORDER BY username ASC
LIMIT 5;

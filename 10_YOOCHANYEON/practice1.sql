-- 문제 1: 모든 데이터 조회하기

-- 문제: users 테이블에 있는 모든 사용자의 모든 정보를 조회하세요.

SELECT 
		*
	FROM users;


-- 문제 2: 특정 조건의 데이터 선택하기

-- 문제: '게임' 카테고리에 해당하는 모든 비디오의 제목과 조회수를 조회하세요.

SELECT 
		title,
		view_count
	FROM videos
WHERE category = '게임';
	

-- 문제 3: 숫자 비교 조건 사용하기

-- 문제: 조회수(view_count)가 1,000,000 (백만) 회를 초과하는 모든 비디오의 creator_id, title, view_count를 조회하세요.

SELECT 
		creator_id,
		title,
		view_count
	FROM videos
 WHERE view_count > 1000000;

-- 문제 4: 결과 정렬하기

-- 문제: users 테이블의 모든 사용자를 가입일(registration_date)이 최신인 순서대로 정렬하여 모든 정보를 조회하세요.

SELECT 
		*
	FROM users
 ORDER BY registration_date DESC;

-- 문제 5: 여러 조건 동시에 만족시키기

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.

SELECT
		title,
		category,
		view_count
	FROM videos
 WHERE category = 'IT/테크'
 	AND view_count >= 500000;


-- 문제 6: 상위 N개 결과만 보기

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요.

SELECT 
		title,
		view_count
	FROM videos
 ORDER BY view_count DESC
 LIMIT 5;

-- 문제 7: 중복 없이 결과 보기

-- 문제: videos 테이블에 존재하는 모든 비디오 카테고리의 종류를 중복 없이 조회하세요.

SELECT 
		DISTINCT category
	FROM videos;

-- 문제 8: 특정 패턴의 문자열 검색하기

-- 문제: 비디오 제목에 '리뷰'라는 단어가 포함된 모든 비디오의 제목을 조회하세요.

SELECT 
		title
	FROM videos
 WHERE title LIKE '%리뷰%';

-- 문제 9: 여러 값 중 하나와 일치하는 데이터 검색

-- 문제: creators 테이블에서 creator_id가 1, 3, 5, 7인 크리에이터의 채널명과 creator_id를 조회하세요.
SELECT 
		channel_name ,
		creator_id
	FROM creators
 WHERE creator_id IN (1,3,5,7);

-- 문제 10: 특정 범위의 데이터 검색하기

-- 문제: 조회수가 500,000 이상 1,000,000 이하인 비디오의 제목과 조회수를 조회하세요.

SELECT
		title,
		view_count
	FROM videos
 WHERE view_count BETWEEN 500000 AND 1000000;

-- 문제 11: NULL이 아닌 데이터만 확인하기

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.
SELECT 
		channel_name
	FROM creators
 WHERE channel_description IS NOT NULL;

-- 문제 12: 복잡한 논리 조건 조합하기

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.
SELECT
		title,
		category,
		duration_seconds 
	FROM videos
 WHERE (category = 'IT/테크'
 	OR category = '교육')
 	AND duration_seconds >= 3600;

-- 문제 13: 여러 기준으로 정렬하기

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.
SELECT 
		category,
		title,
		view_count
	FROM videos
 ORDER BY category, view_count DESC;	

-- 문제 14: 특정 패턴을 제외한 데이터 검색

-- 문제: 크리에이터의 채널 설명(channel_description)에 '튜토리얼'이라는 단어가 포함되지 않은 채널의 이름을 조회하세요.

SELECT
		channel_name
	FROM creators
 WHERE channel_description NOT LIKE ('%튜토리얼%');

-- 문제 15: 특정 범위를 벗어나는 데이터 검색

-- 문제: 재생 시간(duration_seconds)이 10분(600초)에서 30분(1800초) 사이가 아닌 비디오의 제목과 재생 시간을 조회하세요.
SELECT
		title,
		duration_seconds
	FROM videos
 WHERE duration_seconds NOT BETWEEN 600 AND 1800;

-- 문제 16: 더 복잡한 논리 조건 조합하기

-- 문제: '여행' 카테고리 비디오 중 조회수가 500,000 이상인 경우 또는 '음악' 카테고리 비디오 중 재생 시간이 5분(300초) 이하인 경우를 모두 조회하세요. (결과에는 제목, 카테고리, 조회수, 재생 시간을 포함하세요.)
SELECT 
		title,
		category,
		view_count,
		duration_seconds
	FROM videos
 WHERE (view_count >= 500000
 	AND category = '여행')
 	OR (category = '음악'
 	AND duration_seconds <= 300);

-- 문제 17: 결과 구간 선택하기 (페이지네이션)

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요.
SELECT
		username,
		email
	FROM users
ORDER BY user_id 
LIMIT 10, 10;
-- 문제 18: 특정 목록을 제외한 데이터 검색

-- 문제: 'IT/테크', '게임', '교육' 카테고리를 제외한 나머지 카테고리의 비디오 제목과 카테고리를 조회하세요.
SELECT 
		title,
		category
	FROM videos
 WHERE category NOT IN ('IT/테크', '게임', '교육');

-- 문제 19: 특정 위치의 글자 수로 검색하기

-- 문제: users 테이블에서 사용자 이름(username)이 '겜'으로 시작하고 총 세 글자인 사용자를 조회하세요.
SELECT
		*
	FROM users
 WHERE username LIKE ('겜__');

-- 문제 20: 기본기 종합 복습

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.
SELECT
		user_id,
		username,
		country
	FROM users
WHERE country IN ('대한민국', '미국')
ORDER BY username
LIMIT 5;

-- -- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 
-- 모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT 
       v.title
     , c.channel_name
  FROM videos v
  JOIN creators c ON c.creator_id = v.creator_id;

-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE

-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT
       v.title
     , v.view_count
  FROM videos v
  JOIN creators c ON c.creator_id = v.creator_id
 WHERE c.channel_name = '맛있는 요리';

-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여,  
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)
SELECT
       u.username
     , v.title
  FROM watch_histories w
  JOIN users u ON u.user_id = w.user_id 
  JOIN videos v ON v.video_id = w.video_id
 LIMIT 10 ;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리, 
-- 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.
SELECT
       v.title
     , v.category
     , w.watch_datetime
  FROM videos v
  JOIN watch_histories w ON w.video_id = v.video_id
  JOIN users u ON w.user_id = u.user_id
 WHERE u.username = '기술전문가'
 ORDER BY w.watch_datetime DESC ;

-- 문제 29: 4개 테이블 연결하기

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 
-- 그 채널명을 조회하세요.
SELECT
       title
     , channel_name
  FROM users u
  JOIN subscriptions s ON s.user_id = u.user_id
  JOIN videos v ON v.creator_id = s.creator_id
  JOIN creators c ON c.creator_id = v.creator_id
 WHERE u.username = '겜프로';
  
-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.
SELECT
       u.username
  FROM users u
  LEFT JOIN video_likes vl ON u.user_id = vl.user_id
 WHERE vl.like_id IS NULL;
  
-- 문제 31: 특정 데이터가 없는 항목 찾기

-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.
SELECT
       c.channel_name
  FROM creators c
  LEFT JOIN videos v ON c.creator_id = v.creator_id
 WHERE v.creator_id IS NULL;

-- 문제 32: 시청 기록을 통해 사용자 찾기

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 
-- 모든 사용자의 username을 중복 없이 조회하세요.
SELECT
       DISTINCT u.username
  FROM users u
  JOIN watch_histories wh ON u.user_id = wh.user_id
  JOIN videos v ON v.video_id = wh.video_id
 WHERE v.title LIKE '%레시피%';

-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기(***)
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. 
-- '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT
       v.title 
     , u.username
  FROM video_likes vl
 RIGHT JOIN videos v ON vl.video_id = v.video_id 
  LEFT JOIN users u ON vl.user_id = u.user_id; 

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.
SELECT
       v.title
     , v.category
  FROM videos v
  LEFT JOIN video_likes vl ON vl.video_id =v.video_id 
 WHERE category IN ('IT/테크', '교육')
 GROUP BY vl.like_id 
HAVING vl.like_id IS NULL;

-- 문제 35: JOIN 종합 문제

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 
-- 결과를 채널명 가나다순으로 정렬하세요.
SELECT
       v.title
     , c.channel_name
  FROM users u
  JOIN video_likes vl ON vl.user_id = u.user_id 
  JOIN videos v ON vl.video_id = v.video_id 
  JOIN creators c ON v.creator_id = c.creator_id
 WHERE u.country  = '대한민국'
 ORDER BY c.channel_name;

-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.
SELECT
       category
     , count(title)
  FROM videos
 GROUP BY category;

-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT
       c.channel_name
     , sum(v.view_count)
     , avg(v.view_count)
  FROM creators c
  JOIN videos v ON c.creator_id = v.creator_id 
 GROUP BY v.creator_id
 ORDER BY sum(v.view_count) DESC;

-- 문제 38: 그룹화된 결과에 조건 적용하기

-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.
SELECT
       c.creator_id
     , count(v.video_id)
  FROM creators c
  JOIN videos v ON c.creator_id = v.creator_id
 GROUP BY c.creator_id
HAVING count(v.video_id) >= 3;
  

-- 문제 39: JOIN과 GROUP BY, HAVING 

-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.
SELECT
       c.channel_name
     , avg(v.view_count)
  FROM creators c
  JOIN videos v ON c.creator_id = v.creator_id
  JOIN users u ON c.user_id = u.user_id
 WHERE u.country = '대한민국'
 GROUP BY v.creator_id
HAVING avg(v.view_count) >= 500000;
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
  FROM videos a
  JOIN creators b ON a.creator_id = b.creator_id 
 WHERE b.channel_name LIKE '맛있는 요리'

-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여, 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)

SELECT
	   b.username 
	 , c.title
  FROM watch_histories a
  JOIN users b  ON a.user_id = b.user_id
  JOIN videos c ON a.video_id = c.video_id
 LIMIT 10;
	
-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리, 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.

SELECT
	   c.title
	 , c.category
	 , a.watch_datetime 
  FROM watch_histories a
  JOIN users b  ON a.user_id = b.user_id
  JOIN videos c ON a.video_id = c.video_id
 WHERE b.username LIKE '기술전문가';

SELECT
		c.title
		, c.category 
		, b.watch_datetime 
	FROM users a
	JOIN watch_histories b ON a.user_id =b.user_id
	JOIN videos c ON b.video_id =c.video_id
	WHERE a.username = '기술전문가'
	ORDER BY b.watch_datetime;
	
-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.
SELECT
		d.title
		, c.channel_name
	FROM users a
	JOIN subscriptions b ON a.user_id = b.user_id
	JOIN creators c ON b.creator_id = c.creator_id 
	JOIN videos d ON c.creator_id = d.creator_id
	WHERE a.username = '겜프로'

-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.

SELECT
		a.username
		, b.user_id
	FROM users a
	LEFT JOIN video_likes b ON a.user_id =b.user_id
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


-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 모든 사용자의 username을 중복 없이 조회하세요.

SELECT
		DISTINCT c.username
	FROM videos a
	JOIN watch_histories b ON a.video_id = b.video_id
	JOIN users c ON b.user_id = c.user_id
	WHERE a.title LIKE '%레시피%'

-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT
		c.title
		, b.username 
	FROM video_likes a
	JOIN users b ON a.user_id = b.user_id
	RIGHT JOIN videos c ON a.video_id = c.video_id

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.

SELECT
		a.title 
		, a.category 
	FROM videos a
	LEFT JOIN video_likes b ON a.video_id = b.video_id
	WHERE a.category in('IT/테크','교육')
	AND b.video_id IS NULL;
-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 결과를 채널명 가나다순으로 정렬하세요.
SELECT
		b.title
		, c.channel_name
	FROM  video_likes a 
	JOIN videos b ON a.video_id = b.video_id 
	JOIN creators c ON a.user_id  = c.user_id
	JOIN users d ON a.user_id = d.user_id 
	WHERE d.country = '대한민국'
	ORDER BY c.channel_name;

-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.

SELECT 
		videos.category
		, count(*)
	FROM videos
	GROUP BY category 
-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN

-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT
	a.channel_name
	, sum(view_count)
	,avg(view_count)
	FROM creators a
	JOIN videos b ON a.creator_id = b.creator_id
	GROUP BY a.channel_name
	ORDER BY sum(view_count) DESC;
	
-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING

-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.

SELECT
		a.creator_id
		, count(b.creator_id)
	FROM creators a
	JOIN videos b ON a.creator_id = b.creator_id 
	GROUP BY a.creator_id
	HAVING count(b.creator_id)>=3
-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING

-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.
	
SELECT
		a.channel_name 
		, avg(c.view_count)
	FROM creators a
	JOIN users b ON a.user_id = b.user_id 
	JOIN videos c ON a.creator_id = c.creator_id
	WHERE b.country LIKE ('대한민국')
	GROUP BY a.channel_name 
	HAVING avg(c.view_count)>=500000
-- -- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 
-- 모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.

SELECT
	v.title '비디오',
	c.channel_name '채널명' 
FROM videos v
JOIN creators c ON v.creator_id  = c.creator_id;

-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE

-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.

SELECT
	v.title,
	v.view_count
FROM videos v
JOIN creators c ON v.creator_id  = c.creator_id
WHERE c.channel_name = '맛있는 요리';

-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, 
-- users 테이블과 videos 테이블을 JOIN하여,
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)

SELECT
	u.username '사용자',
	v.title '비디오'
FROM watch_histories wh 
JOIN users u ON wh.user_id = u.user_id
JOIN videos v ON wh.video_id = v.video_id
LIMIT 10;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 
-- 시청한 모든 비디오의 제목과 카테고리, 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 
-- 결과는 시청한 시간이 최신인 순서로 정렬하세요.
-- 주제: INNER JOIN

SELECT 
	v.title,
	v.category,
	wh.watch_datetime 
FROM users u
JOIN watch_histories wh ON u.user_id  = wh.user_id
JOIN videos v ON wh.video_id = v.video_id 
WHERE u.username = '기술전문가'
ORDER BY wh.watch_datetime ASC

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.

SELECT 
	v.title,
	c.channel_name
FROM users u 
JOIN subscriptions s ON u.user_id = s.user_id
JOIN creators c ON c.creator_id  = s.creator_id
JOIN videos v ON v.creator_id  = c.creator_id
WHERE u.username = '겜프로';

-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.

SELECT
	u.username
FROM users u 
LEFT JOIN video_likes vl ON u.user_id = vl.user_id
WHERE vl.like_id IS NULL



-- 문제 31: 특정 데이터가 없는 항목 찾기
-- 주제: LEFT JOIN

-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.

SELECT
	c.channel_name 
FROM creators c 
LEFT JOIN videos v ON v.creator_id = c.creator_id 
WHERE v.video_id IS NULL

-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 모든 사용자의 username을 중복 없이 조회하세요.

SELECT 
	DISTINCT(u.username)
FROM videos v
JOIN watch_histories wh ON wh.video_id = v.video_id 
JOIN users u ON u.user_id = wh.user_id 
WHERE v.title LIKE '%레시피%'

-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.

SELECT 
	v.title,
	u.username
FROM video_likes vl
RIGHT JOIN videos v ON v.video_id = vl.video_id
LEFT JOIN users u ON u.user_id = vl.user_id;   

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, 
-- '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.

SELECT
	v.title,
	v.category
FROM videos v
LEFT JOIN video_likes vl ON v.video_id = vl.video_id
WHERE v.category IN ('IT/테크', '교육') AND vl.like_id IS NULL

-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 
-- 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 결과를 채널명 가나다순으로 정렬하세요.

SELECT 
	v.title,
	c.channel_name
FROM users u 
JOIN video_likes vl ON u.user_id = vl.user_id 
JOIN videos v ON vl.video_id = v.video_id
JOIN creators c ON v.creator_id = c.creator_id 
WHERE u.country = '대한민국' AND vl.user_id IS NOT NULL
ORDER BY c.channel_name

-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.

SELECT 
	category,
	COUNT(*)
FROM videos
GROUP BY category;

-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN

-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 
-- 결과를 총 조회수 합계가 높은 순으로 정렬하세요.

SELECT 
	category,
	SUM(v.view_count),
	AVG(v.view_count)
FROM creators c
JOIN videos v ON c.creator_id = v.creator_id
GROUP BY c.channel_name
ORDER BY SUM(v.view_count) DESC

-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING

-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 
-- 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.

SELECT
	c.creator_id,
	COUNT(*)
FROM videos v
JOIN creators c ON v.creator_id = c.creator_id 
GROUP BY c.creator_id
HAVING COUNT(*) >= 5

-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING

-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 
-- 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.

SELECT
	c.channel_name,
	AVG(v.view_count)
FROM users u
JOIN creators c ON u.user_id = c.user_id
JOIN videos v ON v.creator_id = c.creator_id
WHERE u.country = '대한민국'
GROUP BY c.channel_name
HAVING AVG(v.view_count) >= 500000

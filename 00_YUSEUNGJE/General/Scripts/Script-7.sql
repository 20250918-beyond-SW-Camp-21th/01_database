-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN
-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 
--      모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT
       a.title 
     , b.channel_name 
  FROM videos a
 INNER JOIN creators b ON a.creator_id = b.creator_id;

-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE
-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT
       a.title 
     , a.view_count 
  FROM videos a
 INNER JOIN creators b ON a.creator_id = b.creator_id
 WHERE b.channel_name = '맛있는 요리';


-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN
-- 문제: watch_histories 테이블을 중심(basetable)으로, users 테이블과 videos 테이블을 
--      JOIN하여, 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. 
--      (결과가 많을 수 있으니 상위 10개만 조회(LIMIT))
SELECT
       b.username 
     , c.title 
  FROM watch_histories a
  JOIN users b ON a.user_id = b.user_id 
  JOIN videos c ON a.video_id = c.video_id
 LIMIT 10;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY
-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리,
--      그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 
--      결과는 시청한 시간이 최신인 순서로 정렬하세요.

-- users, watch_histories, videos
SELECT
	 c.title
     , c.category 
     , b.watch_datetime 
  FROM users a
  JOIN watch_histories b ON a.user_id = b.user_id 
  JOIN videos c ON b.video_id = c.video_id
 WHERE a.username = '기술전문가'
 ORDER BY b.watch_datetime DESC;

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN
-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 
--      그 채널명을 조회하세요.
-- >> users, subscriptions, creators, videos
SELECT
       d.title 
     , c.channel_name 
  FROM users a
 INNER JOIN subscriptions b ON a.user_id = b.user_id 
 INNER JOIN creators c ON b.creator_id = c.creator_id 
 INNER JOIN videos d ON c.creator_id = d.creator_id 
 WHERE a.username = '겜프로';
 
-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)
-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.
SELECT
	 a.username 
     , b.like_id 
  FROM users a
  LEFT JOIN video_likes b ON a.user_id = b.user_id
 WHERE b.like_id IS NULL;

-- 문제 31: 특정 데이터가 없는 항목 찾기
-- 주제: LEFT JOIN
-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.
SELECT
	 a.channel_name 
     , b.video_id 
  FROM creators a
  LEFT JOIN videos b ON a.creator_id = b.creator_id 
 WHERE b.video_id IS NULL;

-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE
-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 
--      모든 사용자의 username을 중복 없이 조회하세요.
SELECT 
	 DISTINCT c.username 
  FROM videos a
 INNER JOIN watch_histories b ON a.video_id = b.video_id 
 INNER JOIN users c ON b.user_id = c.user_id 
 WHERE a.title LIKE '%레시피%';






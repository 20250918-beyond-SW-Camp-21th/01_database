-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 
-- 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. 
-- '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT 
       b.title
     , c.username
  FROM video_likes a
 RIGHT JOIN videos b ON a.video_id = b.video_id
 LEFT JOIN users c ON a.user_id = c.user_id
ORDER BY b.title;

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, 
-- '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.
SELECT
       a.title 
     , a.category 
  FROM videos a
  LEFT JOIN video_likes b ON a.video_id = b.video_id 
 WHERE a.category IN('IT/테크', '교육')
   AND b.like_id  IS NULL;
 

-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 
--      그 비디오를 만든 크리에이터의 채널명을 조회하세요. 
--      결과를 채널명 가나다순으로 정렬하세요.
-- >> users, video_likes, videos, creators
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
       category 
     , COUNT(*) video_count
  FROM videos
 GROUP BY category;


-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN
-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 
--      결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT
       a.channel_name 
     , SUM(b.view_count) total_views
     , AVG(b.view_count) avg_views
  FROM creators a
  JOIN videos b ON a.creator_id = b.creator_id 
 GROUP BY a.channel_name 
 ORDER BY total_views DESC;

-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING
-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 
--      각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.
SELECT 
       creator_id
     , COUNT(*) video_count
  FROM videos
 GROUP BY creator_id 
HAVING video_count >= 3;


-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING
-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 
-- 올린 비디오의 평균 조회수가 500,000 이상인 
-- 크리에이터의 채널명과 평균 조회수를 조회하세요.
-- >> users, creators, videos
SELECT
       b.channel_name 
     , FLOOR(AVG(c.view_count)) avg_views
  FROM users a 
  JOIN creators b ON a.user_id = b.user_id 
  JOIN videos c ON b.creator_id = c.creator_id 
 WHERE a.country = '대한민국'
 GROUP BY b.channel_name
HAVING avg_views >= 500000;
   













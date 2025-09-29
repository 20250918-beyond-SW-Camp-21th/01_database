-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이 한 번이라도 있는 사용자의 username을 모두 조회하세요.
SELECT
       a.username
  FROM
       users AS a
 WHERE EXISTS (
		    SELECT 1
		      FROM videos AS b
		     INNER JOIN video_likes AS c ON b.video_id = c.video_id
		     WHERE c.user_id = a.user_id AND b.category = '여행'
	        );

-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해, '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.
SELECT
       a.title
  FROM
       videos AS a
 WHERE
	 a.creator_id IN (SELECT creator_id 
	                    FROM creators 
	                   WHERE channel_description LIKE '%리뷰%')
			         AND NOT EXISTS (SELECT 1 
			                           FROM video_likes AS b 
			                          WHERE b.video_id = a.video_id
	    						);

-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 제목, 카테고리, 재생 시간을 조회하세요.



-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.

-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는 모든 사용자의 username을 조회하세요.
SELECT
       a.username
  FROM
       users a
 WHERE
       a.user_id IN (SELECT b.user_id
                       FROM watch_histories b
                      INNER JOIN videos c ON b.video_id = c.video_id
        		    WHERE c.category = 'IT/테크'
       		  );

-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를 기록한 비디오의 제목을 조회하세요.
SELECT
    	 a.channel_name
     , (
        SELECT b.title
          FROM videos AS b
         WHERE b.creator_id = a.creator_id
         ORDER BY b.view_count DESC
         LIMIT 1
       ) AS most_popular_video
FROM
    creators AS a;

-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후, 이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.

WITH PopularVideos AS (
    SELECT
        creator_id
    FROM
        videos
    WHERE
        view_count > 1000000
)
SELECT 
       DISTINCT a.channel_name
  FROM creators AS a
 INNER JOIN PopularVideos AS b ON a.creator_id = b.creator_id;

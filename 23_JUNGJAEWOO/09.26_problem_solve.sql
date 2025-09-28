-- 문제40 : 다른 쿼리의 결과를 조건으로 사용하기
-- 주제: 서브쿼리 ( WHERE 절 내부)
-- 문제: 평균 조회수보다 더 많은 조회수를 기록한 비디오의 제목과 조회수를 조회하세요.
SELECT 
       title
     , view_count
  FROM videos 
 WHERE view_count > ALL(SELECT avg(view_count)
                       FROM videos
                       );

-- 문제 41: 목록(List)을 반환하는 서브쿼리 사용하기
-- 주제: 서브쿼리 with IN
-- 문제: '코딩 아카데미' 채널이 올린 비디오에 '좋아요'를 누른 모든 사용자의 username을 조회하세요. (JOIN을 사용하지 않고 서브쿼리로만 풀어보기!)
SELECT 
       username
  FROM users
 WHERE user_id IN(SELECT user_id
                         FROM video_likes
                        WHERE video_id IN(SELECT video_id
                                            FROM videos
                                           WHERE creator_ID IN(SELECT creator_id
                                                                FROM creators
                                                               WHERE channel_name = '코딩 아카데미'
                                                              )
                                         )
                                                                
                 )       
                    
-- 문제 42: 두 개의 결과 합치기 (중복 제거)
-- 주제: 집합 연산자 UNION
-- 문제: 'IT/테크' 카테고리에 속한 비디오의 제목과, '코딩 아카데미' 채널이 올린 비디오의 제목을 하나의 목록으로 합쳐서 보여주세요. 중복된 제목이 있다면 한 번만 표시합니다.
SELECT
       title
  FROM videos
 WHERE category = 'IT/테크'
 UNION
SELECT
       title
  FROM videos
 WHERE creator_id = (SELECT creator_id
 	 				   FROM creators                     
                      WHERE channel_name = '코딩 아카데미'
                      );
-- 문제 43: 두 개의 결과 합치기 (중복 포함)
-- 주제: 집합 연산자 UNION ALL
-- 문제: users 테이블에서 국적이 '대한민국'인 사용자의 username과, creators 테이블에 있는 모든 크리에이터의 channel_name을 하나의 목록으로 합쳐서 보여주세요.
--      이 경우, 이름이 같더라도 중복을 제거하지 말고 모두 표시합니다.
SELECT 
       username
  FROM users
 WHERE country = '대한민국'
 UNION ALL
SELECT 
       channel_name
  FROM creators
 

-- 문제 44: FROM 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (인라인 뷰 Inline View)
-- 문제: 각 크리에이터별 평균 비디오 조회수를 먼저 구하고, 그 중에서 평균 조회수가 1,000,000 (백만)을 초과하는 크리에이터의 creator_id와 계산된 평균 조회수를 조회하세요.
SELECT
       v.creator_id
     , v.vg
  FROM (SELECT creator_id, avg(view_count) vg,
          FROM videos
         GROUP BY creator_id
        HAVING avg(view_count) > 1000000
       ) AS v
       
-- 문제 45: SELECT 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (스칼라 서브쿼리)
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 해당 채널이 올린 비디오의 총 개수를 함께 조회하세요. (JOIN을 사용하지 마세요.)
SELECT
       channel_name
     , (SELECT count(video_id)
          FROM videos b
         WHERE a.creator_id = b.creator_id
       ) count
  FROM creators a;

-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이 한 번이라도 있는 사용자의 username을 모두 조회하세요.
SELECT
       username
  FROM users a
 WHERE EXISTS (SELECT 1
 			     FROM video_likes b
 			    WHERE b.user_id = a.user_id
 			      AND b.video_id IN (SELECT video_id
 			    					   FROM videos c
 			    					  WHERE c.category = '여행'
 			    					)0-                                                                                                                                             
			  );        
-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해, 
-- '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.
SELECT 
	   title
  FROM videos a
 WHERE EXISTS (SELECT 1
                     FROM creators b
                    WHERE channel_description LIKE "%리뷰%"
                      AND a.creator_id = b.creator_id
                  )
   AND NOT EXISTS (SELECT 1 
                     FROM video_likes c
                    WHERE a.video_id = c.video_id
                  );

-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 제목, 
-- 카테고리, 재생 시간을 조회하세요.
SELECT
       title
     , category
     , duration_seconds
  FROM videos
 WHERE duration_seconds > (SELECT avg(duration_seconds)
          FROM videos
         WHERE category = 'IT/테크')

-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.
SELECT 
	   av.category, av.avg_views
FROM (SELECT category, AVG(view_count) avg_views
  FROM videos
  GROUP BY category
) av
ORDER BY av.avg_views DESC
LIMIT 1;


-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는 모든 사용자의 username을 조회하세요.
SELECT 
       username
  FROM users a
 WHERE a.user_id IN (SELECT user_id
                       FROM watch_histories b
                       JOIN videos c ON c.video_id = b.video_id
                      WHERE c.category = 'IT/테크'
                    )

-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를 
-- 기록한 비디오의 제목을 조회하세요.
SELECT 
       channel_name
     , (SELECT title
          FROM videos a
         WHERE a.creator_id = b.creator_id
         GROUP BY a.creator_id
         ORDER BY a.view_count DESC
         LIMIT 1
        ) vc
  FROM creators b;
-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후, 
-- 이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.
WITH trend AS (
     SELECT b.channel_name
       FROM videos a
       JOIN creators b ON a.creator_id = b.creator_id
      WHERE view_count > 1000000
)
SELECT
       DISTINCT channel_name``
  FROM trend
 

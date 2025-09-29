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
 WHERE b.channel_name = '맛있는 요리';

-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여, 
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)
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
-- 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.
SELECT 
	   c.title
	 , c.category
	 , a.watch_datetime 
  FROM watch_histories a
  JOIN users b ON a.user_id = b.user_id
  JOIN videos c ON a.video_id = c.video_id
 WHERE b.username = '기술전문가'
 ORDER BY a.watch_datetime DESC;

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.
SELECT
	   c.title
	 , d.channel_name
  FROM subscriptions a
  JOIN users b ON a.user_id = b.user_id
  JOIN videos c ON a.creator_id= c.creator_id
  JOIN creators d ON a.creator_id = d.creator_id
 WHERE b.username = '겜프로';
  

-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.
SELECT
	   a.username
  FROM users a
  LEFT JOIN video_likes b ON a.user_id = b.user_id
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
  LEFT JOIN watch_histories b ON a.video_id = b.video_id
  JOIN users c ON b.user_id = c.user_id
 WHERE a.title LIKE '%레시피%';


-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. 
-- '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT
	   a.title
	 , c.username
  FROM videos a
  LEFT JOIN video_likes b ON a.video_id = b.video_id 
  JOIN users c ON b.user_id = c.user_id;


-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.
SELECT
	   a.title 
	 , a.category 
  FROM videos a
  LEFT JOIN video_likes b ON a.video_id = b.video_id 
 WHERE a.category IN ('IT/테크', '교육')
   AND b.like_id IS NULL;


-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 
-- 결과를 채널명 가나다순으로 정렬하세요.
-- users, video_likes, videos, creators
SELECT
	   c.title
	 , d.channel_name
  FROM users a
  JOIN video_likes b ON a.user_id = b.user_id
  JOIN videos c ON b.video_id = c.video_id
  JOIN creators d ON c.creator_id = d.creator_id
 WHERE a.country = '대한민국'
 ORDER BY d.channel_name;


-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.
SELECT
	   category
	 , COUNT(*)
  FROM videos
 GROUP BY category;


-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN
-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 
-- 결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT 
	   a.channel_name 
	 , SUM(b.view_count )
	 , AVG(b.view_count )
  FROM creators a
  JOIN videos b ON a.creator_id = b.creator_id
 GROUP BY a.channel_name
 ORDER BY SUM(b.view_count) DESC;


-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING
-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만,
-- 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.
SELECT 
	   a.creator_id 
	 , COUNT(a.video_id)
  FROM videos a
 GROUP BY creator_id
HAVING COUNT(a.video_id) >= 3;
 

-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING
-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 
-- 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.
SELECT 
	   a.channel_name 
	 , AVG(b.view_count)
  FROM creators a
  JOIN videos b ON a.creator_id = b.creator_id
  JOIN users c ON a.user_id = c.user_id
 WHERE c.country = '대한민국'
 GROUP BY a.channel_name
HAVING AVG(b.view_count) >= 500000;


-- 문제40 : 다른 쿼리의 결과를 조건으로 사용하기
-- 주제: 서브쿼리 ( WHERE 절 내부)
-- 문제: 평균 조회수보다 더 많은 조회수를 기록한 비디오의 제목과 조회수를 조회하세요.
SELECT
	   a.title
	 , a.view_count 
  FROM videos a
 WHERE a.view_count > (SELECT AVG(b.view_count)
 					     FROM videos b
 					  );
 

-- 문제 41: 목록(List)을 반환하는 서브쿼리 사용하기
-- 주제: 서브쿼리 with IN
-- 문제: '코딩 아카데미' 채널이 올린 비디오에 '좋아요'를 누른 모든 사용자의 username을 조회하세요. 
-- (JOIN을 사용하지 않고 서브쿼리로만 풀어보기!)
SELECT 
	   a.username
  FROM users a
 WHERE a.user_id IN (SELECT b.user_id
 					   FROM video_likes b
 					  WHERE video_id = (SELECT c.video_id 
 					  				      FROM videos c
 					  				     WHERE b.video_id = c.video_id
 					  				       AND c.creator_id = (SELECT d.creator_id
 					  				       					     FROM creators d
 					  				       					    WHERE d.channel_name = '코딩 아카데미'
 					  				       					  )
 					  				   )
 					);


-- 문제 42: 두 개의 결과 합치기 (중복 제거)
-- 주제: 집합 연산자 UNION
-- 문제: 'IT/테크' 카테고리에 속한 비디오의 제목과, 
-- '코딩 아카데미' 채널이 올린 비디오의 제목을 하나의 목록으로 합쳐서 보여주세요. 
-- 중복된 제목이 있다면 한 번만 표시합니다.
SELECT
	   a.title 
  FROM videos a
 WHERE a.category = 'IT/테크'
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
-- 문제: users 테이블에서 국적이 '대한민국'인 사용자의 username과, 
-- 	    creators 테이블에 있는 모든 크리에이터의 channel_name을 하나의 목록으로 합쳐서 보여주세요.
--      이 경우, 이름이 같더라도 중복을 제거하지 말고 모두 표시합니다.
SELECT 
	   username
  FROM users
 WHERE country = '대한민국'
UNION ALL
SELECT channel_name
  FROM creators;


-- 문제 44: FROM 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (인라인 뷰 Inline View)
-- 문제: 각 크리에이터별 평균 비디오 조회수를 먼저 구하고, 
--      그 중에서 평균 조회수가 1,000,000 (백만)을 초과하는 크리에이터의 creator_id와 계산된 평균 조회수를 조회하세요.
-- 크리에이터별 평균 조회수 테이블 -> creator_id, AVG(조회수)
-- 요 테이블에서 > 10000000의 조건 맞는 creator_id와 평균 조회수 출력 
SELECT
	   v.creator_id
	 , v.v_count
  FROM (SELECT creator_id
   		     , AVG(view_count) v_count
  		  FROM videos
  		 GROUP BY creator_id
  	   ) v -- 이건 creator_id와 AVG를 칼럼으로 갖는 뷰 
HAVING v_count > 1000000;


-- 문제 45: SELECT 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (스칼라 서브쿼리)
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 해당 채널이 올린 비디오의 총 개수를 함께 조회하세요. 
-- (JOIN을 사용하지 마세요.)
-- creators, videos
SELECT
	   a.channel_name
	 , (SELECT
	 		   COUNT(b.creator_id)
	      FROM videos b
	     WHERE a.creator_id = b.creator_id 
	   ) video_num
  FROM creators a;


-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이 한 번이라도 있는 사용자의 username을 모두 조회하세요.
-- 여행 카테고리 videos에서 video_id 뽑기. video_likes에 video_id
SELECT
	   DISTINCT a.username
  FROM users a
 WHERE EXISTS (SELECT
 					  user_id
 				 FROM video_likes b
 				 JOIN videos c ON b.video_id = c.video_id 
 				WHERE c.category = '여행'
 				  AND a.user_id = b.user_id 
			  );


-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해, 
-- '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.
SELECT
	   a.title
  FROM videos a
 WHERE a.creator_id IN (SELECT 
 					 	  FROM 
 					   )

-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 제목, 카테고리, 재생 시간을 조회하세요.
SELECT 
	   a.title 
	 , a.category 
	 , a.duration_seconds
  FROM videos a
 WHERE a.duration_seconds > (SELECT AVG(b.duration_seconds)
 							   FROM videos b
 							  GROUP BY b.category 
 							 HAVING b.category = 'IT/테크'
 							);


-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.
SELECT
	   MAX(v.avg_view_count) max_view_count
	 , v.max_category 
  FROM (SELECT AVG(a.view_count) avg_view_count
  			 , a.category max_category
  		  FROM videos a
  		 GROUP BY a.category
       ) v;


-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는 모든 사용자의 username을 조회하세요.
SELECT
	   a.username
  FROM users a
  JOIN watch_histories b ON a.user_id = b.user_id
 WHERE b.video_id IN (SELECT
 						     c.video_id
 						FROM videos c
 					   WHERE c.category = 'IT/테크'
 					 );


-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를 기록한 비디오의 제목을 조회하세요.
SELECT
	   a.channel_name
	 , (SELECT 
	 		   MAX(b.view_count)
	 	  FROM videos b
	 	 GROUP BY b.creator_id
	 	HAVING a.creator_id = b.creator_id
	   ) max_view
  FROM creators a;


-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후,
--      이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.
WITH over_1m AS (SELECT video_id
					  , creator_id
				   FROM videos
				  WHERE view_count > 1000000
 				)
SELECT 
	   DISTINCT a.channel_name 
  FROM creators a
  JOIN over_1m b ON a.creator_id = b.creator_id;



























-- 문제 1: 모든 데이터 조회하기
-- 주제: SELECT, FROM

-- 문제: users 테이블에 있는 모든 사용자의 모든 정보를 조회하세요.
SELECT * FROM users;

-- 문제 2: 특정 조건의 데이터 선택하기
-- 주제: SELECT (특정 컬럼), WHERE

-- 문제: '게임' 카테고리에 해당하는 모든 비디오의 제목과 조회수를 조회하세요.

SELECT title,view_count    
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
	ORDER BY registration_date DESC;


-- 문제 5: 여러 조건 동시에 만족시키기
-- 주제: WHERE (복수 조건 AND)

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.

SELECT title, category, view_count   
	FROM videos
WHERE category = 'IT/테크'
AND view_count >= 500000;


-- 문제 6: 상위 N개 결과만 보기
-- 주제: ORDER BY, LIMIT

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요. 

-- SELECT title, view_count   
-- 	FROM videos
-- ORDER BY view_count DESC
-- LIMIT 5;


-- 문제 7: 중복 없이 결과 보기
-- 주제: DISTINCT

-- 문제: videos 테이블에 존재하는 모든 비디오 카테고리의 종류를 중복 없이 조회하세요.

-- SELECT 
-- 	DISTINCT category  
-- 	FROM videos;

-- 문제 8: 특정 패턴의 문자열 검색하기
-- 주제: WHERE (패턴 검색 LIKE)

-- 문제: 비디오 제목에 '리뷰'라는 단어가 포함된 모든 비디오의 제목을 조회하세요.

SELECT title   
	FROM videos
WHERE title LIKE "%리뷰%";


-- 문제 9: 여러 값 중 하나와 일치하는 데이터 검색
-- 주제: WHERE (리스트 검색 IN)

-- 문제: creators 테이블에서 creator_id가 1, 3, 5, 7인 크리에이터의 채널명과 creator_id를 조회하세요.

SELECT channel_name, creator_id   
	FROM creators
	WHERE creator_id IN (1,3,5,7)

-- 문제 10: 특정 범위의 데이터 검색하기
-- 주제: WHERE (범위 검색 BETWEEN)

-- 문제: 조회수가 500,000 이상 1,000,000 이하인 비디오의 제목과 조회수를 조회하세요.
	
SELECT title, view_count   
	FROM videos
	WHERE view_count BETWEEN  500000 AND 1000000;

-- 문제 11: NULL이 아닌 데이터만 확인하기
-- 주제: WHERE (NULL 값 확인)

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.

SELECT channel_name 
	FROM creators
	WHERE channel_description IS NOT NULL;
	
-- 문제 12: 복잡한 논리 조건 조합하기
-- 주제: WHERE (논리 연산자 AND, OR 조합)

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.

-- SELECT title, category, duration_seconds   
-- 	FROM videos
-- 	WHERE (category = 'IT/테크'
-- 	OR category = '교육')
-- 	AND duration_seconds >= 3600;
 	
-- 문제 13: 여러 기준으로 정렬하기
-- 주제: ORDER BY (다중 컬럼 정렬)

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.

SELECT category, title, view_count    
	FROM videos
	ORDER BY category ASC, view_count DESC;   
	
-- 문제 17: 결과 구간 선택하기 (페이지네이션)
-- 주제: LIMIT with OFFSET

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요.

-- SELECT username, email    
-- 	FROM users
-- 	ORDER BY user_id
-- 	LIMIT 10, 10 

-- 문제 18: 특정 목록을 제외한 데이터 검색
-- 주제: WHERE (부정 리스트 검색 NOT IN)

-- 문제: 'IT/테크', '게임', '교육' 카테고리를 제외한 나머지 카테고리의 비디오 제목과 카테고리를 조회하세요.
	
-- SELECT title, category   
-- 	FROM videos
-- 	WHERE category NOT IN ('IT/테크', '게임','교육');  

-- 문제 19: 특정 위치의 글자 수로 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '겜'으로 시작하고 총 세 글자인 사용자를 조회하세요.
	
-- SELECT username
-- 	 FROM users
-- 	WHERE username LIKE "겜__%";

-- 문제 20: 기본기 종합 복습
-- 주제: WHERE, ORDER BY, LIMIT 종합

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.
-- SELECT user_id, username, country
-- 	FROM users
-- 	WHERE country IN('대한민국','미국')
-- 	ORDER BY username 
-- 	LIMIT 5;
	
-- 문제 14: 특정 패턴을 제외한 데이터 검색
-- 주제: WHERE (NOT LIKE)

-- 문제: 크리에이터의 채널 설명(channel_description)에 '튜토리얼'이라는 단어가 포함되지 않은 채널의 이름을 조회하세요.
	
SELECT channel_name
	FROM creators
	WHERE channel_description NOT LIKE '%튜토리얼%'
	
-- 문제 15: 특정 범위를 벗어나는 데이터 검색
-- 주제: WHERE (NOT BETWEEN)

-- 문제: 재생 시간(duration_seconds)이 10분(600초)에서 30분(1800초) 사이가 아닌 비디오의 제목과 재생 시간을 조회하세요.

	SELECT title, duration_seconds   
	FROM videos
	WHERE duration_seconds NOT BETWEEN 600 AND 1800

	

-- 문제 16: 더 복잡한 논리 조건 조합하기
-- 주제: WHERE (복합 논리 조건 (), AND, OR)
	
-- 문제: '여행' 카테고리 비디오 중 조회수가 500,000 이상인 경우 또는 '음악' 카테고리 비디오 중 재생 시간이 5분(300초) 이하인 경우를 모두 조회하세요. (결과에는 제목, 카테고리, 조회수, 재생 시간을 포함하세요.)

SELECT title, category, view_count, duration_seconds  
	FROM videos
	WHERE (category = '여행'
	AND view_count >= 500000)
	OR (category = '음악'
	AND duration_seconds <= 300) 
	
	-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT
	   a.title 비디오제목
     , b.channel_name 채널명	
  FROM videos a
  JOIN creators b ON a.creator_id  = b.creator_id; 

-- 문제26: JOIN 결과에 조건 추가하기
-- 주제: INNER JOIN + WHERE

-- 문제: JOIN을 사용하여 '맛있는 요리' 채널이 올린 모든 비디오의 제목과 조회수를 조회하세요.
SELECT
	   a.title 비디오제목
     , a.view_count 조회수	
  FROM videos a
  JOIN creators b ON a.creator_id  = b.creator_id
 WHERE b.channel_name = '맛있는 요리';


-- 문제 27: 3개 테이블 연결하기
-- 주제: 3개 테이블 INNER JOIN

-- 문제: watch_histories 테이블을 중심으로, users 테이블과 videos 테이블을 JOIN하여, 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. (결과가 많을 수 있으니 상위 10개만 조회)
SELECT 
	   b.username 사용자이름
	 , c.title 비디오이름
  FROM watch_histories a
  JOIN users b ON a.user_id = b.user_id
  JOIN videos c ON a.video_id  = c.video_id 
 LIMIT 10;

-- 문제 28: 3개 테이블 JOIN 결과에 조건과 정렬 추가하기
-- 주제: 3개 테이블 INNER JOIN + WHERE + ORDER BY

-- 문제: '기술전문가'라는 username을 가진 사용자가 시청한 모든 비디오의 제목과 카테고리, 그리고 **언제 시청했는지(watch_datetime)**를 조회하세요. 결과는 시청한 시간이 최신인 순서로 정렬하세요.
-- users, watch_histories, videos
SELECT 
	   c.title 사용자이름
	 , c.category 카테고리
	 , b.watch_datetime 시간
  FROM users a
  JOIN watch_histories b ON a.user_id = b.user_id
  JOIN videos c ON b.video_id  = c.video_id 
 WHERE a.username = '기술전문가'
 ORDER BY b.watch_datetime DESC; 

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.

SELECT 
	   d.title 비디오제목
	 , c.channel_name 채널명
  FROM users a
  JOIN subscriptions b ON a.user_id = b.user_id 
  JOIN creators c ON b.creator_id = c.creator_id
  JOIN videos d ON c.creator_id  = d.creator_id 
 WHERE a.username = '겜프로';
 
-- 문제 30: 한 번도 특정 행동을 하지 않은 데이터 찾기
-- 주제: LEFT JOIN (외부 조인)

-- 문제: 아직 '좋아요'를 한 번도 누르지 않은 사용자의 username을 모두 조회하세요.

SELECT 
	   a.username 사용자
	 , b.like_id  
  FROM users a
  LEFT JOIN video_likes b ON a.user_id = b.user_id 
  WHERE like_id IS NULL; 

-- 문제 31: 특정 데이터가 없는 항목 찾기
-- 주제: LEFT JOIN

-- 문제: 아직 비디오를 하나도 올리지 않은 크리에이터의 채널명을 조회하세요.

SELECT 
	   a.channel_name
	 , 
  FROM creators a
  LEFT JOIN videos b ON a.creator_id = b.creator_id 
 WHERE video_id IS NULL; 

-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 모든 사용자의 username을 중복 없이 조회하세요.

  SELECT 
	   DISTINCT c.username 이름
  FROM videos a
  JOIN watch_histories b ON a.video_id = b.video_id
  JOIN users c ON b.user_id  = c.user_id 
 WHERE a.title LIKE '%레시피%';
	
	-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.

SELECT
	   b.title 비디오제목
	 , c.username 
  FROM video_likes a
 RIGHT JOIN videos b ON a.video_id = b.video_id
  LEFT JOIN users c ON a.user_id = c.user_id; 

-- 문제 34: 특정 카테고리 중 활동이 없는 데이터 찾기
-- 주제: LEFT JOIN + WHERE IN
-- 문제: 'IT/테크' 또는 '교육' 카테고리 비디오 중에서, '좋아요'를 받지 못한 비디오의 제목과 카테고리를 조회하세요.

SELECT
       a.title
     , a.category      
  FROM videos a
  LEFT JOIN video_likes b ON a.video_id = b.video_id
 WHERE a.category IN('IT/테크', '교육')
   AND b.like_id IS NULL;

-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 결과를 채널명 가나다순으로 정렬하세요.
SELECT
       c.title
     , d.channel_name      
  FROM users a
  JOIN video_likes b ON a.user_id = b.user_id r_id
  JOIN a.videos c ON b.b.video_id = c.video_id;
  JOIN creators d ON d.creator_id = c.creator_od  b.like_id IS NULL;
 WHERE 
 ORDER BY d.channel_name ASC;	 	
-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.

SELECT 
	   category
	 , count(*) video_count
  FROM videos
 GROUP BY category; 

-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN

-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 결과를 총 조회수 합계가 높은 순으로 정렬하세요.

SELECT 
       a.channel_name 
     , sum(b.view_count) total_views
     , avg(b.view_count) avg_views
  FROM creators a
  JOIN videos b ON a.creator_id  = b.creator_id
 GROUP BY a.channel_name
 ORDER BY sum(b.view_count); -- total_views

-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING

-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.
SELECT 
       create_id
     , count(*) video_count
  FROM video
 GROUP BY create_id
HAVING video_count >= 3;

-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING

-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.
-- >> users, creators, videos
SELECT 
       b.channel_name 
     , AVG(c.view_count) avg_views
  FROM users a
  JOIN creators b ON a.user_id  = b.user_id
  JOIN videos c b.creator_id = c.creator_id
 WHERE a.country = '대한민국' 
 GROUP BY b.channel_name
HAVING avg_views >= 500000; -- AVG(view_count) >= 500000;

-- 2025_09_26

-- 문제40 : 다른 쿼리의 결과를 조건으로 사용하기
-- 주제: 서브쿼리 ( WHERE 절 내부)
-- 문제: 평균 조회수보다 더 많은 조회수를 기록한 비디오의 제목과 조회수를 조회하세요.
-- 평균 조회수를 찾기

SELECT
	   title
	 , view_count  
  FROM videos 
 WHERE view_count > (SELECT  
		  	  				 avg(view_count)
	     				FROM videos 
					 );

-- 문제 41: 목록(List)을 반환하는 서브쿼리 사용하기
-- 주제: 서브쿼리 with IN
-- 문제: '코딩 아카데미' 채널이 올린 비디오에 '좋아요'를 누른 모든 사용자의 username을 조회하세요. (JOIN을 사용하지 않고 서브쿼리로만 풀어보기!)
SELECT
	   username
  FROM users
 WHERE user_id IN (SELECT
					       user_id
					 FROM  video_likes
					WHERE  video_id IN(SELECT video_id
					        			 FROM videos 
					        			WHERE creator_id = (SELECT creator_id 
					        			 					  FROM creators
					        			 					 WHERE channel_name = '코딩 아카데미'
					        							   )	 
					                  ) 
				  );

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
 FROM  videos
WHERE  creator_id = (SELECT creator_id FROM creators WHERE channel_name ='코딩 아카데미');

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
  FROM creators;

-- 문제 44: FROM 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (인라인 뷰 Inline View)
-- 문제: 각 크리에이터별 평균 비디오 조회수를 먼저 구하고, 그 중에서 평균 조회수가 1,000,000 (백만)을 초과하는 크리에이터의 creator_id와 계산된 평균 조회수를 조회하세요.
SELECT
       v.creator_id 
	 , v.avg
  FROM (SELECT
  			   creator_id
  		     , avg(view_count) avg
  		  FROM videos
  		 GROUP BY creator_id    
		HAVING avg(view_count) > 1000000 ) v;

-- 문제 45: SELECT 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (스칼라 서브쿼리)
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 해당 채널이 올린 비디오의 총 개수를 함께 조회하세요. (JOIN을 사용하지 마세요.)
SELECT
	   a.channel_name
    ,  (SELECT count(*)
	      FROM videos b
	     WHERE a.creator_id = b.creator_id )
  FROM
       creators a; 

-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이 한 번이라도 있는 사용자의 username을 모두 조회하세요.
SELECT username 
FROM users a
WHERE EXISTS(SELECT 1 
			   FROM video_likes b 
			   JOIN videos c ON b.video_id = c.video_id 
			   WHERE b.user_id = a.user_id 
			     AND c.category = '여행');

-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해, '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.

SELECT
	   a.title
  FROM
	   videos a
WHERE
	   a.creator_id IN (SELECT creator_id
	                      FROM creators
						 WHERE channel_description LIKE '%리뷰%')AND NOT EXISTS (SELECT 1 FROM video_likes b WHERE b.video_id = a.video_id);

-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 제목, 카테고리, 재생 시간을 조회하세요.
SELECT 
	   title
     , category
	 , duration_seconds 
FROM videos 
WHERE duration_seconds > (SELECT avg(duration_seconds)
	   FROM videos
	   WHERE category = 'IT/테크'); 


-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.
	SELECT
	       a.category
	     , a.avg_views
	  FROM (SELECT category
		         , AVG(view_count) avg_views
		      FROM videos
		     GROUP BY category) a
	 ORDER BY avg_views DESC;

-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는 모든 사용자의 username을 조회하세요.
-- username 
SELECT username 
  FROM users
 WHERE user_id IN (SELECT DISTINCT b.user_id FROM watch_histories b JOIN videos a ON b.video_id  = a.video_id  WHERE a.category = 'IT/테크');


-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를 기록한 비디오의 제목을 조회하세요.
channel_name, title

SELECT c.channel_name
     , (SELECT a.title
	      FROM videos a
	     WHERE a.creator_id = c.creator_id
	     ORDER BY a.view_count DESC
	     LIMIT 1) max_title
  FROM creators c;
-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후, 이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.
WITH popular_video AS (
	SELECT a.title
		,  a.creator_id
		,  b.channel_name
		FROM videos a
		JOIN creators b ON a.creator_id = b.creator_id  
		WHERE a.view_count > 1000000)

SELECT
       DISTINCT popular_video.channel_name
FROM popular_video;


-- 문제 1: 모든 데이터 조회하기
-- 주제: SELECT, FROM

-- 문제: users 테이블에 있는 모든 사용자의 모든 정보를 조회하세요.

	SELECT 
	       *
	    FROM users;


-- 문제 2: 특정 조건의 데이터 선택하기
-- 주제: SELECT (특정 컬럼), WHERE

-- 문제: '게임' 카테고리에 해당하는 모든 비디오의 제목과 조회수를 조회하세요.

	SELECT 
		   title
		 , view_count
	  FROM videos
	 WHERE category = '게임'


-- 문제 3: 숫자 비교 조건 사용하기
-- 주제: WHERE (숫자 비교)

-- 문제: 조회수(view_count)가 1,000,000 (백만) 회를 초과하는 모든 비디오의 creator_id, title, view_count를 조회하세요.
   
	SELECT 
		   creator_id 
		 , title 
		 , view_count  
	  FROM videos
	 WHERE view_count > 1000000;


-- 문제 4: 결과 정렬하기
-- 주제: ORDER BY

-- 문제: users 테이블의 모든 사용자를 가입일(registration_date)이 최신인 순서대로 정렬하여 모든 정보를 조회하세요.

	SELECT 
		   *
	  FROM users
	 ORDER BY registration_date DESC;


-- 문제 5: 여러 조건 동시에 만족시키기
-- 주제: WHERE (복수 조건 AND)

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.

	SELECT 
		   title 
		 , category
		 , view_count 
	  FROM videos
	 WHERE category = 'IT/테크' 
	   AND view_count >= 500000;


-- 문제 6: 상위 N개 결과만 보기
-- 주제: ORDER BY, LIMIT

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요.
   
	SELECT 
	       title
	     , view_count 
	  FROM videos
	 ORDER BY view_count DESC
	 LIMIT 5;


-- 문제 7: 중복 없이 결과 보기
-- 주제: DISTINCT

-- 문제: videos 테이블에 존재하는 모든 비디오 카테고리의 종류를 중복 없이 조회하세요.

	SELECT 
		   DISTINCT category
	  FROM videos;


-- 문제 8: 특정 패턴의 문자열 검색하기
-- 주제: WHERE (패턴 검색 LIKE)

-- 문제: 비디오 제목에 '리뷰'라는 단어가 포함된 모든 비디오의 제목을 조회하세요.
	
	SELECT 
		   title
	  FROM videos
	 WHERE title LIKE '%리뷰%';


-- 문제 9: 여러 값 중 하나와 일치하는 데이터 검색
-- 주제: WHERE (리스트 검색 IN)

-- 문제: creators 테이블에서 creator_id가 1, 3, 5, 7인 크리에이터의 채널명과 creator_id를 조회하세요.

	SELECT
	       channel_name 
	     , creator_id 
	  FROM creators
	 WHERE creator_id IN (1, 3, 5, 7);

-- 문제 10: 특정 범위의 데이터 검색하기
-- 주제: WHERE (범위 검색 BETWEEN)

-- 문제: 조회수가 500,000 이상 1,000,000 이하인 비디오의 제목과 조회수를 조회하세요.

	SELECT
	       title
	     , view_count
	  FROM videos
	 WHERE view_count BETWEEN 500000 AND 1000000;
   
   
-- 문제 11: NULL이 아닌 데이터만 확인하기
-- 주제: WHERE (NULL 값 확인)

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.
	SELECT
		   channel_name 
	  FROM creators
	 WHERE channel_description IS NOT NULL;


-- 문제 12: 복잡한 논리 조건 조합하기
-- 주제: WHERE (논리 연산자 AND, OR 조합)

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.
   
   SELECT
	   	  title
		, category
	 	, duration_seconds
	 FROM videos
    WHERE (category = 'IT/테크' OR category = '교육') 
      AND duration_seconds >= 3600;
   
   
-- 문제 13: 여러 기준으로 정렬하기
-- 주제: ORDER BY (다중 컬럼 정렬)

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.

   SELECT 
   	      category
   	    , title
   	    , view_count
   	 FROM videos
   	ORDER BY category, view_count DESC;
   
   	
-- 문제 14: 특정 패턴을 제외한 데이터 검색
-- 주제: WHERE (NOT LIKE)

-- 문제: 크리에이터의 채널 설명(channel_description)에 '튜토리얼'이라는 단어가 포함되지 않은 채널의 이름을 조회하세요.

   	SELECT 
   	        channel_name 
   	   FROM creators
   	  WHERE channel_description NOT LIKE ('%튜토리얼%');
   	
   	
-- 문제 15: 특정 범위를 벗어나는 데이터 검색
-- 주제: WHERE (NOT BETWEEN)

-- 문제: 재생 시간(duration_seconds)이 10분(600초)에서 30분(1800초) 사이가 아닌 비디오의 제목과 재생 시간을 조회하세요.

   	SELECT
   		   title
   		 , duration_seconds 
   	  FROM videos
   	 WHERE duration_seconds NOT BETWEEN 600 AND 1800;
   		
   	
-- 문제 16: 더 복잡한 논리 조건 조합하기
-- 주제: WHERE (복합 논리 조건 (), AND, OR)

-- 문제: '여행' 카테고리 비디오 중 조회수가 500,000 이상인 경우 또는 '음악' 카테고리 비디오 중 재생 시간이 5분(300초) 이하인 경우를 모두 조회하세요. (결과에는 제목, 카테고리, 조회수, 재생 시간을 포함하세요.)
   	
   	
   	SELECT
   	       title
   	     , category
   	     , view_count
   	     , duration_seconds 
   	  FROM videos
   	 WHERE category = '여행' AND view_count >= 500000
   	    OR category = '음악' AND duration_seconds <= 300;
   	
   	
-- 문제 17: 결과 구간 선택하기 (페이지네이션)
-- 주제: LIMIT with OFFSET

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요.

   	SELECT
   		   username
   		 , email 
   	  FROM users
   	 ORDER BY user_id 
   	 LIMIT 10, 10;
   	
   	 
-- 문제 18: 특정 목록을 제외한 데이터 검색
-- 주제: WHERE (부정 리스트 검색 NOT IN)

-- 문제: 'IT/테크', '게임', '교육' 카테고리를 제외한 나머지 카테고리의 비디오 제목과 카테고리를 조회하세요.

   	 SELECT
   	        title
   	      , category
   	   FROM videos
   	  WHERE category NOT IN ('IT/테크', '게임', '교육');
   	 
   	 
-- 문제 19: 특정 위치의 글자 수로 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '겜'으로 시작하고 총 세 글자인 사용자를 조회하세요.

   	 SELECT 
   	 		username 
   	   FROM users
   	  WHERE username LIKE ('겜__');
   	 
   	 
-- 문제 20: 기본기 종합 복습
-- 주제: WHERE, ORDER BY, LIMIT 종합

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.
   	 
   	 SELECT
   	 	    user_id
   	 	  , username
   	 	  , country
   	   FROM users
   	   WHERE country = '대한민국' OR country = '미국' 
   	   ORDER BY username 
   	   LIMIT 5;
   	 
 -- 문제 21: 정확한 글자 수로 패턴 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '테스트사용자' 
-- 다음에 정확히 한 글자가 더 붙는 사용자(예: 테스트사용자1, 테스트사용자2)를 모두 조회하세요.
SELECT username
FROM users
WHERE username LIKE '테스트사용자_';

-- 문제 22: 여러 값을 동시에 제외하기
-- 주제: WHERE (부정 리스트 검색 NOT IN)
-- 
-- 문제: 국적이 '대한민국', '미국', '일본'이 아닌 사용자의 사용자명과 국적을 조회하세요.

SELECT username, country
FROM users
WHERE country NOT IN ('대한민국', '미국', '일본');

-- 문제 23: 값이 없는(NULL) 데이터 검색하기
-- 주제: WHERE (NULL 값 검색 IS NULL)
-- 
-- 문제: creators 테이블에서 채널 설명(channel_description)이 등록되지 않은 (값이 NULL인) 크리에이터가 있는지 찾아보세요.
SELECT channel_name, channel_description
FROM creators
WHERE channel_description IS NULL;

-- 문제24: 여러 종류의 조건문 종합하기
-- 주제: WHERE (종합 논리 조건)
-- 
-- 문제: users 테이블에서, 국적이 '영국'이거나 '프랑스'이면서, 동시에 사용자 이름에 '사용자'라는 단어가 포함되지 않는 사용자를 조회하세요.
SELECT username, country
FROM users
WHERE
    country IN ('영국', '프랑스')
    AND username NOT LIKE '%사용자%';

-- 문제25: 두 테이블의 정보 합치기 (기초)
-- 주제: INNER JOIN

-- 문제: videos 테이블과 creators 테이블을 JOIN하여, 모든 비디오의 제목과 해당 비디오를 올린 크리에이터의 채널명을 함께 조회하세요.
SELECT
       a.title
     , b.channel_name 
  FROM videos a
  JOIN creators b ON a.creator_id = b.creator_id
-- 참조관계 확인 했을 때, video_id가 pk이고 crator_id가 fk임


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

-- 문제: watch_histories 테이블을 중심(베이스테이블)으로, 
-- users 테이블과 videos 테이블을 JOIN하여, 
-- 어떤 사용자(username)가 어떤 비디오(title)를 시청했는지 조회하세요. 
-- (결과가 많을 수 있으니 상위 10개만 조회)
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
--	     그리고 **언제 시청했는지(watch_datetime)**를 조회하세요.
--       결과는 시청한 시간이 최신인 순서로 정렬하세요.
SELECT 
	   c.title
	 , c.category
	 , a.watch_datetime 
  FROM watch_histories a
  JOIN users b ON a.user_id = b.user_id 
  JOIN videos c ON a.video_id = c.video_id
 WHERE b.username = '기술전문가'
 ORDER BY a.watch_datetime DESC;

SELECT 
       a.title
     , a.category
     , b.watch_datetime 
  FROM videos a
  JOIN watch_histories b ON a.video_id = b.video_id
  JOIN users c ON b.user_id = c.user_id 
 WHERE c.username = '기술전문가'
 ORDER BY b.watch_datetime DESC;

-- 문제 29: 4개 테이블 연결하기
-- 주제: 4개 테이블 INNER JOIN

-- 문제: '겜프로'(username)라는 사용자가 구독한 채널들이 올린 모든 비디오의 제목과 그 채널명을 조회하세요.
SELECT
	   a.title
	 , b.channel_name 
  FROM videos a
  JOIN creators b ON a.creator_id = b.creator_id
  JOIN subscriptions c ON c.creator_id = b.creator_id
  JOIN users d ON d.user_id = c.user_id
  WHERE d.username = '겜프로';

-- 답안
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
  WHERE b.creator_id IS NULL;

-- 문제 32: 시청 기록을 통해 사용자 찾기
-- 주제: 3개 테이블 JOIN + WHERE LIKE

-- 문제: 비디오 제목에 '레시피'라는 단어가 포함된 비디오를 시청한 모든 사용자의 username을 중복 없이 조회하세요.
  SELECT 
         DISTINCT a.username 
       , c.title 
    FROM users a
    JOIN watch_histories b ON a.user_id = b.user_id
    JOIN videos c ON b.video_id = c.video_id
    WHERE c.title LIKE '%레시피%';

-- 문제 33: 한쪽 테이블의 모든 데이터 보여주기
-- 주제: RIGHT JOIN
-- 문제: 모든 비디오의 제목을 보여주고, 해당 비디오에 '좋아요'를 누른 사용자가 있다면 그 username도 함께 보여주세요. 
-- '좋아요'가 없는 비디오도 목록에 포함되어야 합니다.
SELECT 
	   c.title
	 , a.username 
  FROM users a
 RIGHT JOIN video_likes b ON a.user_id = b.user_id
 RIGHT JOIN videos c ON b.video_id = c.video_id
 
 -- 강사님 답안
 SELECT
 	    b.title
 	  , c.username 
   FROM video_likes a
  RIGHT JOIN videos b ON a.video_id = b.video_id
   LEFT JOIN users c ON a.user_id = c.user_id
  ORDER BY b.title;

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
    -- = WHERE (a.category = 'IT/테크' OR a.category = '교육')
   
-- 문제 35: JOIN 종합 문제
-- 주제: 4개 테이블 JOIN + WHERE + ORDER BY

-- 문제: '대한민국' 국적의 사용자가 '좋아요'를 누른 비디오의 제목과, 
-- 그 비디오를 만든 크리에이터의 채널명을 조회하세요. 결과를 채널명 가나다순으로 정렬하세요.
-- 베이스테이블을 정하는 데에는 문제를 보고 테이블을 보면 정하기 좋다.
   
SELECT
	   d.channel_name
	 , a.country 
  FROM users a
  JOIN video_likes b ON a.user_id = b.user_id
  JOIN videos c ON b.video_id = c.video_id
  JOIN creators d ON c.creator_id = d.creator_id
 WHERE a.country = '대한민국'
 ORDER BY d.channel_name
   

SELECT 
	   a.title 
	 , b.channel_name
	 , d.country 
  FROM videos a
  JOIN creators b ON b.creator_id = a.creator_id
  JOIN video_likes c ON c.video_id = a.video_id
  JOIN users d ON c.user_id = d.user_id 
 WHERE d.country = '대한민국'
 ORDER BY b.channel_name;



-- 문제 36: 데이터 그룹으로 묶고 개수 세기
-- 주제: GROUP BY, COUNT()
-- 문제: 각 비디오 카테고리별로 비디오가 총 몇 개씩 있는지 개수를 세어보세요.
 SELECT
        category  
 	 ,  count(*) video_count
   FROM videos
  GROUP BY category


-- 문제 37: 그룹별 합계와 평균 계산하기 (JOIN과 함께)
-- 주제: GROUP BY, SUM(), AVG() with JOIN

-- 문제: 각 크리에이터 채널별로, 올린 비디오의 총 조회수 합계와 평균 조회수를 계산하세요. 결과를 총 조회수 합계가 높은 순으로 정렬하세요.
SELECT
	   a.channel_name 
	 , sum(b.view_count) total_views
	 , avg(b.view_count) avg_views
  FROM creators a
  JOIN videos b ON a.creator_id = b.creator_id 
 GROUP BY a.channel_name 
 ORDER BY total_views DESC;
 
 
-- 문제 38: 그룹화된 결과에 조건 적용하기
-- 주제: GROUP BY, HAVING

-- 문제: 비디오를 3개 이상 올린 크리에이터에 대해서만, 각 크리에이터별 creator_id와 올린 비디오의 총 개수를 조회하세요.
SELECT 
	   creator_id
	 , count(*) 
  FROM videos
 GROUP BY creator_id
HAVING count(video_id) >= 3;

-- 문제 39: JOIN과 GROUP BY, HAVING 
-- 주제: JOIN, GROUP BY, HAVING

-- 문제: '대한민국' 국적을 가진 크리에이터 중에서, 
-- 올린 비디오의 평균 조회수가 500,000 이상인 크리에이터의 채널명과 평균 조회수를 조회하세요.
SELECT 
       a.channel_name
     , avg(c.view_count) -- floor(avg(c.view_count))면 소숫점 삭제
  FROM creators a
  JOIN users b ON a.user_id = b.user_id
  JOIN videos c ON a.creator_id = c.creator_id
 WHERE b.country = '대한민국'
 GROUP BY a.channel_name -- GROUP BY a.creator_id 가 아닌 이유는, SQL에서 select 절에 있는 집계함수로 묶이지 않은 컬럼은 group by 절에 명시해주어야 한다.
HAVING avg(c.view_count) >= 500000


-- 문제40 : 다른 쿼리의 결과를 조건으로 사용하기
-- 주제: 서브쿼리 (WHERE 절 내부)
-- 문제: 평균 조회수보다 더 많은 조회수를 기록한 비디오의 제목과 조회수를 조회하세요.
SELECT
	   title 
	 , view_count 
  FROM videos 
 WHERE view_count > (SELECT avg(view_count)
 	      	           FROM videos);


-- 문제 41: 목록(List)을 반환하는 서브쿼리 사용하기
-- 주제: 서브쿼리 with IN
-- 문제: '코딩 아카데미' 채널이 올린 비디오에 '좋아요'를 누른 모든 사용자의 username을 조회하세요. (JOIN을 사용하지 않고 서브쿼리로만 풀어보기!)
-- (videos, creators, users, video_likes)

SELECT 
	   a.username
  FROM users a
 WHERE a.user_id IN (SELECT b.user_id 
 	                   FROM video_likes b
 	                  WHERE b.video_id IN (SELECT c.video_id 
 	                 	                     FROM videos c
 	                 	                    WHERE c.creator_id IN (SELECT d.creator_id 
 	                 	                   							 FROM creators d
 	                 	                   						    WHERE d.channel_name = '코딩 아카데미')
										  )
				     );
  

-- 문제 42: 두 개의 결과 합치기 (중복 제거)
-- 주제: 집합 연산자 UNION
-- 문제: 'IT/테크' 카테고리에 속한 비디오의 제목과, '코딩 아카데미' 채널이 올린 비디오의 제목을 하나의 목록으로 합쳐서 보여주세요. 중복된 제목이 있다면 한 번만 표시합니다.
 SELECT
 		a.title 
   FROM videos a
  WHERE a.category = 'IT/테크'
  UNION
 SELECT 
  	    b.title 
   FROM videos b
  WHERE b.creator_id IN (SELECT c.creator_id 
   						   FROM creators c
   						  WHERE c.channel_name  = '코딩 아카데미');

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
-- 문제: 각 크리에이터별 평균 비디오 조회수를 먼저 구하고, 
-- 그 중에서 평균 조회수가 1,000,000을 초과하는 크리에이터의 creator_id와 계산된 평균 조회수를 조회하세요.
  SELECT
  	     *
    FROM (SELECT creator_id
    		   , round(avg(view_count)) avg_view_count
    		FROM videos
           GROUP BY creator_id) a
    WHERE a.avg_view_count > 1000000;
    

-- 문제 45: SELECT 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (스칼라 서브쿼리)
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 해당 채널이 올린 비디오의 총 개수를 함께 조회하세요. (JOIN을 사용하지 마세요.)

SELECT
	   a.channel_name
	 , (SELECT count(*) 
	 	  FROM videos b
	 	 WHERE a.creator_id = b.creator_id) count_video
	 	-- GROUP BY b.creator_id) count_video
  FROM creators a;

-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이 한 번이라도 있는 사용자의 username을 모두 조회하세요.
SELECT
	    a.username
   FROM users a
  WHERE EXISTS (SELECT 1
  	              FROM video_likes b
  	              JOIN videos c ON b.video_id = c.video_id 
  	             WHERE a.user_id = b.user_id AND c.category = '여행')

-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해, '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.
SELECT
	   a.title
  FROM videos a
 WHERE NOT EXISTS (SELECT 1
  	                 FROM video_likes b
  	                 JOIN creators c ON b.user_id = c.user_id
  	                WHERE a. AND a.description LIKE '%리뷰%');

SELECT
       v.title
  FROM videos v
  JOIN creators c ON v.creator_id = c.creator_id
 WHERE c.channel_description LIKE '%리뷰%'
   AND NOT EXISTS (SELECT 1
                     FROM video_likes vl
                    WHERE vl.video_id = v.video_id);

SELECT title FROM videos
  

-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 제목, 카테고리, 재생 시간을 조회하세요.

SELECT 
       a.title
     , a.category
     , a.duration_seconds
  FROM videos a
 WHERE a.duration_seconds > (SELECT avg(b.duration_seconds)
 							   FROM videos b
 							  WHERE b.category = 'IT/테크');
 	                           

-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.
SELECT *
  FROM (SELECT 
  	           a.category
  	         , round(avg(a.view_count)) avg_view
  	      FROM videos a
  	     GROUP BY a.category
  	     ORDER BY avg_view DESC
  	     LIMIT 1
  	    ) avg_table;
  	     

-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는 모든 사용자의 username을 조회하세요.

SELECT
	   c.username 
  FROM videos a
  JOIN watch_histories b ON a.video_id = b.video_id
  JOIN users c ON b.user_id = c.user_id
 WHERE c.user_id IN (SELECT b.user_id 
 	                   FROM watch_histories b
 	                  WHERE a.category = 'IT/테크');
  	  

-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를 기록한 비디오의 제목을 조회하세요.
SELECT 
	   a.channel_name
	 , (SELECT b.view_count 
	 	  FROM videos b
	 	 WHERE a.creator_id = b.creator_id 
	 	 ORDER BY b.view_count DESC
	 	 LIMIT 1) highst_view_count
  FROM creators a
 GROUP BY a.channel_name;



-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후, 이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.
WITH popular_video AS (
	 SELECT 
	 	    DISTINCT a.creator_id 
	 	  , a.view_count
	 	  , a.title 
	   FROM videos a
	  WHERE a.view_count > 1000000
	  ORDER BY a.creator_id
)
SELECT 
	   DISTINCT b.channel_name
	 , c.creator_id 
  FROM creators b
  JOIN popular_video c ON b.creator_id = c.creator_id
 
-- 문제 53: 문자열 합치고 일부만 잘라내기
-- 주제: 문자열 함수 (CONCAT, LEFT)
-- 문제: users 테이블에서 각 사용자의 username과 email을 조합하여, "사용자명 (이메일앞4글자...)" 와 같은 형태로 출력하세요.
  SELECT 
  	     concat(username, ' (', left(email, 4), '...)')
    FROM users;

-- 문제 54: 날짜/시간 데이터 형식 바꾸기
-- 주제: 날짜/시간 함수 (DATE_FORMAT)
-- 문제: videos 테이블의 upload_date를 'YYYY년 MM월 DD일' 형식(예: '2025년 09월 30일')으로 바꾸어, 비디오의 제목과 함께 조회하세요.
-- (참고 : https://mariadb.com/docs/server/reference/sql-functions/date-time-functions/date_format)
SELECT date_format(upload_date, '%Y년 %m %d')
  FROM videos

SELECT title
	 , DATE_FORMAT(upload_date, '%Y년 %m월 %d일') formatted_upload_file
  FROM videos;

-- 문제 55:  영문 대소문자 변환하기
-- 주제: UPPER(), LOWER()
-- 문제: users 테이블에서 email은 모두 대문자로, username은 모두 소문자로 변환하여 조회하세요.
  SELECT 
  	     UPPER(email)
  	   , lower(username)
    FROM users;

-- 문제 56: 문자열 길이 측정 및 일부 잘라내기
-- 주제: LENGTH(), SUBSTRING()
-- 문제: videos 테이블에서 비디오 제목(title)의 글자 수를 title_length로, 제목의 3번째 글자부터 5글자를 substring_title로 조회하세요.
SELECT 
	   title
	 , char_length(title) title_length
	 , substring(title, 3, 5) substring_title
  FROM videos;
-- char_length로 쓰기!!
    
    
-- 문제 57: 특정 문자열 찾아 바꾸기
-- 주제: REPLACE()
-- 문제: creators 테이블의 channel_description에서 '입니다'라는 단어를 '입니다!'로 모두 찾아 바꾸어 조회하세요.
SELECT 
	   channel_description 
	 , REPLACE(channel_description, '니다.', '니다!') modified_description
  FROM creators
  
  
-- 문제 58: 문자열 앞뒤 공백 제거하기
-- 주제: TRIM()
-- 문제: videos 테이블의 카테고리 중에 '  게임  ' 이나 '  IT/테크  ' 처럼 실수로 앞뒤에 공백이 들어간 데이터가 있다고 가정하고, 
-- TRIM() 함수를 사용하여 이 공백을 모두 제거한 후, 중복 없는 카테고리 목록을 조회하세요.
-- 공백이 포함된 가상 데이터를 만들기 위해 UNION ALL 사용
SELECT 
	   DISTINCT trim(a.category)
  FROM (SELECT 
	           category 
  	      FROM videos
 		 UNION ALL
		SELECT '  게임  '
	     UNION ALL
		SELECT '  IT/테크  '
	    ) a
  


-- 문제 59: 문자열을 특정 길이로 만들고 빈 곳 채우기
-- 주제: LPAD()
-- 문제: videos 테이블의 video_id를 항상 5자리로 표시하고 싶습니다. ID가 5자리 미만일 경우, 왼쪽에 '0'을 채워서 5자리 문자열로 만드세요. (예: 1 -> '00001', 12 -> '00012')
SELECT 
	   video_id
	 , LPAD(video_id, 5, '0')
  FROM videos;


-- 문제 60: 숫자 반올림 및 올림하기
-- 주제: ROUND(), CEIL()
-- 문제: videos 테이블에서 각 비디오의 재생 시간(duration_seconds)을 60으로 나누어 '분' 단위로 변환하되, 
-- 소수점 첫째 자리에서 반올림하여 정수로 표시하고, 소수점을 무조건 올림하여 정수로도 표시해보세요.
SELECT
	   title 
     , concat(round(duration_seconds / 60, 0), '분') rounded_minutes
     , concat(ceil(duration_seconds / 60), '분') ceiling_minutes
  FROM videos;

--  문제 61: 날짜 계산하기
-- 주제: NOW(), DATEDIFF()
-- 문제: videos 테이블의 각 비디오에 대해, 
-- 업로드된 날로부터 오늘까지 총 며칠이 지났는지 계산하여 비디오 제목과 함께 조회하세요.
SELECT 
	   title 
	 , upload_date
	 , datediff(now(), upload_date)
     , DAY(upload_date)
     , DAY(now())
FROM videos;

-- 문제 62: 특정 기간 후의 날짜 구하기
-- 주제: DATE_ADD()
-- 문제: users 테이블에서 각 사용자의 가입일로부터 정확히 100일 후는 며칠인지 '100일 기념일'이라는 이름으로 조회하세요.
SELECT
	   username
	 , registration_date 
	 , DATE_ADD(registration_date, INTERVAL 100 DAY) AS '100일 기념일'
  FROM users
  

-- 문제 63: NULL 값을 다른 값으로 대체하기
-- 주제: IFNULL(), COALESCE()
-- 문제: creators 테이블의 채널 설명(channel_description)이 만약 NULL이라면, '설명이 없습니다.' 라는 문구로 대체하여 조회하세요.
-- (https://mariadb.com/docs/server/reference/sql-functions/control-flow-functions/ifnull)
-- (https://mariadb.com/docs/server/reference/sql-structure/operators/comparison-operators/coalesce)
SELECT 
	   channel_name
	 , IFNULL(channel_description, '설명이 없습니다') description_check
  FROM creators;


-- 문제 64: 조건에 따라 다른 값 표시하기
-- 주제: IF()
-- 문제: videos 테이블에서 조회수가 1,000,000(백만) 이상이면 '인기 영상', 그렇지 않으면 '일반 영상'이라고 표시하는 '영상 등급' 컬럼을 추가하여, 비디오 제목과 조회수, 등급을 함께 조회하세요.
-- (https://mariadb.com/docs/server/reference/sql-functions/control-flow-functions/if-function)
SELECT 
       title
     , view_count
     , IF (view_count >= 1000000, '인기 영상', '일반 영상') '영상 등급'
  FROM videos;

SELECT 
       title
     , view_count
     , CASE 
	     WHEN view_count >= 1000000  THEN '인기 영상'
         ELSE '일반영상'
       END
     	   AS '영상 등급'
  FROM videos;
-- IF와 CASE 둘다 기능상 동일. 
-- 조건이 단순하면 IF가 더 편하고, 조건이 복잡하거나 여러개면 WHEN THEN이 더 유리


-- 문제 65: 데이터 타입 변환하기
-- 주제: CAST(), CONVERT()
-- 문제: videos 테이블의 video_id(숫자 타입)와 title(문자열 타입)을 CONCAT() 함수로 합쳐 
-- '[1] 2025년 최신 스마트폰 리뷰' 와 같은 형태로 출력하세요. 
-- 이 과정에서 숫자 video_id를 문자열로 명시적으로 변환해야 합니다.

SELECT 
	   CONCAT('[', CAST(video_id AS CHAR), '] ', title)
  FROM videos;
  
  
-- 문제 66: 함수를 이용한 데이터 분석
-- 주제: SUBSTRING_INDEX()와 GROUP BY 응용
-- 문제: users 테이블에서 사용자의 email 주소의 도메인(예: 'example.com')만 추출하고,
--  이 도메인별로 사용자가 총 몇 명인지 GROUP BY를 사용하여 계산하세요.
  
SELECT
	   SUBSTRING_INDEX(email, '@', -1) '도메인'
     , count(SUBSTRING_INDEX(email, '@', -1)) '사용자 수'
  FROM users
 GROUP BY 도메인
 ORDER BY '사용자 수' DESC;

-- 문제 67: 복잡한 쿼리를 뷰(View)로 저장하기
-- 주제: CREATE VIEW
-- 문제: 사용자가 어떤 비디오에 '좋아요'를 눌렀는지 쉽게 조회할 수 있도록, 
--  users의 username, videos의 title, video_likes의 like_datetime을
--  JOIN하여 보여주는 v_user_likes 라는 이름의 뷰를 만드세요.

CREATE VIEW v_user_likes AS
SELECT
	   a.username
	 , c.title 
	 , b.like_datetime
  FROM users a
  JOIN video_likes b ON a.user_id = b.user_id
  JOIN videos c ON b.video_id = c.video_id;

SELECT * FROM v_user_likes;
  
-- 문제 68: 생성된 뷰(View) 활용하기
-- 주제: VIEW 활용
-- 문제: 위에서 생성한 v_user_likes 뷰를 사용하여, '겜프로'라는 사용자가 '좋아요'를 누른 비디오의 목록과
--  '좋아요'를 누른 시간을, 최신순으로 정렬하여 조회하세요.

SELECT 
	   username 
	 , title 
	 , like_datetime
  FROM v_user_likes 
--   JOIN users a ON v_user_likes.username = a.username
 WHERE v_user_likes.username = '겜프로'
 ORDER BY v_user_likes.like_datetime DESC;


/* 각각 두개씩 나옴
SELECT 
	   a.username 
	 , v_user_likes.title 
	 , b.like_datetime
  FROM v_user_likes 
  JOIN users a ON v_user_likes.username = a.username
  JOIN video_likes b ON b.user_id = a.user_id 
 WHERE v_user_likes.username = '겜프로'
 ORDER BY b.like_datetime DESC;
*/


-- 문제 69: 뷰(View)에 그룹 함수 포함하기
-- 주제: GROUP BY를 포함하는 뷰 생성
-- 문제: 각 채널별 총 비디오 개수, 총 조회수, 
-- 평균 조회수를 요약해서 보여주는 v_creator_stats 라는 이름의 뷰를 만드세요.
CREATE VIEW v_creator_stats AS
SELECT
	   b.channel_name 
	 , count(*) count_videos
	 , sum(a.view_count) sum_videos
	 , round(avg(a.view_count)) avg_videos -- 혹은 floor
  FROM videos a 
  LEFT JOIN creators b ON a.creator_id = b.creator_id 
 GROUP BY b.channel_name;

SELECT * FROM v_creator_stats;

-- 문제 70: 뷰(View)를 이용해 데이터 접근 제한하기 (보안)
-- 주제: 보안을 위한 뷰 활용
-- 상황: 인턴사원에게는 사용자의 개인정보(이메일, 가입일)를 제외한 
-- user_id, username, country 정보만 보여주고 싶습니다.
-- 문제: users 테이블에서 email과 registration_date 컬럼을 제외한 
-- v_public_users라는 이름의 뷰를 만드세요.
CREATE VIEW v_public_users AS
SELECT
	   user_id
	 , username
	 , country
  FROM users
  WITH CHECK OPTION;

SELECT * FROM v_public_users;

-- 문제 71: 기존 뷰(View) 수정하기
-- 주제: CREATE OR REPLACE VIEW

-- 문제: 이전에 만들었던 v_public_users 뷰에 
-- channel_name도 함께 보여줄 필요성이 생겼습니다. 
-- 크리에이터인 사용자의 경우 채널명도 함께 나올 수 있도록 
-- v_public_users 뷰의 내용을 수정하세요. 
-- (크리에이터가 아닌 경우 채널명은 NULL로 표시됩니다.)

CREATE OR REPLACE VIEW v_public_users AS
SELECT
	   a.user_id
	 , a.username
	 , a.country
	 , b.channel_name 
  FROM users a 
  LEFT JOIN creators b ON a.user_id = b.user_id;

SELECT * FROM v_public_users;
  

  
  
  
    

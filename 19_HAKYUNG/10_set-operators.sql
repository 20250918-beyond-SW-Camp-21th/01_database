-- 10 SET OPERATORS : 두 개 이상의 SELECT 문의 결과집합을 결합
-- UNION, UNION ALL, INTERSECT, MINUS ALTER 
-- 
-- 1. UNION 
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복 레코드 제거 후 반환
SELECT
          menu_code
        , menu_name
        , menu_price
        , category_code
        , orderable_status
    FROM tbl_menu
   WHERE category_code = 10
   UNION 
SELECT
          menu_code
        , menu_name
        , menu_price
        , category_code
        , orderable_status
    FROM tbl_menu
   WHERE menu_price < 9000;

-- 2. union all
--    두 개 이상의 select 문의 결과를 결합하여 중복 레코드 제거하지 않고 반환
SELECT
          menu_code
        , menu_name
        , menu_price
        , category_code
        , orderable_status
    FROM tbl_menu
   WHERE category_code = 10
   UNION ALL 
SELECT
          menu_code
        , menu_name
        , menu_price
        , category_code
          , ''      -- 만약 서로 다른 컬럼을 가진다면 공백으로 컬럼 개수를 맞춰줘야 한다.
    FROM tbl_menu
   WHERE menu_price < 9000;

-- 3. intersect : 두 select의 결과 중 공통괴는 레코드만 반환 (교집합)
-- mysql과 mariadb에서는 제공하지 않는 연산자임. --> 업데이트 됨. mariadb에서는 사용 가능
-- inner join 또는 in 연산자로 구현 가능.

-- (1) inner join
SELECT
          a.menu_code
        , a.menu_name
        , a.menu_price
        , a.category_code
        , a.orderable_status
    FROM tbl_menu a
    JOIN (SELECT menu_code
               , menu_name
               , menu_price
               , category_code
               , orderable_status
            FROM tbl_menu
           WHERE menu_price < 9000) b ON a.menu_code = b.menu_code ;
   
-- (2) in 연산자
SELECT
          a.menu_code
        , a.menu_name
        , a.menu_price
        , a.category_code
        , a.orderable_status
    FROM tbl_menu a 
   WHERE a.category_code = 10
     AND a.menu_code  IN (SELECT menu_code
                            FROM tbl_menu 
                           WHERE menu_price < 9000);
   

-- 4. minus: 첫번째 select문의 결과에서 두번째 select문의 결과가 포함하는 레코드를
--              제외한 레코드를 반환
SELECT
          a.menu_code
        , a.menu_name
        , a.menu_price
        , a.category_code
        , a.orderable_status
    FROM tbl_menu a
    LEFT JOIN (SELECT menu_code
                    , menu_name
                    , menu_price
                    , category_code
                    , orderable_status
                 FROM tbl_menu  
                WHERE menu_price < 9000) b ON a.menu_code = b.menu_code 
                -- a에는 모든 메뉴코드가 있고, b에는 9000원 이하의 메뉴코드만 있는데
                -- left join을 했으므로 9000원 초과 메뉴의 메뉴코드는
                    -- 조인한 가상 테이블에서 null이 됐을 것.
                    -- 실제로는 menu_code를 가지고 있지만, 논리 테이블 상에서 null값임.
   WHERE a.category_code  = 10
     AND b.menu_code IS NULL;


-- 문제40 : 다른 쿼리의 결과를 조건으로 사용하기
-- 주제: 서브쿼리 ( WHERE 절 내부)
-- 문제: 평균 조회수보다 더 많은 조회수를 기록한 비디오의 제목과 조회수를 조회하세요.
SELECT  
        title
      , view_count 
    FROM videos 
   WHERE view_count > (SELECT AVG(view_count)
                         FROM videos  
                      );


-- 문제 41: 목록(List)을 반환하는 서브쿼리 사용하기
-- 주제: 서브쿼리 with IN
-- 문제: '코딩 아카데미' 채널이 올린 비디오에 '좋아요'를 누른 모든 사용자의 username을 조회하세요. (JOIN을 사용하지 않고 서브쿼리로만 풀어보기!)
SELECT 
        a.username 
    FROM users a
   WHERE a.user_id IN (SELECT b.user_id
                          FROM video_likes b
                          WHERE b.video_id IN (SELECT d.video_id
                                                 FROM videos d
                                                WHERE d.creator_id IN (SELECT c.creator_id
                                                                         FROM creators c
                                                                         WHERE c.channel_name = '코딩 아카데미')
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
    FROM videos 
    WHERE creator_id = (SELECT creator_id 
                          FROM creators
                          WHERE channel_name = '코딩 아카데미');
                       
                       
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
    FROM creators  ;


-- 문제 44: FROM 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (인라인 뷰 Inline View)
-- 문제: 각 크리에이터별 평균 비디오 조회수를 먼저 구하고, 그 중에서 평균 조회수가 1,000,000 (백만)을 초과하는
-- 크리에이터의 creator_id와 계산된 평균 조회수를 조회하세요.
SELECT 
           a.creator_id_over1m 
         , a.avg_vcount_over1m
            FROM (SELECT AVG(b.view_count) avg_vcount_over1m
                       , b.creator_id creator_id_over1m
                   FROM videos b
                   GROUP BY b.creator_id 
                   HAVING AVG(b.view_count) > 1000000
                 ) a;
    

-- 문제 45: SELECT 절에서 서브쿼리 사용하기
-- 주제: 서브쿼리 (스칼라 서브쿼리)
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 해당 채널이 올린 비디오의 총 개수를 함께 조회하세요. (JOIN을 사용하지 마세요.)
SELECT 
        channel_name
      , (SELECT count(*)
         FROM videos b
         WHERE b.creator_id = a.creator_id) video_count
FROM creators a



-- 11. DML(Data Manipulation Language)
--     데이터 조작 언어, 테이블에 값을 삽입하거나 수정하거나 삭제한다.

-- (1) insert : 새로운 행을 추가
INSERT 
  INTO tbl_menu
VALUES 
( 
  NULL
, '바나나해장국'
, 8500
, 4
, 'Y'
);

SELECT * FROM tbl_menu;
 
 
INSERT 
  INTO tbl_menu 
(
  menu_code, menu_name, menu_price, category_code, orderable_status
)
VALUES 
(
  23, '초콜릿죽', 6500
, 7, 'Y'
);

INSERT
 INTO tbl_menu
 (
  menu_price, menu_name, orderable_status, category_code 
 )
 VALUES
 (
 70000, '파인애플탕', 'Y', 4
 );
 
 -- multi insert
 INSERT 
  INTO tbl_menu 
VALUES 
(null, '참치맛아이스크림', 1700, 12, 'Y'),
(null, '멸치맛아이스크림', 1500, 11, 'Y'),
(null, '소시지맛커피', 2500, 8, 'Y');


-- (2) update : 테이블에 기록된 컬럼의 값을 수정
--     0~n개의 행이 업데이트 되며 테이블 전체 행의 수는 변화 없다.
UPDATE tbl_menu
   SET category_code = 7
     , menu_name = '딸기맛붕어빵'
 WHERE menu_code = 25;

 SELECT * FROM tbl_menu;

 -- subquery를 update절에 활용할 수 있다.
 UPDATE tbl_menu
   SET category_code = 6
 WHERE menu_code = (SELECT menu_code
                      FROM tbl_menu 
                     WHERE menu_name = '딸기맛붕어빵');

SELECT * FROM tbl_menu;

 -- (3) delete: 테이블의 행을 삭제하는 구문
 -- where 1절을 이용한 삭제
DELETE 
  FROM tbl_menu
  WHERE menu_code = 25;
SELECT * FROM tbl_menu;
-- limit을 활용한 삭제 (offset지정은 불가)
DELETE 
  FROM tbl_menu
  ORDER BY menu_price
  LIMIT 2;
-- delete 조건 없이 모든 행 삭제
DELETE 
  FROM tbl_menu
  WHERE 1 = 1;
ROLLBACK ; -- auto commit을 껐기 때문에 다시 복구 가능함.

-- (4) replace: 중복된 데이터를 덮어 쓸 수 있다.
REPLACE
  INTO tbl_menu 
VALUES 
(
  17
, '참기름맛소주'
, 50000
, 10
, 'Y'
);
SELECT * FROM tbl_menu;

REPLACE tbl_menu
    SET menu_code = 2
      , menu_name = '우럭쥬스'
      , menu_price = 2000
      , category_code = 9
      , orderable_status = 'N';

SELECT * FROM tbl_menu; 

ROLLBACK;


-- 문제 46: 특정 조건을 만족하는 데이터가 존재하는지 확인하기
-- 주제: 서브쿼리 (EXISTS)
-- 문제: '여행' 카테고리의 비디오에 '좋아요'를 누른 기록이
-- 한 번이라도 있는 사용자의 username을 모두 조회하세요.
SELECT u.username 
  FROM users u
 WHERE EXISTS (SELECT u.user_id
                 FROM video_likes vl
                 JOIN videos v ON vl.video_id = v.video_id 
                WHERE v.category = '여행'
                  AND u.user_id = vl.user_id ) ;


-- 문제 47: 특정 조건을 만족하는 데이터가 없는지 확인하기
-- 주제: 서브쿼리 (NOT EXISTS)
-- 문제: 채널 설명에 '리뷰'라는 단어가 포함된 크리에이터가 올린 비디오에 대해,
-- '좋아요'를 한 번도 받지 못한 비디오의 제목을 조회하세요.
SELECT v.title
  FROM videos v
  JOIN creators c ON v.creator_id = c.creator_id 
 WHERE NOT EXISTS (SELECT 1
                     FROM video_likes vl 
                    WHERE v.video_id = vl.video_id
                  )
   AND c.channel_description LIKE '%리뷰%';

                  
-- 문제 48: 특정 그룹의 통계를 조건으로 사용하기
-- 주제: WHERE 절 서브쿼리
-- 문제: 'IT/테크' 카테고리 비디오들의 평균 재생 시간보다 더 긴 재생 시간을 가진 모든 비디오의 
-- 제목, 카테고리, 재생 시간을 조회하세요.
SELECT a.title
     , a.category
     , a.duration_seconds
  FROM videos a
 WHERE a.video_id IN (SELECT b.video_id
                       FROM videos b 
                      WHERE b.duration_seconds > (SELECT AVG(c.duration_seconds)
                                                    FROM videos c
                                                   WHERE c.category = 'IT/테크'
                                                 )
                    );


-- 문제 49: 가장 뛰어난 그룹 찾기
-- 주제: FROM 절 서브쿼리 (인라인 뷰)
-- 문제: 평균 조회수가 가장 높은 카테고리는 무엇이며, 그 평균 조회수는 얼마인지 조회하세요.
-- 1. 카테고리 별 평균 조회수 그룹핑
-- 2. 카테고리와 평균 조회수 조회
SELECT 
    a.category
  , a.view_count
  FROM (SELECT 
              b.category        category
            , AVG(b.view_count) view_count
          FROM videos b
         GROUP BY category 
       ) a
 ORDER BY a.view_count DESC 
 LIMIT 1;    


-- 문제 50: 다른 테이블의 정보를 이용해 필터링하기
-- 주제: WHERE IN과 JOIN을 포함한 서브쿼리
-- 문제: 'IT/테크' 카테고리의 비디오를 하나라도 시청한 기록이 있는
-- 모든 사용자의 username을 조회하세요.
# IT/테크 카테고리 비디오 아이디 가져오기
# 가져온 비디오 아이디와 watch_histories 비디오 아이디랑 같은 히스토리 가져오기
# 히스토리의 유저아이디와 유저의 유저아이디 연결 후 유저 네임 출력
SELECT 
    u.username
  FROM users u 
  RIGHT JOIN watch_histories wh ON u.user_id = wh.user_id
  WHERE wh.video_id IN (SELECT v.video_id
                          FROM videos v 
                         WHERE v.category = 'IT/테크')
  ORDER BY u.user_id;
                         

-- 문제 51: 각 행에 대한 연관 정보 조회하기
-- 주제: SELECT 절의 스칼라 상관 서브쿼리
-- 문제: creators 테이블의 각 채널에 대해, 채널명과 함께 해당 채널의 가장 높은 조회수를
-- 기록한 비디오의 제목을 조회하세요.
# creator_id별 비디오 그룹핑 후 view_count가장 높은 값만 가져가기
# creator 매핑해서 channel_name 반환
SELECT
       a.channel_name
     , (
        SELECT b.title
          FROM videos b
         WHERE b.creator_id = a.creator_id
         ORDER BY b.view_count DESC
         LIMIT 1
       ) most_popular_video
FROM
    creators a;




-- 문제 52: 임시 테이블을 만들어 쿼리 가독성 높이기
-- 주제: WITH 절 (공통 테이블 표현식, Common Table Expression)
-- 문제: 조회수가 1,000,000 (백만)을 초과하는 '인기 비디오'들을 먼저 정의한 후,
-- 이 '인기 비디오'들을 올린 크리에이터들의 채널명을 중복 없이 조회하세요.
WITH popular_video AS (
    SELECT video_id
         , creator_id 
      FROM videos
     WHERE view_count > 1000000
)
SELECT 
        DISTINCT c.channel_name
  FROM creators c, popular_video p
 WHERE p.creator_id = c.creator_id 

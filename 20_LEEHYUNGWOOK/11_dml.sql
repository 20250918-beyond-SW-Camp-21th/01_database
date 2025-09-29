-- DML : Data MANIPULATION LANGUAGE
-- 데이터 조작언어, 테이블에 값을 삽입하거나 수정하거나 삭제하는(데이터베이스 내의 데이터를 조작하는데 사용하는) 
-- SQL의 한 부분이다.

INSERT 
  INTO tbl_menu
VALUES 
(
  NULL, '바나나해장국'
, 8500, 4
, 'Y'
);


-- INSERT 시 null 허용 가능 컬럼 ro auto_increment 등
-- 기본 값이 존재하는 컬럼은 제외하고 컬럼을 지정해서 삽입할 수 있다.

INSERT 
  INTO tbl_menu
(
  menu_name, menu_price
, category_code, orderable_status
)
VALUES 
(
  '초콜릿죽', 6500
, 7, 'Y'
);

-- 컬럼을 명시적으로 작성했을 경우 순서 변경이 가능하다.
INSERT 
  INTO tbl_menu
(orderable_status, menu_price, menu_name, category_code,menu_code)
VALUES 
( 'Y', 5500, '파인애플탕', 4,24);

-- multi insert
INSERT 
  INTO tbl_menu 
VALUES 
(null, '참치맛아이스크림', 1700, 12, 'Y'),
(null, '멸치맛아이스크림', 1500, 11, 'Y'),
(null, '소시지맛커피', 2500, 8, 'Y');

-- (2) UPDATE: 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.

UPDATE tbl_menu
   SET category_code = 7
     , menu_name = '딸기맛붕어빵'
 WHERE menu_code = 24;

-- subquery를 이용해서 UPDATE 절에 활용할 수 있다.
UPDATE tbl_menu
   SET category_code = 6
 WHERE menu_code = (SELECT menu_code
                      FROM tbl_menu 
                     WHERE menu_name = '딸기맛붕어빵');

-- (3) DELETE: 테이블의 행을 삭제하는 구문이다.
-- 테이블의 행의 갯수가 줄어든다.
DELETE
  FROM tbl_menu
 WHERE menu_code = 24;

-- LIMIT을 활용한 행 삭제(offset 지정은 안됨)
DELETE FROM tbl_menu
ORDER BY menu_price
LIMIT 2;


DELETE FROM tbl_menu;
-- (경고문구를 안 띄우고 싶다면)
DELETE FROM tbl_menu WHERE 1 = 1;




-- (4) REPLACE : INSERT 시 PRIMARY KEY 또는 
-- UNIQUE KEY가 충돌이 발생할 수 있다면 REPLACE를 
-- 통해 중복된 데이터를 덮어 쓸 수 있다.

-- INSERT INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y'); -- 에러 발생
REPLACE 
   INTO tbl_menu 
 VALUES (17, '참기름소주', 5000, 10, 'Y');

REPLACE tbl_menu
    SET menu_code = 2
      , menu_name = '우럭쥬스'
      , menu_price = 2000
      , category_code = 9
      , orderable_status = 'N';


SELECT * FROM tbl_menu;
ROLLBACK;
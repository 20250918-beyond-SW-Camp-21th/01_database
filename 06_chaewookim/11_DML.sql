-- 
-- 11. DML(Data Manipulation Language)
-- 데이터 조작 언어
-- 데이터를 삽입하거나 수정하거나 삭제 

-- (1) INSERT: 새로운 행을 추가 
INSERT
  INTO tbl_menu
VALUES
(
  NULL
, '바나나 해장국'
, 8500
, 4
, 'Y'
);

SELECT * FROM tbl_menu;

-- INSERT 시 NULL 허용 가능 컬럼 or AUTO_INCREMENT 등
-- 기본값이 존재하는 칼럼은 제외하고 칼럼을 지정해 삽입 가능 
INSERT
  INTO tbl_menu
(
  menu_name
, menu_price
, category_code
, orderable_status
)
VALUES
(
  '초콜릿죽'
, 6500
, 7
, 'Y'
);

-- 칼럼을 명시적으로 작성했을 경우 순서 변경 가능 
INSERT
  INTO tbl_menu
(
  menu_price
, menu_name
, orderable_status
, category_code
)
VALUES
(
  70000
, '파인애플탕'
, 'Y'
, 4
);

-- 
INSERT 
  INTO tbl_menu
VALUES 
(null, '참치맛아이스크림', 1700, 12, 'Y'),
(null, '멸치맛아이스크림', 1500, 11, 'Y'),
(null, '소시지맛커피', 2500, 8, 'Y');


-- (2) UPDATE: 테이블에 기록된 칼럼의 값을 수정 
-- 0~n개의 행이 업데이트 되며 테이블 전체 행의 수는 변화 x
UPDATE tbl_menu
   SET category_code = 7
     , menu_name = '딸기맛붕어빵'
 WHERE menu_code = 24;

-- SUBQUERYfmf UPDATE 절에 활용 가능 
UPDATE tbl_menu
   SET category_code = 6
 WHERE menu_code = (SELECT menu_code 
   				      FROM tbl_menu
   				     WHERE menu_name = '딸기맛붕어빵'
 				   );

-- (3) DELETE: 테이블의 행을 삭제하는 구문 
DELETE
  FROM tbl_menu
 WHERE menu_code = 24;

-- LIMIT을 이용한 삭제 (offset 지정은 불가)
DELETE
  FROM tbl_menu
 ORDER BY menu_price
 LIMIT 2;

-- DELETE의 조건 없이 삭제 (모든 행 삭제)
DELETE
  FROM tbl_menu
 WHERE 1=1;


-- (4) REPLACE: 중복된 데이터를 덮어 쓸 수 있음 
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

-- WHERE 절 없이 업데이트 가능 
REPLACE tbl_menu
    SET menu_code = 2
      , menu_price = 1000
      , menu_name = '우럭쥬스'
      , category_code = 9
      , orderable_status = 'N';

SELECT * FROM tbl_menu;

























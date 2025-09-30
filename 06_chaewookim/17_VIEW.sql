-- 17. VIEW: SELECT 쿼리문을 저장한 객체(가상 테이블)
-- 실질적인 데이터를 물리적으로 저장하는 것이 아니라 논리적으로 저장 
-- (1) 보안성 (2) 복잡한 구문을 간결하게 작성 가능 

-- view 생성
CREATE VIEW hansik AS 	-- DDL
SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE category_code = 4;

-- view 조회
SELECT * FROM hansik;
SELECT * FROM tbl_menu;
-- 베이스 테이블의 데이터를 변경하면 뷰의 데이터도 변경됨 
INSERT INTO tbl_menu 
VALUES (NULL, '식혜맛국밥', 5500, 5, 'Y');
-- 뷰의 데이터를 변경하면 베이스 테이블의 데이터 변경
INSERT INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');

UPDATE hansik
  SET menu_name = '버터맛국밥'
    , menu_price = 5700
WHERE menu_code = 99;

DELETE FROM hansik
 WHERE menu_code = 99;

-- or REPLACE
CREATE OR REPLACE VIEW hansik AS 	-- DDL
SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , orderable_status
  FROM tbl_menu
 WHERE category_code = 4;

-- CHECK OPTION
-- 뷰를 통한 데이터 변경 시 뷰 정의 조건을 만족하지 않는 데이터는
-- 추가/수정 불가하도록 제한하는 옵션 
-- (1) with local check option: 뷰 자체 조건만 검사 
-- (2) with cascaded check option: 상위 뷰의 조건까지 검사(default) 
CREATE OR REPLACE VIEW hansik_with_check AS
SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE category_code = 4
  WITH CHECK OPTION;

INSERT INTO hansik_with_check
VALUES (100, '감자탕', 8000, 3, 'Y'); -- 삽입 실패 

INSERT INTO hansik
VALUES (101, '감자탕', 8000, 3, 'Y'); 

INSERT INTO hansik_with_check
VALUES (100, '곰탕', 8000, 4, 'Y');

SELECT * FROM hansik_with_check;
SELECT * FROM tbl_menu;

UPDATE hansik_with_check  -- check 제약조건 때문에 안 됨 
   SET category_code = 3
 WHERE menu_code = 100;

UPDATE hansik -- 됨 
   SET category_code = 3
 WHERE menu_code = 100
 
 -- VIEW 삭제 
 DROP VIEW hansik;
 DROP VIEW hansik_with_check;
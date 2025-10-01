-- 17. view : select 쿼리문을 저장한 객체(가상 테이블)
-- 실질적인 데이터를 물리적으로 저장하는 것이 아니라 논리적으로 저장한다.
-- (1) 보안성 (2) 복잡한 구문을 간결하게 작성 가능하다.

SELECT a.*
  FROM(
SELECT
       menu_code
     , menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10) a;

-- view 생성
CREATE VIEW hansik AS   -- ddl
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
-- 베이스 테이블의 데이터를 변경하면 view의 데이터도 변경된다.
INSERT
  INTO tbl_menu
 VALUES (NULL, '식혜맛국밥', 5500, 4, 'Y');

-- view의 데이터를 변경 > 베이스 테이블의 데이터가 변경됨
INSERT 
  INTO hansik 
 VALUES (99, '수정과맛국밥', 5500, 4, 'Y');

UPDATE hansik
   SET menu_name = '버터맛국밥'
     , menu_price = 5700
 WHERE menu_code = 99;

DELETE 
  FROM hansik 
 WHERE menu_code = 99;

-- view를 이용해 dml 명령어 조작이 불가능한 경우
-- (1) 뷰 정의에 포함 되지 않은 컬럼을 조작할 때
-- (2) 뷰에 포함되지 않은 컬럼 중 베이스 테이블에 not null 조건이 있는 경우
-- (3) 산술 표현식이 정의 된 경우
-- (4) join을 이용해 여러 테이블을 연결한 경우
-- (5) distinct를 포함한 경우
-- (6) 그룹함수 또는 group by 등을 포함한 경우

-- or replace
CREATE OR REPLACE VIEW hansik AS  
SELECT 
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 4;

-- check option
-- 뷰를 통한 데이터 변경 시 뷰 정의 조건을 만족하지 않는 데이터는
-- 추가/수정 불가하도록 제한하는 옵션
-- (1) with local check option : 뷰 자체 조건만 검사
-- (2) with cascacded check option: 상위 뷰의 조건까지 검사(default)

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

INSERT 
  INTO hansik_with_check
VALUES (100, '감자탕', 8000, 3, 'Y');  -- 삽입 실패

INSERT 
  INTO hansik
VALUES (101, '감자탕', 8000, 3, 'Y'); 

INSERT 
  INTO hansik_with_check
VALUES (100, '곰탕', 8000, 4, 'Y'); -- 삽입 성공

SELECT * FROM hansik;
SELECT * FROM tbl_menu;

UPDATE hansik_with_check
   SET category_code = 3
 WHERE menu_code = 100; -- check option 위반으로 수정 실패

UPDATE hansik
   SET category_code = 3
 WHERE menu_code = 100;  -- check option 없어 수정 가능
 
-- view 삭제
DROP VIEW hansik;
DROP VIEW hansik_with_check;

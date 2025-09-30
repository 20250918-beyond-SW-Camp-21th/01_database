-- ==================================================================
-- 17. view
-- ==================================================================

-- 💡 SELECT 쿼리문을 저장한 객체로 가상테이블이라고 불린다. 
-- 실질적인 데이터를 물리적으로 저장하고 있지 않고 쿼리만 저장했지만 테이블을 사용하는 것과 동일하게 사용할 수 있다.
-- 물리적 저장 x 논리적 저장.
-- VIEW는 데이터를 쉽게 읽고 이해할 수 있도록 돕는 동시에, 원본 데이터의 보안을 유지하는데 도움이 된다.
-- (1) 보안성 (2) 복잡한 구문을 간결하게 작성 가능하다.

-- (1) View 생성

-- view 생성 후 조회
SELECT * FROM tbl_menu;

-- VIEW 생성
CREATE VIEW hansik AS -- ddl
SELECT 
       menu_code 
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu 
 WHERE category_code = 4;

-- 생성된 VIEW 조회
SELECT * FROM hansik;

-- 베이스 테이블의 정보가 변경되면 VIEW의 결과도 같이 변경된다.
INSERT 
  INTO tbl_menu 
VALUES (null, '식혜맛국밥', 5500, 4, 'Y');

SELECT * FROM hansik;

START TRANSACTION;


-- (2) VIEW를 통한 DML
-- VIEW를 통한 DML 작업은 베이스 테이블에도 영향을 주게 된다.

-- (2-1) VIEW를 통한 INSERT
-- - VIEW는 AUTO_INCREMENT가 없으므로 pk 컬럼의 값을 지정해 주어야 한다.
-- - VIEW를 통한 INSERT 이후 VIEW 조회 및 베이스 테이블 조회
-- INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');    -- 에러 발생
INSERT 
  INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');   

-- (2-2) VIEW를 통한 UPDATE
-- VIEW를 통한 UPDATE 이후 VIEW 조회 및 베이스 테이블 조회
UPDATE hansik
   SET menu_name = '버터맛국밥', menu_price = 5700 
 WHERE menu_code = 99;

SELECT * FROM hansik;

SELECT * FROM tbl_menu;

-- (2-3) VIEW를 통한 DELETE
-- VIEW를 통한 DELETE 이후 VIEW 조회 및 베이스 테이블 조회
DELETE FROM hansik WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- (2-4) VIEW로 DML 명령어로 조작이 불가능한 경우
--     사용된 SUBQUERY에 따라 DML 명령어로 조작이 불가능할 수 있다.
--     1. 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
--     2. 뷰에 포함되지 않은 컬럼 중에 베이스가 되는 테이블 컬럼이 NOT NULL 제약조건이 지정된 경우
--     3. 산술 표현식이 정의된 경우
--     4. JOIN을 이용해 여러 테이블을 연결한 경우
--     5. DISTINCT를 포함한 경우
--     6. 그룹함수나 GROUP BY 절을 포함한 경우


-- (3) VIEW 삭제
-- VIEW 삭제
DROP VIEW hansik;
DROP VIEW hansik_with_check;

-- (4) VIEW 옵션

-- OR REPLACE 옵션
-- 테이블을 DROP하지 않고 기존의 VIEW를 새로운 VIEW로 쉽게 다룰 수 있다.
CREATE OR REPLACE VIEW hansik AS
SELECT 
       menu_code AS '메뉴코드'
     , menu_name '메뉴명'
     , category_name '카테고리명'
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code
 WHERE b.category_name = '한식';

SELECT * FROM hansik;

-- CHECK 옵션
-- 
-- - 뷰를 통한 데이터 변경 시 뷰 정의 조건을 만족하지 않는 데이터는 추가/수정 불가하도록 제한하는 옵션
--     1. with local check option : 뷰 자체 조건만 검사
--     2. With cascaded check option: 상위 뷰의 조건까지 검사
-- 	   -> WHERE 문에 있는 조건만 CHECK함

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

SELECT * FROM hansik_with_check;

START TRANSACTION;

INSERT 
  INTO hansik_with_check
VALUES (100, '감자탕', 8000, 3, 'Y');

INSERT 
  INTO hansik
VALUES (101, '감자탕', 8000, 3, 'Y');


INSERT 
  INTO hansik_with_check
VALUES (100, '곰탕', 8000, 4, 'Y');  
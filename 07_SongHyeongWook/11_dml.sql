--11. DML(Data Manipulation Language)
-- 데이터 조작 언어, 테이블에 값을 삽입하거나 수정하거나 삭제한다.

/*
 
 [INSERT문]
INSERT
   INTO 테이블명
VALUES
(값,값,값);
 
INSERT
   INTO 테이블명
(컬럼명, 컬럼명, 컬럼명)
VALUES
(값,값,값);

[UPDATE문]
UPDATE 테이블명
     SET  변경할컬럼명 = 변경할 값
 WHERE 조건문

[DELETE문]
DELETE
   FROM 테이블명
WHERE 조건식  
 
 */

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

SELECT * FROM tbl_menu

-- insert 시 null 허용 가능 컬럼 or auto_increment 등
-- 기본 값이 존재하는 컬럼은 제외하고 컬럼을 지정해서 삽입할 수 있다.
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
  '초콜릿죽', 6500
, 7, 'Y'
);

SELECT * FROM tbl_menu

-- 컬럼을 명시적으로 작성했을 경우 순서 변경이 가능하다

INSERT
  INTO tbl_menu
(
  menu_price, menu_name
, orderable_status, category_code
)
VALUES
(
  70000, '파인애플탕'
, 'Y', 4
);

-- multi insert
INSERT
  INTO tbl_menu 
VALUES
(NULL, '참치맛아이스크림', 16998, 12, 'Y'),
(NULL, '멸치맛아이스크림', 15000, 12, 'Y'),
(NULL, '고등어맛아이스크림', 19000, 12, 'Y');

SELECT * FROM tbl_menu

-- (2) update : 테이블에 기록된 컬럼의 값을 수정
-- 0~n개의 행이 업데이트 되며 테이블 전체 행의 수는 변화 없다.
UPDATE tbl_menu
   SET category_code = 7 -- 카테고리 코드를 7로 바꿀 거라는 의미
     , menu_name = '딸기맛붕어빵'
 WHERE menu_code = 24;

-- 서브쿼리를 update절에 활용할 수 있다.
UPDATE tbl_menu
   SET category_code = 6
 WHERE menu_code = (SELECT menu_code
 					  FROM tbl_menu
 					 WHERE menu_name = '딸기맛붕어빵'
 					);

SELECT * FROM tbl_menu

-- (3) delete : 테이블의 행을 삭제하는 구문
DELETE
  FROM tbl_menu 
 WHERE menu_code = 24;

-- limit를 활용한 삭제 (offset 지정은 불가함)
DELETE
  FROM tbl_menu 
 ORDER BY menu_price
 LIMIT 2;
-- delete의 조건없이 삭제(모든 행 삭제) // 1 = 0도 사용 가능
DELETE
  FROM tbl_menu
 WHERE 1 = 1;
ROLLBACK; -- commit 하기 직전까지 롤백

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
 )
 
 SELECT * FROM tbl_menu;

-- update와는 달리 where절 없이 update 가능
REPLACE tbl_menu
    SET menu_code = 22
      , menu_price = 10000
      , menu_name = '우럭쥬스'
      , category_code = 9
      , orderable_status = 'N';









 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

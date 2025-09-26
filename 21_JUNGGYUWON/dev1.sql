use menudb;
-- 01. select : 특정 테이블에서 원하는 데이터 조회

select
        menu_name
  from tbl_menu;

select
        menu_code,
        menu_name
     from tbl_menu;

SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu;


SELECT
        *
  FROM tbl_menu;

-- 단독으로 select문 사용
select 7 + 3;
select 7 * 3;
select 7 / 3;
select 7 % 3;

-- 내장 함수 확인
select NOW();
select CONCAT('홍', '길동');

-- column 별칭
select NOW() AS '현재 시간';

select NOW() '"현재 시간"';

select CONCAT('홍', '길동') as 'full name';
select CONCAT('홍', '길동') 'full name';


SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
--  ORDER BY menu_price ASC;	-- ASC는 오름차순
 ORDER BY menu_price;
-- 01. select : 특정 테이블에서 원하는 데이터를 조회
SELECT 
       menu_name
  FROM tbl_menu;

select
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status 
  from tbl_menu;

-- '*' : 모든
select
       *
  from tbl_menu;

-- 단독으로 select 문 사용
select 7 + 3;
select 7 * 3;
select 7 % 3;
select 7 / 3;

-- 내장함수 확인
select NOW();
select CONCAT('홍',' ', '길동');

-- 컬럼 별칭
select NOW() as 현재시간;
-- select NOW() as 현재 시간; >> 현재 시간 처럼 사용하면 안된다.
select NOW() as '현재 시간';
select NOW() as "현재 시간";
select NOW() 현재시간;
select NOW() '현재 시간';
select NOW() "현재 시간";
select NOW() "'현재 시간'";
select NOW() '"현재 시간"';

select CONCAT('홍', '', '길동');
select CONCAT('홍', '', '길동') "Full Name";


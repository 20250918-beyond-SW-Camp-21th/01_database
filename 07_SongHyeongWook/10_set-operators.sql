-- 10. SET OPERATORS : 두개 이상의 select문의 결과집합을 결합
-- join = 가로로 붙이기, union = 세로로 붙이기
-- union, union all, intersect, minus

-- 1. union
-- 두 개 이상의 select문의 결과를 결합하여 중복 레코드 제거 후 반환
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
 WHERE menu_price < 9000

-- 2. union all
-- 두 개 이상의 select 문의 결과를 결합하여 중복 레코드 제거하지 않고 반환
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
	 , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;

-- 3. intersect : 두 select의 결과 중 공통되는 레코드만 반환 (교집합)
-- mysql, mariadb에서는 제공하지 않는 연산자로 inner join 또는 in 연산자로 구현 가능함

-- (1) inner join
SELECT
	   a.menu_code
	 , a.menu_name
	 , a.menu_price
	 , a.category_code
	 , a.orderable_status
  FROM tbl_menu a
  JOIN (SELECT menu_code, menu_name
	 		 , menu_price, category_code
	 		 , orderable_status -- 정렬 두개 내지 세개로 행을 줄여도 됨
  	      FROM tbl_menu
  	     WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)  -- 인라인 뷰
  WHERE a.category_code = 10;
 
 -- (2) in 연산자 사용
SELECT
	   a.menu_code, a.menu_name
	 , a.menu_price, a.category_code
	 , a.orderable_status
  FROM tbl_menu a
 WHERE a.category_code = 10
   AND a.menu_code IN(SELECT menu_code 
						FROM tbl_menu
					   WHERE menu_price < 9000
   					 );
 
-- intersect도 사용 가능하네요 
 SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 INTERSECT
SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;
 
-- 4. minus: 첫번째 select문의 결과에서 두번째 select문의 결과가 포함하는 레코드를 제외한 레코드를 반환
SELECT
	   a.menu_code
	 , a.menu_name
	 , a.menu_price
	 , a.category_code
	 , a.orderable_status
	 , b.menu_code
  FROM tbl_menu	a
  LEFT JOIN(SELECT
				   menu_code
				 , menu_name
				 , menu_price
				 , category_code
				 , orderable_status
			  FROM tbl_menu
			 WHERE menu_price < 9000) b ON a.menu_code = b.menu_code
  WHERE a.category_code = 10
    AND b.menu_code IS NULL;















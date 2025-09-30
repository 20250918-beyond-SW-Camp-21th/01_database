-- 
-- 10. SET_OPERATORS
-- : 두 개 이상의 SELECT 문의 결과 집합을 결합

-- 1. UNION
-- 두 개 이상의 SELECT 문의 결과를 결합해 중복 제거 후 반환 
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
	, ''
  FROM tbl_menu
 WHERE menu_price < 9000;


-- 2. UNION ALL
-- 두 개 이상의 `SELECT` 문의 결과를 결합해 중복 제거하지 않고 반환 
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
	, ''
  FROM tbl_menu
 WHERE menu_price < 9000;

-- 3. INTERSECT
-- 두 SELECT 문의 결과 중 공통되는 레코드만 반환
-- INNER JOIN 또는 IN 연산자로도 구현 가능 
-- (1) INNER JOIN 사용 
SELECT
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
  FROM tbl_menu a
  JOIN (SELECT
		  	   menu_code
			 , menu_name
			 , menu_price
			 , category_code
			 , orderable_status
		  FROM tbl_menu 
	     WHERE menu_price < 9000
		) b ON (a.menu_code = b.menu_code)
  WHERE a.category_code = 10;

-- (2) IN 사용
SELECT
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
  FROM tbl_menu a
 WHERE a.category_code = 10
   AND a.menu_code IN (SELECT menu_code
   					     FROM tbl_menu
   					    WHERE menu_price < 9000
   					   );

-- (3) INTERSECT 사용 
SELECT
			  a.menu_code
			, a.menu_name
			, a.menu_price
			, a.category_code
			, a.orderable_status
  FROM tbl_menu a
INTERSECT
SELECT
	  	 menu_code
		 , menu_name
		 , menu_price
		 , category_code
		 , orderable_status
  FROM tbl_menu 
 WHERE menu_price < 9000;

-- 4. MINUS
-- 첫 번째 `SELECT` 문의 결과에서 두 번째 `SELECT` 문의 결과가 포함하는 레코드를 제외한 레코드를 반환 
SELECT
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
	, b.menu_code
  FROM tbl_menu a
  LEFT JOIN (SELECT
  				    menu_code
   				  , menu_name
				  , menu_price
				  , category_code
				  , orderable_status
			   FROM tbl_menu
			  WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10
   AND b.menu_code IS NULL;















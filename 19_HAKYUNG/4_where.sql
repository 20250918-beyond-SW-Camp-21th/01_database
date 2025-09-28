-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT 
menu_code
, menu_name
FROM tbl_menu
WHERE orderable_status = 'Y';

SELECT 
	 	menu_code
	  , menu_name
  FROM tbl_menu
WHERE orderable_status = 'N';

SELECT
		menu_code
	  , menu_name
	 FROM tbl_menu
WHERE menu_price = 10000;

SELECT
       menu_code
     , menu_name
     , orderable_status
  FROM tbl_menu
--  WHERE orderable_status <> 'Y';
 WHERE orderable_status != 'Y';

SELECT
       menu_code
     , menu_name
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status <> 'Y';

SELECT 
        menu_price
      , menu_name
      , orderable_status
    FROM tbl_menu
  WHERE menu_price <= 13000
    AND menu_price > 10000;

SELECT
       *
  FROM tbl_menu
 WHERE (category_code = 4
    OR menu_price = 9000)
   AND menu_code > 10;


-- 3. between and 연산자 : 이상 ~ 이하
SELECT 
        *
  FROM tbl_menu 
  -- WHERE menu_price >= 10000
  -- AND menu_price <= 25000;
  WHERE menu_price BETWEEN 10000 AND 25000
  ORDER BY menu_price;


  
-- 4. LIKE 연산자 %
SELECT
        *
    FROM tbl_menu 
  WHERE menu_name NOT LIKE '%마늘%'; -- '마늘'이라는 카워드가 포함된 모든 항목 선택

SELECT
        *
    FROM tbl_menu 
  WHERE menu_name LIKE '붕어빵%'; 
-- SELECT * FROM tbl_menu ORDER BY menu_name;

SELECT 
        menu_code
			, menu_name
			, menu_price
			, category_code
			, orderable_status
    FROM tbl_menu 
  WHERE menu_price >= 5000 
  AND category_code = 10
  AND menu_name LIKE '%갈치%';


-- 5. in 연산자
SELECT
				*
		FROM tbl_menu 
-- 		WHERE category_code = 4
-- 		OR category_code = 5
-- 		OR category_code = 6
		  WHERE category_code IN(4, 5, 6)
		ORDER BY category_code ;


-- 6. is null : null 값 비교(null은 비교 연산자 사용 불가)
SELECT  
				*
		FROM tbl_category 
-- 		WHERE ref_category_code = NULL  -- 안됨
-- 		WHERE ref_category_code = 'null'  -- 안됨
		WHERE ref_category_code IS NOT NULL ;
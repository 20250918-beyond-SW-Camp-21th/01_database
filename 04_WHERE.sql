-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT
      menu_code
     ,menu_price  -- 3번
      FROM tbl_menu -- 1번
 WHERE orderable_status = 'n'; -- 2번
 
 SELECT
       menu_code
      ,menu_price
  FROM tbl_menu
 WHERE menu_price = 13000 ;
-- 값이 일치하지 않는지 확인(!=,<>)
SELECT
	  menu_code
	, menu_name
	, orderable_status
 FROM tbl_menu
-- WHERE orderable_status != 'Y'
WHERE orderable_status = 'Y';

-- 대소비교 (>초과,>=이상, <미만, <=이하)
SELECT
       menu_code
    ,  menu_name
    ,  orderable_status
  FROM tbl_menu
-- WHERE menu_price > 13000; 
-- WHERE menu_price >= 13000;
-- WHERE menu_price < 13000;
 WHERE menu_price <= 13000;

-- 2. 논리연산자(AND)
-- a and b : a와 b 모두 만족할 경우 true and는 false를 앞으로 붙이는 게 좋다.

SELECT
		*
  FROM tbl_menu tm 
 WHERE orderable_status = 'Y'
   AND category_code = '10';

-- a or b : a 또는 b

SELECT
		*
  FROM tbl_menu tm 
 WHERE orderable_status = 'Y'
   OR category_code = '10';

SELECT
		*
  FROM tbl_menu tm -- 1번
 WHERE (category_code  = '4' -- 3번
    OR menu_price = '9000') -- 3번
   AND menu_code > '10'; -- 2번 

-- 3. between and 연산자 (이상 ... 이하의 값을 가져올 때)

SELECT 
       *
  FROM tbl_menu
--  WHERE menu_price >= 10000
--    AND menu_price <= 25000;
WHERE menu_price BETWEEN 10000 AND 25000
ORDER BY menu_price;

-- not 연산자와 조합할 예정

SELECT 
       *
  FROM tbl_menu
--  WHERE menu_price >= 10000
--    AND menu_price <= 25000;
WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_price;   
-- 4. LIKE 연산자 %
-- 포함되는 내용들을 KEYWORD


SELECT
*
FROM tbl_menu
SELECT
       *
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%'; --어디가되었든지 마늘이라는 키워드가 포함되면 선택
 
SELECT
       *
  FROM tbl_menu
 WHERE menu_name LIKE '%아메리카노'; --해당 키워드로 시작하면 키워드%해당키워드로끝나면 %키워드
 
 
 SELECT
        *
  FROM tbl_menu
 WHERE menu_name LIKE '흑%'; -- 해당 키워드로 시작하는 걸 선택
 
 SELECT
        *
   FROM tbl_menu
  WHERE menu_name LIKE '_마늘%';
 
 -- '_' 나 '%'와 같은 기호를 실제로 검색하고 싶을 경우
 -- LIKE '%\_%' 또는
 -- LIKE '%!_%' ESCAPE '!' 와 같은 방식으로 ESCAPE 한다.
 
 SELECT
        *
   FROM tbl_menu
  WHERE menu_name NOT LIKE '_마늘%';
 
 -- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며,
 -- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리를 작성하시오.
 SELECT
        menu_code
      , menu_name
      , menu_price
      , category_code
      , orderable_status 
   FROM tbl_menu
  WHERE menu_price >= '5000'
    AND category_code = '10'
    AND menu_name LIKE '%갈치%';
 
 -- 5. in 연산자
SELECT
        *
  FROM tbl_menu
 WHERE category_code IN(4,5,6)
 ORDER BY category_code ;
 

 
 
 
 
 
 
 
 
 SELECT
        *
  FROM tbl_menu
 WHERE category_code NOT IN (4,5,6)
 ORDER BY category_code ;
 
 -- 6. is null : null 값 비교(비교 연산자 사용 불가)
 SELECT
        *
   FROM tbl_category
  WHERE ref_category_code IS NULL;
 
-- not 연산자 사용
  SELECT
        *
   FROM tbl_category
  WHERE ref_category_code IS NOT NULL;
 
 
 
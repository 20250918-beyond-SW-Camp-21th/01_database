-- 10. SET OPERATORS : 두 개 이상의 select문의 결과집합을 결합
-- UNION, UNION ALL, INTERSACT, MINUS

-- 1. UNION
-- 두 개 이상의 select문의 결과를 결합하여 중복 레코드 제거 후 반환

SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION -- -> 코드
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;

-- 2. UNION ALL
-- 두 개 이상의 SELECT 문의 결과를 결합하며 중복된 레코드를 제거하지 않고 모두 반환하는 SQL 연산자이다.

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

-- 3. INTERSECT; 두 SELECT 문의 결과 중 공통되는 레코드만을 반환하는 SQL 연산자이다.
-- 교집합
-- MySQL은 본래 기본적으로 INTERSECT를 제공하지 않는다. 
-- 하지만 INNER JOIN 또는 IN 연산자 활용해서 구현하는 것은 가능하다.

-- (1)INNER JOIN 로 INTERSECT 구현
SELECT
       a.menu_code, a.menu_name
     , a.menu_price, a.category_code
     , a.orderable_status
  FROM tbl_menu a
 INNER JOIN (SELECT menu_code, menu_name
                  , menu_price, category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000) b ON a.menu_code = b.menu_code
 WHERE a.category_code = 10;

-- (2) IN OPERATOR 로 INTERSECT 구현
SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
  FROM tbl_menu a
 WHERE category_code = 10 
   AND menu_code IN (SELECT menu_code
                       FROM tbl_menu
                      WHERE menu_price < 9000);

-- 4. MINUS: 첫 번째 SELECT 문의 결과에서 두 번째 SELECT 문의 결과가 
--    포함하는 레코드를 제외한 레코드를 반환하는 SQL 연산자이다.

SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
  FROM tbl_menu a
  LEFT JOIN (SELECT menu_code
                  , menu_name
                  , menu_price
                  , category_code
                  , orderable_status
               FROM tbl_menu b
              WHERE menu_price < 9000) b ON a.menu_code = b.menu_code
 WHERE a.category_code = 10
   AND b.menu_code IS NULL;
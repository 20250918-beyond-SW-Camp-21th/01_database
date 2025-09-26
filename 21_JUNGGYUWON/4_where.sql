-- 04. where : 특정 조건에 맞는 레코드만 선택
USE menudb;

SELECT menu_code,
       menu_name
FROM tbl_menu
WHERE orderable_status = 'Y';

SELECT menu_code,
       menu_name
FROM tbl_menu
WHERE orderable_status = 'N';

SELECT menu_code,
       menu_name
FROM tbl_menu
WHERE menu_price = 13000;

SELECT menu_code,
       menu_name
FROM tbl_menu
WHERE orderable_status != 'Y';

-- 대소비교
SELECT menu_code,
       menu_name,
       menu_price
FROM tbl_menu
WHERE menu_price <= 13030;

-- 논리연산자
SELECT *
FROM tbl_menu
WHERE orderable_status = 'Y'
  AND category_code = 10;


SELECT menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE orderable_status = 'Y'
   OR category_code = 10
ORDER BY category_code;

-- and, or 연산자 중 우선순위가 높은 연산자는 == and
SELECT *
FROM tbl_menu
WHERE category_code = 4
   OR menu_price = 9000
    AND menu_code > 10;

SELECT *
FROM tbl_menu
WHERE (category_code = 4
    OR menu_price = 9000)
  AND menu_code > 10;

-- between and 연산자
SELECT *
FROM tbl_menu
WHERE menu_price BETWEEN 10000 AND 25000;

SELECT *
FROM tbl_menu
WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_code;

-- like 연산자
SELECT *
FROM tbl_menu
WHERE menu_name LIKE '%마늘%';

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '%아메리카노';

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '흑%';

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '_마늘%';

-- '_'나 '%'와 같은 기호를 실제로 검색하고 싶을 경우
-- LIKE '%\_%' 또는
-- LIKE '%!_%' ESCAPE '!' 와 같은 방식ㄷ으로 ESCAPE 한다.
SELECT *
FROM tbl_menu
WHERE menu_name NOT LIKE '_마늘%';

-- 메ㅠㄴ 가격이 5000원 이상이고, 카테고리 코드가 10이며, 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리

SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE menu_name LIKE '%갈치%'
  AND menu_price >= 5000
  AND category_code = 10;

SELECT
    menu_code, menu_name, menu_price, category_code, orderable_status
    from tbl_menu
where category_code IN (4,5,6);

SELECT
    *
FROM tbl_category
WHERE  ref_category_code IS NULL;

SELECT
    *
FROM tbl_category
WHERE  ref_category_code IS NOT NULL;
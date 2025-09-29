-- 13. data types
-- (1) 명시적 형변환
SELECT AVG(menu_price) FROM tbl_menu;

-- ANSI표준 : CAST
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) '평균 메뉴 가격'
  FROM tbl_menu; -- 정수형으로 형변환
  
-- mysql, mariadb : convert 제공
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) '평균 메뉴 가격'
     , AVG(menu_price) 
  FROM tbl_menu;   

-- 20250929
SELECT cast('2025$9$29' AS DATE);
SELECT cast('2025*9^29' AS DATE);

-- 메뉴 가격 구하기
SELECT cast(menu_price AS char(5)) FROM tbl_menu;
SELECT cast(menu_price AS char(4)) FROM tbl_menu;
SELECT CONCAT(CAST(menu_price AS char(5)), '원') FROM tbl_menu;

-- 카테고리별 메뉴 가격 합계
SELECT category_code
     , concat(CAST(sum(menu_price) AS char(10)), '원') '합계'
  FROM tbl_menu
 GROUP BY category_code;


 -- (2) 암시적/묵시적 형변환
SELECT '1' + '2';   -- 각 문자가 정수로 형변환됨.
SELECT concat(menu_price, '원') FROM tbl_menu;  -- 정수가 문자열로 형변환됨.
SELECT 3 > 'MAY'; -- 문자는 0으로  변환된다.
SELECT 7 > '6MAY';  -- 문자에서 첫번째로 나온 숫자는 정수로 전환된다.
SELECT 5 > 'M6AY';  -- 숫자가 뒤에 나오면 문자로 인식되어 0으로 변환
-- SELECT hire_date > '2000-5=30' -- 날짜로 바뀔 수 있는 것은 자동으로 바뀜
--   FROM employee

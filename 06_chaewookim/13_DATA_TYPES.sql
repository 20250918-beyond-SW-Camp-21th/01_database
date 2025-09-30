-- 13. Data Types
-- (1) 명시적 형변환 
SELECT AVG(menu_price) FROM tbl_menu;

-- ANSI 표준: CAST
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) '평균 메뉴 가격' FROM tbl_menu; 

-- MySQL, MariaDB: CONVERT
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) '평균 메뉴 가격' FROM tbl_menu; 

-- 20250929를 날짜 형식으로 형변환하고 싶음 
SELECT CAST('2025$9$29' AS DATE);
SELECT CAST('2025+9+29' AS DATE);
SELECT CAST('2025/9/29' AS DATE);
SELECT CAST('2025^9^29' AS DATE);
SELECT CAST('2025-9-29' AS DATE);

-- 메뉴 가격 구하기
SELECT CAST(menu_price AS CHAR(5)) FROM tbl_menu;
SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;

-- 카테고리 별 메뉴 가격의 합계
SELECT category_code
     , CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원') '카테고리 별 합계'
  FROM tbl_menu
 GROUP BY category_code;

-- (2) 암시적/묵시적 형변환 
SELECT '12a' + '2'; -- 각 문자가 정수로 변환 
SELECT CONCAT(menu_price, '원') FROM tbl_menu;
SELECT 3 > 2; -- 대소를 비교할 때 문자는 0으로 변환 

SELECT 7 > '6MAY';
SELECT 5 > 'MAY6';
SELECT hire_date > '2000.9.30'
  FROM employee; -- 날짜형으로 바뀔 수 있는 문자는 DATE 형으로 변환 
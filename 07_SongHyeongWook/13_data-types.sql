-- 13. data types
-- (1) 명시적 형변환
SELECT avg(menu_price) FROM tbl_menu;

-- ANSI표준 : CAST
SELECT CAST(avg(menu_price) AS signed INTEGER) '평균 메뉴 가격' -- 정수로 바꿔줘
  	 , avg(menu_price)
  FROM tbl_menu;

-- mysql, mariadb : convert 제공
SELECT CONVERT (avg(menu_price), signed INTEGER) '평균 메뉴 가격' -- 정수로 바꿔줘
  	 , avg(menu_price)
  FROM tbl_menu;

-- 20250929
SELECT CAST('2025$9$29' AS date);
SELECT CAST('2025/9/29' AS date);
SELECT CAST('2025^9^29' AS date);
SELECT CAST('2025%9%29' AS date);

-- 메뉴 가격 구하기
SELECT CAST(menu_price AS CHAR(5)) FROM tbl_menu
SELECT CONCAT(CAST(menu_price AS char(5)), '원') FROM tbl_menu

-- 카테고리별 메뉴 가격 합게
SELECT 
	   category_code
	 , CONCAT(CAST(sum(menu_price) AS char(10)), '원') 합계
  FROM tbl_menu
 GROUP BY category_code;

-- (2) 암시적/묵시적 형변한
SELECT '1' + '2'; -- 각 문자가 정수로 변환됨 result: 3
SELECT 'a1' + '2'; -- result: 2 // 정수 아니면 계산 안 하겠다는 거
SELECT '1a' + '2'; -- result: 3
SELECT concat(menu_price, '원') FROM tbl_menu; -- menu_price가 문자로 변환됨
SELECT 3 > 5; -- result: 0
SELECT 3 > 'MAY'; -- result: 1 문자는 0으로 변환된다.
SELECT 3 > 0; -- result: 1

SELECT 7 > '6MAY'; -- result: 1 // 문자에서 첫번째로 나온 숫자는 정수로 전환됨
SELECT 5 > 'M6AY'; -- result: 0 // 숫자가 뒤에 나오면 문자로 인식되어 0으로 변환

-- employee
-- 암묵적으로 년도월일을 구분해서 넣어주면 알아서 날짜로 계산함. 
-- 꼭 하이픈(-) 아니어도 됨. (%, ^, &...)
SELECT hire_date > '2000-5-30' 
  FROM employee -- 날짜형으로 바뀔 수 있는 문자는 DATE형으로 변환된다. 








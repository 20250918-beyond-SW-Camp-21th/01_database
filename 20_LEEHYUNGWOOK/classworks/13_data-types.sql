-- 13. data types

-- (1) 명시적 형변환

SELECT AVG(menu_price) FROM tbl_menu;

-- ANSI표준 : CAST
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) 
	AS '평균 메뉴 가격' FROM tbl_menu;
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) 
	AS '평균 메뉴 가격' FROM tbl_menu;

-- '20250929' 문자를 날짜형으로 바꾸는 방법
SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);
-- > 특수기호는 딱히 상관없다는 것! '$ / % @ ..' 특수기호 다 됨

-- 메뉴 가격 구하기
SELECT CAST(menu_price AS CHAR(5)) FROM tbl_menu;
-- > 가격을 문자로 변환

SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;

SELECT 	category_code, CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원') 합계
FROM 	tbl_menu 
GROUP 	BY category_code;


-- (2) 암시적/묵시적 형변환

SELECT 'a1' + '2';

SELECT CONCAT(menu_price, '원') FROM tbl_menu;    -- menu_price가 문자로 변환됨
SELECT 3 > 'MAY';    -- 문자는 0으로 변환된다. 결과는 1 => 값이 True라는 것

SELECT 5 > '6May';	 -- 숫자가 앞에 나오면 정수로 전환
SELECT 5 > 'May6';	 -- 문자가 앞에 나오면 문자로 전환


SELECT '2023-5-30';  -- 날짜형으로 바뀔 수 있는 문자는 DATE형으로 변환된다.

SELECT 	hire_date > '2000%5%30'
FROM	employee;
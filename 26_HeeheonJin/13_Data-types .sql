-- 13 data types
-- (1) 명시적 형변환
SELECT avg(menu_price) FROM tbl_menu;

-- ANSI(미극국가표준)표준: CAST
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) '평균 메뉴 가격'  -- <--()를 함수라고 한다.
     , avg(menu_price)
FROM tbl_menu;

-- mysql,maroadb : convert 제공 

SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) '평균 메뉴 가격'  -- <--()를 함수라고 한다.
     , avg(menu_price)
FROM tbl_menu;

-- 20250929 ()
SELECT CAST('2025$9$29' AS DATE); 
SELECT CAST('2025/9/29' AS DATE);
SELECT CAST('2025^9^29' AS DATE); 
SELECT CAST('2025%9%29' AS DATE);
SELECT CAST('2025@9@29' AS DATE); 
SELECT CAST('2025$9$32' AS DATE); -- 안됨
SELECT CAST('2025$9@29' AS DATE); -- 됨

-- 메뉴 가격 구하기.
SELECT CAST(menu_price AS char(5)) FROM tbl_menu;
SELECT CONCAT(CAST(menu_price AS char(5)), '원') FROM tbl_menu;

-- 그룹함수 count, min, max, sum, avg
-- 단일행 함수는 쓰는 갯수만큼 아웃풋이 나온다. 

--재열님
-- 카테고리별 메뉴 가격 합계
SELECT category_code, concat(CAST(sum(menu_price) AS char(10)), '원') '합계' FROM tbl_menu GROUP BY category_code;

-- (2) 암시적/묵시적 형변환
SELECT '1' + '2'; -- 각 문자가 정수로 변환됨
SELECT '1a' + '2b'; 
SELECT 'a1' + '2'; -- 앞에서 숫자에대한 내용이 나오면 숫자로
SELECT concat(menu_price, '원')FROM tbl_menu; -- menu_price 가 문자로 변환됨.
SELECT 3 > 'MAY' ; -- 1 -- 문자는 0으로 변환된다. 
SELECT 3 > 5 ; -- 0
SELECT 3 > 0 ; -- 1 

SELECT 7 > '6MAY'; -- 문자에서 첫번째로 나온 숫자는 정수로 전환된다.
SELECT 5 > 'M6AY'; -- 숫자가 뒤에 나오면 문자로 인식도어 0으로 변환 
SELECT hire_date > '2000-5-30' 
  FROM employee;   -- 날짜형으로 바뀔 수 있는 문자는 date형으로 변환된다. -------------------------매우 중요할거 같다!!!

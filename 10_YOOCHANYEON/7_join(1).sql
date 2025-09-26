-- ===========================
-- JOIN
-- ===========================
-- 두 개 이상의 테이블의 레코드를 연결해서 가상테이블(relation)생성
-- 연관성을 가지고 있는 컬럼을 기준(데이터)으로 조합
-- 
-- # realtion을 생성하는 2가지 방법
-- 1.JOIN:특정 컬럼 기준으로 행과 행을 연결한다.(가로)
-- 2.UNION: 컬럼과 컬럼을 연결한다.(세로)
-- join은 두 테이블의 행 사이의 공통된 데이터를 기준으로 선을 연결해서 새로운 하나의 행을 만든다.
-- 
-- join구분
-- 1. Equi JOIN: 일반적으로 사용하는 Equality Condition(=)에 의한 조인
-- 2. Non-Equi JOIN: 동등조건(=)이 아닌 BETWEEN AND, IS NULL,
-- 					IS NOT NULL, IN, NOT IN, != 등으로 사용
-- 					
-- Equi JOIN 구분
-- 1. INNER JOIN(내부조인) : 교집합(일반적으로 사용하는 JOIN)
-- 2. OUTER JOIN(외부조인) : 합집합
-- LEFT(OUTER) JOIN  (왼쪽 외부 조인)
-- RIGHT(OUTER) JOIN (오른쪽 외부 조인)
-- FULL(OUTER) JOIN (완전외부조인)
-- 3. CROSS JOIN
-- 4. SELF JOIN(자가 조인)
-- 5. MULTIPLE JOIN(다중 조인)

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 1.inner join : 두 테이블의 교집합을 반환
-- (1)ON: join 할 테이블의 컬럼명이 동일하거나 동일하지 않거나 사용 가능
SELECT
	   a.menu_code 
	 , a.menu_price 
	 , b.category_name 
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code
	
-- (2) using: join할 테이블의 컬럼명이 동일한 경우만 사용 가능
SELECT
	   a.menu_code 
	 , a.menu_price 
	 , b.category_name 
  FROM tbl_menu a
  JOIN tbl_category b USING(category_code);

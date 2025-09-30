-- 8. grouping
-- 열을 묶는 것

-- GROUP BY절은 결과 집합을 특정 열의 값에 따라 그룹화하는데 사용된다.
-- HAVING은 GROUP BY 절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용된다.

-- 그룹함수 : COUNT, SUM, AVG, MIN, MAX

-- ----------------------------------------------------------
-- 6 select 조회컬럼...
-- 1   from 조회할 대상 테이블(베이스테이블)
-- 2   join 조회 대상 테이블 ...
-- 3  where 테이블 행을 조건으로 필터링
-- 4  group by 대상 컬럼으로 결과 집합 그룹핑
-- 5 having 그룹핑 결과를 조건으로 필터링 
-- 7  order by 정렬 기준

-- Roll up : 중간 집계 함수로 GROUP BY 절과 함께 사용
-- GROUP BY 절의 첫번째 기준 컬럼에 대한 중간 집계 + 총 집계 값이
-- result set에 포함된다.

-- 카테고리별로 메뉴(그룹)의 수를 구한다.
SELECT 
	   category_code
	 , count(*) 합
  FROM tbl_menu
 GROUP BY category_code;

-- count 함수의 특성
SELECT 
	   count(*) # 전체 행(NULL 포함)
	 , count(category_code)  # 컬럼 중 값이 있는 것 만 뽑아낸다.
	 , count(ref_category_code) # 즉, NULL값은 count하지 않음 
  FROM tbl_category;

-- SUM 숫자 합계 계산
SELECT
	   category_code
	 , sum(menu_price )
  FROM tbl_menu
 GROUP BY category_code
 -- WITH ROLLUP;
 
 -- AVG 평균
 SELECT
	   category_code
	 , AVG(menu_price )
  FROM tbl_menu
 GROUP BY category_code
 
 -- min, max
SELECT 
	   MIN(emp_name)
	 , MAX(emp_name)
	 , MIN(hire_date)
	 , max(hire_date)
  FROM employee;                               
 
-- group by 에서 2 개 이상의 그룹 생성
SELECT 
	   menu_price
	 , category_code
	 , count(*) 합
  FROM tbl_menu
 GROUP BY menu_price, category_code;

-- 카테고리별로 메뉴 가격 평균이 10000원이상인 카테고리의 
-- 카테고리 코드, 카테고리 명, 평균 메뉴 가격을 조회하자
SELECT
	   b.category_code
	 , b.category_name
	 , AVG(a.menu_price) amp
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code 
 GROUP BY a.category_code , b.category_name
HAVING amp >= 10000

-- ROLLUP
SELECT
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;
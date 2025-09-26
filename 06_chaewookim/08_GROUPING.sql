-- 8. GROUPING 

-- GROUP BY: 결과 집합을 특정 열의 값에 따라 그룹화
-- HAVING: GROUP BY 절과 함께 사용하며 그룹의 조건을 적용 

-- 그룹함수 종류 : COUNT, SUM, AVG, MIN, MAX
-- 여러개의 값 중에 한 개를 반환 

-- 예제1.
-- 카테고리별로 메뉴의 수를 구하고자 한다. 
SELECT 
	   category_code
	 , COUNT(*)
  FROM tbl_menu
 GROUP BY category_code;

-- COUNT 함수의 특성 
SELECT
       COUNT(*) -- '*' 모든 행 
     , COUNT(category_code) -- 칼럼 명 기재 시 값이 있는 행만 카운트
     , COUNT(ref_category_code)
  FROM tbl_category;


-- SUM: 숫자 합계 계산 
SELECT 
	   category_code 
	 , SUM(menu_price)
  FROM tbl_menu
 GROUP BY category_code;


-- AVG: 숫자 평균 계산 
SELECT 
	   category_code 
	 , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code;


-- MIN/MAX: 모든 데이터 타입을 대상으로 사용 가능 
SELECT
	   MIN(emp_name)
	 , MAX(emp_name)
	 , MIN(hire_date)
	 , MAX(hire_date)
  FROM employee;


-- GROUP BY에서 두 개 이상의 그룹 생성 
SELECT 
	   menu_price
	 , category_code
	 , COUNT(*)
  FROM tbl_menu
 GROUP BY menu_price, category_code;


-- 카테고리 별로 메뉴 가격 평균이 10000원 이상인 카테고리의
-- 카테고리 코드, 카테고리명, 평균 메뉴 가격을 조회하자. 
SELECT
	   a.category_code
	 , a.category_name
	 , AVG(b.menu_price)
  FROM tbl_category a
  JOIN tbl_menu b ON a.category_code = b.category_code
 GROUP BY a.category_code, a.category_name
HAVING AVG(b.menu_price) >= 10000;


-- ROLLUP: 중간 집계 함수로 GROUP BY 절과 함께 사용
-- GROUP BY 절의 첫 번째 기준 컬럼에 대한 중간 집계 + 총 집계 값이 result set에 포함
SELECT
	   menu_price
	 , category_code
	 , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;


-- ---------------------------------------
-- 6 select 조회컬럼...
-- 1   from 조회할 대상 테이블(베이스테이블)
-- 2   join 조회 대상 테이블 ...
-- 3  where 테이블 행을 조건으로 필터링
-- 4  group by 대상 컬럼으로 결과 집합 그룹핑
-- 5 having 그룹핑 결과를 조건으로 필터링 
-- 7  order by 정렬 기준
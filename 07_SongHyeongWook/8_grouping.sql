-- 8. grouping

-- group by : 결과 집합을 특정 열의 값에 따라 그룹화
-- having : group by절과 함께 사용하며 그룹의 조건을 적용

-- 그룹함수 : count(), sum(), avg(), min(), max()
-- 여러개의 값중에 한 개를 반환

-- 카테고리별 메뉴의 수를 구하고자 한다.
SELECT
	   category_code
	 , count(*)
  FROM tbl_menu
 GROUP BY category_code;

-- count 함수의 특성
SELECT
       count(*) -- '*' 모든행
     , count(category_code) -- 컬럼명 기재 시 값이 있는 행만 카운트 
     , count(ref_category_code) -- null값은 카운트 하지 않는다.
  FROM tbl_category
  
-- sum : 숫자 함계 계산
SELECT
       category_code
     , sum(menu_price)
  FROM tbl_menu
 GROUP BY category_code
 
-- avg : 숫자 평균
 SELECT
       category_code
     , avg(menu_price)
  FROM tbl_menu
 GROUP BY category_code
 
-- min, max는 모든 데이터 타입을 대상으로 사용 가능
 SELECT
       min(emp_name)
     , max(emp_name)
     , min(hire_date)
     , max(hire_date)
  FROM employee -- db 바꾸기
  
-- group by에서 2개 이상의 그룹을 생성 가능
SELECT
	   menu_price
	 , category_code
	 , count(*)
  FROM tbl_menu
 GROUP BY menu_price, category_code;

-- 카테고리별로 메뉴 가격 평균 10000원 이상인 카테고리의
-- 카테고리 코드, 카테고리명, 평균 메뉴 가격 조회
SELECT
       a.category_code 
     , b.category_name 
     , avg(a.menu_price)
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code 
 GROUP BY a.category_code, b.category_name
HAVING avg(a.menu_price) >= 10000
  

------------------------------------------------------ 
-- 6 select 조회컬럼...
-- 1   from 조회할 대상 테이블(베이스테이블)
-- 2   join 조회 대상 테이블 ...
-- 3  where 테이블 행을 조건으로 필터링
-- 4  group by 대상 컬럼으로 결과 집합 그룹핑
-- 5 having 그룹핑 결과를 조건으로 필터링 
-- 7  order by 정렬 기준 

-- rollup : 중간 집계 함수. group by와 함께 사용
-- group by 절의 첫번째 기준 컬럼에 대한 중간 집계 + 총 집계 값이
-- result set에 포함된다.

SELECT
       category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY category_code
  WITH ROLLUP;

SELECT
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP; 
-- ================
-- JOIN
-- ================
-- 두 개 이상의 테이블의 레코드를 연결해서 가상테이블(relation) 생성
-- 연관성을 가지고 있는 컬럼을 기준(데이터)으로 조합

-- # relation을 생성하는 2가지 방법
-- 1. JOIN : 특정컬럼 기준으로 행과 행을 연결한다. (가로)
-- 2. UNION : 컬럼과 컬럼을 연결한다. (세로)
-- JOIN은 두 테이블의 행 사이의 공통된 데이터를 기준으로 선을 연결해서 새로운 하나의 행을 만든다.

-- JOIN 구분
-- 1. equi JOIN : 일반적으로 사용하는 Equality Condition(=)에 의한 조언
-- 2. Non-Equi JOIN : 동등조건(=)이 아닌 BETWEEN AND, IS NULL, 
-- 					  IS NOT NULL, IN, NOT IN, != 등으로 사용


-- Equi JOIN 구분
-- 1. INNER JOIN (내부조인) : 교집합(일반적으로 사용하는 JOIN)
-- 2. OUTER JOIN (외부조인) : 합집합
--      LEFT(OUTER) JOIN (왼쪽 외부 조인)
--      RIGHT(OUTER) JOIN (오른쪽 외부 조인)
--      FULL(OUTER) JOIN (완전 외부 조인)
-- 3. CROSS JOIN (모든 경우의 수 조합 조인. 행이 4개인 A와 3개인 B를 조인하면 12개가 생김)
-- 4. SELF JOIN(자가 조인)
-- 5. MULTIPLE JOIN(다중 조인)

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 1. inner join : 두 테이블의 교집합을 반환
-- 	(1) ON : JOIN 할 테이블의 컬럼명이 동일하거나 동일하지 않거나 사용 가능
SELECT 
       tbl_menu.menu_name
     , tbl_menu.menu_price 
     , tbl_category.category_name 
  FROM tbl_menu -- 베이스 테이블
  JOIN tbl_category ON tbl_category.category_code = tbl_category.category_code 

SELECT 
       a.menu_name 
     , a.menu_price 
     , b.category_name 
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code
  
-- (2) using : join할 테이블의 컬럼명이 동일한 경우만 사용 가능
SELECT 
       a.menu_name 
     , a.menu_price 
     , b.category_name 
  FROM tbl_menu a
  JOIN tbl_category b USING(category_code);
  

-- employee와 department join
SELECT
       a.emp_name
     , b.dept_title
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_id; -- 결과 : 22명

SELECT * FROM employee; -- 결과 : 24명

-- 2. LEFT[outer 생략가능] JOIN	
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환
SELECT 
	   a.emp_name
	 , b.dept_title
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID; -- null에 대한 내용이 들어옴
  
-- 3. RIGHT[outer] JOIN
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환
SELECT 
	   a.emp_name
	 , b.dept_title
  FROM employee a
 RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID;

-- 4. CROSS JOIN : 두 테이블의 가능한 모든 조합을 반환하는 조인
SELECT 
	   a.emp_name
	 , b.dept_title
  FROM employee a
 CROSS JOIN department b;

-- 5. SELF JOIN : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
SELECT
 	   a.emp_name 사원명
 	 , b.emp_name 관리자명
  FROM employee a
  JOIN employee b ON a.MANAGER_ID = b.EMP_ID;
-- 꽌리자가 있는 사원만 출력

SELECT
 	   a.emp_name 사원명
 	 , b.emp_name 관리자명
  FROM employee a
  LEFT JOIN employee b ON a.MANAGER_ID = b.EMP_ID;
-- 관리자가 없는 사원도 출력

-- 잠시 swcamp에서 참고
SELECT 
	   a.category_name 하위분류
	 , b.category_name 상위분류
  FROM tbl_category a
  LEFT JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT category_name FROM tbl_category WHERE ref_category_code IS NOT NULL; 
-- 

-- employee 테이블에서 다중 테이블 JOIN
-- 사원명(employee), 부서명(department), 직급명(job) 조회
SELECT
	   a.emp_name
	 , b.DEPT_TITLE
	 , c.JOB_NAME 
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN job c ON a.JOB_CODE = c.JOB_CODE; 
  -- job이 없는 경우는 없음. 왜냐면 테이블 만들 때 not null이기에. 그래서 left 안 해도 됨.

-- 사원명(employee), 부서명(department), 근무 지역명(location), 근무 국가명 조회(nation)
SELECT
  	   a.EMP_NAME 
  	 , b.DEPT_TITLE 
  	 , c.local_name
  	 , d.NATIONAL_NAME 
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
  JOIN nation d ON c.NATIONAL_CODE = d.NATIONAL_CODE;
  








  
  
  
  
  
  
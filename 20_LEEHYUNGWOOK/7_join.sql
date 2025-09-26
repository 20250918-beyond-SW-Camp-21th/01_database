-- ====================
-- JOIN
-- ====================
-- 두 개 이상의 테이블의 레코드를 연결해서 가상테이블(relation) 생성
-- 연관성을 가지고 있는 컬럼을 기준(데이터)으로 조합

-- # relation을 생성하는 2가지 방법
-- 1. join : 특정컬럼 기준으로 행과 행을 연결한다.(가로)
-- 2. union: 컬럼과 컬럼을 연결한다.(세로)
-- join은 두 테이블의 행 사이의 공통된 데이터를 기준으로 선을 연결해서 새로운 하나의 행을 만든다.

-- JOIN 구분
-- 1. Equi JOIN : 일반적으로 사용하는 Equality Condition(=)에 의한 조인
-- 2. Non-Equi JOIN: 동등조건(=)이 아닌 BETWEEN AND, IS NULL, 
--                   IS NOT NULL, IN, NOT IN, != 등으로 사용

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
SELECT * FROM tbl_category tc 

-- 1. INNER JOIN : 두 테이블의 교집합을 반환
--	  ON		 : join할 테이블의 컬럼명이 동일/미동일 할 때 사용 간으
SELECT
       *
  FROM tbl_menu a
  -- INNER JOIN tbl_category b ON a.category_code = b.category_code;
  JOIN tbl_category b ON a.category_code = b.category_code;

-- 2. USING : JOIN할 테이블의 컬럼명이 동일한 경우만 사용 가능
SELECT
       a.menu_name
     , a.menu_price 
     , b.category_name 
  FROM tbl_menu a
--  INNER JOIN tbl_category b USING (category_code);
  JOIN tbl_category b USING (category_code);

-- employee와 department JOIN
-- INNERJOIN -> ON 이후에 있는 조건에 합당한 값들만 무조건 붙이기
SELECT 
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.dept_id;
  
-- LEFT JOIN = [LEFT OUTER JOIN]
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 모든 레코드 반환(왼쪽 기준 강제)
SELECT 
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID ;

-- RIGHT JOIN = [RIGHT OUTER JOIN]
-- 오른쪾 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 모든 레코드 반환(우측 기준 강제)
SELECT 
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
  FROM employee a
  RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID ;

-- CROSS JOIN : 두 텐이블에 가능한 모든 조합을 반환(CARTESIAN operation)
SELECT
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
  FROM employee a
 CROSS JOIN department b;

-- SELF JOIN : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
-- 카테고리별 대분류 확인을 위한 SELF JOIN 조회
SELECT
	   a.EMP_NAME 사원
	 , b.EMP_NAME 관리자
  FROM employee a
  LEFT JOIN employee b ON a.MANAGER_ID = b.EMP_ID 
  
-- swcamp 예시
SELECT
       a.category_name 하위분류
     , b.category_name 하위분류
  FROM tbl_category a
  JOIN tbl_category b ON a.ref_category_code = b.category_code;
 -- WHERE a.ref_category_code IS NOT NULL;
  
-- employee에서 다중 테이블 JOIN
-- 사원명(employee TABLE), 부서명(department TABLE), 직급명 조회(job TABLE)
-- 각각의 TABLE 들을 JOIN 하면 된다. 
-- 순서: 1. 각각의 요소가 어느 테이블에 있는지 확인 한 후 가져온다.
SELECT
	   a.EMP_NAME 사원명
	 , b.DEPT_TITLE  부서명
	 , c.JOB_NAME 직급명
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID  # LEFT -> 사원명 기준임 
  													 # RIGHT -> 부서명 기준이 될 것 그러면 아래에 있는 것도 LEFT로 해줘야함
  JOIN job c ON a.JOB_CODE = c.JOB_CODE; # INNER JOIN.

-- 부서명이 기준이 되었을 때의 코드
SELECT
	   a.EMP_NAME 사원명
	 , b.DEPT_TITLE  부서명
	 , c.JOB_NAME 직급명
  FROM employee a
  RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID  
  LEFT JOIN job c ON a.JOB_CODE = c.JOB_CODE;
# => 이렇게 되면 가운데 껴 있는 부서명이 기준이 되는 것
  
-- 사원명(employee.emp_name), 
-- 부서명?
-- 근무 지역명(location.local_name), 
-- 근무 국가명 조회(nation.national_name)
SELECT
	   a.EMP_NAME 
	 , b.DEPT_TITLE 
	 , c.LOCAL_NAME 
	 , d.NATIONAL_NAME 
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID 
  JOIN location c ON b.LOCATION_ID  = c.LOCAL_CODE #nation을 가져오기 위해 얘를 먼저 가져와야 한다.
  JOIN nation d ON c.NATIONAL_CODE = d.NATIONAL_CODE;


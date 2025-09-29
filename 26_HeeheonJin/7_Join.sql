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

select
	   a.emp_name
     , b.dept_title
  from employee a
  left join department b on a.dept_code = b.dept_id; 

-- 3. RIGHT[outer] join
-- 오르쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반홤
select
	   a.emp_name
     , b.dept_title
  from employee a
  right join department b on a.dept_code = b.dept_id;  

-- 4. cross join : 두 테이블의 가능한 모든 조합을 반환하는 조인
select
	   a.emp_name
     , b.dept_title
  from employee a
  CROSS JOIN department b;
-- 5. self join : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
SELECT 
	   a.emp_name 사원명
	 , b.emp_name 관리자명
  FROM employee a
  JOIN employee b ON a.manager_id = b.emp_id;

SELECT 
	   a.emp_name 사원명
	 , b.emp_name 관리자명
  FROM employee a
  LEFT JOIN employee b ON a.manager_id = b.emp_id;

-- SELECT 
-- 	   a.category_name 하위분류
-- 	 , b.category_name 상위분류
-- 	 FROM tbl_category a
-- 	 LEFT JOIN tbl_category b ON a.ref_category_code = b.category_code;
-- 
-- SELECT category_name FROM tbl_category WHERE ref_category_code IS NULL;

-- employee에서 다중 테이블 join
-- 사원명, 부서명, 직급명 조회
SELECT 
	   a.emp_name 사원명
	 , b.dept_title 부서명
	 , c.job_name 직급명
  FROM employee a 
  LEFT JOIN department b ON a.dept_code = b.dept_id
  JOIN job c ON a.job_code = c.job_code;

-- 사원명, 근무 지역명, 근무 국가명 조회
-- SELECT 
-- 	   a.emp_name 사원명
-- 	 , b.local_name 지역명
-- 	 , c.NATIONAL_NAME  직급명
--   FROM employee a 
--   LEFT JOIN location b ON a.location_code = b.location_id
--   JOIN nation c ON a.job_code = c.job_code;

-- 사원명, 부서명, 근무 지역명, 근무 국가명 조회
-- employee department location nation
SELECT 
	   a.emp_name 사원명
	 , b.dept_title 부서명
	 , c.local_name 근무지역명
	 , d.national_name 근무국가명
  FROM employee a 
  JOIN department b ON a.dept_code = b.dept_id
  JOIN location c ON b.location_id = c.local_code
  JOIN nation d ON c.national_code = d.national_code;




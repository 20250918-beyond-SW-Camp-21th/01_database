-- employee와 deparment join
SELECT
	   a.emp_name
	 , b.dept_title
  FROM employee a
  JOIN department b ON a.dept_code = b.dept_id;

SELECT * FROM employee;

-- 2. left[outer] join
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환
SELECT
	   a.emp_name
	 , b.dept_title
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID ;

-- 3. RIGHT[outer] join
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환
SELECT
	   a.emp_name
	 , b.dept_title
  FROM employee a
 RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID ;

-- 4. cross join: 두 테이블의 가능한 모든 조합을 반환하는 조인
SELECT
		a.emp_name
		, b.dept_title
	FROM employee a
	CROSS JOIN department b ;

-- 5. self join : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형
SELECT
	   a.emp_name 사원명
	 , b.emp_name 관리자명
  FROM employee a
  LEFT JOIN employee b ON a.manager_id = b.emp_id; 


SELECT
	   a.category_name 하위분류
	 , b.category_name 상위분류
  FROM tbl_category a
  LEFT JOIN tbl_category b ON a.ref_category_code = b.category_code;

SELECT category_name FROM tbl_category WHERE ref_category_code IS NULL;

-- employee에서 다중 테이블 join
-- 사원명, 부서명, 직급명 조회
SELECT
		a.emp_name
		, b.dept_title
		, c.job_name
	FROM employee a
	LEFT JOIN department b ON a.dept_code = b.dept_id
	JOIN job c ON a.job_code = c.job_code;

-- 사원명, 부서명, 근무 지역명, 근무 국가명 조회
-- employee department location nation
SELECT
		a.emp_name
		, b.dept_title
		, c.local_name
		, d.national_name
	FROM employee a
	JOIN department b ON a.dept_code = b.dept_id
	JOIN location c ON b.location_id = c.local_code
	JOIN nation d ON c.national_code = d.national_code;


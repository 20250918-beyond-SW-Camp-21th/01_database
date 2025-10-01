-- ==================================================================
-- 19. Procedure
-- ==================================================================

-- (1) 매개변수 없는 간단한 예제
-- 프로시저 생성
DELIMITER //

CREATE PROCEDURE getAllEmployee ()
BEGIN
		SELECT	emp_id, emp_name, salary
		FROM 	employee;
END //

DELIMITER ;
-- 호출
CALL getAllEmployee();

-- -----------------------------------------------------------------
-- (2) in 매개변수: 호출 시 전달 된 값을 사용
-- 특정 부서의 직우너 정보 조회 프로시저
DROP PROCEDURE getEmployeesByDepartment;

DELIMITER //

CREATE PROCEDURE getEmployeesByDepartment (
	IN dept CHAR(2)
)
BEGIN
    SELECT emp_id, emp_name, salary
    FROM employee
    WHERE dept_code = dept;
END //

DELIMITER ;

CALL getEmployeesByDepartment('D5'); -- 호출
SHOW FULL COLUMNS FROM employee;	 -- 컬럼 확인
-- -----------------------------------------------------------------
--  (3) OUT 매개변수: 결과 값을 호출한 곳으로 반환
-- 
-- - OUT 매개변수를 사용하는 프로시저는 결과 값을 호출한 곳으로 반환
-- - 특정 직원의 급여를 반환하는 프로시저
DELIMITER //

CREATE PROCEDURE getEmployeeSalary (
	IN id VARCHAR(3),
	OUT sal DECIMAL(10,2)
)
BEGIN
    SELECT salary INTO sal
    FROM employee
    WHERE emp_id = id;
END //

DELIMITER ;
-- -----------------------------------------------------------------
-- 이전에는 Result값만 받으면 됐지만, 값을 받아줄 새로운 공간이 필요하다.\
-- 프로시저 호출
-- '@': 사용자 변수 선언
SET @sal = 0;
CALL GetEmployeeSalary('201', @sal);
SELECT @sal;
-- -----------------------------------------------------------------

-- (4) Inout 매개변수
-- 특정 직원의 급여를 증가시키고, 증가된 급여(보너스 포함)를 반환하는 프로시저
DELIMITER //

CREATE PROCEDURE updateAndReturnSalary (
	IN id VARCHAR(3), 
	INOUT sal DECIMAL(10,2)
)
BEGIN
    UPDATE employee
    SET salary = sal
    WHERE emp_id = id;
    
    SELECT salary + (salary * IFNULL(bonus, 0)) INTO sal
    FROM employee
    WHERE emp_id = id;
END //

DELIMITER ;
-- 해당 프로시저 호출
SET @new_sal = 9000000;
CALL updateAndReturnSalary('200', @new_sal) ;
SELECT @new_sal;
-- -----------------------------------------------------------------
SELECT * FROM employee e;

-- (5)  if-else 활용
-- IF ... ELSE 문은 조건에 따라 다른 SQL 문을 실행하는 데 사용된다. 
-- MariaDB의 IF ... ELSE 구문은 프로시저나 함수 내에서 조건문을 작성할 때 유용하다. 
-- 
DELIMITER //

CREATE PROCEDURE checkEmployeeSalary(
	IN id VARCHAR(3), 
	IN threshold DECIMAL(10,2), 
	OUT result VARCHAR(50)
)
BEGIN
    DECLARE sal DECIMAL(10,2);

    SELECT salary INTO sal
    FROM employee
    WHERE emp_id = id;

    IF sal > threshold THEN
        SET result = '기준치를 넘는 급여입니다.';
    ELSE
        SET result = '기준치와 같거나 기준치 이하의 급여입니다.';
    END IF;
END //

DELIMITER ;

SET @result = '';
CALL checkEmployeeSalary('201', 30, @result);
SELECT @result;
-- -----------------------------------------------------------------

--  (6) case 활용
-- 
-- - CASE 문법은 주어진 조건에 따라 여러 가지 경로 중 하나를 선택하여 실행할 수 있게 해주는 제어 구조이다.
-- MariaDB에서 CASE 문법은 프로시저나 쿼리 내에서 조건에 따라 다른 값을 반환하거나 다른 SQL 문을 실행할 때 유용하다.
DELIMITER //

CREATE PROCEDURE getDepartmentMessage(
	IN id VARCHAR(3),
	OUT message VARCHAR(50)
)
BEGIN
	DECLARE dept VARCHAR(50);

	SELECT 	dept_code INTO dept 	
	FROM	employee
	WHERE 	emp_id = id;
	
	CASE
        WHEN dept = 'D1' THEN
            SET message = '인사관리부 직원이시군요!';
        WHEN dept = 'D2' THEN
            SET message = '회계관리부 직원이시군요!';
        WHEN dept = 'D3' THEN
            SET message = '마케팅부 직원이시군요!';
        ELSE
            SET message = '어떤 부서 직원이신지 모르겠어요!';
    END CASE;	
END//

DELIMITER ;

SET @message = '';
CALL getDepartmentMessage('221', @message);
SELECT @message;


-- -----------------------------------------------------------------
-- (7) while 활용
-- - `WHILE` 구문은 조건이 참인 동안 반복해서 SQL 문을 실행하는 데 사용된다.

DELIMITER //
CREATE PROCEDURE calculateSumUpTo(
	IN max_num INT,
    OUT sum_result INT
)
BEGIN
	DECLARE current_num INT DEFAULT 1; -- 값이 디폴트값으로 초기화됨
	DECLARE total_sum INT DEFAULT 0;
	
	WHILE current_num <= max_num DO
        SET total_sum = total_sum + current_num;
        SET current_num = current_num + 1;
    END WHILE;
	
	SET sum_result = total_sum;
END //

DELIMITER ;

CALL calculateSumUpTo(3, @result);
SELECT @result;

-- -----------------------------------------------------------------
-- (8) 예외처리 활용
-- 
-- - 예외 처리를 위해 `DECLARE ... HANDLER` 구문을 사용한다.
-- 이 구문은 특정 조건이나 SQLSTATE 코드가 발생했을 때 실행할 핸들러를 선언한다.
DELIMITER //

CREATE PROCEDURE divideNumbers(
	IN numerator DOUBLE, 
	IN denominator DOUBLE, 
	OUT result DOUBLE
)
BEGIN
    DECLARE division_by_zero CONDITION FOR SQLSTATE '45000';
    DECLARE EXIT HANDLER FOR division_by_zero
    BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0으로 나눌 수 없습니다.';
    END;

    IF denominator = 0 THEN
        SIGNAL division_by_zero;
    ELSE
        SET result = numerator / denominator;
    END IF;
END//

DELIMITER ;

CALL divideNumbers(100, 3, @result);
SELECT @result; 
CALL divideNumbers(10, 0, @result); -- error 발생 ) 에러처리

-- ==================================================================
-- FUNCTION
-- ==================================================================
DELIMITER //

CREATE FUNCTION getAnnualSalary(
	id VARCHAR(3)
) 
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE monthly_salary DECIMAL(10, 2);
    DECLARE annual_salary DECIMAL(15, 2);

    SELECT salary INTO monthly_salary
    FROM employee
    WHERE emp_id = id;

    SET annual_salary = monthly_salary * 12;

    RETURN annual_salary;
END //

DELIMITER ;

SELECT 
		   emp_name
	   , getAnnualSalary(emp_id) AS annual_salary
 FROM employee;
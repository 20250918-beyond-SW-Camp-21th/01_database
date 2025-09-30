-- 16. Build in Function(내장함수)

-- (1) 문자열 관련 함수 
-- ASCII(아스키 코드), CHAR(숫자)
SELECT ASCII('A'), CHAR(65);

-- bit: bit 수, char: 문자 수, length: byte 수
SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie');

-- 한글 값은 저장 시 3byte
SELECT BIT_LENGTH('한글'), CHAR_LENGTH('한글'), LENGTH('한글');

-- concat(문자열1, 문자열2, ...)
SELECT CONCAT('호랑이', '기린', '사자');
-- concat_ws(구분자, 문자열1, 문자열2, ...)
SELECT CONCAT_ws(',', '호랑이', '기린', '사자');

-- 문자 탐색 시 사용될 수 있는 함수들
SELECT 
       ELT(2, '사과', '딸기', '바나나')         -- 첫 번째 인자인 숫자 위치에 있는 문자 반환 
     , FIELD('딸기', '사과', '딸기', '바나나')   -- 첫 번째 인자인 문자가 있는 위치의 숫자 반환 
     , FIND_IN_SET('바나나', '사과,딸기,바나나')  -- 첫번째 인자인 문자가 셋 안에서 있는 위치의 숫자 반환 
     , INSTR('사과딸기바나나', '딸기') 			-- 두 번째 인자인 문자가 첫 번째 인자 문자열 내부에서의 시작 위치 반환 
     , LOCATE('딸기', '사과딸기바나나');			-- INSTR과 순서만 반대 
     
-- format(숫자, 소수점 자리);
SELECT Format(78954654867.57654, 3)

-- bin: 2진수, oct: 8진수, hex: 16진수 
SELECT BIN(65), OCT(65), HEX(65);

-- INSERT
-- 특정 위치으 ㅣ문자열을 지우고 그 자리에 새로운 문자열 삽입 
-- 기본 형식: INSERT(원본 문자열, 시작 위치, 길이, 새로운 문자)
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- LEFT, RIGHT
-- LEFT와 RIGHT 함수는 각각 문자열의 왼쪽 또는 오른쪽에서 원하는 개수만큼의 문자를 추출
SELECT LEFT('Hello World!', 3), RIGHT('Hello World', 3);

-- UPPER, LOWER
SELECT UPPER('Hello World!'), LOWER('Hello World!');

-- LPAD, RPAD
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6, '@');

-- LTRIM, RTRIM
SELECT LTRIM('     왼쪽     '), RTRIM('   오른쪽    '); 

-- TRIM
-- BOTH, LEADING, TRAILING
SELECT TRIM('    mariadb    '), TRIM(BOTH '@' FROM '@@@@mariadb@@@@');
SELECT TRIM(LEADING '@' FROM '@@@@mariadb@@@@');
SELECT TRIM(TRAILING '@' FROM '@@@@mariadb@@@@');

-- REPEAT
SELECT REPEAT('재밌다', 5);

-- REPLACE
SELECT REPLACE('마리아디비', '마리아', 'maria');

-- REVERSE
SELECT REVERSE('재밌다');

-- SPACE
SELECT CONCAT('제 이름은', SPACE(5), '이고,', SPACE(3), ' 나이는 25입니다');

-- SUBSTRING
SELECT
	   SUBSTRING('안녕하세요 반갑습니다', 7, 2)
	 , SUBSTRING('안녕하세요 반갑습니다', 7);
-- SUBSTRING_INDEX
SELECT
	   SUBSTRING_INDEX('hong.test@gmail.com', '.', 2)
	 , SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);

-- ABS
SELECT ABS(-123);

-- CEILING, FLOOR, ROUND
-- CEILING: 올림값 반환
-- FLOOR: 버림값 반환
-- ROUND: 반올림값 반환
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV('A', 16, 2), CONV(1010, 2, 8);

-- MOD(숫자1, 숫자2) 또는 숫자1 % 숫자2 또는 숫자1 MOD 숫자2
SELECT MOD(75, 10), 75 % 10, 75 MOD 10;

-- POW(숫자1, 숫자2), SQRT(숫자)
SELECT POW(2, 4), SQRT(16);

-- RAND()
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);

-- SIGN(숫자)
SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

-- TRUNCATE(숫자, 정수)
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

-- (3) 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
SELECT ADDDATE('2025-09-18', INTERVAL 30 DAY), ADDDATE('2025-09-18', INTERVAL 6 MONTH), ADDDATE('2025-09-18', INTERVAL 1 YEAR);
SELECT SUBDATE('2025-09-30', INTERVAL 30 DAY), SUBDATE('2025-09-30', INTERVAL 6 MONTH), SUBDATE('2025-09-18', INTERVAL 1 YEAR);;

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
SELECT ADDTIME('2023-05-31 09:00:00', '1:0:1'), SUBTIME('2023-05-31 09:00:00', '1:0:1');

-- 현재 시스템 날짜/시간 변환 
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일 
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- YEAR(날짜), MONTH(날짜), DAYOFMONTH(날짜),
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

-- DATE(), TIME()
SELECT DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜1 또는 시간2)
SELECT DATEDIFF('2025-09-30', '2025-09-18'), TIMEDIFF('17:07:11', '13:06:10');

-- DAYOFWEEK(날짜), MONTHNAME(), DAYOFYEAR(날짜)
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
SELECT LAST_DAY('20230201');

-- MAKEDATE(연도, 정수)
SELECT MAKEDATE(2025, 32);

-- MAKETIME(시, 분, 초)
SELECT MAKETIME(17, 03, 02);

-- QUARTER(날짜)
SELECT QUARTER('2023-09-30');

-- TIME_TO_SEC(시간)
SELECT TIME_TO_SEC('1:1:1');


-- 16. build in functions (내장함수)

-- (1) 문자열 관련 함수
-- ASCII(아스키코드), CHAR(숫자)
SELECT ASCII('A'), CHAR(65);
SELECT ASCII('유'), CHAR(236);

-- bit: bit수, char: 문자수, length: byte수
-- 영문자와 숫자는 각각 1바이트
SELECT BIT_LENGTH('p'), CHAR_LENGTH('pie'), LENGTH('pie0');

-- 한글 값은 저장 시 3byte
SELECT BIT_LENGTH('한글'), CHAR_LENGTH('한글'), LENGTH('한글');

-- concat(문자열1, 문자열2, ....)
SELECT CONCAT('호랑이', '기린', '토끼');
-- concat_ws(구분자, 문자열1, 문자열2, ....)
SELECT concat_ws(', ', '호랑이', '기린', '토끼')


-- 문자 탐색 시 사용될 수 있는 함수들
-- 0, 1, 2가 아님!! 1, 2, 3 으로 시작해서 위치나 순서 반환 
SELECT 
       ELT(2, '사과', '딸기', '바나나') -- 첫번째 인자인 숫자 위치에 있는 문자 반환
     , FIELD('딸기', '사과', '딸기', '바나나') -- 첫번째 인자인 문자가 있는 위치의 숫자를 반환
     , FIND_IN_SET('바나나', '사과,딸기,바나나') -- 첫번째 인자인 문자가 셋 안에서 있는 위치 숫자 반환
     , INSTR('사과딸기바나나', '딸기') -- 두번째 인자인 문자가 첫번째 인자 문자열 내부에서의 시작 위치 반환
     , LOCATE('딸기', '사과딸기바나나'); -- INSTR과 인자 순서만 반대

-- format(숫자, 소수점 자리수)
SELECT format(132.55456789, 3);

-- bin: 2진수, oct: 8진수, hex: 16진수
SELECT bin(65), oct(65), hex(65);

-- INSERT
-- 특정 위치의 문자열을 지우고 그 자리에 새로운 문자열을 삽입한다.
-- 기본 형식 : INSERT(원본문자열, 시작위치, 길이, 새로운 문자열)
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');


-- LEFT, RIGHT
-- LEFT와 RIGHT 함수는 각각 문자열의 왼쪽 또는 오른쪽에서 원하는 개수만큼의 문자를 추출
SELECT LEFT('Hello World!', 3), RIGHT('Hello World!', 3);

-- UPPER, LOWER
SELECT UPPER('Hello World!'), LOWER('Hello World!');

-- lpad, rpad
SELECT LPAD('왼쪽', 6, '@'); -- result: @@@@왼쪽
SELECT RPAD('오른쪽', 6, '@'); -- result: 오른쪽@@@
SELECT RPAD('881122-1', 13, '*');

-- ltrim, rtrim
SELECT LTRIM('    왼쪽    '), RTRIM('     오른쪽     ');

-- trim
-- both, leading(왼쪽 삭제), trailing(오른쪽 삭제)
SELECT TRIM('     mariadb     '), TRIM(BOTH '@' FROM '@@mariadb@@');
SELECT TRIM(LEADING '@' FROM '@@mariadb@@'), TRIM(TRAILING '@' FROM '@@mariadb@@')

-- repeat
SELECT REPEAT('재밋다', 5);

-- replace
SELECT REPLACE('마리아db', '마리아', 'maria');

-- reverse
SELECT REVERSE('hello');

-- space
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세 입니다.');

-- substring('문자열', 자르고자 하는 위치, 어디까지 자를지)
SELECT
	   SUBSTRING('안녕하세요 반갑습니다', 7, 2)
	 , SUBSTRING('안녕하세요 반갑습니다', 7);
-- substring_index('문자열', '찾고자 하는 문자', 그 기준으로 자른 데까지 보여줌)
SELECT
	   SUBSTRING_INDEX('hong.test@gmail.com', '.', 2)
     , SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);


-- (2) 숫자 관련 함수

SELECT ABS(-123);

-- CEILING: 올림값 반환
-- FLOOR: 버림값 반환
-- ROUND: 반올림값 반환
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);


-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10)
	 , CONV('A', 16, 2)
	 , CONV(1010, 2, 8)
	 , CONV(10101001, 2, 16);


-- MOD(숫자1, 숫자2) 또는 숫자1 % 숫자2 또는 숫자1 MOD 숫자2
SELECT MOD(75, 10)
	 , 75 % 10
	 , 75 MOD 10;

-- POW(숫자1, 숫자2), SQRT(숫자)
-- POW: 거듭제곱값 추출
-- SQRT: 제곱근을 추출
SELECT POW(2, 4), SQRT(16);

-- RAND()
-- RAND: 0이상 1 미만의 실수를 구한다.
-- 'm <= 임의의 정수 < n'을 구하고 싶다면
-- FLOOR((RAND() * (n - m) + m)을 사용한다.
-- 1부터 10까지 난수 발생: FLOOR(RAND() * (11 - 1) + 1)
-- ex) -128부터 127은 256개
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);

-- SIGN(숫자)
-- SIGN: 양수면 1, 0이면 0, 음수면 -1을 반환
SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

-- TRUNCATE(숫자, 정수)
-- TRUNCATE: 소수점을 기준으로 정수 위치까지 구하고 나머지는 버림
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);


-- (3) 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
-- ADDDATE: 날짜를 기준으로 차이를 더함
-- SUBDATE: 날짜를 기준으로 날짜를 뺌
SELECT ADDDATE('2025-09-18', INTERVAL 30 DAY)
	 , ADDDATE('2025-09-18', INTERVAL 6 MONTH)
	 , ADDDATE(NOW(), INTERVAL 1 YEAR);
SELECT SUBDATE('2025-09-30', INTERVAL 30 DAY)
	 , SUBDATE('2025-09-30', INTERVAL 6 MONTH)
	 , SUBDATE('2025-09-30', INTERVAL 7 YEAR);


-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
-- ADDTIME: 날짜 또는 시간을 기준으로 시간을 더함
-- SUBTIME: 날짜 또는 시간을 기준으로 시간을 뺌
SELECT ADDTIME('2023-05-31 09:00:00', '1:0:1')
     , SUBTIME('2023-05-31 09:00:00', '1:0:1');


-- CURDATE(), CURTIME(), NOW(), SYSDATE()
-- CURDATE: 현재 연-월-일 추출
-- CURTIME: 현재 시:분:초 추출
-- NOW() 또는 SYSDATE(): 현재 연-월-일 시:분:초 추출
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일 
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

--  NOW(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 아예 동일
--  LOCALTIME, LOCALTIME()도 아예 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();


-- YEAR(날짜), MONTH(날짜), DAYOFMONTH(날짜),
-- HOUR(시간), MINUTE(시간), SECOND(시간), MICROSECOND(시간)
-- 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초를 추출
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME())
     , SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

-- DATE(), TIME()
-- DATE: 연-월-일만 추출
-- TIME: 시:분:초만 추출
SELECT DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜1 또는 시간2)
-- DATEDIFF: 날짜1 - 날짜2의 일수를 반환
-- TIMEDIFF: 시간1 - 시간2의 결과를 구함
SELECT DATEDIFF('2023-05-31', '2023-02-27')
 	 , TIMEDIFF('17:07:11', '13:06:10');

-- DAYOFWEEK(날짜), MONTHNAME(), DAYOFYEAR(날짜)
-- DAYOFWEEK: 요일 반환(1이 일요일)
-- MONTHNAME: 해당 달의 이름 반환
-- DAYOFYEAR: 해당 년도에서 며칠이 흘렀는지 반환
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
-- LAST_DAY: 해당 날짜의 달에서 마지막 날의 날짜를 구한다.
SELECT LAST_DAY('20230201');

-- MAKEDATE(연도, 정수)
-- MAKEDATE: 해당 연도의 정수만큼 지난 날짜를 구한다.
SELECT MAKEDATE(2023, 32);

-- MAKETIME(시, 분, 초)
-- MAKETIME: 시, 분, 초를 이용해서 '시:분:초'의 TIME 형식을 만든다.
SELECT MAKETIME(17, 03, 02);

-- QUARTER(날짜)
-- QUARTER: 해당 날짜의 분기를 구함
SELECT QUARTER('2023-05-31');

-- TIME_TO_SEC(시간)
-- TIME_TO_SEC: 시간을 초 단위로 구함
SELECT TIME_TO_SEC('1:1:1');













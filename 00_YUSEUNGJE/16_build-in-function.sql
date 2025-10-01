-- 16. build in functions(내장함수)

-- (1) 문자열 관련 함수
-- ASCII(아스키코드), CHAR(숫자)
SELECT ASCII('A'), CHAR(65);

-- bit: bit수, char: 문자수, length: byte수
SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie');

-- 한글 값은 저장 시 3byte
SELECT BIT_LENGTH('한글'), CHAR_LENGTH('한글'), LENGTH('한글');

-- concat(문자열1, 문자열2,....)
SELECT CONCAT('호랑이', '기린', '토끼');
-- concat_ws(구분자, 문자열1, 문자열2,....)
SELECT CONCAT_WS(', ', '호랑이', '기린', '토끼');

-- 문자 탐색 시 사용될 수 있는 함수들
SELECT 
       ELT(2, '사과', '딸기', '바나나') -- 첫번째 인자인 숫자 위치에 있는 문자 반환
     , FIELD('딸기', '사과', '딸기', '바나나') -- 첫번째 인자인 문자가 있는 위치의 숫자 반환
     , FIND_IN_SET('바나나', '사과,딸기,바나나') -- 첫번째 인자인 문자가 셋 안에서 있는 위치 숫자 반환
     , INSTR('사과딸기바나나', '딸기') -- 두번째 인자인 문자가 첫번째 인자 문자열 내부에서의 시작 위치 반환
     , LOCATE('딸기', '사과딸기바나나'); -- INSTR과 인자 순서만 반대
     
 -- format(숫자, 소수점 자리수)
SELECT FORMAT(123123123123.567467, 3);

-- bin : 2진수, oct: 8진수, hex: 16진수
SELECT BIN(65), OCT(65), HEX(65);
-- INSERT
-- 특정 위치의 문자열을 지우고 그 자리에 새로운 문자열을 삽입한다.
-- 기본 형식 : INSERT(원본문자열, 시작위치, 길이, 새로운 문자열)
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- LEFT, RIGHT
-- LEFT와 RIGHT함수는 각각 문자열의 왼쪽 또는 오른쪽에서 원하는개수만큼의 문자를 추출
SELECT LEFT('Hello World!', 3), RIGHT('Hello World!', 3);

-- UPPER, LOWER
SELECT UPPER('Hello World!'), LOWER('Hello World!');

-- lpad, rpad
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6, '@');
SELECT RPAD('881122-1', 16, '*');

-- ltrim, rtrim 
SELECT LTRIM('    왼쪽    '), RTRIM('    오른쪽    ');

-- trim
-- both, leading, trailing
SELECT TRIM('   mariadb   '), TRIM(TRAILING '@' FROM '@@@mariadb@@');

-- repeat
SELECT REPEAT('재밋다 ', 5);

-- replace
SELECT REPLACE('마리아db', '마리아', 'maria');

-- reverse
SELECT REVERSE('hello');

-- SPACE
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세 입니다.');

-- substring
SELECT
       SUBSTRING('안녕하세요 반갑습니다', 7, 2)
     , SUBSTRING('안녕하세요 반갑습니다', 7);
-- substring_index
SELECT
       SUBSTRING_INDEX('hong.test@gmail.com', '.', 2)
     , SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);

-- (2) 숫자 관련 함수

SELECT ABS(-123), ABS(123);

-- CEILING: 올림값 반환
-- FLOOR: 버림값 반환
-- ROUND: 반올림값 반환
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10)
     , CONV('A', 16, 2) 
     , CONV(1010, 2, 8);

-- mod
SELECT MOD(75, 10), 75 % 10, 75 MOD 10;

-- POW(숫자1, 숫자2), SQRT(숫자)
SELECT POW(2, 4), SQRT(16);


-- RAND()
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);

-- SIGN(숫자)
-- SIGN: 양수면 1, 0이면 0, 음수면 -1을 반환
SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

-- TRUNCATE(숫자, 정수)
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

-- (3) 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
SELECT ADDDATE('2025-09-18', INTERVAL 30 DAY)
, ADDDATE('2025-09-18', INTERVAL 6 MONTH)
, ADDDATE('2025-09-30', INTERVAL 1 YEAR);
SELECT SUBDATE('2025-09-30', INTERVAL 30 DAY)
, SUBDATE('2025-09-30', INTERVAL 6 MONTH)
, SUBDATE('2025-09-30', INTERVAL 7 YEAR)
;


-- addtime, subtime
SELECT ADDTIME('2023-05-31 09:00:00', '1:0:1'), SUBTIME('2023-05-31 09:00:00', '1:0:1');

-- 현재 시스템 날짜/시간 반환
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일 
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- YEAR(날짜), MONTH(날짜), DAYOFMONTH(날짜)
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

-- date, time
SELECT DATE(NOW()), TIME(NOW());

-- datediff, timediff
SELECT DATEDIFF('2025-09-30', '2025-09-18'), TIMEDIFF('17:07:11', '13:06:10');

-- last day
SELECT LAST_DAY('2023-02-01');

-- MAKEDATE(연도, 정수)
SELECT MAKEDATE(2023, 32);

-- MAKETIME(시, 분, 초)
SELECT MAKETIME(17, 03, 02);

-- QUARTER(날짜)
SELECT QUARTER('2025-09-01');

-- TIME_TO_SEC(시간)
SELECT TIME_TO_SEC('1:1:1');


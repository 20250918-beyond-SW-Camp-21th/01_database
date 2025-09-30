-- 16. build IN fuctions(내장함수)

-- (1) 문자열 관련 함수
-- ASCII(아스키 코드), char(숫자)
SELECT ascii('A'), char(65); -- A는 숫자로, 숫자는 문자로
SELECT ascii('유'), char(236);

-- bit: bit수, char: 문자수, length: byte 수
SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie0');

SELECT BIT_LENGTH('한글'), CHAR_LENGTH('한글'), LENGTH('한글');

-- concat(문자열1, 문자열2,...)
SELECT concat('호랑이', '기린', '토끼');
-- concat_ws(구분자, 문자열1, 문자열2,...)
SELECT CONCAT_WS(', ', '호랑이', '기린', '토끼');
-- 연결

-- 문자 탐색 시 사용될 수 있는 함수들

SELECT 
       ELT(2, '사과', '딸기', '바나나')			-- 첫번째 인자인 숫자 위치에 있는 문자 반환 
     , FIELD('딸기', '사과', '딸기', '바나나')  	-- 첫번째 인자인 문자가 있는 위치의 숫자 반환
     , FIND_IN_SET('바나나', '사과,딸기,바나나') 	-- 첫번째 인자인 문자가 셋 안에서 있는 위치 숫자 반환 
     , INSTR('사과딸기바나나', '딸기')           	-- 두번째 인자인 문자가 첫번째 인자 문자열 내부에서의 시작 위치 반환 
     , LOCATE('딸기', '사과딸기바나나'); 			-- INSTR과 인자 선서만 반대
     
-- format(숫자, 소수점 자리수)
    SELECT FORMAT(123123123123.567567, 3) 	-- 오른쪽 값은 왼쪽값을 소수점 몇번째까지 반올림 할건지. ;
    
-- bin : 2진수, oct: 8진수, hex: 16진수
SELECT BIN(65), oct(8), hex(65);

-- INSERT
-- 특정 위치의 문자열을 지우고 그 자리에 새로운 문자열을 삽입한다.
-- 기본 형식 : INSERT(원본문자열, 시작위치, 길이, 새로운 문자열)
SELECT INSERT('내 이름은 아무개 입니다.', 7, 3, '홍길동');
SELECT INSERT('내 이름은 아무개입니다.')

-- LEFT, RIGHT
-- LEFT 와 RIGHT 함수는 각각 문자열의 왼쪽 또는 오른쪽에서 원하는 개수만큼의 문자를 추출
SELECT LEFT('Hello world!', 3); 			-- 왼쪽에서 3번째까지 가져온다. 
SELECT RIGHT('Hello world!', 3); 			-- 오른쪽에서 3개

-- UPPER, LOWER 
SELECT UPPER('hello world!'), LOWER('HELLO WORLD!');

-- lpad, rpad (엘패드, 알패드)
SELECT LPAD('왼쪽', 6, '@'); -- 왼쪽에 시작해 6칸이 될때까지 @ 으로 채워준다. 
SELECT RPAD('오른쪽', 6, '@'); -- 오른쪽에 시작해 6칸이 될때까지 @ 으로 채워준다. 
SELECT RPAD('881122-1', 16, '*');

-- LTRIM, RTRIM (엘트림, 알트림)
SELECT LTRIM('        왼쪽          '), RTRIM('          오른쪽          '); -- 왼쪽 트림, 오른쪽 트림

-- trim
-- both, leading, trailing
SELECT TRIM('      mariadb      '), TRIM(BOTH '@' FROM '@@@mariadb@@'); -- 유용하다
SELECT TRIM('      mariadb      '), TRIM(leading '@' FROM '@@@mariadb@@'); -- 왼쪽만 트림
SELECT TRIM('      mariadb      '), TRIM(trailing '@' FROM '@@@mariadb@@'); -- 오른쪽만 트림

-- repeat
SELECT REPEAT('재밋다', 5); -- 반복

-- replace 
SELECT REPLACE('마리아db', '마리아', 'maria');

-- reverse
SELECT reverse('hello');

-- space
SELECT concat('제 이름은', SPACE(5), '이고 나이는', space(3), '세 입니다.');

-- substring
SELECT substring('안녕하세요 반값습니다', 7, 2); 
SELECT substring('안녕하세요 반값습니다', 7); 

-- substring_index
SELECT substring_index('hong.test@gmail.com', '.', 2);  	-- 앞에서
SELECT substring_index('hong.test@gmail.com', '.', -2);  	-- 뒤에서

-- (2) 숫자 관련 함수
SELECT abs(-123), abs(123);

-- CEILING: 올림값 반환
-- FLOOR: 버림값 반환
-- ROUND: 반올림값 반환

SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV: 원래 진수에서 변환하고자 하는 진수로 변환
SELECT CONV('A', 16, 10), CONV('A', 16, 2), CONV(1010, 2, 8);

-- mod (나머지)
SELECT MOD(75,10), 75%10, 75 MOD 10;

-- POW: 거듭제곱값 추출
-- SQRT: 제곱근을 추출
SELECT POW(2, 4), SQRT(16);

-- RAND: 0이상 1 미만의 실수를 구한다.
-- 'm <= 임의의 정수 < n'을 구하고 싶다면
-- FLOOR((RAND() * (n - m) + m)을 사용한다.
-- 1부터 10까지 난수 발생: FLOOR(RAND() * (11 - 1) + 1)

-- RAND()
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

SELECT ADDDATE('2025-09-18', INTERVAL 30 DAY), ADDDATE('2025-09-30', INTERVAL 6 MONTH), ADDDATE('2025-09-30', INTERVAL 1 YEAR);
SELECT SUBDATE('2025-09-18', INTERVAL 30 DAY), SUBDATE('2025-09-30', INTERVAL 6 MONTH), ADDDATE('2025-09-30', INTERVAL 8 YEAR);

-- CURDATE: 현재 연-월-일 추출
-- CURTIME: 현재 시:분:초 추출
-- NOW() 또는 SYSDATE(): 현재 연-월-일 시:분:초 추출

SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일 
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- YEAR(날짜), MONTH(날짜), DAYOFMONTH(날짜
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

-- date, time
SELECT date(now()), time(now());

-- datediff, timediff
SELECT datediff('2025-09-30', '2025-09-18'), timediff('17:07:11','13:06:10');

-- LAST DAY
SELECT last_day('2023-02-01');

-- MAKEDATE(연도, 정수)
SELECT MAKEDATE(20323, 32);

-- MARKTIM(시,분,초)
SELECT MAKETIME(17,03,02);

-- QUARTER(날짜)
SELECT QUARTER('2025-09-01');

-- TIME_TO_SEC(시간)
SELECT TIME_TO_SEC('1:1:1');
-- HOUR(시간), MINUTE(시간), SECOND(시간), MICROSECOND(시간)
-- 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초를 추출
-- DATE: 연-월-일만 추출
-- TIME: 시:분:초만 추출
-- DATEDIFF: 날짜1 - 날짜2의 일수를 반환
-- TIMEDIFF: 시간1 - 시간2의 결과를 구함
-- DAYOFWEEK: 요일 반환(1이 일요일)
-- MONTHNAME: 해당 달의 이름 반환
-- DAYOFYEAR: 해당 년도에서 몇 일이 흘렀는지 반환
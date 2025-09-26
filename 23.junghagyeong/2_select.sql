-- 01. select : 특정 테이블에서 원하는 데이터를 조회 할때 사용

USE menudb;
SELECT 
	menu_name 
  FROM tbl_menu;

SELECT 
	 menu_code
   , menu_name
   , menu_price
   , category_code
   , orderable_status
 FROM tbl_menu;

-- '*' 모든
SELECT
	*
 FROM tbl_menu;

-- 단독으로 select문 사용
SELECT 7 + 3;
SELECT 7 * 3;
SELECT 7 % 3;
SELECT 7 / 3;

-- 내장함수 확인
SELECT NOW(); -- now() : 현재 날짜에 대한 내용
SELECT concat('홍', '길동'); -- concat : 문자열들에 대한 연결 시킬때 사용

-- 컬럼의 별칭
SELECT NOW() as 현재시간;
 -- SELECT NOW() as 현재 시간; >> 글 사이에 뛰어쓰기 XX
SELECT NOW() as '현재 시간';
SELECT NOW() as "현재 시간";

SELECT NOW() 현재시간;
SELECT NOW() '현재 시간';
SELECT NOW() "현재 시간";
SELECT NOW() "'현재 시간'"; -- '현재 시간'
SELECT NOW() ''"현재 시간"''; -- "현재 시간"
 -- SELECT NOW() ""현재 시간""; XX
 -- SELECT NOW() ''현재 시간''; XX

-- full name 출력
SELECT concat('홍', '길동') as 'full name';
SELECT concat('홍', '길동') as "full name";
SELECT concat('홍', '길동') 'full name';
SELECT concat('홍', '길동') "full name";


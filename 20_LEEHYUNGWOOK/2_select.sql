-- 01. select :특정 테이블에서 원하는 데이터 조회

SELECT
		menu_name
	FROM tbl_menu;
-- tbl menu 에서 메뉴이름 조회
	
SELECT
		menu_code
	 , menu_price
	 , menu_name
	 , orderable_status
	FROM tbl_menu;
-- tbl menu에서 메뉴코드,가격,이름,주문가능여부 조회
	
SELECT 
		*
	FROM tbl_menu;
-- tbl 메뉴에서 모든 데이터 조회

SELECT 7+10;
-- 단독select문

### 내장함수 확인 ###
SELECT NOW();
# 현재 날짜와 시간 확인
## 언제 사용하는가? 상품 등록 일시를 그때그때 저장해야 할 때

SELECT CONCAT('홍','','길동');
# 문자열들에 대한 연결을 시킬 때 사용

SELECT NOW() AS "현 시간";
# 별칭을 지을 수 있다.===============
# SELECT NOW() AS 현 시간 => 오류뜸.

SELECT CONCAT('홍', '', '길동') 'full name';
# 이거도 가능: AS 생략

SELECT NOW() '"현재 시간"';
# SELECT NOW() ''현재 시간''; =>이건 안됨

SELECT NOW() '';

# full name 으로 가능한 모든 방법으로 출력하기
SELECT CONCAT('홍', '', '길동') AS 'full name';
SELECT CONCAT('홍', '', '길동') AS "full name";
SELECT CONCAT('홍', '', '길동') AS "'full name'";
SELECT CONCAT('홍', '', '길동') AS '"full name"';
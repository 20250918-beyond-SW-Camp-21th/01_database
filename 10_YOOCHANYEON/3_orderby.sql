

-- order by 절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용 가능
SELECT
		menu_code,
		menu_name,
		menu_price * menu_code
	FROM tbl_menu
	ORDER BY menu_price * menu_code;

SELECT
		menu_code '메뉴 코드',
		menu_name '메뉴명',
		menu_price * menu_code '연산 결과'
	FROM tbl_menu
	ORDER BY '연산 결과';

-- FIELD 함수 
SELECT FIELD ('A', 'A', 'B', 'C'); -- 1
SELECT FIELD ('B', 'A', 'B', 'C'); -- 2
SELECT FIELD ('C', 'A', 'B', 'C'); -- 3
SELECT FIELD ('D', 'A', 'B', 'C'); -- 0 (없을 때)

-- FIELD 함수를 활용하면 정렬 데이터 기준을 설정 가능
SELECT
		menu_name,
		orderable_status,
		FIELD(orderable_status, 'Y', 'N') 판매여부
	FROM tbl_menu
ORDER BY 판매여부 -- FIELD(orderable_status, 'Y', 'N');

-- null 값의 정렬 방식
SELECT 
		category_code,
		category_name,
		ref_category_code
	FROM tbl_category
-- ORDER BY ref_category_code;
-- ORDER BY ref_category_code DESC;
ORDER BY -ref_category_code DESC;



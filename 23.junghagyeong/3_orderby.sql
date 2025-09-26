-- 2. order by : result set 정렬

SELECT * FROM tbl_menu;

SELECT   
	  menu_code
	, menu_name
	, menu_price
  FROM tbl_menu
  ORDER BY menu_price DESC; -- desc 내림차순
  -- ORDER BY menu_price ASC; Ascending Order 오른차순
  -- ORDER BY menu_price; Asc는 생략 가능(default)

-- 정렬 기준 상 동일한 값이 있을 때
-- 그 다음 정렬 기준을 세울 수 있다.
  
SELECT   
	  menu_code
	, menu_name
	, menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC, menu_code; -- 메뉴 가격은 내림차순이 선 메뉴가격이 같으면 menu_code 올림차순 정리
 
 -- order by 절 뒤에 컬럼명 외에 연산 결과, 별칭 등 사용 가능
 SELECT 
 		  menu_code '메뉴코드'
 		, menu_name '메뉴명'
 		, menu_price * menu_code '연산결과'
 	FROM tbl_menu
  ORDER BY 연산결과;

-- field 함수
SELECT FIELD('A', 'A', 'B', 'C'); -- 1
SELECT FIELD('B', 'A', 'B', 'C'); -- 2
SELECT FIELD('C', 'A', 'B', 'C'); -- 3
SELECT FIELD('D', 'A', 'B', 'C'); -- 0 존재하지 않을때
 -- 제일 앞에 있는 문자가 몇번째에 있는지 보여줌

-- field 함수를 활용하면 정렬 데이터 기준 설정 가능

SELECT 
         menu_name
       , orderable_status 
       , FIELD(orderable_status, 'Y', 'N') 판매여부
  FROM tbl_menu
ORDER BY 판매여부;

-- NULL 값이 정렬 방식
SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
-- ORDER BY ref_category_code; -- ASC 생략 가능
-- ORDER BY ref_category_code DESC;
  ORDER BY -ref_category_code;

 
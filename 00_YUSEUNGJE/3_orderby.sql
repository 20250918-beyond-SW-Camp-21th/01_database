-- 2. order by : result set을 정렬
SELECT * FROM tbl_menu;

SELECT 
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 -- ORDER BY menu_price ASC; -- Ascending Order 오름차순
 -- ORDER BY menu_price; -- asc는 생략해도된다. (default) 
  ORDER BY menu_price DESC; -- desc는 내림차순 
  
 -- 정렬 기준 상 동일한 값이 있을 때
 -- 그 다음 정렬 기준을 세울 수 있다.
 SELECT 
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC, menu_code;
  
 -- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
 SELECT
        menu_code
      , menu_name
      , menu_price * menu_code
   FROM tbl_menu
  ORDER BY menu_price * menu_code
  
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
 SELECT FIELD('D', 'A', 'B', 'C'); -- 0은 찾는 값이 없을 경우
-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.
SELECT 
	 menu_name
     , orderable_status
     , FIELD(orderable_status, 'Y', 'N') 판매여부
  FROM tbl_menu
 ORDER BY 판매여부; -- FIELD(orderable_status, 'Y', 'N');
 
-- null 값의 정렬 방식
SELECT 
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
--  ORDER BY ref_category_code;
--  ORDER BY ref_category_code DESC;
  ORDER BY -ref_category_code;

 
 
 
 
 
 
 
 
 
 
 
  
# 2. order by : 결과 세트 정렬
 
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
--  ORDER BY menu_price ASC;	-- ASC는 오름차순
 ORDER BY menu_price;
 
 
 SELECT                                       
       menu_code                             
     , menu_name                             
     , menu_price                            
  FROM tbl_menu                              
 ORDER BY menu_price DESC;	-- DESC는 내림차순
 
 # 정렬 기준 상 동일한 값이 있을 때
 # 그 다음 정렬 기준을 세울 수 있다.
 SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC, menu_name ASC;
 
 # order by 절 뒤에 컬럼명 외에 연산 결과, 
 # 별칭 등을 사용menudb할 수 있다.
SELECT
	menu_code '메뉴 코드',
	menu_name '메뉴명',
	menu_price * menu_code '연산 결과'
	FROM tbl_menu
	ORDER BY '연산 결과';
	
# field 함수
SELECT FIELD('A', 'A', 'B', 'C'); # 1 -> A의 위치
SELECT FIELD('B', 'A', 'B', 'C'); # 2 -> B의 위치가 어딨나
SELECT FIELD('C', 'A', 'B', 'C'); # 3 -> C의 위치가 어딨나
SELECT FIELD('Z', 'A', 'B', 'C'); # 0 -> 찾는 값이 없을 때
# => Field를 활용해서 정렬 데이터 기준을 설정할 수 있다.

SELECT
	 menu_name
	,orderable_status
	,FIELD(orderable_status, 'Y','N') 
	FROM tbl_menu;
	
SELECT
	*
	FROM tbl_menu;
	
SELECT
	 menu_name
	,orderable_status
	FROM tbl_menu
	ORDER BY FIELD(orderable_status, 'Y','N');
	
# null 값의 정렬 방식
SELECT 
	 category_code
	,category_name
	,ref_category_code
	FROM tbl_category;
	
	
SELECT 
	 category_code
	,category_name
	,ref_category_code
	FROM tbl_category
	#ordery BY ref_category_code;
	order BY ref_category_code DESC; #Null 값을 아래로.
	
select 
		menu_code
		, menu_name
		, menu_price * menu_code
	from tbl_menu
	order by menu_price * menu_code

	
select
	menu_code '메뉴코드'
	,menu_name '메뉴명'
	, menu_price * menu_code '연산결과'
	from tbl_menu
	order by 연산결과
	

	-- field 함수
	select FIELD('A','A','B','C'); --- 1
	
	select FIELD('B','A','B','C'); --- 2
	 
	select FIELD('C','A','B','C'); --- 3
	
	select FIELD('D','A','B','C'); --- 0은 찾는 값이 없을 경우
	
	-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.
	select
			menu_name
		,   orderable_status
		,	FIELD(orderable_status, 'Y', 'N') as 판매여부
	from tbl_menu
	order by 판매여부; -- FIELD(orderable_status, 'Y', 'N');
	
	-- null 값의 정렬 방식
	select
	      category_code
		, category_name
		, ref_category_code
	from tbl_category
	-- order by ref_category_code
	-- order by ref_category_code desc;
	-- order by ref_category_code asc;
	order by -ref_category_code;
	
	
	
	
	
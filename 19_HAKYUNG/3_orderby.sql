-- 2. order by : result set을 정렬
select * from tbl_menu;

select
      menu_code
    , menu_name
    , menu_price
  from tbl_menu
  order by menu_price desc, menu_name asc; -- 생략하면 디폴트로 asc
  
  
 select
        menu_code as '메뉴코드'
      , menu_name as '메뉴이름'
      , menu_price * menu_code as '연산결과'
    from tbl_menu
  order by '메뉴코드', '연산결과' desc;

 SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');

SELECT 
       FIELD(orderable_status, 'N', 'Y')
  FROM tbl_menu;

SELECT
       menu_name
     , orderable_status
  FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y');

-- null 값이 있는 컬럼에 대한 정렬
SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
--  ORDER BY ref_category_code ASC;
 ORDER BY ref_category_code;	-- ASC 생략 가능
 
 SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY -ref_category_code DESC;	-- 마이너스(-)부호를 붙이고 DESC를 적용해 주면 된다.
                                    -- 마이너스 부호는 null을 제외하고 정렬을 반대로 뒤집는 것이다.

 SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY ref_category_code DESC;
 
 
 
 SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY -ref_category_code ASC;
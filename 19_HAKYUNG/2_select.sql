select
        menu_name
  from tbl_menu;

select 
        menu_code
      , menu_name
      , menu_price
      , category_code 
      , orderable_status 
  from tbl_menu;

select
       *
  from tbl_menu;

select now() as nowtime;
-- as 키워드는 컬럼의 별칭 지정

select concat('홍', ' ', '길동');
select concat('홍', ' ', '길동') as name;
select concat('홍', ' ', '길동') as 'full name';

select 1 + 3;
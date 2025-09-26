-- 2. order by : result set을 정렬
use menudb;
select * from tbl_menu;

select
    menu_code,
    menu_name,
    menu_price
from tbl_menu
order by menu_price DESC ; -- ASC는 생략 가능.

-- 정렬 기준 상 ㄷ오일한 값이 있을 때
-- 그 다음 정렬 기준을 세울 수 있다.
select
    menu_code,
    menu_name,
    menu_price * menu_code
from tbl_menu
order by menu_price * menu_code; -- ASC는 생략 가능.

select
    menu_code '메뉴 코드',
    menu_name '메뉴명',
    menu_price * menu_code '연산 결과'
from tbl_menu
order by `연산 결과` DESC; -- ASC는 생략 가능.

-- field 함수

SELECT FIELD('A', 'A', 'B', 'C'); -- 1
SELECT FIELD('B', 'A', 'B', 'C'); -- 2
SELECT FIELD('C', 'A', 'B', 'C'); -- 3
SELECT FIELD('D', 'A', 'B', 'C'); -- 0
-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.
SELECT
        menu_name
     ,  orderable_status
     , FIELD(orderable_status, 'Y', 'N') 판매여부
  FROM tbl_menu
 ORDER BY 판매여부;

-- 널 값의 정렬 방식
SELECT
      category_code,
      category_name,
      ref_category_code
    From tbl_category
 order by  ref_category_code DESC;
-- 06. limit: select ㅜㅁㄴ의 결과 집합에서 반환할 행의 갯수 제한

use menudb;

SELECT
    menu_code,
    menu_name,
    menu_price
    from tbl_menu
ORDER BY menu_price
LIMIT 1,4;

SELECT
    menu_code,
    menu_name,
    menu_price
    from tbl_menu
ORDER BY menu_price
LIMIT 5;
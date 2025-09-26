-- 06. limit :
SELECT
        menu_code
      , menu_name 
      , menu_price 
  FROM tbl_menu
  ORDER BY menu_price
  LIMIT 1, 4;

-- offset: 시작할 행의 번호 (0-based index)
-- row_count: 이후 행부터 반환 받을 행의 개수

-- offset은 생략 가능, row_count만 입력하면 top-n행 반환
SELECT
        menu_code
      , menu_name 
      , menu_price 
  FROM tbl_menu
  ORDER BY menu_price
  LIMIT 4;


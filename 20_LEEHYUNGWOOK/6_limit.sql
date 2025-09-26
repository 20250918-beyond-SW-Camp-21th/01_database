# 6. LIMIT 키워드는 SELECT문의 결과 집합에서 
# 반환할 행의 수를 제한하는데 사용된다.

SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
ORDER BY
    menu_price DESC;

# LIMIT 사용
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC
 LIMIT 1, 4;

# 
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC
 LIMIT 5;
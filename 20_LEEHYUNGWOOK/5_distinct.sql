-- 5. distinct: 중복 컬럼 값 제거 후 조회

# 메뉴 테이블에 존재하는 카테고리 종류 조회

SELECT 
       DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;

# NULL값을 포함한 열의 DISTINCT 사용
SELECT
       DISTINCT ref_category_code
  FROM tbl_category;

SELECT
       DISTINCT ref_category_code
  FROM tbl_category
  ORDER BY 1 /*DESC*/; #순번으로 정렬
  
 # 다중열 DISTINCT 사용
  
  SELECT 
       category_code
     , orderable_status
  FROM tbl_menu;
  
  SELECT 
       DISTINCT category_code
     , orderable_status
  FROM tbl_menu;
  
 SELECT 
       DISTINCT *
  FROM tbl_menu;
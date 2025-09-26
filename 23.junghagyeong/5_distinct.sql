-- 05. DISTINCT : 중복 컬럼 값 제거 후 조회

-- 메뉴 테이블에 존재하는 카테고리의 종류 조회
SELECT 
	   DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;

-- null 값이 존재하는 컬럼에 사용
SELECT
       DISTINCT ref_category_code
  FROM tbl_category
  ORDER BY 1 DESC; -- 1이 들어 온것은 ref_category_code의 정렬 순서를 정하는거

-- 다중열에 DISTINCT 사용
SELECT
       DISTINCT category_code -- 무조건 DISTINCT은 맨앞에 와야함
     , orderable_status -- 여기에 DISTINCT 이거 붙이면 오류
  FROM tbl_menu;


-- 5_distinct: 중복 컬럼 값 제거 조회
USE menudb;

SELECT category_code
FROM tbl_menu
ORDER BY category_code;

-- 메뉴가 존재하는 카테고리의 종류를 뽑을 때 Distinct를 쓸 수 있다.
SELECT DISTINCT category_code
FROM tbl_menu
ORDER BY category_code;

SELECT DISTINCT ref_category_code
FROM tbl_category
WHERE ref_category_code IS NOT NULL
ORDER BY 1 DESC;

SELECT distinct category_code,  orderable_status
FROM tbl_menu;
# WHERE절은 특정 조건에 맞는 레코드만을 
# 선택하는데 사용되며 다양한 방법으로 조건을 설정할 수 있다.

# 1. 비교 연산자
# 값이 일치하는지 확인

SELECT
	 	 menu_code
     , menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y';

# 2. 정수
SELECT
       menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE menu_price = 13000;

# 값이 일치하지 않는지 확인
SELECT
       menu_code
     , menu_name
     , orderable_status
  FROM tbl_menu
--  WHERE orderable_status <> 'Y';
 WHERE orderable_status != 'Y';

# 대소 비교
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 --WHERE menu_price > 20000;
 WHERE menu_price <= 20000;

# 2. 논리연산자(AND)
SELECT
       menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
  WHERE orderable_status = 'Y'
   		AND category_code = 10;

# 3. 논리연산자(OR)
SELECT
       menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y'
    OR category_code = 10
 ORDER BY category_code;

# AND 와 OR 중 우선순위가 더 높은 것
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 4
    OR menu_price = 9000
   AND menu_code > 10;

# OR 우선으로 해보면
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE (category_code = 4
    OR menu_price = 9000)
   AND menu_code > 10;


# 3. BETWEEN AND 연산자
SELECT
       menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE menu_price >= 10000 # 10000 <= menu_price <= 25000
   AND menu_price <= 25000
 ORDER BY menu_price;

SELECT
       menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE menu_price BETWEEN 10000 AND 25000 # 동일한 의미
 ORDER BY menu_price; #가격 순으로 10000-25000 사이
 
# 부정표현 NOT
SELECT
       menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000
 ORDER BY menu_price;

# 4. LIKE 연산자 %
SELECT
        *
   FROM tbl_menu
   WHERE menu_name LIKE '%마늘%'; #어디가 되었든 "마늘"포함되면선택

   
SELECT
        *
   FROM tbl_menu
   WHERE menu_name LIKE '아메리카노'; #해당 키워드로 시작하는 것
   
   
SELECT
        *
   FROM tbl_menu
   WHERE menu_name LIKE '흑%'; #어디가 되었든 "마늘"포함되면선택
   
SELECT
        *
   FROM tbl_menu
   WHERE menu_name LIKE '_마늘%'; # escape 문자

# NOT 추가
SELECT
        *
   FROM tbl_menu
   WHERE menu_name NOT LIKE '_마늘%'; # 마늘 빼고 다찾기
   
# 연습문제
SELECT
		*
	 FROM tbl_menu
	 WHERE menu_price >= 5000 
	 	AND category_code = 10 
	 	AND menu_name LIKE '%갈치%';\

# IN 연산자

# IN 없이
SELECT 
        *
   FROM tbl_menu
  WHERE category_code = 4
     OR category_code = 5
     OR category_code = 6
  ORDER BY category_code;
# OR 대신 IN을 사용하여 단축시킬 수 있다.
SELECT 
        *
   FROM tbl_menu
  WHERE category_code IN (4, 5, 6) # IN() 안에있는 부분에 포함o
  ORDER BY category_code;

SELECT 
        *
   FROM tbl_menu
  WHERE category_code NOT IN (4, 5, 6) # IN() 안에있는 부분에 포함o
  ORDER BY category_code;

#IS NULL 연산자 활용 (비교 연산자 사용 불가)

SELECT 
       *
  FROM tbl_category
  -- WHERE ref_category_code = NULL; = 안됨
  -- WHERE ref_category_code IS 'NULL'; ''안됨 
 WHERE ref_category_code IS NULL;

# 부정
SELECT 
       *
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;
-- =======================================================
-- 14. ddl
-- =======================================================
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용되는 SQL의 한 부분이다.

-- -------------------------------------------------------
-- (1) CREATE---------------------------------------------
CREATE TABLE IF NOT EXISTS tb1 (
    pk INT PRIMARY KEY, -- 컬럼 레벨에서  제약조건 추가 > 행을 식별할 수 있는 컬럼
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N')) -- 테이블 레벨에서 제약조건 추가
) ENGINE=INNODB;

DESCRIBE tb1;
DESC tb1;-- 줄여서 쓸 수도 있다.

INSERT INTO tb1 VALUES (1, 10, 'Y');
SELECT * FROM tb1;

-- auto increment 적용한 테이블 생성 -- ------------------------
DROP TABLE IF EXISTS tb2;
CREATE TABLE IF NOT EXISTS tb2 (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

DESC tb2;

INSERT INTO tb2 VALUES (null, 10, 'Y');
INSERT INTO tb2 VALUES (null, 20, 'Y');
-- AUTO_INCREMENT 적용하여 NULL 값을 넣어도 자동으로 index가주어짐. --
SELECT * FROM tb2;
-- -------------------------------------------------------
-- (2) ALTER :테이블에 추가/변경/수정/삭제하는 모든 것은 
-- 			  ALTER 명령어를 사용해 적용한다.
-- Alter는 UPDATE와 동작이 같지만 대상이 다르다.
-- (2-1) 열 추가(ADD)---------------------------------------
ALTER TABLE tb2
ADD col2 INT NOT NULL; -- <--

DESCRIBE tb2;

-- (2-2) 열 이름 및 데이터 형식 변경-- --------------------------
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESCRIBE tb2;

-- (2-3) 열 삭제-- ------------------------------------------
ALTER TABLE tb2
DROP COLUMN col2;

DESCRIBE tb2;

-- (2-4) 제약 조건 추가 및 삭제-- ------------------------------
ALTER TABLE tb2
DROP PRIMARY KEY;    
-- 에러 발생 there can be only one auto column and it must be defined as a key

-- AUTO_INCREMENT가 걸려 있는 컬럼은 PRIMARY KEY 제거가 안되므로 
-- AUTO_INCREMENT를 MODIFY 명령어로 제거한다(컬럼 정의 수정)
ALTER TABLE tb2
MODIFY pk INT;
-- > AUTO_INCREMENT제거
-- 이제 다시 PRIMARY KEY 제약조건 제거
ALTER TABLE tb2
DROP PRIMARY KEY;
-- > 더이상 PK 가 없다.(pk는 컬럼명이다.)

-- 다시 pk 컬럼에 PRIMARY KEY 제약조건 추가하기
ALTER TABLE tb2
ADD PRIMARY KEY(pk);

-- (2-5) 컬럼 여러개 추가하기-- --------------------------------
ALTER TABLE tb2
ADD col3 DATE NOT NULL,			
ADD col4 TINYINT NOT NULL; 

SHOW variables LIKE 'autocommit';

-- -------------------------------------------------------
-- (3) drop : 테이블 삭제 구문
DROP TABLE IF EXISTS tb2;

-- 한번에 2개의 테이블 삭제
DROP TABLE IF EXISTS tb4, tb5;

-- -------------------------------------------------------
-- (4) Truncate : 논리적으로는 WHERE절이 없는 DELETE 구문과 큰 차이가 없어 보인다. 
-- 하지만 어차피 데이터를 다 삭제할 경우 행마다 하나씩 지워지는 DELETE보다 DROP이후 바로 
-- 테이블을 재생성 해주는 TRUNCATE가 훨씬 효율적으로 한번에 테이블을 초기화 시켜준다.
-- 값을 넣어주어보자.
INSERT INTO tb1 VALUES(1, 11, 'Y');
SELECT * FROM tb1;

TRUNCATE tb1;
ROLLBACK; -- 작동되지 않음. ROLLBACK이 안됨
-- 14. DDL (Data Definition Language)
-- 데이터 정의 언어, 데이터베이스의 스키마를 정의하거나 수정

-- (1) CREATE: 테이블 생성 
CREATE TABLE IF NOT EXISTS tb (
  pk INT PRIMARY KEY,   -- PRIMARY KEY: 행을 식별할 수 있는 칼럼 
  fk INT,
  col1 VARCHAR(255), 
  CHECK(col1 IN ('Y', 'N'))
);

-- 테이블 구조 확인 
DESCRIBE tb;
DESC tb;

INSERT 
  INTO tb 
VALUES
(
  2
, 10
, 'Y'
);

SELECT * FROM tb;

CREATE TABLE IF NOT EXISTS tb2 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
);

DESC tb2;

INSERT 
  INTO tb2 
VALUES 
(
  null
, 10
, 'Y'
);

SELECT * FROM tb2;

-- (2) ALTER: 테이블에 추가/변경/수정/삭제 
-- 2-1. 열 추가 
ALTER TABLE tb2
  ADD col2 INT NOT NULL;

-- 2-2. 열 이름 및 데이터 형식 변경 
ALTER TABLE tb2 
CHANGE COLUMN fk change_fk INT;

ALTER TABLE tb2 
CHANGE COLUMN change_fk change_fk INT NOT NULL;

-- 2-3 칼럼 삭제 
ALTER TABLE tb2
 DROP COLUMN col2;

-- 2-4 제약조건 
ALTER TABLE tb2
 DROP PRIMARY KEY;

-- AUTO_INCREMENT 설정이 있을 경우 pk 제약조건 제거 불가 
-- AUTO_INCREMENT부터 제거 (칼럼 정의 수정)
ALTER TABLE tb2
MODIFY pk INT;

ALTER TABLE tb2
 DROP PRIMARY KEY;

-- 제약조건 다시 추가 수정 
ALTER TABLE tb2
  ADD PRIMARY KEY(pk);

-- 2.5 다중 칼럼 추가 
ALTER TABLE tb2
  ADD col5 DATE NOT NULL,
  ADD col4 TINYINT NOT NULL;

DESC tb2;

-- (3) DROP: 테이블 삭제 구문 
DROP TABLE IF EXISTS tb, tb2;

-- (4) TRUNCATE: 논리적으로는 DELETE 구문과 차이가 없어 보이지만 
-- DROP 이후 테이블을 재생성 해주는 구문 
-- DELETE FROM 테이블은 모든 행을 제거하는 것보다 성능적으로 빠름 

-- tb6 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
);

INSERT INTO tb1 VALUES (null, 10, 'Y');
INSERT INTO tb1 VALUES (null, 20, 'Y');
INSERT INTO tb1 VALUES (null, 30, 'Y');
INSERT INTO tb1 VALUES (null, 40, 'Y');

SELECT * FROM tb1;

-- 테이블 초기화 하기
TRUNCATE tb1;
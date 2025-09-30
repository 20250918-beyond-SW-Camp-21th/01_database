-- 14. ddl 
-- 데이터 정의언어, 데이터베이스의 스키마를 정의하거나 수정

-- (1) create
CREATE TABLE IF NOT EXISTS tb( -- if not exists : 존재하지 않으면
  pk INT PRIMARY KEY, -- primary key > 행을 식별할 수 있는 컬럼
   -- pk : 컬럼명, int : 자료형, primary key : 옵션값
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N')) 
);

-- 테이블의 구조 확인
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

-- auto increment 적용한 테이블 생성
CREATE TABLE IF NOT EXISTS tb2( 
  pk INT AUTO_INCREMENT PRIMARY KEY, 
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N')) 
);

-- insert 테스트
INSERT
  INTO tb2
VALUES
(
  NULL
, 10
, 'Y'
);

-- (2) ALTER : 테이블 추가/변경/수정/삭제
-- (2)-1. 열 추가
ALTER TABLE tb2
  ADD col2 INT NOT NULL;

DESC tb2;

-- (2)-2. 열 이름 및 데이터 형식 변경
ALTER TABLE tb2 
CHANGE COLUMN fk change_fk INT;

ALTER TABLE tb2 
CHANGE COLUMN change_fk change_fk INT NOT NULL;

-- (2)-3. 컬럼 삭제
ALTER TABLE tb2
 DROP COLUMN col2;

-- (2)-4. 제약 조건 추가 및 삭제
ALTER TABLE tb2
 DROP PRIMARY KEY; -- (아래 코드 없이 이것만 실행하면 에러. auto_increment 제거해야함)

-- auto_increment 설정이 있을 경우 pk 제약조건 제거 불가
-- auto_incremnt부터 제거(컬럼 정의 수정)
ALTER TABLE tb2
MODIFY pk INT; -- auto_increment 제거 

-- 제약 조건 다시 추가 수정
ALTER TABLE tb2
  ADD PRIMARY KEY(pk) NOT NULL;

-- (2)-5. 컬럼 다중 추가
ALTER TABLE tb2 
  ADD col3 date NOT NULL,
  ADD col4 TINYINT NOT NULL
  
INSERT
  INTO tb2
VALUES
(
  5
, 10
, 'Y'
, now()
, 10
);

-- (3) drop : 테이블 삭제 구문
DROP TABLE IF EXISTS tb2;
DROP TABLE IF EXISTS tb, tb2;

-- (4) truncate : 논리적으로는 delete 구문과 차이가 없어보이지만
-- drop 이후 테이블을 재생성해주는 구문이다.
-- delete from 테이블로 모든 행을 제거하는 것보다 성능적으로 빠름
SELECT * FROM tb;

DELETE FROM tb;

DESC tb;

truncate tb;









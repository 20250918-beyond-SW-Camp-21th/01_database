-- 14. DDL
-- 테이터 정의언어, 데이터베이스의 스키마를 정의하거나 수정

-- (1) CREATE: 테이블 생성
CREATE TABLE tb(
object의 종류 )
-- create user 같이 객체로 쓸 수 도 있다.  

CREATE TABLE tb( -- 테이블병 
pk INT PRIMARY KEY, -- primary key> 행을 식별할 수 있는 컬럼 -- 하나의 컬럼지정 
fk INT,
col1 varchar(255), -- 여기안에서는 가변적으로 255자까지 허용할 수 있다. 
CHECK(col1 IN ('Y','N'))
);

-- 위에 테이블은 3개의 컬럼이 가지고 있다.
-- CHECK(col1 IN ('Y','N')은 col1에 나타내는것을 알수 있다.
-- CHECK(col1 IN ('Y','N') table 레벨에 지정했다고 표현한다.
-- 컬럼 레벨, 테이블 레벨?    

-- pk 컬럼명 INT 자료형 primary key 옵션
-- 뒤에 primary key 가 있어서 사용 할 수 있는거다. 
CREATE TABLE IF NOT EXISTS tb( -- 만약 테이블이 없다면 만들어줘. 
pk INT PRIMARY KEY, 
fk INT,
col1 varchar(255),
CHECK(col1 IN ('Y','N'))
);

-- 테이블의 구조를 확인
DESCRIBE tb; -- 아래와 같은거다. 
DESC tb; -- DESC(discribe)

INSERT
  INTO tb 
  VALUES -- 칼럼 확인 
  (2,10,'Y');

-- auto increment 적용한 테이블 생성
CREATE TABLE IF NOT EXISTS tb2(
	pk INT AUTO_INCREMENT PRIMARY KEY ,
	fk INT,
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y', 'N'))
); 
DESCRIBE tb2;
DESC tb2;

-- insert 테스트
INSERT
INTO tb2
VALUES
(NULL, 10, 'Y');

-- (2) ALTER : 테이블에 추가/변경/수정/삭제
-- 2-1. 열추가 
ALTER TABLE tb2 -- 테이블을 수정하겠다! 
ADD col2 INT NOT NULL; 

DESC tb2;

-- 2-2. 열 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;
DESC tb2;

ALTER TABLE tb2
CHANGE COLUMN change_fk change_fk INT NOT NULL;
DESC tb2;

-- 2-3.컬럼 삭제
ALTER TABLE tb2
DROP COLUMN col2;
DESC tb2;

-- CREATE  USER > DROP USER > DROP table


SHOW DATABASES; 

-- 2-4. 제약 조건 추가 및 삭제
ALTER TABLE tb2
DROP PRIMARY KEY; -- rollback 으로 돌이길 수 없다. 

-- auto_increment 설정이 있을 경우 pk 제약조건 제거 불가
-- auto_increment 부터 제거(칼람 정의 수정)
ALTER TABLE tb2
MODIFY pk INT;

DESC tb2

-- 제약 조건을 다시 추가 수정
ALTER TABLE tb2
 ADD PRIMARY key(pk); 
DESC tb2

-- 2-5. 컬럼 다중 추가
ALTER TABLE tb2
 ADD col2 DATE NOT NULL,
 ADD col4 TINYINT NOT NULL;
DESC tb2;

SELECT * FROM tb2;

INSERT
INTO tb2
VALUES department(7, 10,'Y');

COMMIT;
ALTER TABLE tb2
DROP COLUMN col4;
SET autocommit = 1;
SHOW variables LIKE 'autocommit';

ALTER TABLE tb2
ADD col2 DATE NOT NULL;
ROLLBACK;
SELECT  * FROM tb2;

-- (3) drop : 테이블 삭제 구문
DROP TABLE IF EXISTS tb2;
DROP TABLE IF EXISTS tb, tb2; -- 여러개 한번에 지우기. 

-- (4) trancate : 논리적으로는 delete 구문과 차이가 없어보이지만
-- drop 이후 테이블을 재생성해주는 구문이다.
-- delete from 테이블로 모든 행을 제거하는 것보다 성능적으로 빠름.

SELECT  * FROM tb;
COMMIT;
ROLLBACK; 
DELETE FROM tb;

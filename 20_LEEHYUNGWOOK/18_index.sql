-- ==================================================================
-- 18 Index
-- ==================================================================

-- 인덱스 생성
-- PRIMARY KEY 제약조건을 지닌 기본 테이블 생성 후 기본 데이터 INSERT 후 조회
CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT 
  INTO phone (phone_code , phone_name , phone_price )
VALUES 
(1, 'galaxyS23', 1200000),
(2, 'iPhone14pro', 1433000),
(3, 'galaxyZfold3', 1730000);

SELECT * FROM phone;

-- 인덱스가 없는 컬럼을 WHERE절의 조건으로 활용한 조회 진행 시 EXPLAIN으로 쿼리 실행 계획 확인
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

SELECT * FROM phone WHERE phone_name = 'galaxyS23';
EXPLAIN SELECT * FROM phone WHERE phone_code = 1;


-- phone_name 컬럼에 idx_name이라는 이름의 인덱스 생성 후 확인
CREATE INDEX idx_name ON phone (phone_name);

-- 2개 이상의 컬럼을 한번에 하나의 인덱스로 설정해서 생성할 수 있다.
-- 복합 인덱스 생성
CREATE INDEX idx_name_price ON phone (phone_name, phone_price);

SHOW INDEX FROM phone;

-- 데이터베이스(스키마)에 존재하는 인덱스 조회
SELECT 	* FROM INFORMATION_SCHEMA.STATISTICS
WHERE  	TABLE_SCHEMA = 'empdb';

-- 인덱스 활용

-- 테이블에 인덱스가 설정 된 컬럼을 활용해 조회를 진행


-- 인덱스 최적화(재구성)
ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name(phone_name);

OPTIMIZE TABLE phone;
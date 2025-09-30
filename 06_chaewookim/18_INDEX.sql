-- 18. INDEX
-- 
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
 
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

EXPLAIN SELECT * FROM phone WHERE phone_code = 1;

-- phone_name 칼럼에 인덱스 생성
CREATE INDEX idx_name ON phone(phone_name);

-- 복합 인덱스 생성
CREATE INDEX idx_name_price ON phone(phone_name, phone_price);

-- 데이터베이스에 존재하는 인덱스 조회
SELECT * FROM information_schema.STATISTICS
 WHERE TABLE_SCHEMA = 'empdb';

-- 인덱스에 해당하는 칼럼 값이 변화하면 인덱스도 변환 필요
-- 인덱스 최적화(재구성)
ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name(phone_name);
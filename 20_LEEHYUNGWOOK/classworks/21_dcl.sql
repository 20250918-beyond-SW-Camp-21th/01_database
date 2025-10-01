-- ==================================================================
-- 20. dcl
-- ==================================================================
-- DCL은 root 계정에서 이루어져야 한다.
-- (1) GRANT
CREATE USER 'test'@'localhost' identified BY 'test';
SELECT * FROM USER;

CREATE DATABASE testdb;
SHOW DATABASES;

SHOW GRANTS FOR 'test'@'localhost';

GRANT ALL PRIVILEGES ON testdb.* TO 'test'@'localhost';

-- (2) REVOKE
REVOKE ALL PRIVILEGES ON testdb.* FROM 'test'@'localhost';

-- 특정 권한만 부여(SELECT, INSERT 권한만 부여)
GRANT SELECT, INSERT ON testdb.* TO 'test'@'localhost';

-- 특정 권한만 취소(INSERT 권한만 취소) => (SELECT 권한만 잔여)
REVOKE INSERT ON testdb.* FROM 'test'@'localhost';

-- 사용자에게 모든 데이터베이스에 대한 특정 권한 부여
GRANT SELECT, UPDATE, DELETE ON *.* TO 'test'@'localhost';

-- 사용자에게서 모든 데이터베이스에 대한 특정 권한 취소
REVOKE DELETE ON *.* FROM 'test'@'localhost';


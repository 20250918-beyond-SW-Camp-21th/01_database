-- 21. DCL
-- 계정 권한을 부여해주기 위해서 root계정으로 접속후 테스트를 진행

CREATE USER 'test'@'localhost' identified BY 'test';
USE mysql;
SELECT * FROM USER;

CREATE DATABASE testdb;
SHOW DATABASES;

SHOW GRANTS FOR 'test'@'localhost';
-- 권한 부여
GRANT ALL PRIVILEGES ON testdb.* TO 'test'@'localhost';

-- 권한 회수
REVOKE ALL PRIVILEGES ON testdb.* FROM 'test'@'localhost';

-- 특정 권한만 부여
GRANT SELECT, INSERT ON testdb.* TO 'test'@'localhost';

-- 특정 권한만 회수
REVOKE INSERT ON testdb.* FROM 'test'@'localhost';


GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'test'@'localhost';

REVOKE SELECT, INSERT, UPDATE, DELETE ON *.* FROM 'test'@'localhost';


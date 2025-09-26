-- db 생성 
-- db 이름 : ott_platform

-- 계정 생성
-- id : 'ott_admin'@'%'
-- pwd : admin

-- 권한 전부 제공 

show databases;
USE mysql;

SHOW tables;

SELECT * FROM user;

CREATE DATABASE ott_platform;

CREATE USER 'ott_admin'@'localhost' IDENTIFIED BY 'admin';

SELECT * FROM user;

GRANT ALL PRIVILEGES ON ott_platform.* TO 'ott_admin'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'ott_admin'@'localhost';

CREATE DATABASE empdb;

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employee';

GRANT ALL PRIVILEGES ON empdb.* TO 'employee'@'localhost';
SHOW GRANTS FOR 'employee'@'localhost';
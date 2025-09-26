CREATE DATABASE menudb;

SHOW GRANTS FOR 'swcamp'@'%';

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';
SHOW GRANTS FOR 'swcamp'@'%';
create database employeedb;
show databases;
grant all privileges on employeedb.* to 'swcamp'@'%'
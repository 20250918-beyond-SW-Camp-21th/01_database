CREATE DATABASE menudb;

SHOW GRANTS FOR 'swcamp'@'%';

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';
GRANT ALL PRIVILEGES ON employeedb.* TO 'swcamp'@'%';


SHOW GRANTS FOR 'swcamp'@'%';
create database employeedb; 
show databases;
CREATE DATABASE menudb;

SHOW GRANTS FOR 'swcamp'@'%';

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

SHOW GRANTS FOR 'swcamp'@'%';

CREATE DATABASE employeedb;
show databases;
GRANT ALL PRIVILEGES ON employeedb.* TO 'swcamp'@'%';
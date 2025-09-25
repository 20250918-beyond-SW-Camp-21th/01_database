SHOW DATABASES;

CREATE DATABASE empdb;

CREATE USER 'employee'@'%' IDENTIFIED BY  'employee';

GRANT ALL PRIVILEGES ON empdb.* TO 'employee'@'%';

SHOW GRANTS FOR 'employee'@'%';
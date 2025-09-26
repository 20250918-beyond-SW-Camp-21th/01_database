create database ott_platform;

CREATE USER 'ott_admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON ott_platform.* TO 'ott_admin'@'%';
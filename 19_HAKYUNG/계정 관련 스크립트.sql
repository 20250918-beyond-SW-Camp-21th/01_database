-- SQL scripts: DB에서 데이터를 불러오는 걸 기록하는 것, .sql확장자 사용
-- 필요할 때마다 정보를 가져오는 것, 자주 불러오는 내용을 스크립트 형태로 정리
-- 즉 데이터베이스에 대해 어떤 정보를 가져올지에 대한 질의 정보를 저장한 파일이 스크립트 파일

-- 계정 생성 후 데이터베이스 활용

-- 1) 새로운 swcamp 계정 만들기
 -- 'localhost' 대신 '%'를 쓰면 외부 ip로 접속 가능하다.

-- 현재 존재하는 데이터베이스 확인
SHOW DATABASES;
	
-- mysql 데이터베이스로 계정 정보 확인하기
USE mysql;	-- 기본 적으로 제공되는 mysql database

SELECT * FROM user;	-- mysql database에서 user를 확인해 계정이 추가된 것을 확인한다.
-- it's same thing [select * from mysql.user;]

-- 2) 데이터베이스 생성 후 계정에 권한 부여

-- 데이터베이스(스키마) 생성
CREATE DATABASE menudb;
-- CREATE SCHEMA menudb;
-- MySQL 또는 MariaDB는 개념적으로 database와 schema를 구분하지 않는다.
-- (CREATE DATABASE와 CREATE SCHEMA가 같은 개념이다.)
-- root에서만 데이터베이스 생성 가능하다. 생성 후에 특정 유저에게 권한을 줘야지 그 유저가 접근 가능하다.

-- 데이터베이스 생성 완료 확인
SHOW DATABASES;

-- swcamp 계정의 권한 확인하기
SHOW GRANTS FOR 'swcamp'@'%';

-- 왼쪽 Navigator를 새로고침해서 menudb database(schema)가 추가된 것을 확인한다.

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';	-- menu에 대한 모든 권한 부여

-- swcamp 계정의 바뀐 권한 확인하기
SHOW GRANTS FOR 'swcamp'@'%';

-- 3) 새로운 접속기 생성 후 접속하고 데이터베이스 활용하기
-- 좌측 상단의 '파일' 버튼을 눌러 '세션 관리자'에서 '신규'로 swcamp 계정 접속기를 만들어
-- 접속하고 database(schema)를 사용한다.
-- 접속기의 Connection Name은 'SWCAMP'로 지정
-- Parameters의 Username은 'swcamp'로 지정(계정명)
-- Default Schema(기본 데이터베이스(스키마) 설정)는 'menudb'로 지정
USE menudb;

CREATE DATABASE employeedb;
SHOW DATABASES;
GRANT ALL PRIVILEGES ON employeedb.* TO 'swcamp'@'%';
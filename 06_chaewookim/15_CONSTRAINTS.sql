-- 15. CONSTRAINTS(제약조건)

-- (1) NOT NULL: NULL 값을 허용하지 않음 
CREATE TABLE IF NOT EXISTS user_notnull (
  user_no INT NOT NULL,           -- 컬럼 레벨의 제약조건 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255)
);

INSERT INTO user_notnull VALUES
(
  1
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

INSERT INTO user_notnull VALUES
(
  2
, NULL -- NOT NULl 제약조건이 걸려 있기 때문에 오류 발생 
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

SELECT * FROM user_notnull;

-- (2) UNIQUE: 중복 값을 허가하지 않음 
CREATE TABLE IF NOT EXISTS user_unique (
  user_no INT NOT NULL UNIQUE,           -- 컬럼 레벨의 제약조건 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255)
);

DESC user_unique;

INSERT INTO user_unique VALUES
(
  1 -- UNIQUE이기 때문에 겹치면 안 됨 
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

SELECT * FROM user_unique;

CREATE TABLE IF NOT EXISTS user_unique2 (
  user_no INT NOT NULL, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  UNIQUE(user_no) -- 테이블 레벨
);

INSERT INTO user_unique2 VALUES
(
  1 -- UNIQUE이기 때문에 겹치면 안 됨 
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

-- (3) PRIMARY KEY: 테이블의 식별자 역할 진행, 한 행을 구분 
-- NOT NULL + UNIQUE 성질 
-- 한 테이블 당 하나만 설정 가능 
CREATE TABLE IF NOT EXISTS user_primary (
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  PRIMARY KEY(user_no) -- 테이블 레벨 제약조건 
);

INSERT INTO user_primary VALUES
(
  1 
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

INSERT INTO user_unique2 VALUES
(
  NULL 
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
);

-- (4) FOREIGN KEY: 참조 제약 조건 (참조 무결성 위배하지 않도록)
CREATE TABLE IF NOT EXISTS user_grade (
  grade_code INT UNIQUE,
  grade_name VARCHAR(255) NOT NULL
);

INSERT INTO user_grade VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

SELECT * FROM user_grade;

CREATE TABLE IF NOT EXISTS user_foreignkey ( -- 자식 테이블 
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  grade_code INT,
  PRIMARY KEY(user_no),
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
);

DESC user_foreignkey;

INSERT INTO user_foreignkey VALUES
(
  1
, 'user_01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
, 10
);

INSERT INTO user_foreignkey VALUES
(
  3
, 'user_03'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
, NULL
);

SELECT * FROM user_foreignkey;

DELETE
  FROM user_grade
 WHERE grade_code = 10; -- 참조 제약조건에 위배되기 때문에 단독 삭제 불가 
 
DELETE
  FROM user_grade
 WHERE grade_code = 10; 
 
-- 삭제 롤 변경 
CREATE TABLE IF NOT EXISTS user_foreignkey2 ( -- 자식 테이블 
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  grade_code INT,
  PRIMARY KEY(user_no),
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  ON UPDATE SET NULL ON DELETE SET NULL
);

INSERT INTO user_foreignkey2 VALUES
(
  1
, 'user_03'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
, 10
);

INSERT INTO user_foreignkey2 VALUES -- FK 제약조건 위반 
(
  2
, 'user_03'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
, 40
);

SELECT * FROM user_foreignkey2;

DELETE
  FROM user_grade
 WHERE grade_code = 10;

CREATE TABLE IF NOT EXISTS user_foreignkey3 ( -- 자식 테이블 
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  grade_code INT,
  PRIMARY KEY(user_no),
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  -- 수정 및 삭제 시 함께 삭제 
  ON UPDATE CASCADE 
  ON DELETE CASCADE
);

INSERT INTO user_foreignkey3 VALUES -- FK 제약조건 위반 
(
  1
, 'user_03'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@gmail.com'
, 30
);

SELECT * FROM user_foreignkey3;

DELETE
  FROM user_grade
 WHERE grade_code = 30;

SELECT * FROM user_grade;

-- (5) CHECK 제약조건: 제약조건 위반 시 반영되지 않음 
CREATE TABLE IF NOT EXISTS user_check (
  user_no INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3) CHECK (gender IN ('남', '여')),
  age INT CHECK(age >= 19)
);

INSERT INTO user_check VALUES (null, '홍길동', '남', 25),
(null, '이순신', '남', 33);

SELECT * FROM user_check;

INSERT INTO user_check VALUES (null, '홍길동', '남', 16);
INSERT INTO user_check VALUES (null, '홍길동', '남자', 25);

-- (6) DEFAULT: 칼럼에 null 값 대신 기본 값 적용 가능 
CREATE TABLE IF NOT EXISTS tbl_country (
  country_code INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255) DEFAULT '한국',
  population VARCHAR(255) DEFAULT '0명',
  add_day DATE DEFAULT (CURRENT_DATE),
  add_time DATETIME DEFAULT (CURRENT_TIME)
);

INSERT INTO tbl_country VALUES (NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM tbl_country;
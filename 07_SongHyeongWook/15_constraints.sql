-- 15. constraints (제약조건)

-- (1) not null : null 값을 허용하지 않음. // 테이블 레벨 지정 불가
CREATE TABLE IF NOT EXISTS user_notnull (
  user_no INT NOT NULL,           -- 컬럼 레벨의 제약조건 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255)
);

INSERT
  INTO user_notnull
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
)

INSERT -- 오류
  INTO user_notnull
VALUES
(
  2
,  null
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
)

DESC user_notnull;
SELECT * FROM user_notnull;


-- (2) unique : 중복값 허가하지 않음
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

INSERT
  INTO user_unique
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
)

SELECT * FROM user_unique;
DESC user_unique;

------------------------------------------ 
CREATE TABLE IF NOT EXISTS user_unique2 (
  user_no INT NOT NULL, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  UNIQUE(user_no) -- 테이블 레벨의 제약조건
);

DESC user_unique2;

INSERT
  INTO user_unique2
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
)

SELECT * FROM user_unique2;

-- (3) primary key : 테이블의 식별자 역할 (한 행을 구분)
-- not null + unique
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

INSERT
  INTO user_primary
VALUES
(
  null
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
)

DESC user_primary;
SELECT * FROM user_primary;

-- (4) foreign key : 참조 제약 조건 (참조 무결성 위배하지 않도록)
CREATE TABLE IF NOT EXISTS user_grade (
  grade_code INT UNIQUE,
  grade_name VARCHAR(255) NOT NULL
);

INSERT INTO user_grade VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원'),
(NULL, '좋은회원');

SELECT * FROM user_grade;

CREATE TABLE IF NOT EXISTS user_foreignkey (
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  grade_code INT,
  PRIMARY KEY(user_no), -- 테이블 레벨 제약조건
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  -- pk가 없으므로 명시적으로 등록해줌
);

DESC user_foreignkey

INSERT
  INTO user_foreignkey
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
, 10
);

INSERT
  INTO user_foreignkey
VALUES
(
  2
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
, 50 -- 외래키 참조 오류
);

INSERT
  INTO user_foreignkey
VALUES
(
  3
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
, NULL -- grade_code가 not null이 아니기 때문에 null 가능
);

SELECT * FROM user_foreignkey

-- 삭제. (사용하고 있는 grade_code는 제약조건 위배)
DELETE
  FROM user_grade
 WHERE grade_code = 10;

-- 삭제 롤 변경
CREATE TABLE IF NOT EXISTS user_foreignkey2 (
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  grade_code INT,
  PRIMARY KEY(user_no), -- 테이블 레벨 제약조건
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  -- 삭제를 생략시 삭제 불가
  ON UPDATE SET NULL ON DELETE SET NULL
  -- 수정 또는 삭제시 NULL값으로 변경
);

INSERT
  INTO user_foreignkey2
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
, 10
);

SELECT * FROM user_foreignkey2

UPDATE user_foreignkey SET grade_code = 20;

-- 이제 삭제 가능
DELETE
  FROM user_grade
 WHERE grade_code = 10;

SELECT * FROM user_foreignkey2 -- 이제 NULL로 바뀜

CREATE TABLE IF NOT EXISTS user_foreignkey3 (
  user_no INT, 
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  grade_code INT,
  PRIMARY KEY(user_no), -- 테이블 레벨 제약조건
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  -- ON UPDATE SET NULL ON DELETE SET NULL
  ON UPDATE CASCADE ON DELETE CASCADE
  -- 수정 및 삭제시 함께 삭제
  );

INSERT
  INTO user_foreignkey3
VALUES
(
  1
, 'userp1'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong@naver.com'
, 30
);

SELECT * FROM user_foreignkey3

DELETE
  FROM user_grade
 WHERE grade_code = 30;

SELECT * FROM user_grade; -- grade_code : 30이 사라짐

-- (5) CHECK 제약 조건
CREATE TABLE IF NOT EXISTS user_check (
  user_no INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3) CHECK (gender IN ('남', '여')),
  age INT CHECK(age >= 19)
);

DESC user_check;

INSERT
  INTO user_check
VALUES (NULL, '홍길동', '남', '20');

SELECT * FROM user_check;

INSERT
  INTO user_check
VALUES (NULL, '홍길동', '남', '16'); -- age check 제약조건 위배

INSERT
  INTO user_check
VALUES (NULL, '홍길동', '남자', '19'); -- gender check 제약조건 위배

-- (6) default : 컬럼에 null 값 대신 기본값 적용 가능
CREATE TABLE IF NOT EXISTS tbl_country (
  country_code INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255) DEFAULT '한국',
  population VARCHAR(255) DEFAULT '0명',
  add_day DATE DEFAULT (CURRENT_DATE),
  add_time DATETIME DEFAULT (CURRENT_TIME)
);

INSERT INTO tbl_country
VALUES (NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM tbl_country;












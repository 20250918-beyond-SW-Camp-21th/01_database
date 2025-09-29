-- 15. constraints (제약조건)

-- (1) not nulll : null 값을 허용하지 않음
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull (
    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
) ENGINE=INNODB;

INSERT 
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_notnull;

INSERT
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', null, '이순신', '남', '010-222-2222', 'lee222@gmail.com');


-- (2) unique: 중복값 허가하지 않음
DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique (
    user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE (phone)
) ENGINE=INNODB;

INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_unique;
DESC user_unique;


-- (3) primary key : 테이블의 식별자 역할 (한 행을 구분)
-- not null + unique
-- 한 테이블 당 하나만 설정 가능
DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey (
--     user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no)
) ENGINE=INNODB;

INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_primarykey;

INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(2, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');


-- (4) foreign key : 참조 제약 조건(참조 무결성 위배하지 않도록)
DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade (
    grade_code INT UNIQUE,
    grade_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;
INSERT 
  INTO user_grade
VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

SELECT * FROM user_grade;

DROP TABLE IF EXISTS user_foreignkey;
CREATE TABLE IF NOT EXISTS user_foreignkey (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
    -- user_grade 테이블에 pk가 없으므로 references에 특정 열(grade_code)를 써준다.
    -- 괄호에 아무것도 쓰지 않으면 해당 테이블의 pk를 참조한다.
) ENGINE=INNODB;
INSERT 
  INTO user_foreignkey
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

SELECT * FROM user_foreignkey;
-- INSERT 
--   INTO user_foreignkey
-- (user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
-- VALUES
-- (3, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 40);
INSERT 
  INTO user_foreignkey
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', NULL);

DELETE FROM user_grade WHERE grade_code = 10;

-- 삭제 롤 변경
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
    -- 여기까지 쓰면 참조키가 존재할 때 해당 키 삭제/업데이트 불가
    ON UPDATE SET NULL ON DELETE SET NULL
    -- 수정 및 삭제 시 null 값으로 변경
) ENGINE=INNODB;

INSERT 
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

SELECT * FROM user_foreignkey2;

INSERT INTO user_foreignkey2
VALUES
(3, 'user01', 'pass03', '333', '여', '010-2345-6778', 'asdf@gmail.com', 30);

DELETE FROM user_grade WHERE grade_code = 30;
SELECT * FROM user_grade;

DELETE FROM user_foreignkey2 WHERE user_no = 3;
SELECT * FROM user_foreignkey2 ;
DESC user_foreignkey2;

DROP TABLE IF EXISTS user_foreignkey3;
CREATE TABLE IF NOT EXISTS user_foreignkey3 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
    ON UPDATE CASCADE ON DELETE CASCADE 
    -- 수정 및 삭제 시 함께 삭제
) ENGINE=INNODB;

INSERT INTO user_foreignkey3
VALUES
(1, 'u1', 'p1', '홍길동', '남', '010-2345-2345', 'hong@gmail.com', 30);
SELECT * FROM user_foreignkey3;
DELETE FROM user_foreignkey3 WHERE grade_code = 30;
SELECT * FROM user_grade ;


-- check
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check (
    user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남','여')),
    age INT CHECK(age >= 19)
) ENGINE=INNODB;

INSERT 
  INTO user_check
VALUES 
(null, '홍길동', '남', 25),
(null, '이순신', '남', 33);

SELECT * FROM user_check;
INSERT INTO user_check values(NULL, '미성년', '여', 18); -- check age 위배
INSERT INTO user_check values(NULL, '미성년', '남자', 28); -- check gender 위배


-- (6) default : 컬럼에 null 값 대신 기본 값 적용가능
CREATE TABLE IF NOT EXISTS tbl_country (
  country_code INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255) DEFAULT '한국',
  population VARCHAR(255) DEFAULT '0명',
  add_day DATE DEFAULT (CURRENT_DATE),
  add_time DATETIME DEFAULT (CURRENT_TIME)
);
SELECT * FROM tbl_country ;
DESC tbl_country;

INSERT INTO tbl_country 
VALUES 
(NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
SELECT * FROM tbl_country;



DROP TABLE IF EXISTS tb;
DROP TABLE IF EXISTS tbl_country;
DROP TABLE IF EXISTS user_check;
DROP TABLE IF EXISTS user_foreignkey;
DROP TABLE IF EXISTS user_foreignkey2 ;
DROP TABLE IF EXISTS user_foreignkey3;
DROP TABLE IF EXISTS user_grade;
DROP TABLE IF EXISTS user_notnull;
DROP TABLE IF EXISTS user_primarykey ;
DROP TABLE IF EXISTS user_unique;

COMMIT;
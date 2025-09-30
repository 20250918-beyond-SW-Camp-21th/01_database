-- ===========================================================================
-- 15. constraints(제약조건)
-- ===========================================================================
-- ---------------------------------------------------------------------------
-- (1) not null : null 값을 허용하지 않음
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

-- NULL 값 없이 INSERT한 경우 정상작동한다.-------------------------------------------
INSERT 
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

-- NULL 값이 있다면 오류가 발생한다.--------------------------------------------------
INSERT 
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'null', 'pass03', '이순신', '남', '010-1234-9999', 'sunshin@gmail.com');

-- ---------------------------------------------------------------------------
-- (2) unique : 중복 값을 허용하지 않음
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

-- UNIQUE 규칙 적용한 경우---------------------------------------------------------
INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

-- UNIQUE하지 않은 (중복값)을 적었을 때는 오류가 발생한다.---------------------------------
INSERT 
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');

-- 칼럼 레벨, 테이블레벨 예시--------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_unique2 (
    user_no INT NOT NULL, -- 칼럼레벨
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE (phone, user_no) -- 테이블 레벨
) ENGINE=INNODB;

-- ---------------------------------------------------------------------------
-- (3) PRIMARY KEY : 테이블의 식별자 역할(한 행을 구분)
-- 	NOT NULL + UNIQUE : 한 테이블 당 하나만 설정 가능

DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey (
--     user_no INT PRIMARY KEY,
    user_no INT, -- 컬럼레벨
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no) -- 테이블 레벨
) ENGINE=INNODB;

INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');


-- primary key 제약조건 에러 발생(null값 적용)
-- SQL Error [1048] [23000]: (conn=213) Column 'user_no' cannot be null
INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(null, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com');

-- ---------------------------------------------------------------------------
-- (4) FOREIGN KEY : 참조 무결성을 위배하지 않기 위해 사용: 기존에 있던 내용에서 없는 것을 참조할 수 없다는 것
DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade (
    grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL
) ENGINE=INNODB; -- > 부모테이블의 역할을 함
-- 부모테이블 레코드 삽입
INSERT 
  INTO user_grade
VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

-- 자식 테이블 생성: 위에 만들어 놓은 user_grade 테이블을 참조한다.
DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,		  -- > grade_code 초기화(user_grade PK값)
    FOREIGN KEY (grade_code)  -- > 테이블 레벨에서 참조
		REFERENCES user_grade (grade_code) -- > (user_grade PK 참조)
) ENGINE=INNODB;

INSERT 
  INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
-- (2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 50); \
-- -> 왜 안되나? 부모 테이블 grade_code에 없어서 안됨. '자식'이 '부모'에서 "참조"해서 가져와야 하는데, 
--            부모 테이블에 없다면 fk 가 참조해올 수 없음


-- grade_code 10 삭제 안됨
DELETE 
  FROM user_grade
 WHERE grade_code = 10; -- > 안됨. grade_code 10을 fk로 사용하고 있기 때문에.

SELECT * FROM user_foreignkey1;

-- 삭제롤 변경
-- 삭제롤 변경 → 수정 및 삭제 시 NULL  값으로 변경
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
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
        ON UPDATE SET NULL
        ON DELETE SET NULL -- 삭제롤!!!!
) ENGINE=INNODB;

INSERT
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

INSERT -- NULL 값 넣을 수 있는 제약조건 변경!! ******근데 안됨***********
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3, 'user03', 'pass03', '홍홍홍', '남', '010-1234-56378', 'ho33ng123@gmail.com', NULL);

-- 1) 부모테이블의 grade_code 수정하기 -> 얘를 하려면 처음에 삭제롤을 넣어줘야한다.
DROP TABLE IF EXISTS user_foreignkey1;

UPDATE user_grade
   SET grade_code = null
 WHERE grade_code = 10;

-- 자식 테이블의 grade_code가 10이 었던 회원의 grade_code값이 NULL이 된 것을 확인

-- CASCADE 수정 및 삭제 시 함께 삭제
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
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
        ON DELETE CASCADE
        -- 수정 및 삭제 시 함께 삭제
) ENGINE=INNODB;

DESC user_foreignkey3;

INSERT
  INTO user_foreignkey3
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(2, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 30);

SELECT * FROM user_foreignkey3;

UPDATE user_foreignkey3
   SET grade_code = 40
 WHERE user_no = 1;

-- ---------------------------------------------------------------------------
-- (5) CHECK : check 제약 조건 위반시 허용하지 않는 제약조건
-- 유효성 제약에 포함됨.
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check (
    user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남','여')),
    age INT CHECK(age >= 19) -- > 나이, 성별 기입 체크!!!
) ENGINE=INNODB;

INSERT 
  INTO user_check
VALUES 
(null, '홍길동', '남', 25),
(null, '이순신', '남', 33);

-- GENDER 컬럼의 CHECK 에러 발생
-- CONSTRAINT `user_check.gender` 
-- failed for `empdb`.`user_check`
INSERT 
  INTO user_check
VALUES (null, '안중근', '남성', 27);
-- age 컬럼 CHECK에러 발생
-- CONSTRAINT `user_check.age` failed for 
-- `empdb`.`user_check`
INSERT 
  INTO user_check
VALUES (null, '유관순', '여', 17);

SELECT * FROM user_check;
-- ---------------------------
------------------------------------------------
-- (6) DEFAULT : 컬럼에 null 대신 기본 값 적용
DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country (
    country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국', -- > 기본값으로 '한국'
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
    -- > 값이 비어있다면 DEFAUL (초기화) 값으로 들어간다.
) ENGINE=INNODB;

SELECT * FROM tbl_country;

INSERT 
  INTO tbl_country
VALUES (null, default, default, default, default);

-- values(null, null ,null, null, null)
-- null값만 들어감
SELECT * FROM tbl_country;

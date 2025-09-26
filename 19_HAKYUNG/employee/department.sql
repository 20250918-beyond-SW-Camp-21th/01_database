create table department
(
    DEPT_ID     varchar(10)  not null
        primary key,
    DEPT_TITLE  varchar(100) null comment '부서명',
    LOCATION_ID varchar(100) not null,
    constraint IDX_DEPARTMENT_DEPT_ID_PK
        unique (DEPT_ID)
)
    comment '부서' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D1', '인사관리부', 'L1');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D2', '회계관리부', 'L1');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D3', '마케팅부', 'L1');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D4', '국내영업부', 'L1');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D5', '해외영업1부', 'L2');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D6', '해외영업2부', 'L3');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D7', '해외영업3부', 'L4');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D8', '기술지원부', 'L5');
INSERT INTO empdb.department (DEPT_ID, DEPT_TITLE, LOCATION_ID) VALUES ('D9', '총무부', 'L1');

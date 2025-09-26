create table job
(
    JOB_CODE varchar(10) not null
        primary key,
    JOB_NAME varchar(35) null comment '직급명',
    constraint IDX_JOB_CODE_PK
        unique (JOB_CODE)
)
    comment '직급' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J1', '대표');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J2', '부사장');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J3', '부장');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J4', '차장');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J5', '과장');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J6', '대리');
INSERT INTO empdb.job (JOB_CODE, JOB_NAME) VALUES ('J7', '사원');

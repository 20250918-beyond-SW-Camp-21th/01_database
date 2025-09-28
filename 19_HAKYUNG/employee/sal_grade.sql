create table sal_grade
(
    SAL_LEVEL char(2) not null
        primary key,
    MIN_SAL   double  null comment '최소급여',
    MAX_SAL   double  null comment '최대급여',
    constraint IDX_SAL_GRADE_SAL_LEVEL_PK
        unique (SAL_LEVEL)
)
    comment '급여등급' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S1', 6000000, 10000000);
INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S2', 5000000, 5999999);
INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S3', 4000000, 4999999);
INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S4', 3000000, 3999999);
INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S5', 2000000, 2999999);
INSERT INTO empdb.sal_grade (SAL_LEVEL, MIN_SAL, MAX_SAL) VALUES ('S6', 1000000, 1999999);

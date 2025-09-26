create table nation
(
    NATIONAL_CODE char(2)     not null
        primary key,
    NATIONAL_NAME varchar(35) null comment '국가명',
    constraint IDX_NATION_NATIONAL_CODE_PK
        unique (NATIONAL_CODE)
)
    comment '국가' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.nation (NATIONAL_CODE, NATIONAL_NAME) VALUES ('CH', '중국');
INSERT INTO empdb.nation (NATIONAL_CODE, NATIONAL_NAME) VALUES ('JP', '일본');
INSERT INTO empdb.nation (NATIONAL_CODE, NATIONAL_NAME) VALUES ('KO', '한국');
INSERT INTO empdb.nation (NATIONAL_CODE, NATIONAL_NAME) VALUES ('RU', '러시아');
INSERT INTO empdb.nation (NATIONAL_CODE, NATIONAL_NAME) VALUES ('US', '미국');

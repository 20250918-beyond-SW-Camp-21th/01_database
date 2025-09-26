create table location
(
    LOCAL_CODE    char(2)     not null
        primary key,
    NATIONAL_CODE char(2)     not null,
    LOCAL_NAME    varchar(40) null comment '지역명',
    constraint IDX_LOCATION_LOCAL_CODE_PK
        unique (LOCAL_CODE)
)
    comment '지역' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.location (LOCAL_CODE, NATIONAL_CODE, LOCAL_NAME) VALUES ('L1', 'KO', 'ASIA1');
INSERT INTO empdb.location (LOCAL_CODE, NATIONAL_CODE, LOCAL_NAME) VALUES ('L2', 'JP', 'ASIA2');
INSERT INTO empdb.location (LOCAL_CODE, NATIONAL_CODE, LOCAL_NAME) VALUES ('L3', 'CH', 'ASIA3');
INSERT INTO empdb.location (LOCAL_CODE, NATIONAL_CODE, LOCAL_NAME) VALUES ('L4', 'US', 'AMERICA');
INSERT INTO empdb.location (LOCAL_CODE, NATIONAL_CODE, LOCAL_NAME) VALUES ('L5', 'RU', 'EU');

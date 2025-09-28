create table employee
(
    EMP_ID     varchar(3)       not null
        primary key,
    EMP_NAME   varchar(20)      not null,
    EMP_NO     char(14)         not null,
    EMAIL      varchar(25)      null comment '이메일',
    PHONE      varchar(12)      null comment '전화번호',
    DEPT_CODE  varchar(10)      null comment '부서코드',
    JOB_CODE   varchar(10)      not null,
    SAL_LEVEL  char(2)          not null,
    SALARY     double           null comment '급여',
    BONUS      double           null comment '보너스율',
    MANAGER_ID varchar(3)       null comment '관리자사번',
    HIRE_DATE  datetime         null comment '입사일',
    QUIT_DATE  datetime         null comment '퇴사일',
    QUIT_YN    char default 'N' null comment '재직여부',
    constraint IDX_EMPLOYEE_EMP_ID_PK
        unique (EMP_ID),
    constraint UQ_EMPLOYEE_EMP_NO
        unique (EMP_NO),
    constraint FK_EMPLOYEE_DEPARTMENT
        foreign key (DEPT_CODE) references department (DEPT_ID),
    constraint FK_EMPLOYEE_JOB
        foreign key (JOB_CODE) references job (JOB_CODE),
    constraint CK_EMPLOYEE_QUIT_YN
        check (`QUIT_YN` in (_utf8mb4'Y', _utf8mb4'N'))
)
    comment '사원' collate = utf8mb4_0900_ai_ci;

INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('200', '선동일', '621225-1985634', 'sun_di@ohgiraffers.com', '01099546325', 'D9', 'J1', 'S1', 8000000, 0.3, null, '1990-02-06 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('201', '송종기', '631126-1548654', 'song_jk@ohgiraffers.com', '01045686656', 'D9', 'J2', 'S1', 6000000, null, '200', '2001-09-01 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('202', '노옹철', '861015-1356452', 'no_hc@ohgiraffers.com', '01066656263', 'D9', 'J2', 'S4', 3700000, null, '201', '2001-01-01 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('203', '송은희', '070910-4653546', 'song_eh@ohgiraffers.com', '01077607879', 'D6', 'J4', 'S5', 2800000, null, '204', '1996-05-03 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('204', '유재식', '660508-1342154', 'yoo_js@ohgiraffers.com', '01099999129', 'D6', 'J3', 'S4', 3400000, 0.2, '200', '2000-12-29 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('205', '정중하', '770102-1357951', 'jung_jh@ohgiraffers.com', '01036654875', 'D6', 'J3', 'S4', 3900000, null, '204', '1999-09-09 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('206', '박나라', '030709-4054321', 'pack_nr@ohgiraffers.com', '01096935222', 'D5', 'J7', 'S6', 1800000, null, '207', '2008-04-02 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('207', '하이유', '690402-2040612', 'ha_iy@ohgiraffers.com', '01036654488', 'D5', 'J5', 'S5', 2200000, 0.1, '200', '1994-07-07 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('208', '김해술', '870927-1313564', 'kim_hs@ohgiraffers.com', '01078634444', 'D5', 'J5', 'S5', 2500000, null, '207', '2004-04-30 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('209', '심봉선', '750206-1325546', 'sim_bs@ohgiraffers.com', '0113654485', 'D5', 'J3', 'S4', 3500000, 0.15, '207', '2011-11-11 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('210', '윤은해', '650505-2356985', 'youn_eh@ohgiraffers.com', '0179964233', 'D5', 'J7', 'S5', 2000000, null, '207', '2001-02-03 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('211', '전형돈', '830807-1121321', 'jun_hd@ohgiraffers.com', '01044432222', 'D8', 'J6', 'S5', 2000000, null, '200', '2012-12-12 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('212', '장쯔위', '780923-2234542', 'jang_zw@ohgiraffers.com', '01066682224', 'D8', 'J6', 'S5', 2550000, 0.25, '211', '2015-06-17 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('213', '하동운', '621111-1785463', 'ha_dh@ohgiraffers.com', '01158456632', null, 'J6', 'S5', 2320000, 0.1, null, '1999-12-31 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('214', '방명수', '850705-1313513', 'bang_ms@ohgiraffers.com', '01074127545', 'D1', 'J7', 'S6', 1380000, null, '200', '2010-04-04 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('215', '대북혼', '881130-1050911', 'dae_bh@ohgiraffers.com', '01088808584', 'D5', 'J5', 'S4', 3760000, null, null, '2017-06-19 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('216', '차태연', '000704-3364897', 'cha_ty@ohgiraffers.com', '01064643212', 'D1', 'J6', 'S5', 2780000, 0.2, '214', '2013-03-01 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('217', '전지연', '770808-2665412', 'jun_jy@ohgiraffers.com', '01033624442', 'D1', 'J6', 'S4', 3660000, 0.3, '214', '2007-03-20 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('218', '이오리', '870427-2232123', 'loo_or@ohgiraffers.com', '01022306545', null, 'J7', 'S5', 2890000, null, null, '2016-11-28 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('219', '임시환', '660712-1212123', 'im_sw@ohgiraffers.com', null, 'D2', 'J4', 'S6', 1550000, null, null, '1999-09-09 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('220', '이중석', '770823-1113111', 'lee_js@ohgiraffers.com', null, 'D2', 'J4', 'S5', 2490000, null, null, '2014-09-18 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('221', '유하진', '800808-1123341', 'yoo_hj@ohgiraffers.com', null, 'D2', 'J4', 'S5', 2480000, null, null, '1994-01-20 00:00:00', null, 'N');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('222', '이태림', '760918-2854697', 'lee_tr@ohgiraffers.com', '01033000002', 'D8', 'J6', 'S5', 2436240, 0.35, '209', '1997-09-12 00:00:00', '2017-09-12 00:00:00', 'Y');
INSERT INTO empdb.employee (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, QUIT_DATE, QUIT_YN) VALUES ('223', '고두밋', '470808-2123341', 'go_dm@ohgiraffers.com', null, 'D2', 'J2', 'S5', 4480000, null, null, '1994-01-20 00:00:00', null, 'N');

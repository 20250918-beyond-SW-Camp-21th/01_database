use empdb;
-- 1. employee 테이블에서 이름 끝이 연으로 끝나는 사원의 이름을 출력하시오
/*
    출력

    차태연
    전지연

*/

select EMP_NAME 
from employee
where EMP_NAME like ('%연');

-- 2. employee 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 출력하시오

/*
    출력
    심봉선 0113654485
    윤은해 0179964233
    하동운 01158456632

*/

SELECT a.PHONE 
, a.EMP_NAME 
FROM employee a
WHERE a.PHONE NOT LIKE ('010%');

-- 3. employee 테이블에서 메일주소 '_'의 앞이 4자이면서, DEPT_CODE가 D9 또는 D5이고 고용일이 90/01/01 ~ 01/12/31이면서, 월급이 270만원 이상인 사원의 전체 정보를 출력하시오

/*
    출력
    201 송종기 631126-1548654 song_jk@ohgiraffers.com 01045686656 D9 J2 S1 6000000  200 2001-09-01 00:00:00 N


*/

SELECT *
FROM employee e 
WHERE e.EMAIL LIKE ('%____@%')
AND e.DEPT_CODE IN ('D9','D5')
AND e.HIRE_DATE Between '90/01/01' and '01/12/31'
AND e.SALARY > 2700000;

-- 4. employee테이블에서 현재 근무중인 사원을 이름 오름차순으로 정렬해서 출력.

/*
    출력 (23 row)
    223,고두밋
    208,김해술
    ...

*/

SELECT e.EMP_NAME 
FROM employee e 
ORDER BY e.EMP_NAME ;



-- 5. 사원별 입사일, 퇴사일, 근무기간(일)을 조회하세요. 퇴사자 역시 조회되어야 합니다.
> 함수부분이 진도가 안나가서 풀수있는분만 
/* 출력 (24 row)
    선동일 1990-02-06 00:00:00  12488 N
    송종기 2001-09-01 00:00:00  8263  N
    노옹철 2001-01-01 00:00:00  8506  N
    송은희 1996-05-03 00:00:00  10210 N
    ...

*/

SELECT e.EMP_NAME ,
e.HIRE_DATE, 
e.QUIT_DATE , 
datediff(e.QUIT_DATE , e.HIRE_DATE),
e.QUIT_YN 
FROM employee e ;

-- 6. 재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호,
-- 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
-- 참고. 퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 'N'

    /*
        출력결과
        216	차태연	01064643212	2013-03-01 00:00:00	N
        211	전형돈	01044432222	2012-12-12 00:00:00	N
        206	박나라	01096935222	2008-04-02 00:00:00	N
    */

SELECT e.EMP_ID, 
e.EMP_NAME, 
e.PHONE , 
e.HIRE_DATE , 
e.QUIT_YN  
FROM employee e 
WHERE e.QUIT_YN = 'N'
AND e.PHONE LIKE ('%2')
ORDER BY e.HIRE_DATE DESC
LIMIT 3;


-- 7. <1단계> 전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.
-- 참고. 연결된 관리자가 있다는 것은 관리자사번이 NULL이 아님을 의미함


    /*
        출력

        16
    */

SELECT count(e.EMP_ID )
FROM employee e 
WHERE e.MANAGER_ID IS NOT NULL;



-- 문제 53: 문자열 합치고 일부만 잘라내기
-- 주제: 문자열 함수 (CONCAT, LEFT)
-- 문제: users 테이블에서 각 사용자의 username과 email을 조합하여, "사용자명 (이메일앞4글자...)" 와 같은 형태로 출력하세요.

SELECT
concat(a.username, ' (', LEFT(a.email, 4), '...)')
FROM users a;

-- 문제 54: 날짜/시간 데이터 형식 바꾸기
-- 주제: 날짜/시간 함수 (DATE_FORMAT)
-- 문제: videos 테이블의 upload_date를 'YYYY년 MM월 DD일' 형식(예: '2025년 09월 30일')으로 바꾸어, 비디오의 제목과 함께 조회하세요.
(참고 : https://mariadb.com/docs/server/reference/sql-functions/date-time-functions/date_format)

SELECT v.title ,
date_format(date(v.upload_date), '%Y년 %c월 %d일' ) 
FROM videos v 

-- 문제 55:  영문 대소문자 변환하기
-- 주제: UPPER(), LOWER()
-- 문제: users 테이블에서 email은 모두 대문자로, username은 모두 소문자로 변환하여 조회하세요.
SELECT upper(u.email),lower(u.username) 
FROM users u 

-- 문제 56: 문자열 길이 측정 및 일부 잘라내기
-- 주제: LENGTH(), SUBSTRING()
-- 문제: videos 테이블에서 비디오 제목(title)의 글자 수를 title_length로, 제목의 3번째 글자부터 5글자를 substring_title로 조회하세요.

SELECT length(a.title) title_length
, substring(a.title, 3,8)
FROM videos a

-- 문제 57: 특정 문자열 찾아 바꾸기
-- 주제: REPLACE()
-- 문제: creators 테이블의 channel_description에서 '입니다'라는 단어를 '입니다!'로 모두 찾아 바꾸어 조회하세요.

SELECT REPLACE (channel_description, '니다', '니다!')
FROM creators;

-- 문제 58: 문자열 앞뒤 공백 제거하기
-- 주제: TRIM()
-- 문제: videos 테이블의 카테고리 중에 '  게임  ' 이나 '  IT/테크  ' 처럼 실수로 앞뒤에 공백이 들어간 데이터가 있다고 가정하고, TRIM() 함수를 사용하여 이 공백을 모두 제거한 후, 중복 없는 카테고리 목록을 조회하세요.
-- 공백이 포함된 가상 데이터를 만들기 위해 UNION ALL 사용

SELECT a.category
FROM videos a
GROUP by a.category 
WHERE a.category IN ('게임', 'IT/테크');

SELECT distinct trim(category)
FROM (
SELECT category
FROM videos
UNION ALL
SELECT '  게임  '
UNION ALL
SELECT '  IT/테크  ') DATA;

-- 문제 59: 문자열을 특정 길이로 만들고 빈 곳 채우기
-- 주제: LPAD()
-- 문제: videos 테이블의 video_id를 항상 5자리로 표시하고 싶습니다. ID가 5자리 미만일 경우, 왼쪽에 '0'을 채워서 5자리 문자열로 만드세요. (예: 1 -> '00001', 12 -> '00012')

SELECT Lpad(a.video_id, 5, '0')
FROM videos a


-- 문제 60: 숫자 반올림 및 올림하기
-- 주제: ROUND(), CEIL()
-- 문제: videos 테이블에서 각 비디오의 재생 시간(duration_seconds)을 60으로 나누어 '분' 단위로 변환하되, 소수점 첫째 자리에서 반올림하여 정수로 표시하고, 소수점을 무조건 올림하여 정수로도 표시해보세요.

SELECT round(a.duration_seconds/60)
, ceil(a.duration_seconds /60)
FROM videos a

--  문제 61: 날짜 계산하기
-- 주제: NOW(), DATEDIFF()
-- 문제: videos 테이블의 각 비디오에 대해, 업로드된 날로부터 오늘까지 총 며칠이 지났는지 계산하여 비디오 제목과 함께 조회하세요.

SELECT a.title,
datediff(now(), a.upload_date)
FROM videos a

-- 문제 62: 특정 기간 후의 날짜 구하기
-- 주제: DATE_ADD()
-- 문제: users 테이블에서 각 사용자의 가입일로부터 정확히 100일 후는 며칠인지 '100일 기념일'이라는 이름으로 조회하세요.

SELECT date_add(a.registration_date, INTERVAL 100 day ) '100일 기념일'
FROM users a


-- 문제 63: NULL 값을 다른 값으로 대체하기
-- 주제: IFNULL(), COALESCE()
-- 문제: creators 테이블의 채널 설명(channel_description)이 만약 NULL이라면, '설명이 없습니다.' 라는 문구로 대체하여 조회하세요.
(https://mariadb.com/docs/server/reference/sql-functions/control-flow-functions/ifnull)
(https://mariadb.com/docs/server/reference/sql-structure/operators/comparison-operators/coalesce)

SELECT ifnull(a.channel_description,'설명이 없습니다')
FROM creators a;

SELECT coalesce(a.channel_description,'설명이 없습니다')
FROM creators a;

-- 문제 64: 조건에 따라 다른 값 표시하기
-- 주제: IF()
-- 문제: videos 테이블에서 조회수가 1,000,000(백만) 이상이면 '인기 영상', 그렇지 않으면 '일반 영상'이라고 표시하는 '영상 등급' 컬럼을 추가하여, 비디오 제목과 조회수, 등급을 함께 조회하세요.
(https://mariadb.com/docs/server/reference/sql-functions/control-flow-functions/if-function)

SELECT a.title , a.view_count, IF(a.view_count > 1000000, '인기 영상', '일반 영상') '영상 등급'
FROM videos a

-- 문제 65: 데이터 타입 변환하기
-- 주제: CAST(), CONVERT()
-- 문제: videos 테이블의 video_id(숫자 타입)와 title(문자열 타입)을 CONCAT() 함수로 합쳐 '[1] 2025년 최신 스마트폰 리뷰' 와 같은 형태로 출력하세요. 이 과정에서 숫자 video_id를 문자열로 명시적으로 변환해야 합니다.

SELECT concat_ws(' ', CAST(a.video_id AS char), a.title)
FROM videos a;

-- 문제 66: 함수를 이용한 데이터 분석
-- 주제: SUBSTRING_INDEX()와 GROUP BY 응용
-- 문제: users 테이블에서 사용자의 email 주소의 도메인(예: 'example.com')만 추출하고, 이 도메인별로 사용자가 총 몇 명인지 GROUP BY를 사용하여 계산하세요.

SELECT count (substring(a.email, instr(a.email, '@'))) domain
FROM users a
GROUP BY substring (a.email, instr(a.email, '@')); 

SELECT count(substring_index (a.email, '@', -1) ) domain
FROM users a
GROUP BY substring_index (a.email, '@', -1); 

-- ========================================================
-- ========================================================

-- 문제 67: 복잡한 쿼리를 뷰(View)로 저장하기
-- 주제: CREATE VIEW
-- 문제: 사용자가 어떤 비디오에 '좋아요'를 눌렀는지 쉽게 조회할 수 있도록, 
-- users의 username, videos의 title, video_likes의 like_datetime을 JOIN하여 보여주는 v_user_likes 라는 이름의 뷰를 만드세요.

CREATE OR replace VIEW v_user_likes AS 
SELECT a. username
, b.title
, c. like_datetime
FROM users a
JOIN video_likes c ON a.user_id = c.user_id
JOIN videos b ON c.video_id = b.video_id;

SELECT * FROM v_user_likes;

-- 문제 68: 생성된 뷰(View) 활용하기
-- 주제: VIEW 활용
-- 문제: 위에서 생성한 v_user_likes 뷰를 사용하여, '겜프로'라는 사용자가 '좋아요'를 누른 비디오의 목록과 '좋아요'를 누른 시간을, 최신순으로 정렬하여 조회하세요.

SELECT title, like_datetime
FROM v_user_likes
WHERE username = '겜프로';

-- 문제 69: 뷰(View)에 그룹 함수 포함하기
-- 주제: GROUP BY를 포함하는 뷰 생성
-- 문제: 각 채널별 총 비디오 개수, 총 조회수, 평균 조회수를 요약해서 보여주는 v_creator_stats 라는 이름의 뷰를 만드세요.

CREATE OR REPLACE VIEW v_creator_stats as
SELECT avg(a.view_count) avg_views
, c.channel_name
, sum(a.view_count) total_views
, count(a.video_id) video_count
FROM videos a
RIGHT JOIN creators c ON a.creator_id = c.creator_id
GROUP BY c.channel_name;

DROP VIEW v_creator_stats;

SELECT *
FROM v_creator_stats;

-- 문제 70: 뷰(View)를 이용해 데이터 접근 제한하기 (보안)
-- 주제: 보안을 위한 뷰 활용
-- 상황: 인턴사원에게는 사용자의 개인정보(이메일, 가입일)를 제외한 user_id, username, country 정보만 보여주고 싶습니다.
-- 문제: users 테이블에서 email과 registration_date 컬럼을 제외한 v_public_users라는 이름의 뷰를 만드세요.

CREATE VIEW v_public_users AS
SELECT user_id, username, country
FROM users u 

SELECT * FROM v_public_users 

-- 문제 71: 기존 뷰(View) 수정하기
-- 주제: CREATE OR REPLACE VIEW

-- 문제: 이전에 만들었던 v_public_users 뷰에 channel_name도 함께 보여줄 필요성이 생겼습니다. 크리에이터인 사용자의 경우 채널명도 함께 나올 수 있도록 v_public_users 뷰의 내용을 수정하세요. (크리에이터가 아닌 경우 채널명은 NULL로 표시됩니다.)
CREATE OR REPLACE VIEW v_public_users AS
SELECT 
a.user_id, 
username, 
country, 
channel_name
FROM users a
JOIN creators c ON a.user_id = c.user_id;

SELECT * FROM v_public_users

DROP VIEW v_public_users_new;

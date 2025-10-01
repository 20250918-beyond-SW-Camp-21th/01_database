-- ==================================================================
-- 10.01 Assignment 5
-- ==================================================================

-- -----------------------------------------------------------------
-- 문제 72: 가장 간단한 프로시저 만들기
-- 주제: 파라미터 없는 SELECT 프로시저
-- 문제: 조회수가 100만을 넘는 '인기 비디오'의 제목과 조회수를 조회하는 
-- GetPopularVideos라는 이름의 프로시저를 만드세요.
DELIMITER //

CREATE PROCEDURE GetPopularVideos ()
BEGIN
		SELECT  title, view_count
		FROM	videos
		WHERE 	view_count > 1000000;
END //

DELIMITER ;
CALL GetPopularVideos();
-- ------------------------------------------------------------------------------------------------------------

-- 문제 73: 입력받아 동작하는 프로시저 만들기
-- 주제: IN 파라미터
-- 문제: 특정 creator_id를 입력받아, 해당 크리에이터가 올린 비디오 목록을 조회하는 
-- GetVideosByCreator라는 프로시저를 만드세요.
DELIMITER //
CREATE PROCEDURE GetVideosByCreator (
	IN c_ids VARCHAR(10) -- < INT
)
BEGIN
	SELECT	title
	FROM	videos
	WHERE	creator_id = c_ids;
END //

DELIMITER ;
-- CALL
CALL GetVideosByCreator(2);
-- TEST
SELECT title 
FROM creators a
JOIN videos b ON a.creator_id = b.creator_id
WHERE a.creator_id = 2;
-- ------------------------------------------------------------------------------------------------------------
-- 문제 74: 결과를 반환하는 프로시저 만들기
-- 주제: OUT 파라미터
-- 문제: 특정 user_id를 입력받아, 해당 사용자의 username을 결과로 반환하는 
-- GetUsernameById 프로시저를 만드세요.
DELIMITER //
CREATE PROCEDURE GetUsernameById (
	IN u_ids VARCHAR(10),
	OUT u_names VARCHAR(10)
)
BEGIN
	SELECT 	username INTO u_names
	FROM	users
	WHERE	user_id = u_ids;
END //

DELIMITER ;


SELECT user_id, username FROM users ORDER BY user_id;
SET @u_name = '';
CALL GetUsernameById(2, @u_name);
SELECT @u_name;


-- 문제 75: 조건문으로 분기하는 프로시저 만들기
-- 주제: IF 조건문
-- 문제: 비디오의 video_id를 입력받아, 조회수가 50만 이상이면 '인기 영상', 10만 이상이면 '일반 영상', 
-- 그 미만이면 '관심 필요'라는 메시지를 결과로 반환하는 GetVideoRating 프로시저를 만드세요.
DELIMITER //

CREATE PROCEDURE GetVideoRating (
	IN v_ids VARCHAR(3), -- < INT
	OUT RESULT VARCHAR(50)
)
BEGIN
	DECLARE views DECIMAL(10,2); -- < INT

	SELECT 	view_count INTO views
	FROM	videos
	WHERE 	video_id = v_ids;
	
	IF views >= 500000 THEN
		SET RESULT = '인기 영상';
	ELSE -- < ELSEIF 가능
		IF views >= 100000 THEN
			SET RESULT = '일반 영상';
		ELSE
			SET RESULT = '관심 필요';
		END IF;
	END IF;
END //

DELIMITER ;

SET @result = '';
CALL GetVideoRating(23, @result);
SELECT @result;

SELECT video_id, view_count
FROM videos;
-- ----------------------------------------------------------------------------
-- 문제 76: 입력과 출력을 겸하는 프로시저 만들기
-- 주제: INOUT 파라미터
-- 문제: 숫자 하나를 입력받아, 그 숫자에 10을 더한 후 원래 변수에 다시 저장해주는 AddTen 프로시저를 만드세요.
DELIMITER //
CREATE PROCEDURE AddTen(
	INOUT num DECIMAL(10,2)
)
BEGIN
		SET NUM = num + 10;	
END //

DELIMITER ;

SET @answer = 15;
CALL AddTen(@answer);
SELECT @answer;

-- ------------------------------------------------------------------------- 
-- CREATE TABLE video_tags (
--     video_id INT,
--     tag VARCHAR(255),
--     PRIMARY KEY (video_id, tag)
-- );
-- //////////////////
-- 문제 77: 반복문으로 데이터 처리하기
-- 주제: WHILE 반복문
-- 문제: video_tags 테이블에 특정 video_id의 태그를 여러 개 한번에 추가하는 프로시저 AddTags를 만드세요.
-- 태그는 콤마(,)로 구분된 하나의 문자열(예: 'SQL,DB,MariaDB')로 입력받습니다.
-- 힌트: CHAR_LENGTH(), SUBSTRING_INDEX(), SUBSTRING() 이용해보면 좋지않을까..
DELIMITER //
CREATE PROCEDURE AddTags (
	IN v_id INT,
	IN input_val VARCHAR(255)
)
BEGIN
	DECLARE curr_tag VARCHAR(255);
	DECLARE del_used_tag INT;

	WHILE input_val != '' DO
		SET curr_tag = SUBSTRING_INDEX(input_val, ',',1);
		SET del_used_tag = CHAR_LENGTH(curr_tag)+2;
		SET input_val = SUBSTRING(input_val, del_used_tag);
		
		INSERT
		INTO	video_tags 
		VALUES	(v_id, curr_tag);
	END WHILE;
END //

DELIMITER ;

CALL AddTags(1, 'SQL,DB,MariaDB');

SELECT * FROM video_tags;

DROP TABLE video_tags;
-- -------------------------------------------------------------------------------------------------------------- 

-- 문제 78: 프로시저 실행 중 발생하는 에러 처리하기
-- 주제: DECLARE HANDLER (에러 처리)
-- DELIMITER //

-- 문제: : 새로운 사용자를 users 테이블에 추가하는 AddUser라는 프로시저를 만드세요. 이 프로시저는 username, 
-- email, country를 입력받습니다. 만약 username이나 email이 이미 존재하여 
-- **중복 키 오류(Duplicate Key Error)**가 발생하면, 
-- '이미 존재하는 사용자 이름 또는 이메일입니다.'라는 메시지를 반환하고, 성공적으로 추가되면 
-- '새로운 사용자가 추가되었습니다.'라는 메시지를 반환하도록 만드세요.
-- 참고: 중복키 오류는 Error Code : 1062
DELIMITER //
CREATE PROCEDURE AddUser(
	IN u_name VARCHAR(255),
	IN mail VARCHAR(255),
	IN ctry VARCHAR(255)
)
BEGIN
	-- CHECK VAR
	DECLARE check_u_name VARCHAR(255);
	DECLARE check_email VARCHAR(255);

	DECLARE Duplicate_Key_Error CONDITION FOR SQLSTATE '1062';
	DECLARE EXIT HANDLER FOR Duplicate_Key_ErrorALTER 
	BEGIN
		SIGNAL SQLSTATE '1062' SET MESSAGE_TEXT = '이미 존재하는 사용자 이름 또는 이메일입니다.';
	END;
	
	SELECT username INTO check_u_name
	FROM	users
	WHERE	username = u_name;
	
	SELECT 	email INTO check_email
	FROM	users
	WHERE	email = mail;
	
END

DELIMITER ;



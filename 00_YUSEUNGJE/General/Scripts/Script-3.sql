

-- 생성한 데이터베이스 사용
USE ott_platform;

-- 1. 사용자(users) 테이블
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    country VARCHAR(50)
) ENGINE=InnoDB;

-- 2. 크리에이터/채널(creators) 테이블
CREATE TABLE creators (
    creator_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    channel_name VARCHAR(100) NOT NULL,
    channel_description TEXT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB;

-- 3. 비디오(videos) 테이블
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    creator_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    duration_seconds INT,
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    view_count BIGINT DEFAULT 0,
    FOREIGN KEY (creator_id) REFERENCES creators(creator_id)
) ENGINE=InnoDB;

-- 4. 구독(subscriptions) 테이블
CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    creator_id INT NOT NULL,
    subscription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (creator_id) REFERENCES creators(creator_id),
    UNIQUE KEY user_creator_unique (user_id, creator_id)
) ENGINE=InnoDB;

-- 5. 시청 기록(watch_histories) 테이블
CREATE TABLE watch_histories (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    watch_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    watched_seconds INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
) ENGINE=InnoDB;

-- 6. 좋아요(video_likes) 테이블
CREATE TABLE video_likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    like_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    UNIQUE KEY user_video_unique (user_id, video_id)
) ENGINE=InnoDB;
SELECT
    a.username
FROM
    users AS a
WHERE EXISTS (
    SELECT 1
    FROM videos AS b
    INNER JOIN video_likes AS c ON b.video_id = c.video_id
    WHERE c.user_id = a.user_id AND b.category = '여행'
);
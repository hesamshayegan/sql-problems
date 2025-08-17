-- stratascratch - medium

WITH all_posts AS 
    (SELECT post_date,
            COUNT(f.post_id) AS total_posts
    FROM facebook_posts f
    INNER JOIN facebook_post_views v
    ON f.post_id = v.post_id
    GROUP BY post_date
    ),
    spams AS
    (SELECT post_date,
            COUNT(v.post_id) AS spam_posts
    FROM facebook_posts f 
    INNER JOIN facebook_post_views v
    ON f.post_id = v.post_id
    WHERE post_keywords LIKE '%spam%'
    GROUP BY post_date
    )
SELECT a.post_date,
       (spam_posts/total_posts::FLOAT * 100) AS percentage
FROM all_posts a
JOIN spams s
ON a.post_date = s.post_date


-- alternative
-- WITH posts_summary AS (
--     SELECT 
--         post_date,
--         SUM(CASE WHEN v.viewer_id IS NOT NULL THEN 1 ELSE 0 END) AS n_posts
--     FROM facebook_posts p
--     JOIN facebook_post_views v ON p.post_id = v.post_id
--     GROUP BY post_date
-- ),
-- spam_summary AS (
--     SELECT 
--         post_date,
--         SUM(CASE WHEN v.viewer_id IS NOT NULL THEN 1 ELSE 0 END) AS n_spam
--     FROM facebook_posts p
--     JOIN facebook_post_views v ON p.post_id = v.post_id
--     WHERE post_keywords ILIKE '%spam%'
--     GROUP BY post_date
-- )
-- SELECT 
--     spam_summary.post_date,
--     (n_spam / n_posts::float) * 100 AS spam_share
-- FROM posts_summary
-- LEFT JOIN spam_summary ON spam_summary.post_date = posts_summary.post_date;
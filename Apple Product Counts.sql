-- stratascratch - medium

SELECT users.language,
       COUNT(DISTINCT CASE
                WHEN device IN ('macbook pro', 'iphone 5s', 'ipad air') THEN users.user_id
                ELSE NULL 
                END) AS n_apple_users,
        COUNT (DISTINCT users.user_id) AS n_total_users
FROM playbook_users users
JOIN playbook_events events
ON users.user_id = events.user_id
GROUP BY language
ORDER BY n_total_users DESC
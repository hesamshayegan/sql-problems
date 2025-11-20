-- stratascratch - medium

WITH total_emails AS (
    SELECT from_user,
           COUNT(from_user) AS total
    FROM google_gmail_emails
    GROUP BY from_user
    )
SELECT from_user,
       total, 
       RANK() OVER(ORDER BY total DESC, from_user ASC) AS activity_rank
FROM total_emails
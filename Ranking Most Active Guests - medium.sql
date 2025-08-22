-- stratascratch - medium

WITH total_messages AS 
    (SELECT id_guest, SUM(n_messages) AS total_n_messages
    FROM airbnb_contacts
    GROUP BY id_guest
    )
SELECT id_guest, 
       total_n_messages,
       DENSE_RANK() OVER(ORDER BY total_n_messages DESC) AS rank
FROM total_messages


-- alternative without CTE
-- SELECT 
--     DENSE_RANK() OVER(ORDER BY sum(n_messages) DESC) as ranking, 
--     id_guest, 
--     sum(n_messages) as sum_n_messages
-- FROM airbnb_contacts
-- GROUP BY id_guest
-- ORDER BY sum_n_messages DESC

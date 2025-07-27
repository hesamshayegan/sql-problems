-- stratascratch - medium
WITH sent_cte AS (
    -- CTE for all sent friend requests
    SELECT * from fb_friend_requests
    WHERE action = 'sent'
    ),
    accepted_cte AS (
    -- CTE for all accepted friend requests
    SELECT * from fb_friend_requests
    WHERE action = 'accepted'
    )
SELECT
    sent_cte.date AS date, -- Date the request was sent
    -- Calculate acceptance rate: (Accepted Count / Sent Count) as a float
    CAST(COUNT(accepted_cte.user_id_receiver) AS FLOAT) / COUNT(sent_cte.user_id_sender) AS percentage_acceptance
FROM
    sent_cte
    -- -- A LEFT JOIN ensures that ALL records from 'sent_cte' (all sent requests) are kept in the result set,
    -- regardless of whether a matching record exists in 'accepted_cte'.
    -- If a sent request was not accepted, the columns from 'accepted_cte' will be NULL for that row.
LEFT JOIN
    accepted_cte
ON
    -- Join conditions: match sender and receiver IDs
    sent_cte.user_id_sender = accepted_cte.user_id_sender AND
    sent_cte.user_id_receiver = accepted_cte.user_id_receiver
GROUP BY
    sent_cte.date -- Group by the date requests were sent
ORDER BY
    sent_cte.date; -- Order results by date
-- stratascratch - medium

WITH processed AS (
    SELECT type,
           COUNT(processed) AS n_processed
    FROM facebook_complaints
    WHERE processed = TRUE
    GROUP BY type
)
SELECT f.type,
       CAST(n_processed AS FLOAT) / COUNT(f.processed) AS rate
FROM facebook_complaints f
JOIN processed p
ON f.type = p.type
GROUP BY f.type, n_processed



-- using CASE and AVG 
-- it handles the case when the processed column includes NULLS
WITH complaint_data AS
  (SELECT TYPE,
          CASE
              WHEN processed THEN 1
              ELSE 0
          END AS processed_num
   FROM facebook_complaints)
SELECT TYPE,
       ROUND(AVG(processed_num)::numeric, 2) AS processed_rate
FROM complaint_data
GROUP BY TYPE
ORDER BY TYPE;
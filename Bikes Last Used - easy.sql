-- stratascratch - easy

-- faster query
SELECT bike_number, 
       MAX(end_time) as last_used
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY last_used DESC

-- window function
SELECT bike_number, end_time FROM (
    SELECT
       bike_number,
       end_time,
       ROW_NUMBER() OVER (PARTITION BY bike_number ORDER BY end_time DESC) AS rn
    FROM dc_bikeshare_q1_2012
    ) AS sub
WHERE rn = 1
ORDER BY end_time DESC
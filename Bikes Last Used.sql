-- stratascratch - easy
SELECT bike_number, 
       MAX(end_time) as last_used
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY last_used DESC

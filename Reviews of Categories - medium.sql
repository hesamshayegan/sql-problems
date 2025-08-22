-- stratascratch - medium

WITH cats AS 
    (SELECT unnest(string_to_array(categories, ';')) AS category,
    review_count
    FROM yelp_business)
SELECT SUM(review_count) AS total_reviews,
       category
FROM cats c
GROUP BY c.category
ORDER BY total_reviews DESC;

-- The STRING_TO_ARRAY() function in PostgreSQL splits a string into an array using a specified delimiter.
-- The UNNEST() function serves to expand an array into a set of rows.
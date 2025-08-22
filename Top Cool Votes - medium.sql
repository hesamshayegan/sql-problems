-- stratascratch - medium
-- 1) find the maxiumum
-- 2) retrieve the info (review_text + business_name)

-- two approaches:
-- scan and compare the whole dataset OR sort and find the max


SELECT business_name, review_text
FROM yelp_reviews
WHERE cool = (SELECT MAX(cool) FROM yelp_reviews)

-- I can't use MAX() directly in the main SELECT statement to get business_name and review_text because MAX() 
-- is an aggregate function that returns a single value for an entire group of rows, which means the database 
-- wouldn't know which individual business_name or review_text to display alongside that single maximum value.
-- To get the associated data, I must first find the maximum value and then use it in a WHERE clause or a JOIN 
-- to filter for the specific row(s) that have that value.


-- using CTE
WITH max_cool_votes AS (
    SELECT MAX(cool) AS max_cool
    FROM yelp_reviews
)
SELECT y.business_name,
       y.review_text
FROM yelp_reviews y
JOIN max_cool_votes mcv
ON y.cool = mcv.max_cool;

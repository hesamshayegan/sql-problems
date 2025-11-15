-- stratascratch - medium

SELECT 
    (CAST((SELECT COUNT(user_id) FROM fb_active_users WHERE status = 'open' AND country = 'USA') AS FLOAT)
    /
    (SELECT COUNT(user_id) FROM fb_active_users)) * 100 ratio


-- This doesn't work:

-- SELECT (american_users/total_users) 
-- FROM (
--     (SELECT COUNT(user_id) FROM fb_active_users WHERE status = 'open' AND 	country = 'USA') AS american_users, 
--     (SELECT COUNT(user_id) FROM fb_active_users) AS total_users
--     )

-- because:
-- Comma-separated items in FROM: When you put multiple items separated by commas directly in the FROM clause like this: 
--  FROM (subquery1) AS alias1, (subquery2) AS alias2, SQL treats this as a CROSS JOIN (or Cartesian product) between the results of those subqueries.

-- Scalar Subqueries as Tables: Each of your subqueries (SELECT COUNT(user_id) ...) 
-- returns a single row with a single column. When you alias these as american_users and total_users in the FROM clause, 
-- SQL tries to treat them as mini-tables, each with one row and one column.

-- No Join Condition: Because there's no JOIN keyword or ON condition specified, SQL assumes a CROSS JOIN. 
-- A CROSS JOIN combines every row from the first "table" with every row from the second "table." In your case, each "table" only has one row, 
-- so the result of the FROM clause is a single row containing both american_users and total_users as columns.


-- revised
SELECT CAST(COUNT(user_id) AS FLOAT) / (SELECT COUNT(*) FROM fb_active_users) * 100 AS user_percentage
FROM fb_active_users
WHERE country = 'USA'
        AND status = 'open'
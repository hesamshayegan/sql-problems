-- stratascratch - medium

SELECT  CASE 
            WHEN number_of_reviews = 0 THEN 'New'
            WHEN number_of_reviews >= 1 AND number_of_reviews <= 5 THEN 'Rising'
            WHEN number_of_reviews >= 6 AND number_of_reviews <= 15 THEN 'Trending Up'
            WHEN number_of_reviews >= 16 AND number_of_reviews <= 40 THEN 'Popular'
            ELSE 'Hot'
        END review_class
        , MIN(price), MAX(price), AVG(price)
FROM airbnb_host_searches
GROUP BY review_class
ORDER BY MIN(price)



-- Using CTE
--     - First CTE (host_data): Selects price, reviews from airbnb_host_searches.
--     - Second CTE (popular_hosts): Categorizes reviews into review_class with price.
--     - Select, Aggregate: Calculate min, max, average price per class.
--     - Group Results: Aggregate by the calculated review_class.
--     - Order Output: Sort by minimum price ascending.

-- WITH host_data AS 
--     (SELECT price,
--            number_of_reviews
--     FROM airbnb_host_searches), 
--         popular_hosts AS
--     (SELECT  CASE 
--                 WHEN number_of_reviews = 0 THEN 'New'
--                 WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
--                 WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
--                 WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
--                 ELSE 'Hot'
--             END AS review_class,
--             price
--     FROM host_data)
-- SELECT review_class,
--        MIN(price) AS min_price,
--        MAX(price) AS max_price,
--        AVG(price) AS avg_price
-- FROM 
--     popular_hosts
-- GROUP BY
--     review_class
-- ORDER BY
--     min_price 
-- stratascratch - medium

WITH brands_2019 AS (
    SELECT company_name, COUNT(product_name) AS count_2019
    FROM car_launches
    WHERE year = 2019
    GROUP BY company_name
),
brands_2020 AS (
    SELECT company_name, COUNT(product_name) AS count_2020
    FROM car_launches
    WHERE year = 2020
    GROUP BY company_name
)
SELECT b2.company_name,
       (b2.count_2020 - b1.count_2019) AS net_products
FROM brands_2020 b2
FULL OUTER JOIN brands_2019 b1
ON b2.company_name = b1.company_name
ORDER BY b2.company_name
-- stratascratch - medium

WITH daily AS (
    SELECT DISTINCT user_id,
                    CAST(created_at AS date) AS purchase_date
    FROM amazon_transactions
),
ranked AS (
    SELECT
        user_id,
        purchase_date,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY purchase_date) AS rn
    FROM daily
),
first_two AS (
    SELECT
        user_id,
        MAX(CASE WHEN rn = 1 THEN purchase_date END) AS first_date,
        MAX(CASE WHEN rn = 2 THEN purchase_date END) AS second_date
    FROM ranked
    WHERE rn <= 2
    GROUP BY user_id
)
SELECT user_id
FROM first_two
WHERE second_date IS NOT NULL
    AND (second_date - first_date) BETWEEN 1 AND 7
ORDER BY user_id;


-- in first_two -> When I GROUP BY user_id, I must collapse rows into a single row per user.
-- So I need an aggregation function. CASE WHEN rn = 1 picks only the first purchase date.
-- MAX() just collapses it into a single value.

-- by (WHERE rn <= 2), I reduce the data set to just the first two rows per user, massively cutting work for the database.
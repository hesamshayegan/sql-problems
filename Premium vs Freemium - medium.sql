-- stratascratch - mediums

SELECT 
    SUM(CASE WHEN paying_customer = 'yes' THEN downloads ELSE 0 END) AS paid_downloads,
    SUM(CASE WHEN paying_customer = 'no' THEN downloads ELSE 0 END) AS non_paid_downloads,
    "date"
FROM ms_download_facts
JOIN ms_user_dimension
ON ms_user_dimension.user_id = ms_download_facts.user_id
JOIN ms_acc_dimension
ON ms_acc_dimension.acc_id = ms_user_dimension.acc_id
GROUP BY "date"
HAVING SUM(CASE WHEN paying_customer = 'yes' THEN downloads ELSE 0 END) <
       SUM(CASE WHEN paying_customer = 'no' THEN downloads ELSE 0 END)
ORDER BY "date" ASC

-- Note: I can't use aliases in the HAVING clause due to the logical order in which the SQL database executes a query:

-- 1 - FROM and JOIN: The database first determines the tables involved and joins them.
-- 2 - (WHERE: Filters individual rows based on a condition.)
-- 3 - GROUP BY: Groups the filtered rows into summary rows.
-- 4 - HAVING: Filters the groups based on a condition. The database has not yet processed the SELECT list!!
-- 5 - SELECT: Calculates the final expressions and assigns aliases. This is the first time paid_downloads and non_paid_downloads exist as defined names.
-- 6 - ORDER BY: Sorts the final result set.



-- using CTE
-- WITH download_totals AS (
--     SELECT date,
--            SUM(CASE WHEN paying_customer = 'yes' THEN downloads END) AS paying,
--            SUM(CASE WHEN paying_customer = 'no' THEN downloads END) AS non_paying
--     FROM ms_user_dimension a
--     INNER JOIN ms_acc_dimension b ON a.acc_id = b.acc_id
--     INNER JOIN ms_download_facts c ON a.user_id = c.user_id
--     GROUP BY date
-- )

-- SELECT date,
--        non_paying,
--        paying
-- FROM download_totals
-- WHERE (non_paying - paying) > 0
-- ORDER BY date ASC;
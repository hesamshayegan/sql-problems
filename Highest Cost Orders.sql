-- stratascratch - medium

-- Two CTEs: one to calculate total daily spending per customer and
-- another to rank customers by spending for each day.

WITH customer_daily_cost AS
    (SELECT 
        SUM(total_order_cost) AS total_daily_cost,
        o.cust_id,
        o.order_date
    FROM orders o
    WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY o.cust_id, o.order_date
    ),
ranked_daily_totals AS
    (SELECT 
        cust_id,
        order_date,
        total_daily_cost,
        RANK() OVER(PARTITION BY order_date ORDER BY total_daily_cost DESC) AS rnk
    FROM customer_daily_cost)
SELECT c.first_name,
       rdt.order_date,
       rdt.total_daily_cost AS max_cost
FROM customers c
JOIN ranked_daily_totals rdt
ON rdt.cust_id = c.id
WHERE rdt.rnk = 1
ORDER BY rdt.order_date


-- note
-- RANK() OVER(...) is a window function that assigns a rank to each row within a group.
-- PARTITION BY order_date → Group the data by each date (so each day is treated separately). 
-- PARTITION BY splits the data into groups — one group per order_date. If omitted, the entire dataset is treated as one group.
-- ORDER BY total_daily_cost DESC → Within each date, rank customers from highest to lowest
-- The result is that, for each day, the customer who spent the most gets rnk = 1, the second highest gets rnk = 2, and so on.
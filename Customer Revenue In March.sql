-- stratascratch - medium

-- SELECT cust_id, 
--       SUM(total_order_cost) AS revenue
-- FROM orders
-- WHERE order_date BETWEEN '2019-03-01' AND '2019-03-31'
-- GROUP BY cust_id
-- ORDER BY revenue DESC


SELECT cust_id, 
      SUM(total_order_cost) AS revenue
FROM orders
WHERE EXTRACT('MONTH' FROM order_date) = 3
      AND
      EXTRACT('YEAR' FROM order_date) = 2019
GROUP BY cust_id
ORDER BY revenue DESC
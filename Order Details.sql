-- stratascratch 
SELECT c.first_name, o.order_date, o.order_details, o.total_order_cost
FROM customers c
JOIN orders o
ON c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')   
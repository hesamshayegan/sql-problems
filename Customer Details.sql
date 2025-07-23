-- stratascratch 
select c.first_name, c.last_name, c.city, o.order_details
from customers c
LEFT join orders o
on c.id = o.cust_id
ORDER BY c.first_name, o.order_details ASC;
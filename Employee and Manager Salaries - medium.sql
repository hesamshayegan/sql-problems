-- stratascratch - medium

WITH cte_managers AS (
    SELECT
        id,
        salary
    FROM employee
    )
SELECT first_name, 
       employee.salary
FROM employee 
JOIN cte_managers
ON employee.manager_id = cte_managers.id
WHERE employee.salary > cte_managers.salary;


-- subquery
SELECT e.first_name,
       e.salary
FROM employee e
WHERE e.salary > (
    SELECT salary
    FROM employee
    WHERE id = e.manager_id
    );
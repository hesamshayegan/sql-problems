-- stratascratch - medium

WITH salary_per_department AS 
      (SELECT MAX(salary) AS salary,
              department
      FROM employee
      GROUP BY department
      )
SELECT e.department,
       e.first_name,
       e.salary AS highest_salary
FROM employee e
JOIN salary_per_department
ON salary_per_department.salary = e.salary 
AND salary_per_department.department = e.department

-- using RANK

WITH dept_top_salaries AS (
    SELECT id,
           salary,
           department, 
           RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rks
    FROM employee
    GROUP BY department, id, salary
)
SELECT e.first_name, d.salary, d.department
FROM employee e
JOIN dept_top_salaries d
ON e.id = d.id
WHERE rks = 1;
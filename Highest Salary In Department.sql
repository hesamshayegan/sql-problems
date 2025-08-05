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
-- stratascratch
WITH avg_salaries AS
    (SELECT department, AVG(salary) AS avg_salary_of_dept
    FROM employee
    GROUP BY department
    )
SELECT first_name, salary, employee.department, avg_salaries.avg_salary_of_dept
FROM employee
JOIN avg_salaries
ON avg_salaries.department = employee.department
ORDER BY employee.department
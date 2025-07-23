-- stratascratch 

-- SELECT 
-- ABS(
--     (SELECT  MAX(salary) FROM db_employee WHERE department_id = 1)
--     -
--     (SELECT  MAX(salary) FROM db_employee WHERE department_id = 4)
-- ) AS "diff_salaries"


SELECT ABS(
        MAX(CASE 
                WHEN dept.department = 'marketing' THEN emp.salary END)
            -
        MAX(CASE 
                WHEN dept.department = 'engineering' THEN emp.salary END)    
) AS salary_diff
FROM db_employee emp
JOIN db_dept dept
ON emp.department_id = dept.id;
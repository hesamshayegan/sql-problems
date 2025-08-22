-- stratascratch - easy

-- WITH current_salaries AS 
--     (select id, max(salary) as current_salary
--     from ms_employee_salary
--     group by id
--     )
-- select DISTINCT(emp.id), first_name, last_name, department_id, current_salaries.current_salary
-- from ms_employee_salary emp
-- join current_salaries
-- on current_salaries.id = emp.id
-- order by emp.id

SELECT 
    id,
    first_name, 
    last_name,
    department_id,
    max(salary) as salary
FROM ms_employee_salary
GROUP BY
    id,
    first_name, 
    last_name,
    department_id
ORDER BY id ASC
        
        
        
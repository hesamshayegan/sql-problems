-- stratascratch - easy

-- using CASE
-- SELECT ABS(
        -- MAX(CASE 
                -- WHEN dept.department = 'marketing' THEN emp.salary END)
        --     -
        -- MAX(CASE 
                -- WHEN dept.department = 'engineering' THEN emp.salary END)    
-- ) AS salary_diff
-- FROM db_employee emp
-- JOIN db_dept dept
-- ON emp.department_id = dept.id;


WITH highest AS (
    SELECT e.salary, d.department
    FROM db_employee e
    JOIN db_dept d 
    ON e.department_id = d.id
    )
SELECT ABS(
    (SELECT MAX(salary) FROM highest WHERE department = 'engineering') -
    (SELECT MAX(salary) FROM highest WHERE department = 'marketing')
) AS salary_diff;


-- When using CASE, it scans the tables only once, using conditional aggregation to get both max salaries in a single pass.
-- The second query runs two separate subqueries, which means scanning the CTE (or table) twice.
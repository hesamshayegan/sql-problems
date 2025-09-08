SELECT a.title,
      a.budget,
      CEILING((a.end_date - a.start_date) *
            (SUM(c.salary) / 365)) AS prorated_employee_expenses
    FROM linkedin_projects a
    JOIN linkedin_emp_projects b
    ON b.project_id = a.id
    JOIN linkedin_employees c
    ON b.emp_id = c.id
GROUP BY a.title,
         a.budget,
         a.end_date,
         a.start_date
HAVING CEILING((a.end_date - a.start_date) * (SUM(c.salary) / 365)) > a.budget;


-- using CTE
-- WITH ProjectExpenses AS (
--     SELECT
--         p.id,
--         p.title,
--         p.budget,
--         (p.end_date - p.start_date) * SUM(e.salary) / 365 AS calculated_prorated_expenses
--     FROM
--         linkedin_projects p
--     JOIN
--         linkedin_emp_projects ep ON p.id = ep.project_id
--     JOIN
--         linkedin_employees e ON ep.emp_id = e.id
--     GROUP BY
--         p.id, p.title, p.budget, p.end_date, p.start_date
-- )

-- SELECT
--     title,
--     budget,
--     CEILING(calculated_prorated_expenses) AS prorated_employee_expenses
-- FROM
--     ProjectExpenses
-- WHERE
--     CEILING(calculated_prorated_expenses) > budget;

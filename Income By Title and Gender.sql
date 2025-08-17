-- stratascratch - medium

WITH bonuses AS 
    (SELECT worker_ref_id,
            SUM(bonus) AS total_bonus
    FROM sf_bonus
    GROUP BY worker_ref_id
    ),
    salaries AS 
    (SELECT id,
          CASE WHEN (id = bonuses.worker_ref_id) THEN (salary + total_bonus)
          ELSE NULL
          END AS total_compensation
    FROM sf_employee
    JOIN bonuses
    ON id = bonuses.worker_ref_id
    )
SELECT employee_title,
       sex,
       AVG(s.total_compensation) AS avg_compensation
FROM sf_employee
JOIN salaries s
ON s.id = sf_employee.id
GROUP BY employee_title, sex;


-- instead of CASE, I could use INNER JOIN in the second CTE
-- INNER JOIN returns only the rows where there is a match in the specified join condition in both tables (in this case employee with bonus)
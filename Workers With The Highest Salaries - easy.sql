-- stratascratch - easy

-- This query finds the job title of the worker with the highest salary.
-- It joins the worker and title tables using the worker ID.
-- The WHERE clause filters for the worker whose salary equals the maximum salary found in a subquery.
-- The subquery calculates that maximum salary by checking all workers with non-null titles.
-- Finally, it returns the title(s) of the best-paid worker, ordered alphabetically.
-- note: I don’t need a GROUP BY for MAX because I'm aggregating over the entire table, not per group.

SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b
ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
    SELECT MAX(w.salary)
    FROM worker w
    JOIN title t
        ON w.worker_id = t.worker_ref_id
    WHERE t.worker_title IS NOT NULL
)
ORDER BY best_paid_title
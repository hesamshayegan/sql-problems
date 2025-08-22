-- stratascratch - easy

-- SELECT CASE
--          WHEN salary = (SELECT max(salary) FROM worker) THEN worker_title
--        END AS best_paid_title
-- FROM worker a
-- INNER JOIN title b ON b.worker_ref_id=a.worker_id

select t.worker_title
from title t
join worker w
on w.worker_id = t.worker_ref_id
where w.salary = (select max(salary) from worker)
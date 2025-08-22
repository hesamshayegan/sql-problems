-- stratascratch - easy
select AVG(s.popularity) AS average_popularity, emp.location
from facebook_employees emp
JOIN facebook_hack_survey s
ON emp.id = s.employee_id
GROUP BY emp.location
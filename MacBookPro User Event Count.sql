-- stratascratch - easy
select event_name, COUNT(user_id)
from playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
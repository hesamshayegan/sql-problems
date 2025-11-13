-- stratascratch - easy

SELECT AVG(h.popularity) AS average_popularity, e.location
FROM facebook_hack_survey h
JOIN facebook_employees e
ON e.id = h.employee_id
GROUP BY e.location


-- I don’t need to include popularity in the GROUP BY because of how aggregate functions work.
-- AVG(h.popularity) is an aggregate function — it calculates one value per group.
-- GROUP BY e.location tells SQL to create one group for each location.
-- Within each group, SQL automatically aggregates all popularity values using AVG().
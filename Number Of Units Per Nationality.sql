-- stratascratch - medium
SELECT h.nationality,
       COUNT(DISTINCT unit_id) AS total_apartments
FROM airbnb_hosts h
JOIN airbnb_units u
ON h.host_id = u.host_id
WHERE h.age < 30 AND unit_type = 'Apartment'
GROUP BY h.nationality
ORDER BY total_apartments DESC
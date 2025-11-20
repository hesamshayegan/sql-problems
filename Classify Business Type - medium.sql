-- stratascratch - medium

SELECT DISTINCT(business_name),
      CASE 
          WHEN LOWER(business_name) LIKE '%restaurant%' THEN 'restaurant'
          WHEN LOWER(business_name) LIKE '%caf%' THEN 'cafe'
          WHEN LOWER(business_name) LIKE '%school%' THEN 'school'
          ELSE 'other'
        END classification
FROM sf_restaurant_health_violations;
SELECT  city,
        property_type,
        AVG(bathrooms) AS "average_bathrooms",
        AVG(bedrooms) AS "average_bedrooms"
FROM airbnb_search_details
GROUP BY city, property_type;
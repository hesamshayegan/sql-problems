-- stratascratch - medium

WITH games_athlete_counts AS (
    SELECT 
        COUNT(DISTINCT id) AS number_of_athletes,
        games
    FROM 
        olympics_athletes_events
    GROUP BY 
        games
),
ranked_games AS (
    SELECT 
        games,
        number_of_athletes,
        RANK() OVER (ORDER BY number_of_athletes DESC) AS ranking
    FROM 
        games_athlete_counts
)
SELECT 
    ranked_games.games,
    ranked_games.number_of_athletes
FROM 
    ranked_games
WHERE 
    ranked_games.ranking = 1;


-- using subquery

-- SELECT games,
--        athletes_count
-- FROM
--   (SELECT games,
--           COUNT(DISTINCT id) AS athletes_count,
--           MAX(COUNT(DISTINCT id)) OVER () AS max_count
--    FROM olympics_athletes_events
--    GROUP BY games) t
-- WHERE athletes_count = max_count;

-- The query first uses GROUP BY to calculate the number of athletes for each Olympic games.
-- Then, a window function with MAX() OVER() is applied to find the highest athlete count across all those results.
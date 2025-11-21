-- stratascratch - medium

SELECT year_rank,
       group_name,
       song_name
FROM billboard_top_100_year_end
WHERE year = 2010
      AND
      year_rank <= 10
GROUP BY group_name, year_rank, song_name
ORDER BY year_rank
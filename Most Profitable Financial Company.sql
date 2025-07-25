-- stratascratch - easy
-- use of CTE
WITH max_profits AS
    (SELECT MAX(profits) AS max_profit
    FROM forbes_global_2010_2014
    WHERE sector = 'Financials'
    )
SELECT  company,
        continent
FROM forbes_global_2010_2014 f
JOIN max_profits 
ON f.profits = max_profits.max_profit
WHERE sector = 'Financials' -- This WHERE clause is neccessary in case there is the same max profit for another sector


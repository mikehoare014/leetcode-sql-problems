# MySQL query statement below

SELECT stock_name,
       SUM(CASE
               WHEN operation = 'Sell' THEN price
               WHEN operation = 'Buy' THEN -price
           END) AS capital_gain_loss
FROM stocks
GROUP BY stock_name

/*
This problem was a simple group by and case statement. By simply making a helper column with a case statement, the capital gain and loss can be caclulated with a sum and group by. 
*/
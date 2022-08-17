/* Write your T-SQL query statement below */
SELECT sell_date,
       COUNT(product) AS num_sold,
       STRING_AGG(product, ',') AS products
FROM
    (SELECT DISTINCT sell_date,
                     product
     FROM activities) a
GROUP BY sell_date

/* Takeaways

1. STRING_AGG is a very useful function! Made it easy to aggregate strings togeter into one column by a seperator. 
2. Always check for duplicates. I spent sometime getting wrong answers because there were duplicates in the main table. 

*/
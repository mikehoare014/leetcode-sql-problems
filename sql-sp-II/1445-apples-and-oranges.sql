# Self-join
SELECT a.sale_date,
       a.sold_num - o.sold_num AS diff
FROM
    (SELECT *
     FROM sales
     WHERE fruit = 'apples') a
JOIN
    (SELECT *
     FROM sales
     WHERE fruit = 'oranges') o ON a.sale_date = o.sale_date


# Case When statement
SELECT sale_date,
       SUM(CASE
               WHEN fruit = 'apples' THEN sold_num
               WHEN fruit = 'oranges' THEN -sold_num
           END) AS diff
FROM sales
GROUP BY sale_date
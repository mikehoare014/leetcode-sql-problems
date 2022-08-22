# Write your MySQL query statement below
SELECT name AS warehouse_name,
       SUM(width*length*height*units) AS volume
FROM warehouse w
JOIN products p ON p.product_id = w.product_id
GROUP BY name;


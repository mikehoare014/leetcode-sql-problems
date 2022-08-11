/* Write your PL/SQL query statement below */
SELECT name AS customers
FROM customers c
LEFT JOIN orders o on o.customerId = c.id
WHERE o.customerId IS NULL;


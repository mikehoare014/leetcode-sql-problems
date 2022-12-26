# Write your MySQL query statement below

SELECT name,
       SUM(COALESCE(distance, 0)) AS travelled_distance
FROM users u
LEFT JOIN rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY 2 DESC,
         1;

/* Takeaways: 

1. Be carefully aggregating on name field, as there can be multiple people with the same name
2. LEFT JOIN to keep all names, to keep ppl with 0 miles
3. COALESCE to turn NULL values into 0

*/
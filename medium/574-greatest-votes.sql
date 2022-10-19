# Write your MySQL query statement below
SELECT name
FROM(
SELECT name, COUNT(v.id) AS votes
FROM vote v
JOIN candidate c ON c.id = v.candidateId
GROUP BY name
ORDER BY COUNT(v.id) DESC) agg
LIMIT 1

/* 
This solution works because of the assumption that there are no ties, there is always 1 winer. Hence, we can use the LIMIT 1 statement. 

If there were ties, the solution would have to be alter to account for ties. 
*/


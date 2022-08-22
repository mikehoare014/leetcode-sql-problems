# Write your MySQL query statement below

SELECT contest_id,
       ROUND((COUNT(u.user_id) /
                  (SELECT COUNT(*)
                   FROM users)) * 100, 2) AS percentage
FROM register r
JOIN users u on u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC,
         contest_id ASC
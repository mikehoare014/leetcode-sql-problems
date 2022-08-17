/* Write your T-SQL query statement below */
SELECT user_id,
       UPPER(LEFT(name, 1)) + LOWER(RIGHT(name, len(name)-1)) AS name
FROM users
ORDER BY user_id
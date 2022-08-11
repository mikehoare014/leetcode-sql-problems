/* Write your T-SQL query statement below */
SELECT name
FROM customer
WHERE referee_id <> 2
    OR referee_id IS NULL

-- Important! Have to include the IS NULL, sql automatically excludes these
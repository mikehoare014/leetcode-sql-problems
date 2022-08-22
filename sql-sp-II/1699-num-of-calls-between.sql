{"headers": ["from_id", "to_id", "duration", "from_id", "to_id", "duration"],
            "values": [[1, 2, 59, 2, 1, 11],
                       [1, 3, 20, 2, 1, 11],
                       [2, 1, 11, 1, 2, 59],
                       [3, 4, 100, 4, 3, 499],
                       [3, 4, 100, 1, 3, 20],
                       [3, 4, 200, 4, 3, 499],
                       [3, 4, 200, 1, 3, 20],
                       [3, 4, 200, 4, 3, 499],
                       [3, 4, 200, 1, 3, 20],
                       [4, 3, 499, 3, 4, 200],
                       [4, 3, 499, 3, 4, 200],
                       [4, 3, 499, 3, 4, 100]]}


# Write your MySQL query statement below
# Write your MySQL query statement below

SELECT query_name,
       ROUND(SUM(rating/position) / COUNT(query_name), 2) AS quality
FROM queries
GROUP BY query_name


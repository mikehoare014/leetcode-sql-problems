# First solution
SELECT query_name,
       quality,
       ROUND((poor_rating / count_queries) * 100, 2) AS poor_query_percentage
FROM
    (SELECT query_name,
            ROUND(SUM(rating/position) / COUNT(query_name), 2) AS quality,
            SUM(CASE
                    WHEN rating < 3 THEN 1
                    ELSE 0
                END) AS poor_rating,
            COUNT(query_name) AS count_queries
     FROM queries
     GROUP BY query_name) a

# More concise query (no sub-query)

SELECT query_name,
       ROUND(SUM(rating/position) / COUNT(query_name), 2) AS quality,
       ROUND(SUM(CASE
                     WHEN rating < 3 THEN 1
                     ELSE 0
                 END) * 100 / COUNT(query_name), 2) AS poor_query_percentage
FROM queries
GROUP BY query_name
# Write your MySQL query statement below

SELECT distinct project_id
FROM
    ( SELECT *,
             MAX(emply_count) OVER () AS max_emplys
     FROM
         ( SELECT *,
                  COUNT(employee_id) OVER (PARTITION BY project_id
                                           ORDER BY project_id) AS emply_count
          FROM project p) a) b
WHERE emply_count = max_emplys;


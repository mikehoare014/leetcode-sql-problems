
-- Using left join & group bys

SELECT dept_name,
       COUNT(student_id) AS student_number
FROM department d
LEFT JOIN student s USING (dept_id)
GROUP BY dept_name
ORDER BY 2 DESC,
         1 ASC;

-- Using window function  & sub-query
SELECT DISTINCT *
FROM
    ( SELECT dept_name,
             COUNT(student_id) OVER (PARTITION BY dept_name) AS student_number
     FROM department d
     LEFT JOIN student s USING (dept_id) ) a
ORDER BY student_number DESC,
         dept_name ASC
# Write your MySQL query statement below

SELECT student_id,
       course_id,
       grade
FROM
    ( SELECT student_id,
             course_id,
             grade,
             RANK() OVER (PARTITION BY student_id
                          ORDER BY grade DESC, course_id ASC) AS max_grade
     FROM enrollments) a
WHERE max_grade = 1;

/*
These problem is all about RANK function. Ordering in the RANK function is very important and how it determines what rows to rank. 

*/
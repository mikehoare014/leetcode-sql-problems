/* 
Write an SQL query that reports the most experienced employees in each project. 
In case of a tie, report all employees with the maximum number of experience years. 
Return the result table in any order.
*/

SELECT project_id,
       employee_id
FROM
    (SELECT p.project_id,
            e.employee_id,
            name,
            experience_years,
            MAX(experience_years) OVER (PARTITION BY project_id) AS max_exp_yrs
     FROM project p
     INNER JOIN employee e ON e.employee_id = p.employee_id) sub
WHERE experience_years = max_exp_yrs;

/* Metholodgy: Use window function determine the maximum number of employees years on a project. Then, use filter to 
only keep those with the max
*/

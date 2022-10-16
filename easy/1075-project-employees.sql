SELECT project_id,
       ROUND(AVG(experience_years), 2) AS average_years
FROM project p
INNER JOIN employee e ON e.employee_id = p.employee_id
GROUP BY project_id;

/*
Write an SQL query that reports the average experience years of all the employees
for each project, rounded to 2 digits. 

Return the result table in any order. 

Solution:
This problem's solutioino was a simple inner join and usage of the aggregate function (AVG). 



/*
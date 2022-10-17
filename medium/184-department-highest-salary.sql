# Write your MySQL query statement below
SELECT Department,
       Employee,
       Salary
FROM
    ( SELECT d.name AS Department,
             e.name AS Employee,
             salary AS Salary,
             RANK() OVER (PARTITION BY departmentId
                          ORDER BY salary DESC) AS dept_highest_sal
     FROM employee e
     INNER JOIN department d ON d.id = e.departmentId) sub
WHERE dept_highest_sal = 1;



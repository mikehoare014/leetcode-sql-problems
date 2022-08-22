/* Write your T-SQL query statement below */
SELECT COALESCE(s.employee_id, e.employee_id) AS employee_id
FROM employees e
FULL OUTER JOIN salaries s ON s.employee_id = e.employee_id
WHERE name IS NULL
    or salary IS NULL
ORDER BY employee_id ASC;
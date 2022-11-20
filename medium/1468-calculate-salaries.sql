
SELECT company_id,
       employee_id, 
       employee_name,
        CASE WHEN company_max_sal < 1000 THEN salary
             WHEN company_max_sal BETWEEN 1000 AND 10000 THEN ROUND(salary - salary * (24/100))
             WHEN company_max_sal > 10000 THEN ROUND(salary - salary * (49/100))
       ELSE 'error!'
       END AS salary
FROM (

SELECT *
FROM salaries
JOIN (
-- Company max emp salary
SELECT company_id, 
       MAX(salary) AS company_max_sal
FROM salaries
GROUP BY company_id) cts USING (company_id)) sal











SELECT *
FROM salaries
JOIN (
-- Company total salary
SELECT company_id, 
       SUM(salary) AS company_salary
FROM salaries
GROUP BY company_id) cts USING (company_id)


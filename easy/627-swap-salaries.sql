# Write your MySQL query statement below

UPDATE salary
SET sex = CASE
              WHEN sex = 'm' THEN 'f'
              WHEN sex = 'f' THEN 'm'
              ELSE 'error'
          END;

-- Using the case when and update statement will dynamically update the values!
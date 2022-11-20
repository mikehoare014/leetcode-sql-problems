SELECT *,
       DATE_FORMAT(day,'%Y-%m') AS date_helper,
       SUM(CASE
               WHEN type = 'creditor' THEN amount
               ELSE 0
           END) OVER (PARTITION BY account_id,
                                   DATE_FORMAT(day,'%Y-%m')) AS running_monthly_total_income
FROM transactions t
INNER JOIN accounts a USING (account_id)




SELECT DISTINCT account_id
FROM
    (SELECT *,
             LEAD(Suspicioius_Month) OVER (PARTITION BY account_id) AS Suspicioius_consective_months
     FROM
         ( SELECT *,
                  CASE
                      WHEN monthly_sum_amt > max_income THEN 'Yes'
                      WHEN monthly_sum_amt <= max_income THEN 'No'
                      ELSE 'ERROR'
                  END AS Suspicioius_Month
          FROM
              ( -- Group by level
SELECT account_id,
       date_helper,
       SUM(amount_helper) AS monthly_sum_amt,
       max_income
               FROM
                   ( -- Transaction level, build helper cols
SELECT *,
       CASE
           WHEN type = 'creditor' THEN amount
           WHEN type = 'debtor' THEN -amount
           ELSE 'ERROR'
       END AS amount_helper,
       DATE_FORMAT(day,'%Y-%m') AS date_helper
                    FROM transactions t
                    INNER JOIN accounts a USING (account_id)) sub
               GROUP BY account_id,
                        date_helper
               ORDER BY account_id DESC, date_helper DESC) agg) sus_accts) sus_months
WHERE Suspicioius_consective_months = 'Yes';


------------------------------------------------------------------------------------

SELECT *
FROM transactions t
WHERE account_id = 4
ORDER BY day DESC;



SELECT *,
       CASE
           WHEN type = 'creditor' THEN amount
           WHEN type = 'debtor' THEN -amount
           ELSE 'ERROR'
       END AS amount_helper,
       DATE_FORMAT(day,'%Y-%m') AS date_helper,
       SUM(amount_helper) OVER (PARTITION BY date_helper,
                                             account_id) AS running_monthly_account_sum
FROM transactions t
INNER JOIN accounts a USING (account_id)
ORDER BY day DESC





SELECT *,
       SUM(amount_helper) OVER (PARTITION BY date_helper,
                                             account_id) AS running_monthly_account_sum
FROM
    ( SELECT *,
             CASE
                 WHEN type = 'creditor' THEN amount
                 WHEN type = 'debtor' THEN -amount
                 ELSE 'ERROR'
             END AS amount_helper,
             DATE_FORMAT(day,'%Y-%m') AS date_helper
     FROM transactions t
     INNER JOIN accounts a USING (account_id)) sub;





SELECT account_id,
       date_helper,
       SUM(amount_helper)
FROM
    ( SELECT *,
             CASE
                 WHEN type = 'creditor' THEN amount
                 WHEN type = 'debtor' THEN -amount
                 ELSE 'ERROR'
             END AS amount_helper,
             DATE_FORMAT(day,'%Y-%m') AS date_helper
     FROM transactions t
     INNER JOIN accounts a USING (account_id)) sub
GROUP BY account_id,
         date_helper
ORDER BY date_helper,
         account_id



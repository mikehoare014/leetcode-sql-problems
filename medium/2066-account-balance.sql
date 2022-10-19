SELECT account_id,
       day,
       SUM(CASE
               WHEN type = 'Deposit' THEN amount
               ELSE -amount
           END) OVER (PARTITION BY account_id
                      ORDER BY day) AS balance
FROM transactions;

/*
When trying to get a running sum, remember the ORDER BY in the window function!
*/
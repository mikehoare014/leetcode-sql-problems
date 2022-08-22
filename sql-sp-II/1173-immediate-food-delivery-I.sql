SELECT ROUND(SUM(CASE
                     WHEN order_date = customer_pref_delivery_date THEN 1
                     ELSE 0
                 END) * 100 / COUNT(*), 2) AS immediate_percentage
FROM delivery

# More concise code
SELECT ROUND(100 * AVG(order_date=customer_pref_delivery_date), 2) AS immediate_percentage
FROM delivery
SELECT p.product_id,
       ROUND(SUM(price * units) / SUM(units), 2) AS average_price
FROM prices p
JOIN unitssold us ON us.purchase_date BETWEEN p.start_date AND p.end_date
AND us.product_id = p.product_id
GROUP BY product_id;
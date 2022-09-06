# First successful attempt!

SELECT customer_id,
       product_id,
       product_name
FROM
    (SELECT customer_id,
            product_id,
            product_name,
            COUNT(product_name) AS product_count,
            MAX(COUNT(product_name)) OVER (PARTITION BY customer_id) AS most_freq_order
     FROM orders
     JOIN customers USING (customer_id)
     JOIN products USING (product_id)
     GROUP BY customer_id,
              product_id,
              product_name) agg

WHERE product_count = most_freq_order;

/* Takeaways:
The use of the window function is crucial in this problem as a helper column. This columnn is used to filter the count for the most frequently selled item. 
I personally like this solution versus other because it is easier to debug. 
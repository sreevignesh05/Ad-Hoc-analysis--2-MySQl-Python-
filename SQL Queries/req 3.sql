SELECT 
    p.segment, COUNT(DISTINCT s.product_code) AS product_count
FROM
    fact_sales_monthly s
        JOIN
    dim_product p ON s.product_code = p.product_code
GROUP BY p.segment
ORDER BY product_count DESC;








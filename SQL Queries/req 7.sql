SELECT 
    YEAR(s.date) AS Year,
    MONTH(s.date) AS Month,
    SUM(s.sold_quantity * g.gross_price) AS Gross_sales_Amount
FROM
    fact_sales_monthly s
        JOIN
    fact_gross_price g ON s.product_code = g.product_code
        AND s.fiscal_year = g.fiscal_year
        JOIN
    dim_customer c ON s.customer_code = c.customer_code
WHERE
    c.customer LIKE '%Atliq Exclusive%'
GROUP BY Year , Month
ORDER BY Year , Month 
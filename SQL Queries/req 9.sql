WITH sales_data AS (
    SELECT 
        c.channel,
        round(SUM(s.sold_quantity * g.gross_price) / 1000000,2) AS gross_sales_mln
    FROM 
        fact_sales_monthly s
    JOIN 
        dim_customer c ON s.customer_code = c.customer_code
    JOIN 
        fact_gross_price g ON s.product_code = g.product_code 
                            AND s.fiscal_year = g.fiscal_year
    GROUP BY 
        c.channel
)
SELECT 
    channel,
    gross_sales_mln,
    round((gross_sales_mln / SUM(gross_sales_mln)over()) * 100,2) AS pct_contribution
FROM 
    sales_data;




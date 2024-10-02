WITH cte1 AS (
    SELECT 
        p.division AS division,
        p.product_code,
        p.product,
        SUM(s.sold_quantity) AS total_sold_quantity
    FROM 
        fact_sales_monthly s 
    JOIN 
        dim_product p ON s.product_code = p.product_code
    JOIN 
        fact_gross_price g ON s.product_code = g.product_code 
                            AND s.fiscal_year = g.fiscal_year
    WHERE 
        s.fiscal_year = 2021
    GROUP BY 
        p.division, p.product_code, p.product
),
ranked_products AS (
    SELECT 
        division,
        product_code,
        product,
        total_sold_quantity,
        DENSE_RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS _rank
    FROM 
        cte1
)
SELECT *
FROM ranked_products
WHERE 
    _rank IN (1, 2, 3);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

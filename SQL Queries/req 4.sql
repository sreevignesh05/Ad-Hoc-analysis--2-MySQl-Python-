WITH cte1 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT s.product_code) AS product_count_21
    FROM 
        fact_sales_monthly s
    JOIN 
        dim_product p ON s.product_code = p.product_code
    WHERE 
        EXTRACT(YEAR FROM s.date) = 2021
    GROUP BY 
        p.segment
),
cte2 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT s.product_code) AS product_count_20
    FROM 
        fact_sales_monthly s
    JOIN 
        dim_product p ON s.product_code = p.product_code
    WHERE 
        EXTRACT(YEAR FROM s.date) = 2020
    GROUP BY 
        p.segment
)
SELECT 
    cte2.segment, 
    cte1.product_count_21, 
    cte2.product_count_20,
    Abs(cte1.product_count_21-cte2.product_count_20) as abs_difference,
    ROUND(
        (abs((cte1.product_count_21 - cte2.product_count_20)) * 100.0 / abs(cte2.product_count_20)), 2
    ) AS abs_percentage_change
FROM 
    cte1
JOIN 
    cte2 ON cte1.segment = cte2.segment
    
    order by abs_difference desc;

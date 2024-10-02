WITH cte1 AS (
    SELECT 
        COUNT(DISTINCT product_code) AS count_2021
    FROM 
        gdb023.fact_sales_monthly
    WHERE 
        EXTRACT(YEAR FROM date) = 2021
),
cte2 AS (
    SELECT 
        COUNT(DISTINCT product_code) AS count_2020
    FROM 
        gdb023.fact_sales_monthly
    WHERE 
        EXTRACT(YEAR FROM date) = 2020
)
SELECT 
    cte1.count_2021, 
    cte2.count_2020,
    ROUND(
        ((cte1.count_2021 - cte2.count_2020) * 100.0 / cte2.count_2020), 2
    ) AS percentage_chg
FROM 
    cte1, cte2;

SELECT 
  CASE 
    WHEN MONTH(date) IN (9, 10, 11) THEN 1 
    WHEN MONTH(date) IN (12, 1, 2) THEN 2   
    WHEN MONTH(date) IN (3, 4, 5) THEN 3    
    ELSE 4                                  
  END AS fiscal_quarter,
  SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY fiscal_quarter;







select * from (SELECT p.product_code, p.product, 
    m.manufacturing_cost 
FROM dim_product p
JOIN fact_manufacturing_cost m 
ON p.product_code = m.product_code
ORDER BY m.manufacturing_cost ASC 
LIMIT 1) as min_price

UNION ALL

select * from (SELECT p.product_code, p.product, 
    m.manufacturing_cost 
FROM dim_product p
JOIN fact_manufacturing_cost m 
ON p.product_code = m.product_code
ORDER BY m.manufacturing_cost DESC 
LIMIT 1) as max_price;








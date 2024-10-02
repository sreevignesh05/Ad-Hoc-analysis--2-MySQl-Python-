SELECT DISTINCT
    market
FROM
    dim_customer
WHERE
    customer LIKE '%Atliq Exclusive%'
        AND region LIKE '%APAC%';
      
      
      

--------- Data Cleaning -----------

-- NULL values check

SELECT *
FROM customer_spending
WHERE age IS NULL
   OR income IS NULL
   OR total_spent IS NULL;
   
   -- NULL rows delete
   
   DELETE FROM customer_spending
WHERE age IS NULL
   OR income IS NULL
   OR total_spent IS NULL;
   
   -- Duplicate records check
   
   SELECT customer_id, purchase_date, product_category, COUNT(*)
FROM customer_spending
GROUP BY customer_id, purchase_date, product_category
HAVING COUNT(*) > 1;

-- Duplicate delete

DELETE c1
FROM customer_spending c1
JOIN customer_spending c2
ON c1.customer_id = c2.customer_id
AND c1.purchase_date = c2.purchase_date
AND c1.product_category = c2.product_category
AND c1.rowid > c2.rowid;

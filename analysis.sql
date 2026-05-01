-- 1. Top Revenue-Generating Customers

SELECT 
    customer_id,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS lifetime_value
FROM customer_spending
GROUP BY customer_id
ORDER BY SUM(total_spent) DESC
LIMIT 10;


-- 2. Revenue by Product Category

SELECT 
    product_category,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS total_revenue
FROM customer_spending
GROUP BY product_category
ORDER BY SUM(total_spent) DESC;


-- 3. Top 10 Cities by Total Revenue

SELECT 
    city,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS revenue
FROM customer_spending
GROUP BY city
ORDER BY SUM(total_spent) DESC
LIMIT 05;


-- 4. Cities with Highest Average Transaction Value

SELECT 
    city,
    CONCAT('₹ ', FORMAT(AVG(total_spent), 2)) AS avg_transaction_value
FROM customer_spending
GROUP BY city
ORDER BY AVG(total_spent) DESC
LIMIT 05;


-- 5. Online vs Offline Channel Performance

SELECT 
    purchase_channel,
    COUNT(*) AS total_orders,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS total_revenue
FROM customer_spending
GROUP BY purchase_channel;


-- 6. Loyalty vs Non-Loyalty Customer Value

SELECT 
    loyalty_member,
    COUNT(DISTINCT customer_id) AS total_customers,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS total_revenue,
    CONCAT('₹ ', FORMAT(AVG(total_spent), 2)) AS avg_order_value
FROM customer_spending
GROUP BY loyalty_member;


-- 7. Payment Method Analysis

SELECT 
    payment_method,
    COUNT(*) AS transactions,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS total_revenue,
    CONCAT('₹ ', FORMAT(AVG(total_spent), 2)) AS avg_transaction_value
FROM customer_spending
GROUP BY payment_method
ORDER BY SUM(total_spent) DESC;


-- 8. Product Categories with Highest Repeat Orders

SELECT 
    product_category,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customer_spending
GROUP BY product_category
ORDER BY total_orders DESC;


-- 9. Monthly Revenue Trend

SELECT 
    DATE_FORMAT(purchase_date, '%Y-%m') AS month,
    CONCAT('₹ ', FORMAT(SUM(total_spent), 2)) AS monthly_revenue
FROM customer_spending
GROUP BY month
ORDER BY month;


-- 10. What is the Average Revenue per Customer

SELECT 
    CONCAT(
        '₹ ',
        FORMAT(
            SUM(total_spent) / COUNT(DISTINCT customer_id),
            2
        )
    ) AS avg_revenue_per_customer
FROM customer_spending;







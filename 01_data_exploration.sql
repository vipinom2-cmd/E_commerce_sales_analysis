-- =========================================
-- E-COMMERCE SALES ANALYSIS
-- 01: DATA EXPLORATION
-- =========================================


-- 1. Check the total number of records

SELECT COUNT(*) AS total_records
FROM ecommerce_sales;


-- 2. Display the first 10 records

SELECT *
FROM ecommerce_sales
LIMIT 10;


-- 3. Check the distinct product categories

SELECT DISTINCT product_category
FROM ecommerce_sales
ORDER BY product_category;


-- 4. Check the distinct regions

SELECT DISTINCT region
FROM ecommerce_sales
ORDER BY region;


-- 5. Check the distinct payment methods

SELECT DISTINCT payment_method
FROM ecommerce_sales
ORDER BY payment_method;


-- 6. Check the date range of the dataset

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM ecommerce_sales;
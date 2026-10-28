-- E-Commerce Sales Analysis — Data Cleaning Steps

--Step 1: Check the total number of records

SELECT COUNT(*) AS total_records
FROM ecommerce_sales;

-----------------------------------------------
--Step 2: Check the table structure and data types

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'ecommerce_sales'
ORDER BY ordinal_position;

--------------------------------------------------

-- Step 3: Check for missing values

SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_order_date,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE product_category IS NULL) AS missing_category,
    COUNT(*) FILTER (WHERE region IS NULL) AS missing_region,
    COUNT(*) FILTER (WHERE revenue IS NULL) AS missing_revenue
FROM ecommerce_sales;

----------------------------------------------------------------

--Step 4: Check for duplicate records
SELECT
    order_id,
    COUNT(*) AS record_count
FROM ecommerce_sales
GROUP BY order_id
HAVING COUNT(*) > 1;

--------------------------------------------------------------

-- Step 5: Check for invalid quantities and prices
SELECT *
FROM ecommerce_sales
WHERE quantity <= 0
   OR unit_price < 0;
   
-----------------------------------------------------------------

-- Step 6: Validate discount values
-- Assuming the discount is stored as a decimal proportion, such as 0.10 for 10%:
SELECT *
FROM ecommerce_sales
WHERE discount < 0
   OR discount > 1;

--------------------------------------------------------------
-- Step 7: Check customer ratings

-- Assuming the rating scale is from 1 to 5:

SELECT *
FROM ecommerce_sales
WHERE customer_rating < 1
   OR customer_rating > 5;
-----------------------------------------------------------------

-- Step 8: Check delivery days

SELECT *
FROM ecommerce_sales
WHERE delivery_days < 0;

-------------------------------------------------------------------

-- Step 9: Validate revenue calculations

SELECT
    order_id,
    quantity,
    unit_price,
    discount,
    revenue,
    quantity * unit_price * (1 - discount) AS calculated_revenue
FROM ecommerce_sales
WHERE ABS(
    revenue - quantity * unit_price * (1 - discount)
) > 0.01;

--------------------------------------------------------------------


-- Step 10: Check the order-date range

SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM ecommerce_sales;

----------------------------------------------------------------------

 -- 11. Final data-quality review

 -- Final record count
SELECT COUNT(*) AS final_record_count
FROM ecommerce_sales;

-- Check missing revenue values
SELECT COUNT(*) AS missing_revenue_count
FROM ecommerce_sales
WHERE revenue IS NULL;

-- Check invalid quantities
SELECT COUNT(*) AS invalid_quantity_count
FROM ecommerce_sales
WHERE quantity <= 0;

------------------------------------------------------------------------------
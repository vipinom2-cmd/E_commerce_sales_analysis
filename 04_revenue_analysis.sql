-- Question 4

-- Which product category generated the highest revenue?

SELECT product_category,
       SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 1;

-----------------------------------------------------

--Question 5

----Which region generated the highest revenue?

SELECT region,
       SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC
limit 1;

--------------------------------------------------------

-- Question 6
-- Which payment method generated the highest revenue?

SELECT payment_method,
       SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC
LIMIT 1;

----------------------------------------------------------

-- Question 7
--How does revenue vary across different months?

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
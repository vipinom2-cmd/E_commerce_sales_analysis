--Question 14
-- What percentage of total revenue is contributed by each region?

SELECT
region,
SUM(revenue) AS total_revenue,
ROUND(
SUM(revenue)*100.0/
(SELECT SUM(revenue) FROM ecommerce_sales),2
) AS revenue_percentage
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;

---------------------------------------------------------------

--Question 15
-- What percentage of total revenue is contributed by each product category?

SELECT
product_category,
SUM(revenue) AS total_revenue,
ROUND(
SUM(revenue)*100.0/
(SELECT SUM(revenue) FROM ecommerce_sales),2
) AS revenue_percentage
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

------------------------------------------------------------------

--Question 16
-- Who is the highest revenue-generating customer in each region?

WITH customer_revenue AS
(
SELECT
region,
customer_id,
SUM(revenue) AS total_revenue,
ROW_NUMBER() OVER(
PARTITION BY region
ORDER BY SUM(revenue) DESC
) AS rn
FROM ecommerce_sales
GROUP BY region,customer_id
)

SELECT
region,
customer_id,
total_revenue
FROM customer_revenue
WHERE rn=1;

----------------------------------------------------------------


--Question 17
--How do product categories rank based on total revenue generated?

SELECT
product_category,
SUM(revenue) AS total_revenue,
RANK() OVER(
ORDER BY SUM(revenue) DESC
) AS revenue_rank
FROM ecommerce_sales
GROUP BY product_category;

-----------------------------------------------------------------

--Question  18
--What is the cumulative  revenue trend over time?

SELECT
order_date,
SUM(revenue) AS daily_revenue,
SUM(SUM(revenue))
OVER(
ORDER BY order_date
) AS running_revenue
FROM ecommerce_sales
GROUP BY order_date
ORDER BY order_date;

------------------------------------------------------------------


--Question 19
--Which month generated the highest revenue?

SELECT
    DATE_TRUNC('month', order_date::date) AS month,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date::date)
ORDER BY total_revenue DESC
LIMIT 1;

-----------------------------------------------


--Question 20
-- Which customers spend more than the average customer spending?

WITH customer_spending AS
(
SELECT
customer_id,
SUM(revenue) AS total_spending
FROM ecommerce_sales
GROUP BY customer_id
),

average_spending AS
(
SELECT AVG(total_spending) AS avg_spending
FROM customer_spending
)

SELECT
customer_id,avg_spending,
total_spending
FROM customer_spending,average_spending
WHERE total_spending>avg_spending
ORDER BY total_spending DESC;

------------------------------------------
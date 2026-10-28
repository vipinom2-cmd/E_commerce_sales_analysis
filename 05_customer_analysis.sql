--Question 8

--Who are the top 10 customers based on total revenue generated?

SELECT customer_id,
       SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

----------------------------------------------------------------

-- Question 9
-- How can customers be segmented into High, Medium, and Low Value groups based on their spending?

SELECT
customer_id,
SUM(revenue) AS total_spending,
CASE
WHEN SUM(revenue)>=15000 THEN 'High Value'
WHEN SUM(revenue)>=8000 THEN 'Medium Value'
ELSE 'Low Value'
END AS customer_segment
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_spending DESC;

----------------------------------------------------------------

-- Question 10
-- Which customers have placed multiple orders?

SELECT customer_id,
COUNT(order_id) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
HAVING COUNT(order_id)>1
ORDER BY total_orders DESC;

-------------------------------------------------------------------

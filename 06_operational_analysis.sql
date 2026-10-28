-- Question 11
-- Which region has the fastest average product delivery time?

SELECT region,
ROUND(AVG(delivery_days),2) AS average_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY average_delivery_days;

--------------------------------------------------------

 --Question 12
 -- How does average customer rating vary across product categories?

SELECT product_category,
ROUND(AVG(customer_rating),2) AS average_rating
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_rating DESC;

-----------------------------------------------------------

 --Question 13
 -- What is the relationship between discounts offered and revenue generated?

SELECT discount,
ROUND(AVG(revenue),2) AS average_revenue,
SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY discount
ORDER BY discount;

-------------------------------------------------------------
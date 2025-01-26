  		--preview the sales data
SELECT *
FROM sales
LIMIT 15;

		--verify key data to be analysed
SELECT 
    COUNT(*) AS total_rows,
    COUNT(order_id) AS filled_orders,
    COUNT(customer_id) AS filled_customers,
    COUNT(sales) AS filled_sales
FROM sales;

		--yearly sales in descending order
SELECT 
	EXTRACT(YEAR FROM order_date) AS year
	SUM(sales) AS total_sales
FROM sales
GROUP BY year
ORDER BY sales DESC;
		--monthly trends
SELECT 
    EXTRACT(YEAR FROM order_date) AS year, 
    EXTRACT(MONTH FROM order_date) AS month, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY year, month
ORDER BY year, month;

		-- what are some of the top performing products?
SELECT 
    product_name, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

		-- shipping time per region?
SELECT
	region,
	AVG(ship_date - order_date) AS shipping_time
FROM sales
GROUP BY region;

		--3 most valuable customers?
SELECT
	customer_name,
	SUM(sales) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent
LIMIT 3;

		--regional sales?
		
SELECT 
    region, 
    state, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY region, state
ORDER BY total_sales DESC;
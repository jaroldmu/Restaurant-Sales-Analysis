-- RESTAURANT SALES ANALYSIS
-- 03 - BUSINESS ANALYSIS

-- 1 - How has revenue changed over time?
SELECT
	YEAR(order_date) AS 'year',
    MONTH(order_date) AS 'month',
    DATE_FORMAT(order_date, '%y-%m') AS 'year_month',
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY 
	YEAR(order_date),
    MONTH(order_date),
    DATE_FORMAT(order_date, '%y-%m')
ORDER BY 'year', 'month';

-- 2 - Which location generates the most revenue?
SELECT
	location,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS profit,
    COUNT(DISTINCT Order_id) AS total_orders,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY location
ORDER BY revenue DESC;

-- 3 - Which product generates the most revenue and are most profitable?
SELECT
	product,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Product
ORDER BY gross_profit ASC;

-- 4 - Which customer types generate the most value? 
SELECT
	customer_type,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(AVG(revenue), 2) AS avg_transaction_value
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY customer_type
ORDER BY revenue DESC;

-- 5 - Does waiting time affect revenue?
SELECT
	location,
    CASE
		WHEN wait_time_minute < 10 THEN 'Under 10 min'
        WHEN wait_time_minute < 20 THEN '10-20 min'
        WHEN wait_time_minute < 30 THEN '20-30 min'
        ELSE '30+ min'
	END AS wait_time,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY location, wait_time
ORDER BY location, wait_time;

-- 6 - Does weather affect sales?
SELECT
	weather,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY weather
ORDER BY revenue DESC;


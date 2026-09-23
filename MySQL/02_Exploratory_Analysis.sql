-- RESTAURANT SALES ANALYSIS
-- 02 - EXPLORATORY ANALYSIS

-- Overall restaurant performance
SELECT
	ROUND(SUM(revenue), 2) AS total_revenue,
    COUNT(DISTINCT Order_id) AS total_orders,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
    ROUND(SUM(food_cost), 2) AS total_food_cost,
    ROUND(SUM(gross_profit), 2) AS total_gp,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS gp_margin
FROM restaurant_sales_may2025_sep2026_clean;

-- Revenue by Location
SELECT
	location,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin,
    COUNT(DISTINCT Order_id) AS total_orders,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY location
ORDER BY revenue DESC;

-- Revenue over time
SELECT
	DATE(order_date) AS dates,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY DATE(order_date)
ORDER BY dates
LIMIT 50;

-- Monthly revenue
SELECT 
	Month,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Month
ORDER BY revenue DESC;

-- Monthly revenue trend
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

-- Monthly order volume
SELECT
	DATE_FORMAT(order_date, '%y-%m') AS 'year_month',
    COUNT(DISTINCT Order_id) AS total_orders
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY DATE_FORMAT(order_date, '%y-%m')
ORDER BY 'year_month';

-- Day-of-week
SELECT
	day_of_week,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Day_of_Week
ORDER BY revenue DESC;

SELECT DISTINCT
	day_of_week,
    location,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Day_of_Week, location
ORDER BY revenue, location ASC;

-- Sales Channels
SELECT
	Channel,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin,
    COUNT(DISTINCT Order_id) AS total_orders,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Channel
ORDER BY revenue DESC;

-- Sales Channels and Locations
SELECT
	location,
	Channel,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Channel, location
ORDER BY revenue, location DESC;

-- Revenue by Product Category
SELECT
    product_category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY product_category
ORDER BY gross_profit DESC;

-- Product performance
SELECT
	product,
    product_category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(gross_profit), 2) AS gross_profit,
    ROUND(SUM(gross_profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY Product, product_category
ORDER BY gross_profit DESC;

-- RESTAURANT SALES ANALYSIS
-- 01 - DATA CLEANING

SELECT *
FROM restaurant_sales_may2025_sep2026_clean;

-- Transaction number
SELECT 
	COUNT(*) AS total_transactions
FROM restaurant_sales_may2025_sep2026_clean;

-- Unique orders and customers
SELECT
	COUNT(DISTINCT order_id) AS unique_order,
	COUNT(DISTINCT customer_id) AS unique_customer
FROM restaurant_sales_may2025_sep2026_clean;

-- Revenue by Location
SELECT 
	location,
	COUNT(*) AS transactions,
    ROUND(SUM(revenue), 2) AS revenue
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY location
ORDER BY transactions DESC;

-- Missing Values
SELECT
	SUM(order_id IS NULL) AS missing_order_id,
	SUM(order_date IS NULL) AS missing_date,
	SUM(location IS NULL) AS missing_location,
	SUM(product IS NULL) AS missing_product,
	SUM(quantity IS NULL) AS missing_quantity,
	SUM(unit_price IS NULL) AS missing_price,
	SUM(revenue IS NULL) AS missing_revenue,
	SUM(food_cost IS NULL) AS missing_food_cost,
	SUM(gross_profit IS NULL) AS missing_gp
FROM restaurant_sales_may2025_sep2026_clean;

-- Duplicate Orders
SELECT 
	order_id,
    COUNT(*) AS row_counts
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY row_counts DESC;

-- Revenue Calculations
SELECT
	Order_id,
    quantity,
    unit_price,
    discount,
    revenue,
    ROUND((quantity * unit_price) - discount, 2) AS calculated_revenue
FROM restaurant_sales_may2025_sep2026_clean;

-- Negative Values
SELECT *
FROM restaurant_sales_may2025_sep2026_clean
WHERE quantity < 0
	OR unit_price < 0
    OR revenue < 0
    OR food_cost < 0;

-- Available sales Channels
SELECT DISTINCT channel
FROM restaurant_sales_may2025_sep2026_clean
GROUP BY channel;
    
USE ecommerce_project;

-- 1. Overall KPIs
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS average_order_value,
    ROUND(SUM(profit)/SUM(sales)*100,2) AS profit_margin_percent
FROM ecommerce_sales;

-- 2. Sales by category
SELECT category, ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Sales by region
SELECT region, ROUND(SUM(sales),2) AS total_sales,
       COUNT(DISTINCT order_id) AS orders
FROM ecommerce_sales
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Top 10 products
SELECT product, category, ROUND(SUM(sales),2) AS total_sales
FROM ecommerce_sales
GROUP BY product, category
ORDER BY total_sales DESC
LIMIT 10;

-- 5. Monthly sales
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
       ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY month;

-- 6. Payment mode
SELECT payment_mode, COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(sales),2) AS total_sales
FROM ecommerce_sales
GROUP BY payment_mode
ORDER BY total_sales DESC;

-- 7. Customer segment
SELECT customer_segment, ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_sales
GROUP BY customer_segment
ORDER BY total_sales DESC;

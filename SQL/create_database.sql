CREATE DATABASE ecommerce_project;
USE ecommerce_project;

CREATE TABLE ecommerce_sales (
    order_id VARCHAR(20),
    order_date DATE,
    customer_id VARCHAR(20),
    category VARCHAR(50),
    product VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(12,2),
    discount DECIMAL(5,2),
    sales DECIMAL(14,2),
    profit DECIMAL(14,2),
    region VARCHAR(20),
    payment_mode VARCHAR(30),
    customer_segment VARCHAR(30),
    profit_margin DECIMAL(8,4)
);

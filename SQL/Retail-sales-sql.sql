CREATE DATABASE retail_db;
USE retail_db;

CREATE TABLE retail_sales (
    order_id VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price FLOAT,
    date DATE,
    city VARCHAR(50),
    channel VARCHAR(50),
    revenue FLOAT
);

EXEC sp_rename 'Online Retail Data', 'online_retail_data';


SELECT * FROM online_retail_data;

-------------
SELECT TOP 10 * FROM online_retail_data;

SELECT COUNT(*) AS total_records
FROM online_retail_data;

SELECT SUM(Revenue) AS total_revenue
FROM online_retail_data;

SELECT 
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM online_retail_data;

SELECT Description,
       SUM(Quantity) AS total_quantity
FROM online_retail_data
GROUP BY Description
ORDER BY total_quantity DESC;

SELECT TOP 5 Description,
       SUM(Revenue) AS revenue
FROM online_retail_data
GROUP BY Description
ORDER BY revenue DESC;

SELECT Country,
       SUM(Revenue) AS revenue
FROM online_retail_data
GROUP BY Country
ORDER BY revenue DESC;

SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS month,
    SUM(Revenue) AS monthly_revenue
FROM online_retail_data
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY month;

SELECT 
    CAST(InvoiceDate AS DATE) AS sales_date,
    SUM(Revenue) AS daily_revenue
FROM online_retail_data
GROUP BY CAST(InvoiceDate AS DATE)
ORDER BY sales_date;

SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail_data;

SELECT TOP 5 CustomerID,
       SUM(Revenue) AS total_spent
FROM online_retail_data
GROUP BY CustomerID
ORDER BY total_spent DESC;

SELECT 
    Country,
    SUM(Revenue) AS revenue,
    ROUND(
        SUM(Revenue) * 100.0 / 
        (SELECT SUM(Revenue) FROM online_retail_data), 2
    ) AS contribution_percent
FROM online_retail_data
GROUP BY Country
ORDER BY revenue DESC;


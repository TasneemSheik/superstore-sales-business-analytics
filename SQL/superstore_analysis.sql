CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(12,2),
    quantity INT,
    discount NUMERIC(6,4),
    profit NUMERIC(12,4)
);

SELECT COUNT(*) 
FROM superstore;

SELECT *
FROM superstore
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM superstore;


ALTER TABLE superstore
ALTER COLUMN order_date TYPE TEXT,
ALTER COLUMN ship_date TYPE TEXT;

SELECT COUNT(*) FROM superstore;

ALTER TABLE superstore
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'MM/DD/YYYY');

ALTER TABLE superstore
ALTER COLUMN ship_date TYPE DATE
USING TO_DATE(ship_date, 'MM/DD/YYYY');


SELECT order_id, order_date, ship_date
FROM superstore
LIMIT 5;

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(sales) AS average_sales,
    ROUND(
        (SUM(profit) / SUM(sales)) * 100, 2
    ) AS profit_margin_percentage
FROM superstore;

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        (SUM(profit) / SUM(sales)) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        (SUM(profit) / SUM(sales)) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
    DATE_TRUNC('month', TO_DATE(order_date, 'MM/DD/YYYY')) AS sales_month,
    SUM(sales) AS monthly_sales,
    SUM(profit) AS monthly_profit
FROM superstore
GROUP BY DATE_TRUNC('month', TO_DATE(order_date, 'MM/DD/YYYY'))
ORDER BY sales_month;
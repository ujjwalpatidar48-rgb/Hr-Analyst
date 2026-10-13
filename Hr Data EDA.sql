CREATE DATABASE ecom_sales_analysis_db;
USE ecom_sales_analysis_db;
SHOW tables;

SELECT * FROM ecommerce_sales_50000_cleaned;

# Business Query
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales_50000_cleaned
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 1;

# Which city generates the highest revenue?
SELECT
    City,
    SUM(Sales) AS Total_Revenue
FROM ecommerce_sales_50000_cleaned
GROUP BY City
ORDER BY Total_Revenue DESC
LIMIT 1;

# Which category gives the highest profit?
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales_50000_cleaned
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1;

# Which payment method is most used?
SELECT
    Payment_Method,
    COUNT(*) AS Total_Orders
FROM ecommerce_sales_50000_cleaned
GROUP BY Payment_Method
ORDER BY Total_Orders DESC
LIMIT 1;

# Which month has maximum sales? — Monthly Sales
SELECT
    MONTHNAME(Order_Date) AS Month,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales_50000_cleaned
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY Total_Sales DESC
LIMIT 1;

# City Wise Profit
SELECT
    City,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales_50000_cleaned
GROUP BY City
ORDER BY Total_Profit DESC;

# Category Wise Sales
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales_50000_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT * FROM pizza_sales;

-- KPIS
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order
FROM pizza_sales;

-- Charts
-- Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

-- Hourly Trend for Orders
SELECT DATEPART(HOUR, order_time) AS Order_hours,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR, order_time)

-- Percentage of Sales by Pizza Category
SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_revenue,
CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

/* The Numerator (SUM(total_price)):
Because of GROUP BY, this calculates the total sales for only one specific category at a time.
The Denominator ((SELECT SUM(total_price) FROM pizza_sales)):
The subquery inside parentheses forces SQL to ignore the GROUP BY and sum up all pizzas across the entire store.
*/
-- Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_revenue,
CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- TOP 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--  Bottom 5 Worst Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

/* Here MONTH(order_date) = 1 indicates that the output is for the month of January. MONTH(order_date) = 4 indicates output for Month of April.
*/
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date)

/*Here DATEPART(QUARTER, order_date) = 1 indicates that the output is for the Quarter 1. MONTH(order_date) = 3 indicates output for Quarter 3.
*/
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY DATENAME(DW, order_date)




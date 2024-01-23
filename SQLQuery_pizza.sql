-- total revenue

SELECT sum(total_price) AS Total_Revenue

FROM pizza_sales

-- Average order value
SELECT sum(total_price) / COUNT(DISTINCT(order_id)) AS Average_Order_Value

FROM pizza_sales

-- Total Pizza SOld
SELECT SUM(quantity) AS Total_Pizza_Sold

FROM pizza_sales

-- Total Order Sold
SELECT COUNT(DISTINCT (order_id)) AS Total_Order_sold

FROM pizza_sales

-- Average pizza per order, cast to convert to decimal
SELECT sum(quantity) / COUNT(DISTINCT (order_id)) AS Average_Pizza_Order

FROM pizza_sales

-- Daily pizza sales trend
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT(order_id)) AS Total_Orders

FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- Monthly pizza sales trend
SELECT DATENAME(MONTH, order_date) AS MONTHLY, COUNT(DISTINCT(order_id)) AS Total_Order

FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

--Percentage of sales by pizaa category
SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS Percent_Revenue 

FROM pizza_sales

WHERE MONTH(order_date) = 1

GROUP BY pizza_category

--Percentage of sales by pizaa size
SELECT pizza_size, SUM(total_price) AS Total_sales, CAST(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS Percent_Revenue 

FROM pizza_sales

GROUP BY pizza_size
ORDER BY Percent_Revenue DESC

-- Top 5 pizza by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue

FROM pizza_sales

GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- bottom 5 pizza by Revenue 
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue

FROM pizza_sales

GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- top 5 pizza by qunantity
SELECT Top 5 pizza_name, SUM(quantity) AS otal_Qunitity

FROM pizza_sales

GROUP BY pizza_name

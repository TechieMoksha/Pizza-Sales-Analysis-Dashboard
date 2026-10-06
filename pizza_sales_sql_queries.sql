SELECT * FROM pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AVG_oder_value from pizza_sales

SELECT SUM(quantity) AS Total_Sold from pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(Distinct order_id) AS DECIMAL(10,2)) from pizza_sales

--DAILY TREND
SELECT DATENAME(DW, order_date) as oder_day, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)

--HOURLY TREND
SELECT DATEPART(HOUR, Order_Time) AS Order_Hours, COUNT(DISTINCT Order_Id) AS Total_Orders
from pizza_sales
GROUP BY DATEPART(HOUR,Order_Time)
ORDER BY DATEPART(HOUR, order_time)

--SALES IN PERECENTAGE
SELECT pizza_category, SUM(total_price) as Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Total_Sales
from pizza_sales 
GROUP BY pizza_category 

SELECT pizza_category, SUM(total_price) as Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Total_Sales
from pizza_sales 
where month(order_date) = 1
GROUP BY pizza_category 

SELECT pizza_size, SUM(total_price) as Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
from pizza_sales 
GROUP BY pizza_size 
ORDER BY PCT DESC

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2)) as Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) as DECIMAL(10,2)) AS PCT
from pizza_sales 
WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size 
ORDER BY PCT DESC

SELECT pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales 
GROUP BY pizza_category

SELECT pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales 
GROUP BY pizza_name 
order by sum(quantity) desc

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold 
from pizza_sales 
group by pizza_name 
order by sum(quantity) desc

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold 
from pizza_sales 
where month(order_date)= 8
group by pizza_name 
order by sum(quantity) asc



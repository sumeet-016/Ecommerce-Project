-- ------------------------------------------------------------------------
-- ---------------------- Create a database ecommerce ---------------------
-- ------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS ecommerce;

-- ------------------ Create two table deatils and orders -----------------

CREATE TABLE IF NOT EXISTS details (
OrderID VARCHAR(50) PRIMARY KEY,
Amount INT,
Profit INT,
Quantity INT,
Category VARCHAR(100),
SubCategory VARCHAR(100),
PaymentMode VARCHAR(50)
);

CREATE TABLE orders (
Order_ID VARCHAR(20),
Order_Date DATE,
CustomerName VARCHAR(100),
State VARCHAR(50),
City VARCHAR(50),
PRIMARY KEY (Order_ID)
);

-- ------------ Import the data from the external files in the database ----------

SELECT* FROM details;
SELECT* FROM orders;


-- --------------------------------------------------------------------------------------------
-- ------------------------------- Data Analysis questions and queries--------------------------
-- ---------------------------------------------------------------------------------------------

-- Question: What is the total sales amount and profit for each product category?
-- Query
SELECT category, SUM(Amount) AS Total_amt,
SUM(Profit) AS Total_pft
FROM details 
GROUP BY category;


-- Question: Which state has the highest total sales amount?
-- Query
SELECT b.state, SUM(a.amount) AS Total_sales
FROM details a
JOIN orders b
ON a.orderID = b.order_ID
GROUP BY b.state
ORDER BY total_sales DESC
LIMIT 1;

-- Answer Maharastra(42128)


-- Question: Who are the top 5 customers by total sales amount?
-- Query
SELECT b.customerName AS name, SUM(a.amount) AS total_sales
FROM details a
JOIN orders b 
ON a.orderID = b.order_ID
GROUP BY name
ORDER BY total_sales DESC
LIMIT 5;


-- Question: What is the average profit margin (profit/sales) per category and if the margin is above 0 then profit or less than loss?
-- Query
SELECT category,
ROUND(AVG(CAST(profit AS FLOAT)/ NULLIF(amount, 0))*100, 2) AS Avgpftmargin,
CASE
	WHEN AVG(CAST(profit AS FLOAT)/ NULLIF(amount, 0))*100 > 0 THEN "Profit"
	ELSE "Loss"
END AS profit_or_loss
FROM details 
GROUP BY category;

-- Answer - Electronics(1.62 & Profit), clothing(3.53 & Profit) and furiture(-1.64 & Loss)


-- Question: What is the monthly sales trend for the Electronics category?
-- Query
SELECT DATE_FORMAT(STR_TO_DATE(b.`Order_Date`, '%Y-%m-%d'), '%Y-%m') AS MonthYear,
SUM(a.Amount) AS TotalSales
FROM Details a
JOIN Orders b ON a.OrderID = b.Order_ID
WHERE a.Category = 'Electronics'
GROUP BY MonthYear
ORDER BY MonthYear;


-- Question: Which mode of payment generates the highest amount?
-- Query
SELECT a.PaymentMode,
SUM(a.Amount) AS Total_Amount
FROM details a
GROUP BY a.PaymentMode
ORDER BY Total_Amount DESC
LIMIT 1;

-- Answer - Credit Card (66989)


-- Question: What is the total quantity sold for each sub-category?
-- Query
SELECT "Sub-Category" AS ctgy,
SUM(Quantity) AS TotalQuantity
FROM Details 
GROUP BY ctgy
ORDER BY TotalQuantity DESC;


-- Question: Which state and city combination generated the highest profit?
-- Query
SELECT a.State, a.City, SUM(b.Profit) AS TotalProfit
FROM details b
JOIN Orders a 
ON b.OrderID = a.Order_ID
GROUP BY a.State, a.City
ORDER BY TotalProfit DESC
LIMIT 1;

-- Answer - Maharashtra, Pune(3886)


-- Question: Which orders involved the highest quantities, and what were the corresponding profits?
-- Query
SELECT OrderID, Quantity, Profit
FROM Details 
ORDER BY Quantity DESC
LIMIT 5;


-- Question: What is the profitability distribution by payment mode for each product category?
-- Query
SELECT PaymentMode, Category, 
SUM(Profit) AS TotalProfit
FROM Details 
GROUP BY PaymentMode, Category
ORDER BY TotalProfit DESC;


-- Question: Which customer generated the highest total profit?
SELECT b.CustomerName, SUM(a.Profit) AS TotalProfit
FROM Details a
JOIN Orders b ON b.Order_ID = a.OrderID
GROUP BY b.CustomerName
ORDER BY TotalProfit DESC
LIMIT 1;

-- Answer : Aarushi(1883)


-- Question: On which date was the highest single sale made?
SELECT b.Order_Date, a.Amount
FROM Details a
JOIN Orders b ON a.OrderID = b.Order_ID
ORDER BY a.Amount DESC
LIMIT 1;

-- Answer : 2018-03-10(5729)
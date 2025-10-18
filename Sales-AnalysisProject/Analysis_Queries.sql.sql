CREATE TABLE sales (
    "Row ID" TEXT,
    "Order ID" TEXT,
    "Order Date" TEXT,
    "Order Year" INTEGER,
    "Order Month" TEXT,
    "Ship Date" TEXT,
    "Processing_Days" INTEGER,
    "Ship Mode" TEXT,
    "Customer ID" TEXT,
    "Customer Name" TEXT,
    "Segment" TEXT,
    "Country" TEXT,
    "City" TEXT,
    "State" TEXT,
    "Postal Code" TEXT,
    "Region" TEXT,
    "Product ID" TEXT,
    "Category" TEXT,
    "Sub-Category" TEXT,
    "Product Name" TEXT,
    "Sales" REAL
);



-- Sales Overview --
--Total sales
SELECT SUM(Sales) FROM sales;

-- Total number of Orders
SELECT COUNT("Order ID") FROM sales;

-- Average order value
SELECT AVG(Sales) avg_sales FROM sales;


-- Customer Overview --
-- Top 10 Customers 
SELECT "Customer Name", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Customer Name" ORDER BY TotalSales DESC LIMIT 10;

-- Customers who ordered more than 3 times
SELECT "Customer Name", COUNT("Order ID") AS TotalOrders
FROM sales GROUP BY "Customer Name"
HAVING COUNT("Order ID") > 3 ORDER BY TotalOrders DESC ;

-- Average sales per customer
SELECT "Customer Name", AVG(Sales) AS avg_sales FROM sales
GROUP BY "Customer Name" ORDER BY avg_sales DESC LIMIT 10;


-- Categories Overview --
--Total sales by category
SELECT Category, SUM(Sales) AS TotalSales FROM sales
GROUP BY Category ORDER BY TotalSales DESC;

-- Total sales by sub-category
SELECT "Sub-Category", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Sub-Category" ORDER BY TotalSales DESC;

--Top 5 Best-Selling Products
SELECT "Product Name", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Product Name" ORDER BY TotalSales DESC LIMIT 5;

SELECT 
  "Product Name", 
  SUM(Sales) AS TotalSales,
  ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM sales), 2) AS PercentOfTotal
FROM sales
GROUP BY "Product Name"
ORDER BY TotalSales DESC
LIMIT 5;


--  Region Overview --
--Total sales by state
SELECT State, SUM(Sales) AS TotalSales FROM sales
GROUP BY State ORDER BY TotalSales DESC;

--Top 5 Best Selling States
SELECT State, SUM(Sales) AS TotalSales FROM sales
GROUP BY State ORDER BY TotalSales DESC LIMIT 5;

--Number of Customers in each region
SELECT Region, COUNT(DISTINCT "Customer Name") AS UniqueCustomers
FROM sales
GROUP BY Region
ORDER BY UniqueCustomers DESC;


-- Ship Mode Overview --
-- Total orders in each shipping type
SELECT "Ship Mode", COUNT("Order ID") total_orders FROM sales
GROUP BY "Ship Mode" ORDER BY total_orders DESC;

--Average processing days for each type
SELECT "Ship Mode", AVG(Processing_Days) Processing_Days FROM sales
GROUP BY "Ship Mode" ORDER BY Processing_Days DESC;

-- Most commonly used type
SELECT "Ship Mode", COUNT("Order ID") total_orders FROM sales
GROUP BY "Ship Mode" ORDER BY total_orders DESC LIMIT 1;


-- Time Overview --
--Total sales by year
SELECT "Order Year", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Order Year" ORDER BY TotalSales DESC;

--Total sales by month
SELECT "Order Month", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Order Month" ORDER BY TotalSales DESC;

--Top selling year, month
SELECT "Order Year", "Order Month", SUM(Sales) AS TotalSales FROM sales
GROUP BY "Order Year", "Order Month" ORDER BY TotalSales DESC LIMIT 1;

--Total sales by year and month
SELECT "Order Year", "Order Month", SUM(Sales) AS TotalSales
FROM sales GROUP BY "Order Year", "Order Month" ORDER BY "Order Year", TotalSales DESC;

-- more stuff --
--Which segment spends more on average?
SELECT Segment, AVG(Sales) AS AvgSales
FROM sales
GROUP BY Segment ORDER BY AvgSales DESC LIMIT 1;

--Average Sales Per Region Per Segment.
SELECT Region, Segment, AVG(Sales) AS AvgSales
FROM sales
GROUP BY Region, Segment ORDER BY AvgSales DESC;

-- Number of orders whose shipping period exceeds 5 days.
SELECT COUNT("Order ID") FROM sales WHERE Processing_Days > 5;

-- Top Product Category in each Region.
SELECT Region, Category, SUM(Sales) AS TotalSales
FROM sales
GROUP BY Region, Category
ORDER BY Region, TotalSales DESC;

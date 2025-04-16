-- 1. General Aggregations on Original Table
SELECT
    Warehouse_ID,
    ROUND(AVG(Shipping_Time_Days), 2) AS avg_shipping_time
FROM dbo.supply_chain_extended_data
GROUP BY Warehouse_ID
ORDER BY avg_shipping_time DESC;

SELECT
    Warehouse_ID,
    Product_Category,
    Current_Stock
FROM dbo.supply_chain_extended_data
WHERE Current_Stock < 50
ORDER BY Current_Stock ASC;

SELECT
    Location,
    SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS total_profit
FROM dbo.supply_chain_extended_data
GROUP BY Location
ORDER BY total_profit DESC;

SELECT 
    Warehouse_ID,
    SUM(Current_Stock) AS total_stock
FROM dbo.supply_chain_extended_data
GROUP BY Warehouse_ID
ORDER BY total_stock DESC;

SELECT 
    Product_Category,
    SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS profit
FROM dbo.supply_chain_extended_data
GROUP BY Product_Category
HAVING SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) < 0
ORDER BY profit ASC;

-- 2. Create New Table with Order_Date (Only Run Once!)
IF OBJECT_ID('dbo.supply_chain_with_dates') IS NOT NULL
    DROP TABLE dbo.supply_chain_with_dates;

SELECT 
    *, 
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 800, '2023-01-01') AS Order_Date
INTO dbo.supply_chain_with_dates
FROM dbo.supply_chain_extended_data;

-- 3. Use the new table for all Order_Date-based queries

-- 3.1 Monthly Sales by Month
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Monthly_Sales) AS Total_Sales
FROM dbo.supply_chain_with_dates
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

-- 3.2 Top 10 Product Categories by Total Demand
SELECT TOP 10 Product_Category, SUM(Demand_Forecast) AS Total_Demand
FROM dbo.supply_chain_extended_data
GROUP BY Product_Category
ORDER BY Total_Demand DESC;

-- 3.3 Top 10 Warehouses by Shipping Time
SELECT TOP 10 Warehouse_ID, Shipping_Time_Days
FROM dbo.supply_chain_extended_data
ORDER BY Shipping_Time_Days DESC;

-- 3.4 Top 10 Warehouses by Operational Cost
SELECT TOP 10 Warehouse_ID, Operational_Cost
FROM dbo.supply_chain_extended_data
ORDER BY Operational_Cost DESC;

-- 3.5 Top 10 Warehouses by Monthly Sales
SELECT TOP 10 Warehouse_ID, Monthly_Sales
FROM dbo.supply_chain_extended_data
ORDER BY Monthly_Sales DESC;

-- 3.5 Top 10 Warehouses by Stockout Risk
SELECT TOP 10 Warehouse_ID, Stockout_Risk
FROM dbo.supply_chain_extended_data
ORDER BY Stockout_Risk DESC;

-- 3.6 Top 10 Warehouses by Current Stock
SELECT TOP 10 Warehouse_ID, Current_Stock
FROM dbo.supply_chain_extended_data
ORDER BY Current_Stock DESC;

-- 3.7 Top 10 Warehouses by Customer Rating
SELECT TOP 10 Warehouse_ID, Customer_Rating
FROM dbo.supply_chain_extended_data
ORDER BY Customer_Rating DESC;

-- 3.8 Top 10 Warehouses by Return Rate
SELECT TOP 10 Warehouse_ID, Return_Rate
FROM dbo.supply_chain_extended_data
ORDER BY Return_Rate DESC;

-- 3.9 Top 10 Warehouses by Order Processing Time
SELECT TOP 10 Warehouse_ID, Order_Processing_Time
FROM dbo.supply_chain_extended_data
ORDER BY Order_Processing_Time DESC;

-- 3.10 Top 10 Warehouses by Transportation Cost
SELECT TOP 10 Warehouse_ID, Transportation_Cost
FROM dbo.supply_chain_extended_data
ORDER BY Transportation_Cost DESC;


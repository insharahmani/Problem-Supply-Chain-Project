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
SELECT 
    *, 
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 800, '2023-01-01') AS Order_Date
INTO dbo.supply_chain_with_dates
FROM dbo.supply_chain_extended_data;
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Monthly_Sales) AS total_sales
FROM dbo.supply_chain_with_dates
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;




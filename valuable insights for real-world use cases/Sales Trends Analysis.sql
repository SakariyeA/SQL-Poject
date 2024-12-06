-- SALES TRENDS ANALYSIS

--Monthly revenue breakdown:
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

--Top 5 best-selling products:
SELECT TOP 5 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;

--Sales by product category:
SELECT 
    p.ProductCategory,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductCategory
ORDER BY TotalSales DESC;

--Average monthly revenue:
SELECT 
    AVG(MonthlyRevenue) AS AvgMonthlyRevenue
FROM (
    SELECT 
        YEAR(OrderDate) AS Year,
        MONTH(OrderDate) AS Month,
        SUM(TotalAmount) AS MonthlyRevenue
    FROM Orders
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) AS MonthlyData;


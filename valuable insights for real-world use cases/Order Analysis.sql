-- ORDER ANALYSIS

--Find orders with the highest value:
SELECT 
    TOP 10 OrderID, 
    TotalAmount
FROM Orders
ORDER BY TotalAmount DESC;

--Calculate the average order value:
SELECT 
    AVG(TotalAmount) AS AvgOrderValue
FROM Orders;

--Count of orders by month:
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

--Percentage of orders with > $500 total value:
SELECT 
    (CAST(SUM(CASE WHEN TotalAmount > 500 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS PercentageAbove500
FROM Orders;

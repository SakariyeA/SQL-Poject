-- CUSTOMER INSIGHTS

-- Identify loyal customers (e.g., customers with >5 orders):
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) > 5
ORDER BY TotalOrders DESC;

--Find customers who haven't purchased in the last 6 months:
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING MAX(o.OrderDate) < DATEADD(MONTH, -6, GETDATE()) OR MAX(o.OrderDate) IS NULL;

--Total revenue per customer:
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalRevenue DESC;

--Top 10 customers by order count:
SELECT TOP 10 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;


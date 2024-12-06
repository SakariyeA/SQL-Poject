--Query Optimization

--Identify slow queries
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Example slow query:
SELECT * 
FROM Orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-12-31';

--Optimize
EXPLAIN
SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate > '2024-01-01';

--If slow querys are identified rewrite them; examples of optimizations can be Instead of selecting all columns, target specific fields,
--Use indexed columns in filtering and joins, Avoiding unnecessary subqueries
--Other Performance Improvements can be;Update statistics regularly, Add constraints, Use stored procedures for frequent queries
-- Queries to test schema and data
-- Fetch all customers and their orders
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
--List order details with product name
SELECT od.OrderID, p.ProductName, od.Quantity, od.UnitPrice, (od.Quantity * od.UnitPrice) AS TotalPrice
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID;
--Check transaction status
SELECT t.TransactionID, t.OrderID, t.PaymentMethod, t.PaymentStatus
FROM Transactions t;

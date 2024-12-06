-- Combined Product and Sales Insights
--To provide more comprehensive insights, extend the reporting by combining product categories with customer segments.

--View for Sales by Product Category and Customer
CREATE VIEW SalesByCategoryAndCustomer AS
SELECT 
    p.ProductCategory AS Category,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Orders o ON od.OrderID = o.OrderID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    p.ProductCategory, c.FirstName, c.LastName;


	SELECT * FROM SalesByCategoryAndCustomer
	ORDER BY 
	 TotalRevenue DESC;

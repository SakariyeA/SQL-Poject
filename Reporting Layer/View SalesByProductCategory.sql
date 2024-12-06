-- View for Sales by Product Category

--view aggregates sales data by product category, calculating total revenue and total quantity sold per category
CREATE VIEW SalesByProductCategory AS
SELECT 
    p.ProductCategory AS Category,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductCategory;

SELECT * 
FROM SalesByProductCategory
ORDER BY TotalRevenue DESC;

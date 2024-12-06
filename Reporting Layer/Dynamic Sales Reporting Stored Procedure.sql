--Dynamic Sales Reporting Stored Procedure
--Procedure allows for dynamic filtering by year, month, and product category

CREATE PROCEDURE GenerateSalesReport
    @Year INT = NULL,
    @Month INT = NULL,
    @Category NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        FORMAT(o.OrderDate, 'yyyy-MM') AS SalesMonth,
        p.ProductCategory AS Category,
        COUNT(DISTINCT o.OrderID) AS TotalOrders,
        SUM(od.Quantity) AS TotalQuantitySold,
        SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
    FROM 
        Orders o
    JOIN 
        OrderDetails od ON o.OrderID = od.OrderID
    JOIN 
        Products p ON od.ProductID = p.ProductID
    WHERE 
        (@Year IS NULL OR YEAR(o.OrderDate) = @Year)
        AND (@Month IS NULL OR MONTH(o.OrderDate) = @Month)
        AND (@Category IS NULL OR p.ProductCategory = @Category)
    GROUP BY 
        FORMAT(o.OrderDate, 'yyyy-MM'), p.ProductCategory
    ORDER BY 
        TotalRevenue DESC;
END;

-- Sales report for December 2023
EXEC GenerateSalesReport @Year = 2023, @Month = 12;

-- Sales report for a specific category
EXEC GenerateSalesReport @Category = 'Electronics';

-- Full yearly report
EXEC GenerateSalesReport @Year = 2023;

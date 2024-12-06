--Stored Procedure to Generate Monthly Sales Reports

--generates sales reports for a specified year and month, including total revenue, total orders, and the average order value.
CREATE PROCEDURE GenerateMonthlySalesReport
    @Year INT,
    @Month INT
AS
BEGIN
    -- Set formatting for cleaner results
    SET NOCOUNT ON;

    -- Sales report query
    SELECT 
        FORMAT(o.OrderDate, 'yyyy-MM') AS SalesMonth,
        COUNT(o.OrderID) AS TotalOrders,
        SUM(o.TotalAmount) AS TotalRevenue,
        AVG(o.TotalAmount) AS AverageOrderValue
    FROM 
        Orders o
    WHERE 
        YEAR(o.OrderDate) = @Year AND MONTH(o.OrderDate) = @Month
    GROUP BY 
        FORMAT(o.OrderDate, 'yyyy-MM');
END;

--Call the procedure with the desired year and month
EXEC GenerateMonthlySalesReport @Year = 2024, @Month = 02;

-- PARTITIONING
--Partitioning the Orders table by year significantly improves performance for queries targeting specific time ranges

--Add a partition scheme
CREATE PARTITION FUNCTION PartitionByYear (DATETIME)
AS RANGE RIGHT FOR VALUES ('2022-12-31', '2023-12-31', '2024-12-31');

--Partition scheme that maps to the filegroups
CREATE PARTITION SCHEME YearPartitionScheme
AS PARTITION PartitionByYear
ALL TO ([PRIMARY]);

-- Partition Orders Table
CREATE TABLE OrdersPartitioned
(
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, OrderDate)  
)
ON YearPartitionScheme(OrderDate); 

--Migrate data to new table 
INSERT INTO OrdersPartitioned (OrderID, CustomerID, OrderDate, TotalAmount)
SELECT OrderID, CustomerID, OrderDate, TotalAmount
FROM Orders;

-- Verify edge cases 

-- Orders without payments
SELECT * 
FROM Orders o
WHERE NOT EXISTS (
    SELECT 1 
    FROM Transactions t 
    WHERE t.OrderID = o.OrderID
);

-- Out of stock products
SELECT * 
FROM Products 
WHERE StockQuantity = 0;


-- Data distribution validation

-- Count of customers, products, orders, and transactions
SELECT 
    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,
    (SELECT COUNT(*) FROM Products) AS TotalProducts,
    (SELECT COUNT(*) FROM Orders) AS TotalOrders,
    (SELECT COUNT(*) FROM Transactions) AS TotalTransactions;

-- Orders without matching transactions
SELECT COUNT(*) AS OrdersWithoutPayments
FROM Orders o
WHERE NOT EXISTS (
    SELECT 1 
    FROM Transactions t 
    WHERE o.OrderID = t.OrderID
);

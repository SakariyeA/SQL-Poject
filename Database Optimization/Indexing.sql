-- INDEXING

--index on CustomerID in the Orders table
CREATE NONCLUSTERED INDEX idx_Orders_CustomerID
ON Orders (CustomerID);

--index on ProductID in the OrderDetails table
CREATE NONCLUSTERED INDEX idx_OrderDetails_ProductID
ON OrderDetails (ProductID);

--composite index on OrderDate and TotalAmount in the Orders table
CREATE NONCLUSTERED INDEX idx_Orders_OrderDate_TotalAmount
ON Orders (OrderDate, TotalAmount);

--index on TransactionDate in the Transactions table
CREATE NONCLUSTERED INDEX idx_Transactions_TransactionDate
ON Transactions (TransactionDate);

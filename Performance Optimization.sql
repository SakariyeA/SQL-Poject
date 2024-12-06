-- Indexing and analizing performance

CREATE INDEX idx_CustomerID ON Orders (CustomerID);
CREATE INDEX idx_OrderID ON OrderDetails (OrderID);
CREATE INDEX idx_ProductID ON OrderDetails (ProductID);

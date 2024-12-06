-- Inserting Sample Data

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, Country, SignupDate)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Los Angeles', 'California', 'USA', '2024-01-01'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Maple Ave', 'New York', 'New York', 'USA', '2024-01-02');

INSERT INTO Products (ProductName, ProductCategory, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 1200.00, 50),
('Smartphone', 'Electronics', 800.00, 100),
('Headphones', 'Accessories', 150.00, 200);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-02-01', 1350.00),
(2, '2024-02-05', 950.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 1200.00), -- Laptop
(1, 3, 1, 150.00), -- Headphones
(2, 2, 1, 800.00); -- Smartphone

INSERT INTO Transactions (OrderID, PaymentMethod, TransactionDate, PaymentStatus)
VALUES 
(1, 'Credit Card', '2024-02-01', 'Completed'),
(2, 'PayPal', '2024-02-05', 'Completed');

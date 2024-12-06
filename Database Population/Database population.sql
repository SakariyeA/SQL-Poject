-- Insert Customers
-- Use a loop to generate 500+ customers with varied data.
DECLARE @Counter INT = 1;

WHILE @Counter <= 500
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, Country, SignupDate)
    VALUES (
        'FirstName_' + CAST(@Counter AS NVARCHAR(10)),
        'LastName_' + CAST(@Counter AS NVARCHAR(10)),
        'user' + CAST(@Counter AS NVARCHAR(10)) + '@example.com',
        '12345' + RIGHT(CAST(@Counter AS NVARCHAR(10)), 5),
        'Address_' + CAST(@Counter AS NVARCHAR(10)),
        'City_' + CAST(@Counter AS NVARCHAR(10)),
        'State_' + CAST(@Counter AS NVARCHAR(10)),
        'Country_' + CAST((@Counter % 5 + 1) AS NVARCHAR(10)), -- 5 different countries
        DATEADD(DAY, -@Counter, GETDATE()) -- Signup date is distributed across the last 500 days
    );

    SET @Counter = @Counter + 1;
END;

-- Insert Products
-- Insert 100+ products with random categories and prices
DECLARE @ProductCounter INT = 1;

WHILE @ProductCounter <= 100
BEGIN
    INSERT INTO Products (ProductName, ProductCategory, Price, StockQuantity)
    VALUES (
        'Product_' + CAST(@ProductCounter AS NVARCHAR(10)),
        CASE WHEN @ProductCounter % 5 = 0 THEN 'Electronics' 
             WHEN @ProductCounter % 5 = 1 THEN 'Clothing'
             WHEN @ProductCounter % 5 = 2 THEN 'Home'
             WHEN @ProductCounter % 5 = 3 THEN 'Beauty'
             ELSE 'Sports' 
        END,
        ROUND((RAND() * 100 + 10), 2), -- Prices between $10 and $110
        CASE WHEN @ProductCounter % 10 = 0 THEN 0 -- Out of stock products
             ELSE ABS(CHECKSUM(NEWID())) % 500 + 1 -- Random stock quantity between 1 and 500
        END
    );

    SET @ProductCounter = @ProductCounter + 1;
END;

--Insert Orders
--Insert 5,000+ orders with edge cases like missing payments.
DECLARE @OrderCounter INT = 1;

WHILE @OrderCounter <= 5000
BEGIN
    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
    VALUES (
        ABS(CHECKSUM(NEWID()) % 500 + 1), -- Random CustomerID between 1 and 500
        DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 365), GETDATE()), -- Random date in the past year
        ROUND((RAND() * 500 + 20), 2) -- Random total amount between $20 and $520
    );

    SET @OrderCounter = @OrderCounter + 1;
END;

--Insert order details
--Ensure that each order has between 1 and 5 products.
DECLARE @OrderDetailCounter INT = 1;

WHILE @OrderDetailCounter <= 5000
BEGIN
    DECLARE @OrderID INT = @OrderDetailCounter;
    DECLARE @ProductCount INT = ABS(CHECKSUM(NEWID())) % 5 + 1; -- Random number of products per order

    DECLARE @ProductCounter INT = 1;

    WHILE @ProductCounter <= @ProductCount
    BEGIN
        INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
        VALUES (
            @OrderID,
            ABS(CHECKSUM(NEWID())) % 100 + 1, -- Random ProductID between 1 and 100
            ABS(CHECKSUM(NEWID()) % 5 + 1), -- Quantity between 1 and 5
            ROUND((RAND() * 100 + 10), 2) -- Unit price between $10 and $110
        );

        SET @ProductCounter = @ProductCounter + 1;
    END;

    SET @OrderDetailCounter = @OrderDetailCounter + 1;
END;

--Insert Transactions
--Insert transactions with a mix of completed and failed payments.
DECLARE @TransactionCounter INT = 1;

WHILE @TransactionCounter <= 4500 -- Create transactions for 90% of orders
BEGIN
    INSERT INTO Transactions (OrderID, PaymentMethod, TransactionDate, PaymentStatus)
    VALUES (
        @TransactionCounter, -- Match with OrderID
        CASE WHEN @TransactionCounter % 3 = 0 THEN 'PayPal'
             WHEN @TransactionCounter % 3 = 1 THEN 'Credit Card'
             ELSE 'Bank Transfer'
        END,
        DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 30), GETDATE()), -- Random transaction date in the last 30 days
        CASE WHEN @TransactionCounter % 10 = 0 THEN 'Failed' -- 10% failed transactions
             ELSE 'Completed' 
        END
    );

    SET @TransactionCounter = @TransactionCounter + 1;
END;

-- Creating normalized tables as per the schema

CREATE TABLE Customers (
    [CustomerID] INT IDENTITY(1,1) PRIMARY KEY,
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL UNIQUE,
    [Phone] NVARCHAR(15),
    [Address] NVARCHAR(255),
    [City] NVARCHAR(50),
    [State] NVARCHAR(50),
    [Country] NVARCHAR(50),
    [SignupDate] DATE NOT NULL DEFAULT GETDATE()
);


CREATE TABLE Products (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
    [ProductName] NVARCHAR(100) NOT NULL,
    [ProductCategory] NVARCHAR(50),
    [Price] DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    [StockQuantity] INT NOT NULL CHECK (StockQuantity >= 0)
);


CREATE TABLE Orders (
    [OrderID] INT IDENTITY(1,1) PRIMARY KEY,
    [CustomerID] INT NOT NULL,
    [OrderDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [TotalAmount] DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    [OrderDetailID] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [Quantity] INT NOT NULL CHECK (Quantity > 0),
    [UnitPrice] DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Transactions (
    [TransactionID] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderID] INT NOT NULL,
    [PaymentMethod] NVARCHAR(50) NOT NULL,
    [TransactionDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [PaymentStatus] NVARCHAR(20) CHECK (PaymentStatus IN ('Completed', 'Failed')),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


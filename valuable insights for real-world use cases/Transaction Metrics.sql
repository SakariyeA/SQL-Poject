-- TRANSACTION METRICS

--Percentage of successful vs. failed transactions:
SELECT 
    PaymentStatus,
    COUNT(*) AS TransactionCount,
    (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Transactions)) * 100 AS Percentage
FROM Transactions
GROUP BY PaymentStatus;

--List transactions completed via each payment method:
SELECT 
    PaymentMethod,
    COUNT(*) AS TransactionCount
FROM Transactions
WHERE PaymentStatus = 'Completed'
GROUP BY PaymentMethod
ORDER BY TransactionCount DESC;

--Transactions by day:
SELECT 
    CAST(TransactionDate AS DATE) AS TransactionDay,
    COUNT(*) AS TransactionCount
FROM Transactions
GROUP BY CAST(TransactionDate AS DATE)
ORDER BY TransactionDay;

--Average transaction value for successful transactions:
SELECT 
    AVG(o.TotalAmount) AS AvgTransactionValue
FROM Transactions t
JOIN Orders o ON t.OrderID = o.OrderID
WHERE t.PaymentStatus = 'Completed';

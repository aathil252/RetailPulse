--Validate Product key
SELECT fs.ProductKey
FROM dbo.FactSales fs
LEFT JOIN dbo.DimProduct dp
ON fs.ProductKey = dp.ProductKey
WHERE dp.ProductKey IS NULL;

--Validate Customer key
SELECT fs.CustomerKey
FROM dbo.Factsales fs
LEFT JOIN dbo.DimCustomer dc
ON fs.CustomerKey = dc.CustomerKey
Where dc.CustomerKey IS NULL;

--Validate Store key
SELECT fs.StoreKey
FROM FactSales fs
LEFT JOIN DimStore ds
    ON fs.StoreKey = ds.StoreKey
WHERE ds.StoreKey IS NULL;

--Validate Order Date key
SELECT fs.OrderDateKey
FROM FactSales fs
LEFT JOIN DimDate dd
    ON fs.OrderDateKey = dd.DateKey
WHERE dd.DateKey IS NULL;

--Validate DeliceryDate key
SELECT fs.DeliveryDateKey
FROM FactSales fs
LEFT JOIN DimDate dd
    ON fs.DeliveryDateKey = dd.DateKey
WHERE fs.DeliveryDateKey IS NOT NULL
  AND dd.DateKey IS NULL;

--Validate Currency key
  SELECT DISTINCT fs.Currency
FROM FactSales fs
LEFT JOIN DimExchangeRate er
    ON fs.Currency = er.Currency
WHERE er.Currency IS NULL;

--Exact match sales and Factsales
SELECT 
    SalesCount = (SELECT COUNT(*) FROM Sales),
    FactCount = (SELECT COUNT(*) FROM FactSales);

--Validate for Null Foreign Keys
SELECT *
FROM FactSales
WHERE 
    CustomerKey IS NULL OR
    ProductKey IS NULL OR
    StoreKey IS NULL OR
    OrderDateKey IS NULL;

-- Validate for impossible values
-- Where quantity is less than 0
SELECT *
FROM FactSales
WHERE Quantity <= 0;

--For missing prices
SELECT *
FROM FactSales
WHERE UnitPriceUSD IS NULL;


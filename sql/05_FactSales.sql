SELECT * FROM dbo.Sales;
SELECT Count(*) FROM dbo.Sales;

CREATE TABLE FactSales(
SalesKey INT IDENTITY(1,1) PRIMARY KEY,
OrderNumber NVARCHAR(50),
LineItem INT,
CustomerKey INT,
StoreKey INT,
ProductKey INT,
OrderDateKey INT,
DeliveryDateKey INT,
Currency NVARCHAR(10),
Quantity INT,
UnitPriceUSD DECIMAL(10,2),
TotalSalesUSD DECIMAL(10,2)
);

INSERT INTO dbo.FactSales(
OrderNumber,
LineItem,
CustomerKey,
StoreKey,
ProductKey,
OrderDateKey,
DeliveryDateKey,
Currency,
Quantity,
UnitPriceUSD,
TotalSalesUSD
)
SELECT 
s.[Order Number],
s.[Line Item],
s.CustomerKey,
s.StoreKey,
s.ProductKey,
CONVERT (INT, FORMAT(CONVERT(date,s.[Order Date]),'yyyyMMdd')) AS OrderDateKey,
CONVERT( INT, FORMAT(CONVERT(date,s.[Delivery Date]),'yyyyMMdd')) AS DeliveryDateKey,
s.[Currency Code] as Currency,
s.Quantity,
p.UnitPriceUSD,
(s.Quantity * p.UnitPriceUSD) as TotalSalesUSD
FROM dbo.Sales s
JOIN dbo.DimProduct p
ON s.ProductKey = p.ProductKey

TRUNCATE TABLE dbo.FactSales;

INSERT INTO dbo.FactSales(
    OrderNumber,
    LineItem,
    CustomerKey,
    StoreKey,
    ProductKey,
    OrderDateKey,
    DeliveryDateKey,
    Currency,
    Quantity,
    UnitPriceUSD,
    TotalSalesUSD
)
SELECT 
    s.[Order Number],
    s.[Line Item],
    s.CustomerKey,
    s.StoreKey,
    s.ProductKey,

    -- ORDER DATE (safe)
    CONVERT(INT, FORMAT(CONVERT(date, s.[Order Date]), 'yyyyMMdd')) AS OrderDateKey,

    -- DELIVERY DATE (handle blank + NULL)
    CASE 
        WHEN s.[Delivery Date] IS NULL 
             OR LTRIM(RTRIM(s.[Delivery Date])) = '' 
        THEN NULL
        ELSE CONVERT(INT, FORMAT(CONVERT(date, s.[Delivery Date]), 'yyyyMMdd'))
    END AS DeliveryDateKey,

    s.[Currency Code] AS Currency,
    s.Quantity,
    p.UnitPriceUSD,
    (s.Quantity * p.UnitPriceUSD) AS TotalSalesUSD
FROM dbo.Sales s
JOIN dbo.DimProduct p
    ON s.ProductKey = p.ProductKey;

SELECT * FROM dbo.FactSales;
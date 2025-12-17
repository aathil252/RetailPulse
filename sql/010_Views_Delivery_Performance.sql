Create view dbo.vw_DeliveryPerformance as
SELECT fs.SalesKey,
fs.OrderNumber,
fs.LineItem, fs.CustomerKey, 
fs.StoreKey, fs.ProductKey,
od.[Date] as OrderDate,
dd.[Date] as DeliveryDate,
CASE
    WHEN fs.DeliveryDateKey IS NULL THEN NULL
	ELSE DATEDIFF(DAY, od.[Date], dd.[Date])
End AS DeliveryDays,
fs.TotalSalesUSD
FROM dbo.FactSales fs
Join dbo.DimDate od
on fs.OrderDateKey = od.DateKey
LEFT JOIN dbo.DimDate dd
on fs.DeliveryDateKey = dd.DateKey ;

SELECT MIN(DeliveryDays) FROM dbo.vw_DeliveryPerformance;
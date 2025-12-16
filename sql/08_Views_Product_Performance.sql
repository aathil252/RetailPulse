
Create view dbo.vw_Productperformance As 
SELECT p.ProductKey, p.ProductName, p.Brand, p.Category,
p.SubCategory,p.UnitPriceUSD,
SUM(fs.Quantity) as TotalQuantitySold,
SUM(fs.TotalSalesUSD) as TotalSalesUSD,
AVG(fs.UnitPriceUSD) as AvgSellingPriceUSD
From dbo.FactSales fs
Join dbo.DimProduct p
on fs.ProductKey = p.ProductKey
Group By
p.ProductKey, p.ProductName, p.Brand, p.Category,
p.SubCategory,p.UnitPriceUSD;

SELECT * FROM dbo.vw_Productperformance;
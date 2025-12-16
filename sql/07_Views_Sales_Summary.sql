
Create View dbo.vw_SalesSummary_ByDate As
Select d.[Date], d.Year, d.Month, d.MonthName, d.Quarter,
SUM(fs.TotalSalesUSD) as TotalSalesUSD,
Sum(fs.Quantity) as TotalQuantity,
COUNT(DISTINCT fs.OrderNumber) as OrderCount
FROM dbo.FactSales fs
Join dbo.DimDate d
on fs.OrderDateKey = d.DateKey
Group By
d.[Date],d.Year, d.Month, d.MonthName, d.Quarter

SELECT * FROM dbo.vw_SalesSummary_ByDate ORDER BY [Date];
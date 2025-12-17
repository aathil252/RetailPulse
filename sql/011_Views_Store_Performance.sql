Create view dbo.vw_StorePerformance as
SELECT s.StoreKey, s.Country, s.State, s.[Square Meters], s.[Open Date],
Sum(fs.TotalSalesUSD) as TotalSalesUSD,
Sum(fs.Quantity) as TotalUnits,
COUNT(DISTINCT fs.OrderNumber) as OrderCount,
CASE 
    WHEN s.[Square Meters] IS NULL OR s.[Square Meters] = 0 
	THEN NULL
	Else SUM(fs.TotalSalesUSD) * 1.0 / s.[Square Meters]
END AS SalesPerSquareMetre
FROM dbo.DimStore s
LEFT JOIN dbo.FactSales fs
on s.StoreKey = fs.StoreKey
GROUP BY
s.StoreKey, s.Country, s.State, s.[Square Meters], s.[Open Date] ;



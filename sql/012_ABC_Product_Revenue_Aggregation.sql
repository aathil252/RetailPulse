SELECT
    fs.ProductKey,
    SUM(fs.TotalSalesUSD) AS TotalRevenue
FROM dbo.FactSales fs
GROUP BY fs.ProductKey
ORDER BY TotalRevenue DESC;
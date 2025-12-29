CREATE OR ALTER VIEW dbo.vw_ProductABC AS
WITH product_revenue AS (
    SELECT
        fs.ProductKey,
        SUM(fs.TotalSalesUSD) AS TotalRevenue
    FROM dbo.FactSales fs
    GROUP BY fs.ProductKey
),
cumulative_calc AS (
    SELECT
        pr.ProductKey,
        pr.TotalRevenue,
        SUM(pr.TotalRevenue) OVER () AS GrandTotalRevenue,
        SUM(pr.TotalRevenue) OVER (
            ORDER BY pr.TotalRevenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeRevenue
    FROM product_revenue pr
)
SELECT
    dp.ProductKey,
    dp.ProductName,
    cc.TotalRevenue,
    cc.CumulativeRevenue * 1.0 / cc.GrandTotalRevenue AS CumulativeRevenuePct,
    CASE
        WHEN cc.CumulativeRevenue * 1.0 / cc.GrandTotalRevenue <= 0.80 THEN 'A'
        WHEN cc.CumulativeRevenue * 1.0 / cc.GrandTotalRevenue <= 0.95 THEN 'B'
        ELSE 'C'
    END AS ABC_Class
FROM cumulative_calc cc
JOIN dbo.DimProduct dp
    ON cc.ProductKey = dp.ProductKey;
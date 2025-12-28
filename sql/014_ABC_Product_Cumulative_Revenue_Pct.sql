WITH product_revenue AS (
    SELECT
        fs.ProductKey,
        SUM(fs.TotalSalesUSD) AS TotalRevenue
    FROM dbo.FactSales fs
    GROUP BY fs.ProductKey
),
cumulative_calc AS (
    SELECT
        ProductKey,
        TotalRevenue,
        SUM(TotalRevenue) OVER () AS GrandTotalRevenue,
        SUM(TotalRevenue) OVER (
            ORDER BY TotalRevenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeRevenue
    FROM product_revenue
)
SELECT
    ProductKey,
    TotalRevenue,
    CumulativeRevenue,
    CumulativeRevenue * 1.0 / GrandTotalRevenue AS CumulativeRevenuePct
FROM cumulative_calc
ORDER BY TotalRevenue DESC;
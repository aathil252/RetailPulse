Create View dbo.vw_CustomerInsights As
SELECT c.CustomerKey, c.Name, c.Gender, c.Country, c.State, c.Continent, c.Age,
CASE 
    WHEN c.Age IS NULL Then 'Unknown'
	WHEN c.Age < 25 Then 'Under 25'
	When c.Age BETWEEN 25 AND 34 THEN '25-34'
	WHEN c.Age BETWEEN 35 AND 44 THEN '35-44'
	WHEN c.Age BETWEEN 45 AND 54 THEN '45-54'
	WHEN c.Age >= 55 Then '55+'
End AS AgeGroup,
COUNT(Distinct fs.OrderNumber) as OrdersCount,
SUM(fs.TotalSalesUSD) as TotalSalesUSD,
SUM(fs.Quantity) as TotalUnits
FROM dbo.DimCustomer c
Left Join dbo.FactSales fs
ON c.CustomerKey = fs.CustomerKey
Group By
 c.CustomerKey, c.Name, c.Gender, c.Country, c.State, c.Continent, c.Age,
CASE 
    WHEN c.Age IS NULL Then 'Unknown'
	WHEN c.Age < 25 Then 'Under 25'
	When c.Age BETWEEN 25 AND 34 THEN '25-34'
	WHEN c.Age BETWEEN 35 AND 44 THEN '35-44'
	WHEN c.Age BETWEEN 45 AND 54 THEN '45-54'
	WHEN c.Age >= 55 Then '55+'
END ;

SELECT * FROM dbo.vw_CustomerInsights;
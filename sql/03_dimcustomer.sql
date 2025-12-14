
SELECT * FROM dbo.Customers;

CREATE TABLE dbo.DimCustomer(
CustomerKey INT PRIMARY KEY,
Name NVARCHAR(255),
Gender NVARCHAR(255),
City NVARCHAR(255),
[State Code] NVARCHAR(255),
State NVARCHAR(255),
[Zip Code] NVARCHAR(255),
Country NVARCHAR(255),
Continent NVARCHAR(255),
Birthday DATE,
Age INT
);

INSERT INTO dbo.DimCustomer(
CustomerKey,
Name,
Gender,
City,
[State Code],
State,
[Zip Code],
Country,
Continent,
Birthday,
Age
)
 SELECT CustomerKey,
 Name,
 Gender,
 City,
 [State Code],
 State,
 [Zip Code],
 Country,
 Continent,
 Birthday,
 DATEDIFF(YEAR,Birthday,GETDATE()) AS Age
 FROM dbo.Customers;

 SELECT * FROM dbo.DimCustomer;
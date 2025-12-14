Select * From dbo.Products;

CREATE TABLE DimProduct(
ProductKey INT PRIMARY KEY,
ProductName NVARCHAR(255),
Brand NVARCHAR(255),
Color NVARCHAR(255),
UnitCostUSD DECIMAL(10,2),
UnitPriceUSD DECIMAL(10,2),
SubCategoryKey INT,
SubCategory NVARCHAR(255),
CategoryKey INT,
Category NVARCHAR(255)
);

INSERT INTO dbo.DimProduct(
ProductKey,
ProductName,
Brand,
Color,
UnitCostUSD,
UnitPriceUSD,
SubCategoryKey,
SubCategory,
CategoryKey,
Category
)
SELECT ProductKey,
ProductName,
Brand,
Color,
CAST(UnitCostUSD AS DECIMAL(10,2)),
CAST (UnitPriceUSD AS DECIMAL(10,2)),
SubCategoryKey,
SubCategory,
CategoryKey,
Category
FROM dbo.Products;

SELECT * FROM dbo.DimProduct
SELECT Count(*) FROM dbo.Customers;
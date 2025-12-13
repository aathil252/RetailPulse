SELECT * FROM dbo.Stores;

CREATE TABLE DimStore(
StoreKey INT PRIMARY KEY,
Country NVARCHAR(255),
State NVARCHAR(255),
[Square Meters] INT,
[Open Date] DATE
);

INSERT INTO DimStore(
StoreKey,
Country,
State,
[Square Meters],
[Open Date]
)
SELECT StoreKey,
Country,
State,
[Square Meters],
[Open Date]
FROM dbo.Stores;

SELECT * FROM DimStore;

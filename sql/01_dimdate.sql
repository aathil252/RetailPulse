CREATE TABLE dbo.DimDate (
    DateKey INT PRIMARY KEY,
    [Date] DATE,
    Day INT,
    DayName NVARCHAR(20),
    Month INT,
    MonthName NVARCHAR(20),
    Quarter INT,
    Year INT,
    WeekOfYear INT,
    DayOfWeek INT,
    IsWeekend BIT
);
;WITH DateRange AS (
    SELECT CAST('2010-01-01' AS DATE) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateRange
    WHERE DateValue < '2030-12-31'
)
INSERT INTO dbo.DimDate
SELECT
    CONVERT(INT, FORMAT(DateValue,'yyyyMMdd')) AS DateKey,
    DateValue AS [Date],
    DAY(DateValue) AS Day,
    DATENAME(WEEKDAY, DateValue) AS DayName,
    MONTH(DateValue) AS Month,
    DATENAME(MONTH, DateValue) AS MonthName,
    DATEPART(QUARTER, DateValue) AS Quarter,
    YEAR(DateValue) AS Year,
    DATEPART(WEEK, DateValue) AS WeekOfYear,
    DATEPART(WEEKDAY, DateValue) AS DayOfWeek,
    CASE WHEN DATENAME(WEEKDAY, DateValue) IN ('Saturday','Sunday') THEN 1 ELSE 0 END AS IsWeekend
FROM DateRange
OPTION (MAXRECURSION 0);

SELECT * FROM dbo.DimDate;

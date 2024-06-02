use TBD2024;
GO

Alter VIEW [TestView] AS
Select Id,Name,
CASE Type
    WHEN 1 THEN 'Masculino'
    WHEN 2 THEN 'Femenino'
    WHEN 3 THEN 'Apellido'
    ELSE 'Unknown'
  END as StrType,
  Type as NumType
From dbo.RanNames;
GO

Select * From [TestView];
SELECT TABLE_SCHEMA,TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;

SELECT name FROM sys.views;
GO

Alter VIEW [RanNamesCross] AS
Select Name,LastName From 
(Select Name From dbo.RanNames
Where Type = 1) as table1,(
Select Name as LastName From dbo.RanNames
Where Type = 3) as table2
UNION
Select * From 
(Select Name From dbo.RanNames
Where Type = 2) as table1,(
Select Name as LastName From dbo.RanNames
Where Type = 3) as table2;
GO

Select * from dbo.Task;
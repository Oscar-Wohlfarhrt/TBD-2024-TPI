CREATE DATABASE TBD2024;

USE master;
DROP Table dbo.RanNames;

USE TBD2024;
CREATE TABLE dbo.RanNames(
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    Type INT
);

INSERT INTO dbo.RanNames (Name,Type)
VALUES ('Test',0);
INSERT INTO dbo.RanNames (Name,Type)
VALUES ('Test2',0);
INSERT INTO dbo.RanNames (Name,Type)
VALUES ('Test3',0);
INSERT INTO dbo.RanNames (Name,Type)
VALUES ('Test4',0);

SELECT * FROM dbo.RanNames;
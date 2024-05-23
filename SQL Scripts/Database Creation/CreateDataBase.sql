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
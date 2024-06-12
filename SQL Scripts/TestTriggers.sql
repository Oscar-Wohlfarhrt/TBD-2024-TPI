USE TBD2024;
GO
Select * from dbo.RanNames;
GO
Drop TRIGGER testTrgAfterInsert;
GO
CREATE OR ALTER TRIGGER testTrgAfterInsert ON [dbo].[RanNames] 
AFTER INSERT
AS
    declare @test varchar(50);
    Select @test=a.Name from inserted a
	PRINT 'AFTER INSERT: You have been inserted a new row'
    Print @test
GO

Insert into dbo.RanNames (Name,Type)
Values ('AnotherTest3',0);
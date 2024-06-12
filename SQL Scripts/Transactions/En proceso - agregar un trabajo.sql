CREATE PROCEDURE AddWork
@WorkType INT,
@WorkPriority INT,
@ConnectionNum INT,
@FileNumber INT,
@RequestDate DATE,
@StartDate DATE,
@EndDate DATE

AS
    BEGIN TRANSACTION;

    begin TRY
    --
        DECLARE @WorkId int = (next value for [dbo].[SequenceWork])
        INSERT INTO [dbo].[Work] (WorkId,WorkType,WorkPriority,ConnectionNum,FileNumber,RequestDate,StartDate,EndDate)
        VALUES (@WorkId,@WorkType,@WorkPriority,@ConnectionNum,@FileNumber,@RequestDate,@StartDate,@EndDate)
    -- inserto un WORK con WorkId con Sequence y guardo WorkId en una variable para otras operaciones 
DECLARE @count int 
--declaro el contador
WHILE @count <= (select COUNT(*) FROM [dbo].[GenericTask] WHERE WorkType = @WorkType)
--defino el contador e inicio el while
BEGIN
select * FROM [dbo].[GenericTask] as GT WHERE WorkType = @WorkType --obtengo la tabla a copiar de generic work

insert into [dbo].[Task] (WorkId,TaskNumber)--

set @count = @count - 1 
END


        COMMIT TRANSACTION
    end try
    begin CATCH
        ROLLBACK TRANSACTION


    end CATCH

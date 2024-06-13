SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddWork]
@WorkType INT,
@WorkPriority INT,
@ConnectionNum INT,
@FileNumber INT,
@StartDate DATE,
@EndDate DATE

AS
    BEGIN TRANSACTION;

        DECLARE @RequestDate DATE = GETDATE();
    --
        DECLARE @WorkId int = (next value for [dbo].[SequenceWork])
        INSERT INTO [dbo].[Work](WorkId,WorkType,WorkPriority,ConnectionNum,FileNumber,RequestDate,StartDate,EndDate)
        VALUES (@WorkId,@WorkType,@WorkPriority,@ConnectionNum,@FileNumber,@RequestDate,@StartDate,@EndDate)
    -- inserto un WORK con WorkId con Sequence y guardo WorkId en una variable para otras operaciones 
    
        --Variables para recuperar los datos de la tabla generada por 
        DECLARE @retrivedTaskId Int;
        DECLARE @retrivedOrder int;
        DECLARE @retrivedDescription VARCHAR(50);
        DECLARE @retrivedEstimatedDuration int;
        
        --Creo un cursor para iterar sobre la tabla de getTasksByWorkId
        insert INTO [dbo].[Task]
        SELECT 
        @WorkId as WorkId,
        [TaskId] as TaskNumber,
        NULL as ManWorkCost,
        NULL as FileNumber,
        NULL as TaskState,
        NULL as AreaId,
        [Order] as TaskOrder,
        [Description],
        [EstimatedDuration]
        FROM [dbo].getTasksByWorkId(@WorkType)

        COMMIT TRANSACTION
GO

CREATE FUNCTION dbo.getTasksByWorkId(@WorkType INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM [dbo].[GenericTask]
    WHERE WorkType = @WorkType
);
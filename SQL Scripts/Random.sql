use TBD2024
go

drop function RandomInt
go
Create Function RandomInt (@min int = 0,@max as int = 1)
returns int
as begin
  return (Select abs(cast(cast((RAND()) as varbinary(4)) as int)))%(@max-@min+1) + @min
end;
go

drop function RandomDate
go
Create Function RandomDate (@min date,@max as date)
returns date
as begin
  return dateadd(day, (select value from getRandom)*(1+datediff(day, @min, @max)), @min)
end;
go
--value from getNewID

CREATE FUNCTION dbo.RandomIntBetween (@min INT, @max INT)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    DECLARE @seed INT = DATEPART(SECOND, GETDATE()) + DATEPART(MILLISECOND, GETDATE());
    SET @result = ABS(CAST((@seed) AS INT)) % (@max - @min + 1) + @min;

    RETURN @result;
END;
go



update Task
set Task.AreaId = gt.AreaId,Task.EstimatedDuration = gt.EstimatedDuration, Task.ManWorkCost = gt.ManWorkCost
from Task
inner join [Work] as w on Task.WorkId = w.WorkId
inner join [GenericTask] as gt on gt.WorkType = w.WorkType and gt.TaskId = TaskNumber

Select * from task as t
inner join [Work] as w on t.WorkId = w.WorkId
inner join [GenericTask] as gt on gt.WorkType = w.WorkType and gt.TaskId = t.TaskNumber


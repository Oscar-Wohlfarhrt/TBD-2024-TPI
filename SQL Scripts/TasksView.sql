use TBD2024
GO
CREATE OR ALTER VIEW dbo.TasksView as 
SELECT
t.WorkId,
t.TaskNumber,
t.TaskOrder ,
t.[Description],
t.ManWorkCost as [Mano de obra],
t.FileNumber as [File Number],
ts.[Description] as TaskState,
a.AreaId,
a.Name as AreaName,
CONCAT(t.EstimatedDuration, ' minutos') as EstimatedDuration

FROM dbo.Task as t
INNER JOIN TaskState as ts on t.TaskState = ts.TaskStateNum
INNER JOIN Area as a on a.AreaId = t.AreaId

use TBD2024;

Select * from getTasksByWorkId(1);

select * from task;

select * from [Work];

delete from task where workid = 15;

Declare @workId as int;
Declare @areaId as int;
Declare @taskState as int;
set @workId = 15;
set @areaId = 1;
set @taskState = 1;

--insert into Task
Select
    @workId as WorkId,
    [TaskId] as TaskNumber,
    NULL as ManWorkCost,
    NULL as FileNumber,
    @taskState as TaskState,
    @areaId as AreaId,
    [Order] as TaskOrder,
    [Description],
    Dateadd(day,1,GETDATE()) as EstimatedDurationTime
from getTasksByWorkId(1) as a;


select * from TaskState
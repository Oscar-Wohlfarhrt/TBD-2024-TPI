create TABLE GenerictaskMaterial(
RefNumWork int,
TaskNumber int,
MaterialId int,
Quantity int,
Cost float,
ValiditySpan bigint,
PRIMARY KEY(RefNumWork,TaskNumber,MaterialId),
FOREIGN KEY (RefNumWork,TaskNumber) REFERENCES [dbo].[GenericTask](WorkType,taskid),
FOREIGN KEY (MaterialId) REFERENCES [dbo].[Material](Id)
)
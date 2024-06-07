use TBD2024;
 create TABLE GenericTaskMaterial(
    WorkType int,
    TaskNumber int,
    MaterialId int,
    Quantity int,
    Cost float,
    ValiditySpan BIGINT, --long int
    PRIMARY KEY (WorkType,TaskNumber,MaterialId),
    FOREIGN KEY (WorkType,TaskNumber) REFERENCES [dbo].[GenericTask](WorkType,TaskId),
    FOREIGN KEY (MaterialId) REFERENCES [dbo].[Material](id)
 );
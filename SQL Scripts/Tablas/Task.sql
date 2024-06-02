use TBD2024;

CREATE TABLE Task(
    WorkId INT,--PK FK Work
    WorkType INT,-- PK FK GenericTask "Sin este campo no encuentra TaskNumber"
    TaskNumber INT,--PK FK GenericTask
    ETA DATE,
    Creation DATE,
    ManWorkCost FLOAT,
    FileNumber INT,--Fk
    TaskState INT,--FK
    AreaId INT,--FK
    PRIMARY KEY (WorkId,TaskNumber),
    FOREIGN KEY (WorkType,TaskNumber) REFERENCES [dbo].[GenericTask](WorkType,TaskId),
    FOREIGN KEY (WorkId) REFERENCES [dbo].[Work](WorkId),
    FOREIGN KEY (FileNumber) REFERENCES [dbo].[Worker](FileNumber),
    FOREIGN KEY (AreaId) REFERENCES [dbo].[Area](AreaId),
    FOREIGN KEY (TaskState) REFERENCES [dbo].[TaskState](TaskStateNum),
    
);

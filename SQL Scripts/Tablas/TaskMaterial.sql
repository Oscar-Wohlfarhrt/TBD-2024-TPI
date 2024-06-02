use TBD2024;
 CREATE TABLE TaskMaterial(
    WorkId int,--PK FK
    TaskNumber int,--PK FK
    MaterialId int,--PK FK
    Quantity int, -- sugiero que sea FLOAT por el hecho de m de cable o kg de cemento
    Cost float,
    CostStartDate date,
    CostendDate date,
    PRIMARY KEY (WorkId,TaskNumber,MaterialId),
    FOREIGN KEY (WorkId,TaskNumber) REFERENCES Task(WorkId,TaskNumber),
    
    FOREIGN KEY (MaterialId) REFERENCES [dbo].[Material](Id),
 );
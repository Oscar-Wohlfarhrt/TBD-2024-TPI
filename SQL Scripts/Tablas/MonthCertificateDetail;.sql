use TBD2024;
CREATE TABLE MonthCertificateMats(
    CreationDate date,--Fk MonthCertificate
    MaterialId int,--Fk Material
    WorkId int,--FK Task
    TaskNumber int,--FK Task
    Quantity INT,
    Cost float,
    CostStartDate date,
    CostEndDate DATE
    PRIMARY KEY (CreationDate,MaterialId,WorkId,TaskNumber),
    FOREIGN KEY (CreationDate) REFERENCES [dbo].[MonthCertificate](CreationDate),
    FOREIGN KEY (MaterialId) REFERENCES [dbo].[Material](Id),
    FOREIGN KEY (WorkId,TaskNumber) REFERENCES [dbo].[Task](WorkId,Tasknumber),
);
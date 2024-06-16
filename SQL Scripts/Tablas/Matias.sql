use TBD2024
CREATE TABLE Company (
    CompanyId INT PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL
);

CREATE TABLE Priority (
    Priority INT PRIMARY KEY,
    PriorDescription VARCHAR(50) NOT NULL
);

CREATE TABLE GenericWork (
    WorkTypeId INT PRIMARY KEY,
    Description VARCHAR(50) NOT NULL
);

CREATE TABLE GenericTask (
    WorkType INT,
    TaskId INT,
    [Order] INT,
    Description VARCHAR(50) NOT NULL,
    EstimatedDuration BIGINT,
    PRIMARY KEY (WorkType, TaskId),
    FOREIGN KEY (WorkType) REFERENCES GenericWork(WorkTypeId)
);

CREATE TABLE Work (
    WorkId INT PRIMARY KEY,
    WorkType INT,
    Priority INT,
    ConnectionNum INT,
    FileNumber INT,
    RequestDate DATE,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (WorkType) REFERENCES GenericTask(WorkType),
    FOREIGN KEY (Priority) REFERENCES Priority(Priority),
    FOREIGN KEY (ConnectionNum) REFERENCES Connection(ConnectionNum),
    FOREIGN KEY (FileNumber) REFERENCES Worker(FileNumber)
);



CREATE TABLE MonthCertificateMats (
    CurrentDate DATE,
    MatId INT,
    WorkId INT,
    TaskNumber INT,
    MaterialId INT,
    Quantity INT,
    Cost FLOAT,
    CostStartDate DATE,
    CostEndDate DATE,
    PRIMARY KEY (CurrentDate, MatId, WorkId, TaskNumber, MaterialId),
    FOREIGN KEY (WorkId) REFERENCES OtherTableWorkId(WorkId),
    FOREIGN KEY (TaskNumber) REFERENCES OtherTableTaskNumber(TaskNumber),
    FOREIGN KEY (MaterialId) REFERENCES OtherTableMaterialId(MaterialId)
);


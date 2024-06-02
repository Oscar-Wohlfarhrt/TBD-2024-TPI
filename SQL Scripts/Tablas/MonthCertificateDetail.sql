use TBD2024;

CREATE TABLE MonthCertificateDetail (
    CurrentDate date,
    [Index] int, --Index es una palabra reservada por lo que debe ir entre corchetes para poder utilizarla
    WorkId  INT,
    PRIMARY KEY (CurrentDate,[Index]),
    FOREIGN KEY (CurrentDate) REFERENCES MonthCertificate(CurrentDate),-- Estamos seguros que currentDate debe ser almacenado? 
    FOREIGN KEY (WorkId) REFERENCES Work(WorkId),
);
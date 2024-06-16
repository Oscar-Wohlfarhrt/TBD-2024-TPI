use TBD2024

--Actualiza la tabla MonthCertificateMats con datos de la tabla TaskMaterial
GO
CREATE or ALTER TRIGGER ger.AddTaskMaterialonMCD on ger.MonthCertificateDetail
for INSERT as
INSERT into MonthCertificateMats
SELECT 
    mcd.CreationDate,
    tm.MaterialId,
    tm.WorkId,
    tm.TaskNumber,
    tm.Quantity,
    tm.Cost,
    tm.CostStartDate,
    tm.CostendDate
FROM inserted as mcd
inner join TaskMaterial as tm on tm.WorkId = mcd.WorkId

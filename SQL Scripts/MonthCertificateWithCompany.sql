use TBD2024
go
CREATE or ALTER VIEW ger.[MonthCertificateWithCompany] AS
SELECT
mc.CreationDate,
c.CompanyName,
ec.ElectricCompanyName,
mc.StartDate,
mc.EndDate
FROM ger.MonthCertificate as mc
INNER JOIN ger.Company as c on c.CompanyId = mc.Company
INNER JOIN dbo.ElectricCompany as ec on ec.ElectricCompanyId = mc.ElectricCompany

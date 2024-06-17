use TBD2024;

select * from ger.MonthCertificate
select * from ger.MonthCertificateDetail
select * from ger.MonthCertificateMats

select * from Work
select * from TaskMaterial

delete from ger.MonthCertificateDetail;
delete from ger.MonthCertificate;

select 
*
from ger.MonthCertificateDetail as mcd
inner join TaskMaterial as tm on tm.WorkId = mcd.WorkId

select * from TaskMaterial

select * from ger.Company
select * from ElectricCompany



ALTER TABLE [ger].[MonthCertificate] DROP CONSTRAINT FK_MonthCert_Elect
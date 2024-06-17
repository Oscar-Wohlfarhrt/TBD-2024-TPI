use TBD2024
go
CREATE or ALTER VIEW [WorkPerCertificate] AS
SELECT
mc.CreationDate,
w.WorkId,
gw.[Description],
wp.PriorDescription,
w.ConnectionNum,
w.RequestDate,
w.StartDate,
w.EndDate
FROM dbo.Task as t
INNER JOIN dbo.[Work] as w on t.WorkId = w.WorkId
INNER JOIN dbo.GenericWork as gw on gw.WorkTypeId = w.WorkType
INNER JOIN dbo.WorkPriority as wp on wp.WorkPriority = w.WorkPriority
INNER JOIN ger.MonthCertificateDetail as mcd on mcd.WorkId = w.WorkId
INNER JOIN ger.MonthCertificate as mc on mcd.CreationDate = mc.CreationDate
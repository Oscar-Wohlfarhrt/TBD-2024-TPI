use TBD2024
GO
CREATE OR ALTER VIEW ger.ConnectionperLocale as 
SELECT l.Name AS [Localidad] , COUNT(*) as [Cantidad de conexiones] 
FROM dbo.Connection as cu
INNER JOIN Locale l on l.LocaleId = cu.LocaleId
GROUP BY l.Name


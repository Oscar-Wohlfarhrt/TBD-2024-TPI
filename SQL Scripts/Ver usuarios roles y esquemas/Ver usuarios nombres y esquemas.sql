USE TBD2024;
SELECT * FROM sys.database_principals WHERE type IN ('S', 'U', 'G');


select * from sys.server_principals where type like 'S' and is_disabled = 0
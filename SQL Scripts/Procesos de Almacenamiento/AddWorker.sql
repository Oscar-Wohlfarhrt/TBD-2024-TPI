use TBD2024;

"ALTER TABLE dbo.Worker 
ADD principalId INT NULL;"

ALTER ROLE Trabajador Add MEMBER MatiBalbuena

select * from Worker

print SUSER_NAME();
print SUSER_ID();

SELECT * FROM master.sys.server_principals
where principal_id = SUSER_ID();
go

CREATE OR ALTER PROCEDURE [ger].[NewWorker]
@AreaId INT,
@Name VARCHAR (50),
@LastName varchar (50),
@Password VARCHAR (100),
@Rol INT
AS
BEGIN
    declare @rol_type varchar(200)
    declare @safe_login varchar(200)
    declare @safe_password varchar(200)
    set @safe_login = replace(CONCAT(@Name,@LastName),'''', '''''')
    set @safe_password = replace(@password,'''', '''''')

    set @rol_type = CASE
        WHEN @Rol = 1 THEN 'Gerente'
        WHEN @Rol = 2 THEN 'OperadorTelefonico'
        WHEN @Rol = 3 THEN 'Trabajador'
    END

    declare @sql nvarchar(max)
    set @sql = 'use TBD2024;' +
           'create login ' + @safe_login + 
               ' with password = ''' + @safe_password + '''; ' +
           'create user ' + @safe_login + ' from login ' + @safe_login + ';' +
           'ALTER ROLE ' + @rol_type + ' ADD MEMBER ' + @safe_login + ';'
    exec(@sql)
    
    declare @dbId int
    
    SELECT @dbId=principal_id FROM master.sys.server_principals
    where name = @safe_login;

    INSERT INTO [dbo].[Worker] (FileNumber,AreaId,Name,LastName,principalId)
    VALUES (next VALUE for [dbo].[SequenceWorker],@AreaId,@Name,@LastName,@dbId)
END;
go


"CREATE PROCEDURE [dbo].[NewWorker]
@AreaId INT,
@Name VARCHAR (50),
@LastName varchar (50)
As
BEGIN
INSERT Into [dbo].[Worker] (FileNumber,AreaId,[Name],LastName)
VALUES (next VALUE for [dbo].[SequenceWorker],@AreaId,@Name,@LastName)
end;"
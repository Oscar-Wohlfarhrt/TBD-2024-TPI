USE TBD2024;
go
CREATE OR ALTER VIEW DBPROCEDURES AS
SELECT 
    OBJECT_ID(CONCAT(SPECIFIC_SCHEMA,'.',SPECIFIC_NAME)) as OBJECT_ID,
    SPECIFIC_SCHEMA,
    SPECIFIC_NAME,
    CONCAT(SPECIFIC_SCHEMA,'.',SPECIFIC_NAME) as FULL_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE LIKE 'PROCEDURE'
go

select  
'Parameter_name' = name,  
'Type'   = type_name(user_type_id),  
'Length'   = max_length,  
'Prec'   = case when type_name(system_type_id) = 'uniqueidentifier' 
            then precision  
            else OdbcPrec(system_type_id, max_length, precision) end,  
'Scale'   = OdbcScale(system_type_id, scale),  
'Param_order'  = parameter_id,  
'Collation'   = convert(sysname, 
                case when system_type_id in (35, 99, 167, 175, 231, 239)  
                then ServerProperty('collation') end)  

from sys.parameters
go
CREATE OR ALTER VIEW DBPROCEDURES_PARAMS AS
SELECT 
    pro.OBJECT_ID,
    pro.SPECIFIC_SCHEMA,
    pro.SPECIFIC_NAME,
    pro.FULL_NAME,
    par.parameter_id AS PARAM_ID,
    par.name AS PARAM_NAME,
    par.system_type_id AS PARAM_TYPE_ID,
    t.name AS PARAM_TYPE
FROM sys.parameters AS par
INNER JOIN DBPROCEDURES AS pro ON par.object_id = pro.OBJECT_ID
INNER JOIN sys.types AS t ON par.system_type_id = t.system_type_id;
go

SELECT * FROM DBPROCEDURES ORDER BY SPECIFIC_SCHEMA,SPECIFIC_NAME
SELECT * FROM DBPROCEDURES_PARAMS ORDER BY SPECIFIC_NAME,OBJECT_ID,PARAM_ID
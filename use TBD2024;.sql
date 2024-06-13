use TBD2024;
create table [Optel].[test2] (
TableNameId INT,
test2num INT,
Column1 NVARCHAR(50),
detalle NVARCHAR(50),
PRIMARY KEY (TableNameId,test2num),
FOREIGN KEY (TableNameId) REFERENCES [Optel].[testEschema](TableNameId)
)


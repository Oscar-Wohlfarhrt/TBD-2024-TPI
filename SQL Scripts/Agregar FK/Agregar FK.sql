use TBD2024;

ALTER TABLE Work
ADD CONSTRAINT FK_Work_ConnectionNum FOREIGN KEY (ConnectionNum) REFERENCES [dbo].[Connection](ConnectionNum);

--En SQL Server, los corchetes [] se utilizan para delimitar los nombres de los objetos de la base de datos (como tablas, columnas, esquemas, etc.), especialmente cuando estos nombres contienen espacios, caracteres especiales o son palabras reservadas.
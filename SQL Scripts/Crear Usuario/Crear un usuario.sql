CREATE LOGIN nombre_del_usuario WITH PASSWORD = 'Ab123456';

--Usar la contraseña 'Ab123456' 
--Esto crea un usuario pero no lo agrega a la base de datos, para eso esta el siguiente código

USE TBD2024
CREATE USER nombre_del_usuario FOR LOGIN nombre_del_usuario;

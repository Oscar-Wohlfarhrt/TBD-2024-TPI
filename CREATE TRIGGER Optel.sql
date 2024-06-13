CREATE TRIGGER Optel.insertPago
ON Optel.pago
AFTER INSERT
AS
BEGIN
    -- Variables para los datos que vienen de la tabla inserted
    DECLARE @idPago INT;
    DECLARE @fecha DATE;
    DECLARE @idFormaPago INT;
    DECLARE @idCliente INT;
    DECLARE @importePagado INT;

    -- Variables para los datos que vamos a definir manualmente
    DECLARE @fechaMov DATETIME;
    DECLARE @usuario NVARCHAR(128);

    -- Asignación de valores desde la tabla inserted
    SELECT 
        @idPago = id,
        @fecha = fecha,
        @idFormaPago = idFormaPago,
        @idCliente = idCliente,
        @importePagado = importePagado
    FROM inserted;

    -- Asignación de valores definidos manualmente
    SET @fechaMov = GETDATE(); -- Asigna la fecha y hora actuales
    SET @usuario = SUSER_SNAME(); -- Asigna el nombre del usuario actual

    -- Inserción en la tabla de logs
    INSERT INTO Optel.LogPago (idPago, fecha, idFormaPago, importePagado, idCliente, fechaMov, usuario)
    VALUES (@idPago, @fecha, @idFormaPago, @importePagado, @idCliente, @fechaMov, @usuario);
END;
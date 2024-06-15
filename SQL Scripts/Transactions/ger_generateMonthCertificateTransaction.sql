SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ger].[generateMonthCertificateTransaction]
@Company INT,
@ElectricCompany INT,
@Year INT,
@Month INT
AS
BEGIN
    -- Iniciar un bloque TRY
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Como la fecha es la PK obtengo su valor una única vez para evitar errores
        DECLARE @FechaActual DATE = GETDATE();

        -- Crear en la tabla un month certificate
        INSERT INTO [ger].[MonthCertificate]
        VALUES
        (
            @FechaActual,                                  -- CreationDate
            dbo.getFirstDayOfAMonth(@Year, @Month),        -- StartDate
            dbo.getLastDayOfTheMonthAsDate(@Year, @Month), -- EndDate (Calcula el último día del mes)
            @Company,                                      -- Company
            @ElectricCompany                               -- ElectricCompany
        );

        -- Rellenar MonthCertificateDetail con los trabajos terminados en el mes @Month
        INSERT INTO [ger].[MonthCertificateDetail] (CreationDate, [Index], WorkId)
        SELECT 
            @FechaActual,                              -- CreationDate
            ROW_NUMBER() OVER (ORDER BY WorkId) AS [Index],  -- Index 
            WorkId                                    -- WorkId
        FROM 
            [Work]                                    -- Busca los WorkId que hayan sido finalizados en un mes y año
        WHERE 
            DATEPART(YEAR, EndDate) = @Year 
            AND DATEPART(MONTH, EndDate) = @Month;

        -- Confirmar la transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback de la transacción en caso de error
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        
        -- Declarar variables para el mensaje de error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        -- Obtener información del error
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        -- Lanzar el error con la información original
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

    END CATCH;
END;
GO

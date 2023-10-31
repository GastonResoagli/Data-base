--Funcion para insertar un nuevo registro a la tabla gasto
CREATE PROCEDURE InsertarGasto
(
    @idprovincia int,
    @idlocalidad int,
    @idconsorcio int,
    @periodo int,
    @fechapago datetime,
    @idtipogasto int,
    @importe decimal(8,2)
)
AS
BEGIN
    INSERT INTO base_consorcio.dbo.gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (@idprovincia, @idlocalidad, @idconsorcio, @periodo, @fechapago, @idtipogasto, @importe);
END;

--Funcion para eliminar un registro de la tabla consorcio
CREATE PROCEDURE EliminarGasto
(
    @idgasto int
)
AS
BEGIN
    DELETE FROM base_consorcio.dbo.gasto
    WHERE idgasto = @idgasto;
END;

--Funcion para modificar un registro en la tabla consorcio
CREATE PROCEDURE ModificarGasto
(
    @idgasto int,
    @idprovincia int,
    @idlocalidad int,
    @idconsorcio int,
    @periodo int,
    @fechapago datetime,
    @idtipogasto int,
    @importe decimal(8,2)
)
AS
BEGIN
    UPDATE base_consorcio.dbo.gasto
    SET
        idprovincia = @idprovincia,
        idlocalidad = @idlocalidad,
        idconsorcio = @idconsorcio,
        periodo = @periodo,
        fechapago = @fechapago,
        idtipogasto = @idtipogasto,
        importe = @importe
    WHERE idgasto = @idgasto;
END;

--Pruebas
--Insertar gastos
EXEC InsertarGasto(:@idprovincia, :@idlocalidad, :@idconsorcio, :@periodo, :@fechapago, :@idtipogasto, :@importe) 
EXEC InsertarGasto 7, 7,500, 1,'20230101', 5, 500.50;
EXEC InsertarGasto 7, 7,500, 2,'20230211', 3, 48522.99;
EXEC InsertarGasto 7, 7,500, 1,'20230310', 3, 62573.65;
EXEC InsertarGasto 7, 7,500, 1,'20230405', 2, 91137.50;
EXEC InsertarGasto 7, 7,500, 1,'20230509', 2, 3031.15;

--Modificamos el ultimo registro gasto insertado
EXEC ModificarGasto 16011, 7, 7, 500, 1, '20230511', 2, 4031.15

--Eliminamos el primer registro insertado en las pruebas
EXEC EliminarGasto 16006
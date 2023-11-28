--Proceso para insertar un nuevo registro a la tabla consorcio
CREATE PROCEDURE InsertarConsorcio
(
    @idprovincia int,
    @idlocalidad int,
    @idconsorcio int,
    @nombre varchar(50),
    @direccion varchar(250),
    @idzona int,
    @idconserje int,
    @idadmin int
)
AS
BEGIN
    INSERT INTO base_consorcio.dbo.consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
    VALUES (@idprovincia, @idlocalidad, @idconsorcio, @nombre, @direccion, @idzona, @idconserje, @idadmin);
END;

--Proceso para eliminar un registro de la tabla consorcio
CREATE PROCEDURE EliminarConsorcio
(
    @idprovincia int,
    @idlocalidad int,
    @idconsorcio int
)
AS
BEGIN
    DELETE FROM base_consorcio.dbo.consorcio
    WHERE idprovincia = @idprovincia
    AND idlocalidad = @idlocalidad
    AND idconsorcio = @idconsorcio;
END;

--Proceso para modificar un registro en la tabla consorcio
CREATE PROCEDURE ModificarConsorcio
(
    @idprovincia int,
    @idlocalidad int,
    @idconsorcio int,
    @nombre varchar(50),
    @direccion varchar(250),
    @idzona int,
    @idconserje int,
    @idadmin int
)
AS
BEGIN
    UPDATE base_consorcio.dbo.consorcio
    SET nombre = @nombre,
        direccion = @direccion,
        idzona = @idzona,
        idconserje = @idconserje,
        idadmin = @idadmin
    WHERE idprovincia = @idprovincia
    AND idlocalidad = @idlocalidad
    AND idconsorcio = @idconsorcio;
END;

--Pruebas. 
--Insertamos 2 registros usando los procedimientos almacenados
EXEC InsertarConsorcio 7, 7, 500, 'Edificio Pepega 1', 'Av. Poggers 1522', 1, 1, 349
EXEC InsertarConsorcio 7, 7, 501, 'Edificio Jupiter 1', '9 de Julio 2002', 1, 1, 349

--Aqui insertamos usando sentencias insert
INSERT INTO consorcio(idprovincia,idlocalidad,idconsorcio, Nombre,direccion,idzona,idconserje,idadmin) VALUES (7, 7, 502, 'Edificio Urano I', 'Jujuy 998', 1, 2, 356)
INSERT INTO consorcio(idprovincia,idlocalidad,idconsorcio, Nombre,direccion,idzona,idconserje,idadmin) VALUES (7, 7, 503, 'Edificio Marte II', '25 de Mayo 2233', 1, 2, 356)

--Modificamos el registro el nombre y direccion del primer registro insertado
EXEC ModificarConsorcio 7, 7, 500, 'Edificio Neptuno 1', 'Av Poggers 1522', 1, 1, 349
--Acontinuacion eliminamos el Edificio Jupiter 1
EXEC EliminarConsorcio 7, 7, 501

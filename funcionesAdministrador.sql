--Funcion para insertar un nuevo registro a la tabla administrador
CREATE PROCEDURE InsertarAdministrador
(
    @apeynom varchar(50),
    @viveahi varchar(1),
    @tel varchar(20),
    @sexo varchar(1),
    @fechnac datetime
)
AS
BEGIN
    INSERT INTO base_consorcio.dbo.administrador (apeynom, viveahi, tel, sexo, fechnac)
    VALUES (@apeynom, @viveahi, @tel, @sexo, @fechnac);
END;

--Funcion para eliminar un registro de la tabla administrador
CREATE PROCEDURE EliminarAdministrador
(
    @idadmin int
)
AS
BEGIN
    DELETE FROM base_consorcio.dbo.administrador
    WHERE idadmin = @idadmin;
END;

--Funcion para modificar un registro en la tabla administrador
CREATE PROCEDURE ModificarAdministrador
(
    @idadmin int,
    @apeynom varchar(50),
    @viveahi varchar(1),
    @tel varchar(20),
    @sexo varchar(1),
    @fechnac datetime
)
AS
BEGIN
    UPDATE base_consorcio.dbo.administrador
    SET
        apeynom = @apeynom,
        viveahi = @viveahi,
        tel = @tel,
        sexo = @sexo,
        fechnac = @fechnac
    WHERE idadmin = @idadmin;
END;

--Funcion para calcular la edad de los administradores.
CREATE FUNCTION CalcularEdadesAdministradores()
RETURNS TABLE
AS
RETURN (
    SELECT apeynom AS Nombre,
           DATEDIFF(YEAR, fechnac, GETDATE()) AS Edad
    FROM base_consorcio.dbo.administrador
);


--Pruebas 
EXEC InsertarAdministrador(:@apeynom, :@viveahi, :@tel, :@sexo, :@fechnac) 
EXEC InsertarAdministrador 'LOPEZ JUAN CARLOS', 'S', 3794222222, 'M', '19920828'
EXEC InsertarAdministrador 'RAMIREZ JULIA', 'N', 3794448899, 'F', '19910521'
--Modificamos el registro recien insertado 
EXEC ModificarAdministrador 349, 'LOPEZ JUAN CARLOS', 'S', 3794420111, 'M', '19920828' 

--Eliminamos el registro de RAMIREZ JULIA
EXEC EliminarAdministrador 355

--Probamos la funcion del calculo de edades
SELECT Nombre, Edad
FROM dbo.CalcularEdadesAdministradores();
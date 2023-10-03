USE forksoftware;
CREATE VIEW VistaAdministradores AS
SELECT u.ID AS ID_Usuario, u.username
FROM Administrador a
INNER JOIN Persona_Usuario pu ON a.ID = pu.ID_Persona
INNER JOIN users u ON pu.ID_Usuario = u.ID;

SELECT * FROM vistaAdministradores;


CREATE VIEW VistaFuncionarios AS
SELECT u.ID AS ID_Usuario, u.username
FROM funcionario_almacen a
INNER JOIN Persona_Usuario pu ON a.ID = pu.ID_Persona
INNER JOIN users u ON pu.ID_Usuario = u.ID;

SELECT * FROM vistaFuncionarios;

CREATE VIEW VistaGerentes AS
SELECT u.ID AS ID_Usuario, u.username
FROM gerente_almacen a
INNER JOIN Persona_Usuario pu ON a.ID_Gerente = pu.ID_Persona
INNER JOIN users u ON pu.ID_Usuario = u.ID;

SELECT * FROM vistaGerentes;

CREATE VIEW VistaChoferes AS
SELECT u.ID AS ID_Usuario, u.username
FROM chofer a
INNER JOIN Persona_Usuario pu ON a.ID = pu.ID_Persona
INNER JOIN users u ON pu.ID_Usuario = u.ID;

SELECT * FROM vistaChoferes;

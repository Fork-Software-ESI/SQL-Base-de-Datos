USE forksoftware;

CREATE TABLE Persona (
    CI INT(8) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    PRIMARY KEY (CI)
);

CREATE TABLE Persona_Telefono (
    CI INT(8) NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    PRIMARY KEY (CI, Telefono),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Usuario (
    NomUsuario VARCHAR(50) NOT NULL,
    Contrasenia VARCHAR(50) NOT NULL,
    PRIMARY KEY (NomUsuario)
);

CREATE TABLE Persona_Usuario (
    CI INT(8) NOT NULL,
    NomUsuario VARCHAR(50) NOT NULL,
    PRIMARY KEY (CI, NomUsuario),
    FOREIGN KEY (CI) REFERENCES Persona(CI),
    FOREIGN KEY (NomUsuario) REFERENCES Usuario(NomUsuario)
);

CREATE TABLE Chofer (
    CI INT(8) NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Tipo_Libreta (
    Tipo VARCHAR(2) NOT NULL,
    PesoMaximo INT NOT NULL,
    PRIMARY KEY (Tipo)
);

CREATE TABLE Chofer_Tipo_Libreta (
    CI INT(8) NOT NULL,
    Tipo VARCHAR(2) NOT NULL,
    PRIMARY KEY (CI, Tipo),
    FOREIGN KEY (CI) REFERENCES Chofer(CI),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Libreta(Tipo)
);

CREATE TABLE Camion (
    ID BigInt NOT NULL AUTO_INCREMENT,
    Matricula VARCHAR(7) NOT NULL,
    PesoMaximoKg INT NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Chofer_Camion (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    PRIMARY KEY (CI, Id),
    FOREIGN KEY (CI) REFERENCES Chofer(CI),
    FOREIGN KEY (Id) REFERENCES Camion(Id)
);

CREATE TABLE Chofer_Camion_Maneja (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (CI, Id, Fecha_Hora_Inicio),
    FOREIGN KEY (CI) REFERENCES Chofer(CI),
    FOREIGN KEY (Id) REFERENCES Camion(Id)
);

CREATE TABLE Administrador (
    CI INT(8) NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Cliente (
    CI INT(8) NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Lugar_Entrega (
    ID BigInt NOT NULL AUTO_INCREMENT,
    Dirección VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Cliente_Entrega (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    PRIMARY KEY (CI, Id),
    FOREIGN KEY (CI) REFERENCES Cliente(CI),
    FOREIGN KEY (Id) REFERENCES Lugar_Entrega(Id)
);


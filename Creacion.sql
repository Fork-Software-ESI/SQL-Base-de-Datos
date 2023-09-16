CREATE DATABASE forksoftware;

USE forksoftware;

CREATE TABLE Persona (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    CI SMALLINT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Persona_Telefono (
    ID SMALLINT NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID, Telefono),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Usuario (
    NomUsuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasenia VARCHAR(50) NOT NULL,
    PRIMARY KEY (NomUsuario)
);

CREATE TABLE Persona_Usuario (
    ID SMALLINT NOT NULL,
    NomUsuario VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID, NomUsuario),
    FOREIGN KEY (ID) REFERENCES Persona(ID),
    FOREIGN KEY (NomUsuario) REFERENCES Usuario(NomUsuario)
);

CREATE TABLE Chofer (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Tipo_Libreta (
    Tipo VARCHAR(2) NOT NULL,
    PesoMaximoKg SMALLINT NOT NULL,
    PRIMARY KEY (Tipo)
);

CREATE TABLE Chofer_Tipo_Libreta (
    ID SMALLINT NOT NULL,
    Tipo VARCHAR(2) NOT NULL,
    PRIMARY KEY (ID, Tipo),
    FOREIGN KEY (ID) REFERENCES Chofer(ID),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Libreta(Tipo)
);

CREATE TABLE Camion (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Matricula VARCHAR(7) NOT NULL UNIQUE,
    PesoMaximoKg SMALLINT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Chofer_Camion (
    ID_Chofer SMALLINT NOT NULL,
    ID_Camion SMALLINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    PRIMARY KEY (ID_Chofer, ID_Camion),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Chofer) REFERENCES Chofer(ID)
);

CREATE TABLE Chofer_Camion_Maneja (
    ID_Chofer SMALLINT NOT NULL,
    ID_Camion SMALLINT NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (ID_Chofer, ID_Camion),
    FOREIGN KEY (ID_Chofer, ID_Camion) REFERENCES Chofer_Camion(ID_Chofer, ID_Camion)
);

CREATE TABLE Administrador (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Cliente (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Lugar_Entrega (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Direccion VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Almacen (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    PRiMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Lugar_Entrega(ID)
);

CREATE TABLE Cliente_Entrega (
    ID_Cliente SMALLINT NOT NULL,
    ID_Lugar_Entrega SMALLINT NOT NULL,
    PRIMARY KEY (ID_Cliente, ID_Lugar_Entrega),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_Lugar_Entrega) REFERENCES Lugar_Entrega(ID)
);

CREATE TABLE Chofer_Camion_Entrega (
    ID_Chofer SMALLINT NOT NULL,
    ID_Lugar_Entrega SMALLINT NOT NULL,
    ID_Camion SMALLINT NOT NULL,
    PRIMARY KEY (ID_Chofer, ID_Lugar_Entrega, ID_Camion),
    FOREIGN KEY (ID_Chofer, ID_Camion) REFERENCES Chofer_Camion(ID_Chofer, ID_Camion),
    FOREIGN KEY (ID_Lugar_Entrega) REFERENCES Lugar_Entrega(ID)
);

CREATE TABLE Carga (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID)
);

CREATE TABLE Carga_Camion (
    ID_Camion SMALLINT NOT NULL UNIQUE,
    ID_Carga SMALLINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    PRIMARY KEY (ID_Carga),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID)
);

CREATE TABLE Camion_Lleva_Carga (
    ID_Carga SMALLINT NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (ID_Carga),
    FOREIGN KEY (ID_Carga) REFERENCES Carga_Camion(ID_Carga)
);

CREATE TABLE Funcionario_Almacen (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Funcionario_Carga_Camion (
    ID_Carga SMALLINT NOT NULL,
    ID_Funcionario SMALLINT NOT NULL,
    PRIMARY KEY (ID_Carga, ID_Funcionario),
    FOREIGN KEY (ID_Carga) REFERENCES Carga_Camion(ID_Carga),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario_Almacen(ID)
);

CREATE TABLE Plataforma (
    ID_Almacen SMALLINT NOT NULL AUTO_INCREMENT,
    Numero SMALLINT NOT NULL,
    PRIMARY KEY (ID_Almacen, Numero),
    FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID)
);

CREATE TABLE Gerente_Almacen (
    ID_Gerente SMALLINT NOT NULL,
    ID_Almacen SMALLINT NOT NULL,
    PRIMARY KEY (ID_Gerente),
    FOREIGN KEY (ID_Gerente) REFERENCES Persona(ID),
    FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID)
);

CREATE TABLE Camion_Plataforma (
    ID_Camion SMALLINT NOT NULL,
    ID_Almacen SMALLINT NOT NULL,
    Numero_Plataforma SMALLINT NOT NULL,
    Fecha_Hora_Llegada DATETIME NOT NULL,
    PRIMARY KEY (ID_Camion, ID_Almacen, Numero_Plataforma),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Almacen, Numero_Plataforma) REFERENCES Plataforma(ID_Almacen, Numero)
);

CREATE TABLE Camion_Plataforma_Salida (
    ID_Camion SMALLINT NOT NULL,
    ID_Almacen SMALLINT NOT NULL,
    Numero_Plataforma SMALLINT NOT NULL,
    Fecha_Hora_Salida DATETIME NOT NULL,
    PRIMARY KEY (ID_Camion, ID_Almacen, Numero_Plataforma),
    FOREIGN KEY (ID_Camion, ID_Almacen, Numero_Plataforma) REFERENCES Camion_Plataforma(ID_Camion, ID_Almacen, Numero_Plataforma)
);

CREATE TABLE Estante (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    ID_Almacen SMALLINT NOT NULL,
    PRIMARY KEY (ID, ID_Almacen),
    FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID)
);

CREATE TABLE Lote (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50) NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Paquete (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    ID_Cliente SMALLINT NOT NULL,
    Descripcion VARCHAR(50) NULL,
    Peso_Kg SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID)
);

CREATE TABLE Paquete_en_transito (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Paquete(ID)
);

CREATE TABLE Lote_Carga (
    ID_Lote SMALLINT NOT NULL,
    ID_Carga SMALLINT NOT NULL,
    PRIMARY KEY (ID_Lote),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID)
);

CREATE TABLE Forma (
    ID_Lote SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID)
);

CREATE TABLE Funcionario_Lote_Paquete (
    ID_Funcionario SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario_Almacen(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Forma(ID_Paquete)
);

CREATE TABLE Paquete_Estante (
    ID_Paquete SMALLINT NOT NULL,
    ID_Estante SMALLINT NOT NULL,
    ID_Almacen SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID),
    FOREIGN KEY (ID_Estante, ID_Almacen) REFERENCES Estante(ID, ID_Almacen)
);
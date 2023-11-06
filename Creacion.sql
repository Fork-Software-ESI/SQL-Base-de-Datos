CREATE DATABASE IF NOT EXISTS forksoftware;

USE forksoftware;

CREATE TABLE Persona (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    CI INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Persona_Telefono (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    ID_Persona SMALLINT NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Persona) REFERENCES Persona(ID)
);

CREATE TABLE Cliente (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
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

CREATE TABLE EstadoC (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Chofer_Camion (
    ID_Chofer SMALLINT NOT NULL,
    ID_Camion SMALLINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    ID_Estado SMALLINT NOT NULL,
    PRIMARY KEY (ID_Chofer, ID_Camion),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Chofer) REFERENCES Chofer(ID),
    FOREIGN KEY (ID_Estado) REFERENCES EstadoC(ID)
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

CREATE TABLE Almacen (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Direccion VARCHAR(50) NOT NULL,
    PRiMARY KEY (ID)
);

CREATE TABLE Lote (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50) NULL,
    Peso_Kg SMALLINT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE EstadoL (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Lote_Camion (
    ID_Camion SMALLINT NOT NULL,
    ID_Lote SMALLINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    ID_Estado SMALLINT NOT NULL,
    PRIMARY KEY (ID_Lote),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Estado) REFERENCES EstadoL(ID)
    );

CREATE TABLE Camion_Lleva_Lote (
    ID_Lote SMALLINT NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (ID_Lote),
    FOREIGN KEY (ID_Lote) REFERENCES Lote_Camion(ID_Lote)
);

CREATE TABLE Funcionario_Almacen (
    ID SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Persona(ID)
);

CREATE TABLE Plataforma (
    Numero SMALLINT NOT NULL AUTO_INCREMENT,
    ID_Almacen SMALLINT NOT NULL,
    PRIMARY KEY (Numero, ID_Almacen),
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

CREATE TABLE EstadoP (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Paquete (
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    ID_Cliente SMALLINT NOT NULL,
    Descripcion VARCHAR(50) NULL,
    Peso_Kg SMALLINT NOT NULL,
    ID_Estado SMALLINT NOT NULL,
    Destino VARCHAR(255) NOT NULL,
    Codigo VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_Estado) REFERENCES EstadoP(ID)
    );

CREATE TABLE EstadoF(
    ID SMALLINT NOT NULL AUTO_INCREMENT,
    Estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Forma (
    ID_Lote SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    ID_Estado SMALLINT NOT NULL,    
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID),
    FOREIGN KEY (ID_Estado) REFERENCES EstadoF(ID)
);

CREATE TABLE Paquete_Estante (
    ID_Paquete SMALLINT NOT NULL,
    ID_Estante SMALLINT NOT NULL,
    ID_Almacen SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID),
    FOREIGN KEY (ID_Estante, ID_Almacen) REFERENCES Estante(ID, ID_Almacen)
);

CREATE TABLE Gerente_Paquete (
    ID_Gerente SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Gerente) REFERENCES Gerente_Almacen(ID_Gerente),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID)
);

CREATE TABLE Gerente_Forma (
    ID_Gerente SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Gerente) REFERENCES Gerente_Almacen(ID_Gerente),
    FOREIGN KEY (ID_Paquete) REFERENCES Forma(ID_Paquete)
);

CREATE TABLE Gerente_Lote (
    ID_Gerente SMALLINT NOT NULL,
    ID_Lote SMALLINT NOT NULL,
    PRIMARY KEY (ID_Lote),
    FOREIGN KEY (ID_Gerente) REFERENCES Gerente_Almacen(ID_Gerente),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID)
);

CREATE TABLE Funcionario_Forma (
    ID_Funcionario SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario_Almacen(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID)
);

CREATE TABLE Funcionario_Paquete_Estante(
    ID_Funcionario SMALLINT NOT NULL,
    ID_Paquete SMALLINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario_Almacen(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete_Estante(ID_Paquete)
);

CREATE TABLE Persona_Usuario (
    ID_Persona SMALLINT NOT NULL,
    ID_Usuario SMALLINT NOT NULL UNIQUE,
    PRIMARY KEY (ID_Persona),
    FOREIGN KEY (ID_Persona) REFERENCES Persona(ID),
    FOREIGN KEY (ID_Usuario) REFERENCES users(ID)
);

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
    NomUsuario VARCHAR(50) NOT NULL UNIQUE,
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
    Matricula VARCHAR(7) NOT NULL UNIQUE,
    PesoMaximoKg INT NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Chofer_Camion (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    PRIMARY KEY (CI, ID),
    FOREIGN KEY (CI) REFERENCES Chofer(CI),
    FOREIGN KEY (ID) REFERENCES Camion(Id)
);

CREATE TABLE Chofer_Camion_Maneja (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (CI, Id),
    FOREIGN KEY (CI) REFERENCES Chofer(CI),
    FOREIGN KEY (ID) REFERENCES Camion(ID)
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
    Direccion VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Almacen (
    ID BigInt NOT NULL AUTO_INCREMENT,
    PRiMARY KEY (Id),
    FOREIGN KEY (ID) REFERENCES Lugar_Entrega(ID)
);

CREATE TABLE Cliente_Entrega (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    PRIMARY KEY (CI, ID),
    FOREIGN KEY (CI) REFERENCES Cliente(CI),
    FOREIGN KEY (ID) REFERENCES Lugar_Entrega(ID)
);

CREATE TABLE Chofer_Camion_Entrega (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    ID_Camion BIGINT NOT NULL,
    PRIMARY KEY (CI, ID, ID_Camion),
    FOREIGN KEY (CI, ID_Camion) REFERENCES Chofer_Camion(CI, ID),
    FOREIGN KEY (Id) REFERENCES Lugar_Entrega(Id)
);

CREATE TABLE Carga (
    ID BigInt NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
);

CREATE TABLE Carga_Camion (
    ID_Camion BIGINT NOT NULL,
    ID_Carga BIGINT NOT NULL,
    Fecha_Hora_Inicio DATETIME NOT NULL,
    PRIMARY KEY (ID_Carga),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID)
);

CREATE TABLE Camion_Lleva_Carga (
    ID_Carga BIGINT NOT NULL,
    Fecha_Hora_Fin DATETIME NOT NULL,
    PRIMARY KEY (ID_Carga),
    FOREIGN KEY (ID_Carga) REFERENCES Carga_Camion(ID_Carga)
);

CREATE TABLE Funcionario_Almacen (
    CI INT(8) NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Funcionario_Carga_Camion (
    Id_Carga BIGINT NOT NULL,
    CI INT(8) NOT NULL,
    PRIMARY KEY (Id_Carga, CI),
    FOREIGN KEY (Id_Carga) REFERENCES Carga_Camion(ID_Carga),
    FOREIGN KEY (CI) REFERENCES Funcionario_Almacen(CI)
);

CREATE TABLE Plataforma (
    ID BigInt NOT NULL AUTO_INCREMENT,
    Numero INT NOT NULL,
    PRIMARY KEY (ID, Numero),
    FOREIGN KEY (ID) REFERENCES Almacen(ID)
);

CREATE TABLE Gerente_Almacen (
    CI INT(8) NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Persona(CI)
);

CREATE TABLE Gerente_Almacen_Almacen (
    CI INT(8) NOT NULL,
    ID BIGINT NOT NULL,
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES Gerente_Almacen(CI),
    FOREIGN KEY (ID) REFERENCES Almacen(ID)
);

CREATE TABLE Camion_Plataforma (
    ID_Camion BIGINT NOT NULL,
    ID_Plataforma BIGINT NOT NULL,
    Numero INT NOT NULL,
    Fecha_Hora_Llegada DATETIME NOT NULL,
    PRIMARY KEY (ID_Camion, ID_Plataforma, Numero),
    FOREIGN KEY (ID_Camion) REFERENCES Camion(ID),
    FOREIGN KEY (ID_Plataforma, Numero) REFERENCES Plataforma(ID, Numero)
);

CREATE TABLE Camion_Plataforma_Salida (
    ID_Camion BIGINT NOT NULL,
    ID_Plataforma BIGINT NOT NULL,
    Numero INT NOT NULL,
    Fecha_Hora_Salida DATETIME NOT NULL,
    PRIMARY KEY (ID_Camion,ID_Plataforma,Numero),
    FOREIGN KEY (ID_Camion,ID_Plataforma,Numero) REFERENCES Camion_Plataforma(ID_Camion,ID_Plataforma,Numero)
);

CREATE TABLE Estante (
    ID BigInt NOT NULL AUTO_INCREMENT,
    ID_Almacen BIGINT NOT NULL,
    PRIMARY KEY (ID, ID_Almacen),
    FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID)
);

CREATE TABLE Lote (
    ID BigInt NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50) NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Paquete (
    ID BigInt NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50) NULL,
    Peso_Kg INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Paquete_en_transito (
    ID BigInt NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Paquete(ID)
);

CREATE TABLE Lote_Carga (
    ID_Lote BIGINT NOT NULL,
    ID_Carga BIGINT NOT NULL,
    PRIMARY KEY (ID_Lote),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Carga) REFERENCES Carga(ID)
);

CREATE TABLE Forma (
    ID_Lote BigInt NOT NULL AUTO_INCREMENT,
    ID_Paquete BigInt NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID)
);

CREATE TABLE Funcionario_Lote_Paquete (
    CI INT(8) NOT NULL,
    ID_Paquete BIGINT NOT NULL,
    PRIMARY KEY (ID_Paquete),
    FOREIGN KEY (CI) REFERENCES Funcionario_Almacen(CI),
    FOREIGN KEY (ID_Paquete) REFERENCES Forma(ID_Paquete)
);
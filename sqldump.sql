-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para forksoftware
CREATE DATABASE IF NOT EXISTS `forksoftware` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `forksoftware`;

-- Volcando estructura para tabla forksoftware.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion
CREATE TABLE IF NOT EXISTS `camion` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(7) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Matricula` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_lleva_carga
CREATE TABLE IF NOT EXISTS `camion_lleva_carga` (
  `ID_Carga` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Carga`),
  CONSTRAINT `camion_lleva_carga_ibfk_1` FOREIGN KEY (`ID_Carga`) REFERENCES `carga_camion` (`ID_Carga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_plataforma
CREATE TABLE IF NOT EXISTS `camion_plataforma` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Llegada` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  KEY `ID_Almacen` (`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `camion_plataforma_ibfk_2` FOREIGN KEY (`ID_Almacen`, `Numero_Plataforma`) REFERENCES `plataforma` (`ID_Almacen`, `Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_plataforma_salida
CREATE TABLE IF NOT EXISTS `camion_plataforma_salida` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Salida` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_salida_ibfk_1` FOREIGN KEY (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`) REFERENCES `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.carga
CREATE TABLE IF NOT EXISTS `carga` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.carga_camion
CREATE TABLE IF NOT EXISTS `carga_camion` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Carga` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  PRIMARY KEY (`ID_Carga`),
  UNIQUE KEY `ID_Camion` (`ID_Camion`),
  CONSTRAINT `carga_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `carga_camion_ibfk_2` FOREIGN KEY (`ID_Carga`) REFERENCES `carga` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer
CREATE TABLE IF NOT EXISTS `chofer` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion
CREATE TABLE IF NOT EXISTS `chofer_camion` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  KEY `ID_Camion` (`ID_Camion`),
  CONSTRAINT `chofer_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `chofer_camion_ibfk_2` FOREIGN KEY (`ID_Chofer`) REFERENCES `chofer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion_entrega
CREATE TABLE IF NOT EXISTS `chofer_camion_entrega` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Lugar_Entrega` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Lugar_Entrega`,`ID_Camion`),
  KEY `ID_Chofer` (`ID_Chofer`,`ID_Camion`),
  KEY `ID_Lugar_Entrega` (`ID_Lugar_Entrega`),
  CONSTRAINT `chofer_camion_entrega_ibfk_1` FOREIGN KEY (`ID_Chofer`, `ID_Camion`) REFERENCES `chofer_camion` (`ID_Chofer`, `ID_Camion`),
  CONSTRAINT `chofer_camion_entrega_ibfk_2` FOREIGN KEY (`ID_Lugar_Entrega`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion_maneja
CREATE TABLE IF NOT EXISTS `chofer_camion_maneja` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  CONSTRAINT `chofer_camion_maneja_ibfk_1` FOREIGN KEY (`ID_Chofer`, `ID_Camion`) REFERENCES `chofer_camion` (`ID_Chofer`, `ID_Camion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_tipo_libreta
CREATE TABLE IF NOT EXISTS `chofer_tipo_libreta` (
  `ID` smallint(6) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`ID`,`Tipo`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `chofer` (`ID`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_libreta` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.cliente_entrega
CREATE TABLE IF NOT EXISTS `cliente_entrega` (
  `ID_Cliente` smallint(6) NOT NULL,
  `ID_Lugar_Entrega` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Cliente`,`ID_Lugar_Entrega`),
  KEY `ID_Lugar_Entrega` (`ID_Lugar_Entrega`),
  CONSTRAINT `cliente_entrega_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `cliente_entrega_ibfk_2` FOREIGN KEY (`ID_Lugar_Entrega`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.estante
CREATE TABLE IF NOT EXISTS `estante` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `estante_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.forma
CREATE TABLE IF NOT EXISTS `forma` (
  `ID_Lote` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Lote` (`ID_Lote`),
  CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_almacen
CREATE TABLE IF NOT EXISTS `funcionario_almacen` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `funcionario_almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_carga_camion
CREATE TABLE IF NOT EXISTS `funcionario_carga_camion` (
  `ID_Carga` smallint(6) NOT NULL,
  `ID_Funcionario` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Carga`,`ID_Funcionario`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_carga_camion_ibfk_1` FOREIGN KEY (`ID_Carga`) REFERENCES `carga_camion` (`ID_Carga`),
  CONSTRAINT `funcionario_carga_camion_ibfk_2` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_lote_paquete
CREATE TABLE IF NOT EXISTS `funcionario_lote_paquete` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_lote_paquete_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_lote_paquete_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `forma` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.gerente_almacen
CREATE TABLE IF NOT EXISTS `gerente_almacen` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Gerente`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `gerente_almacen_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `persona` (`ID`),
  CONSTRAINT `gerente_almacen_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lote_carga
CREATE TABLE IF NOT EXISTS `lote_carga` (
  `ID_Lote` smallint(6) NOT NULL,
  `ID_Carga` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Carga` (`ID_Carga`),
  CONSTRAINT `lote_carga_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `lote_carga_ibfk_2` FOREIGN KEY (`ID_Carga`) REFERENCES `carga` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lugar_entrega
CREATE TABLE IF NOT EXISTS `lugar_entrega` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.paquete
CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` smallint(6) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.paquete_en_transito
CREATE TABLE IF NOT EXISTS `paquete_en_transito` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `paquete_en_transito_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.paquete_estante
CREATE TABLE IF NOT EXISTS `paquete_estante` (
  `ID_Paquete` smallint(6) NOT NULL,
  `ID_Estante` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Estante` (`ID_Estante`,`ID_Almacen`),
  CONSTRAINT `paquete_estante_ibfk_1` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`),
  CONSTRAINT `paquete_estante_ibfk_2` FOREIGN KEY (`ID_Estante`, `ID_Almacen`) REFERENCES `estante` (`ID`, `ID_Almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CI` smallint(6) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona_telefono
CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `ID` smallint(6) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`,`Telefono`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona_usuario
CREATE TABLE IF NOT EXISTS `persona_usuario` (
  `ID` smallint(6) NOT NULL,
  `NomUsuario` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`,`NomUsuario`),
  KEY `NomUsuario` (`NomUsuario`),
  CONSTRAINT `persona_usuario_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`),
  CONSTRAINT `persona_usuario_ibfk_2` FOREIGN KEY (`NomUsuario`) REFERENCES `usuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.plataforma
CREATE TABLE IF NOT EXISTS `plataforma` (
  `ID_Almacen` smallint(6) NOT NULL AUTO_INCREMENT,
  `Numero` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Almacen`,`Numero`),
  CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.tipo_libreta
CREATE TABLE IF NOT EXISTS `tipo_libreta` (
  `Tipo` varchar(2) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `NomUsuario` varchar(50) NOT NULL,
  `Contrasenia` varchar(50) NOT NULL,
  PRIMARY KEY (`NomUsuario`),
  UNIQUE KEY `NomUsuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

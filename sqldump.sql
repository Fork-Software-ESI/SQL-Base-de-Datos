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
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`CI`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion
CREATE TABLE IF NOT EXISTS `camion` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(7) NOT NULL,
  `PesoMaximoKg` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Matricula` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_lleva_carga
CREATE TABLE IF NOT EXISTS `camion_lleva_carga` (
  `ID_Carga` bigint(20) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Carga`),
  CONSTRAINT `camion_lleva_carga_ibfk_1` FOREIGN KEY (`ID_Carga`) REFERENCES `carga_camion` (`ID_Carga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_plataforma
CREATE TABLE IF NOT EXISTS `camion_plataforma` (
  `ID_Camion` bigint(20) NOT NULL,
  `ID_Plataforma` bigint(20) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Fecha_Hora_Llegada` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Plataforma`,`Numero`),
  KEY `ID_Plataforma` (`ID_Plataforma`,`Numero`),
  CONSTRAINT `camion_plataforma_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `camion_plataforma_ibfk_2` FOREIGN KEY (`ID_Plataforma`, `Numero`) REFERENCES `plataforma` (`ID`, `Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.camion_plataforma_salida
CREATE TABLE IF NOT EXISTS `camion_plataforma_salida` (
  `ID_Camion` bigint(20) NOT NULL,
  `ID_Plataforma` bigint(20) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Fecha_Hora_Salida` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Plataforma`,`Numero`),
  CONSTRAINT `camion_plataforma_salida_ibfk_1` FOREIGN KEY (`ID_Camion`, `ID_Plataforma`, `Numero`) REFERENCES `camion_plataforma` (`ID_Camion`, `ID_Plataforma`, `Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.carga
CREATE TABLE IF NOT EXISTS `carga` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.carga_camion
CREATE TABLE IF NOT EXISTS `carga_camion` (
  `ID_Camion` bigint(20) NOT NULL,
  `ID_Carga` bigint(20) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  PRIMARY KEY (`ID_Carga`),
  KEY `ID_Camion` (`ID_Camion`),
  CONSTRAINT `carga_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `carga_camion_ibfk_2` FOREIGN KEY (`ID_Carga`) REFERENCES `carga` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer
CREATE TABLE IF NOT EXISTS `chofer` (
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`CI`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion
CREATE TABLE IF NOT EXISTS `chofer_camion` (
  `CI` int(8) NOT NULL,
  `ID` bigint(20) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  PRIMARY KEY (`CI`,`ID`),
  KEY `ID` (`ID`),
  CONSTRAINT `chofer_camion_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `chofer` (`CI`),
  CONSTRAINT `chofer_camion_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `camion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion_entrega
CREATE TABLE IF NOT EXISTS `chofer_camion_entrega` (
  `CI` int(8) NOT NULL,
  `ID` bigint(20) NOT NULL,
  `ID_Camion` bigint(20) NOT NULL,
  PRIMARY KEY (`CI`,`ID`,`ID_Camion`),
  KEY `CI` (`CI`,`ID_Camion`),
  KEY `ID` (`ID`),
  CONSTRAINT `chofer_camion_entrega_ibfk_1` FOREIGN KEY (`CI`, `ID_Camion`) REFERENCES `chofer_camion` (`CI`, `ID`),
  CONSTRAINT `chofer_camion_entrega_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_camion_maneja
CREATE TABLE IF NOT EXISTS `chofer_camion_maneja` (
  `CI` int(8) NOT NULL,
  `ID` bigint(20) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`CI`,`ID`),
  KEY `ID` (`ID`),
  CONSTRAINT `chofer_camion_maneja_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `chofer` (`CI`),
  CONSTRAINT `chofer_camion_maneja_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `camion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.chofer_tipo_libreta
CREATE TABLE IF NOT EXISTS `chofer_tipo_libreta` (
  `CI` int(8) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`CI`,`Tipo`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `chofer` (`CI`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_libreta` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`CI`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.cliente_entrega
CREATE TABLE IF NOT EXISTS `cliente_entrega` (
  `CI` int(8) NOT NULL,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CI`,`ID`),
  KEY `ID` (`ID`),
  CONSTRAINT `cliente_entrega_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `cliente` (`CI`),
  CONSTRAINT `cliente_entrega_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `lugar_entrega` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.estante
CREATE TABLE IF NOT EXISTS `estante` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `estante_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.forma
CREATE TABLE IF NOT EXISTS `forma` (
  `ID_Lote` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Paquete` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Lote` (`ID_Lote`),
  CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_almacen
CREATE TABLE IF NOT EXISTS `funcionario_almacen` (
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`CI`),
  CONSTRAINT `funcionario_almacen_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_carga_camion
CREATE TABLE IF NOT EXISTS `funcionario_carga_camion` (
  `Id_Carga` bigint(20) NOT NULL,
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`Id_Carga`,`CI`),
  KEY `CI` (`CI`),
  CONSTRAINT `funcionario_carga_camion_ibfk_1` FOREIGN KEY (`Id_Carga`) REFERENCES `carga_camion` (`ID_Carga`),
  CONSTRAINT `funcionario_carga_camion_ibfk_2` FOREIGN KEY (`CI`) REFERENCES `funcionario_almacen` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.funcionario_lote_paquete
CREATE TABLE IF NOT EXISTS `funcionario_lote_paquete` (
  `CI` int(8) NOT NULL,
  `ID_Paquete` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `CI` (`CI`),
  CONSTRAINT `funcionario_lote_paquete_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `funcionario_almacen` (`CI`),
  CONSTRAINT `funcionario_lote_paquete_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `forma` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.gerente_almacen
CREATE TABLE IF NOT EXISTS `gerente_almacen` (
  `CI` int(8) NOT NULL,
  PRIMARY KEY (`CI`),
  CONSTRAINT `gerente_almacen_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.gerente_almacen_almacen
CREATE TABLE IF NOT EXISTS `gerente_almacen_almacen` (
  `CI` int(8) NOT NULL,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CI`),
  KEY `ID` (`ID`),
  CONSTRAINT `gerente_almacen_almacen_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `gerente_almacen` (`CI`),
  CONSTRAINT `gerente_almacen_almacen_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lote_carga
CREATE TABLE IF NOT EXISTS `lote_carga` (
  `ID_Lote` bigint(20) NOT NULL,
  `ID_Carga` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Carga` (`ID_Carga`),
  CONSTRAINT `lote_carga_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `lote_carga_ibfk_2` FOREIGN KEY (`ID_Carga`) REFERENCES `carga` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.lugar_entrega
CREATE TABLE IF NOT EXISTS `lugar_entrega` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.paquete
CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.paquete_en_transito
CREATE TABLE IF NOT EXISTS `paquete_en_transito` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  CONSTRAINT `paquete_en_transito_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `CI` int(8) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona_telefono
CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `CI` int(8) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`CI`,`Telefono`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.persona_usuario
CREATE TABLE IF NOT EXISTS `persona_usuario` (
  `CI` int(8) NOT NULL,
  `NomUsuario` varchar(50) NOT NULL,
  PRIMARY KEY (`CI`,`NomUsuario`),
  KEY `NomUsuario` (`NomUsuario`),
  CONSTRAINT `persona_usuario_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`),
  CONSTRAINT `persona_usuario_ibfk_2` FOREIGN KEY (`NomUsuario`) REFERENCES `usuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.plataforma
CREATE TABLE IF NOT EXISTS `plataforma` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`Numero`),
  CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forksoftware.tipo_libreta
CREATE TABLE IF NOT EXISTS `tipo_libreta` (
  `Tipo` varchar(2) NOT NULL,
  `PesoMaximo` int(11) NOT NULL,
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

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

-- Volcando datos para la tabla forksoftware.administrador: ~1 rows (aproximadamente)
INSERT INTO `administrador` (`ID`) VALUES
	(10);

-- Volcando estructura para tabla forksoftware.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.almacen: ~6 rows (aproximadamente)
INSERT INTO `almacen` (`ID`, `Direccion`) VALUES
	(1, 'Bv Artigas 2053'),
	(2, 'Aparicio Saravia 1011'),
	(3, 'Palmar 6666'),
	(4, 'Bv Artigas 2053'),
	(5, 'Aparicio Saravia 1011'),
	(6, 'Palmar 6666');

-- Volcando estructura para tabla forksoftware.camion
CREATE TABLE IF NOT EXISTS `camion` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(7) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Matricula` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion: ~2 rows (aproximadamente)
INSERT INTO `camion` (`ID`, `Matricula`, `PesoMaximoKg`) VALUES
	(1, 'abd2053', 2000),
	(2, 'sbu2150', 1500);

-- Volcando estructura para tabla forksoftware.camion_lleva_lote
CREATE TABLE IF NOT EXISTS `camion_lleva_lote` (
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  CONSTRAINT `camion_lleva_lote_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote_camion` (`ID_Lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion_lleva_lote: ~3 rows (aproximadamente)
INSERT INTO `camion_lleva_lote` (`ID_Lote`, `Fecha_Hora_Fin`) VALUES
	(1, '2023-09-12 13:23:00'),
	(2, '2023-09-12 15:40:00'),
	(3, '2023-05-12 11:15:00');

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

-- Volcando datos para la tabla forksoftware.camion_plataforma: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Llegada`) VALUES
	(1, 1, 1, '2023-09-12 08:45:00'),
	(2, 1, 2, '2023-05-12 09:00:00');

-- Volcando estructura para tabla forksoftware.camion_plataforma_salida
CREATE TABLE IF NOT EXISTS `camion_plataforma_salida` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Salida` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_salida_ibfk_1` FOREIGN KEY (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`) REFERENCES `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion_plataforma_salida: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma_salida` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Salida`) VALUES
	(1, 1, 1, '2023-09-12 11:00:00'),
	(2, 1, 2, '2023-05-12 12:23:00');

-- Volcando estructura para tabla forksoftware.chofer
CREATE TABLE IF NOT EXISTS `chofer` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer: ~2 rows (aproximadamente)
INSERT INTO `chofer` (`ID`) VALUES
	(8),
	(9);

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

-- Volcando datos para la tabla forksoftware.chofer_camion: ~2 rows (aproximadamente)
INSERT INTO `chofer_camion` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Inicio`) VALUES
	(8, 1, '2023-09-12 08:30:05'),
	(9, 2, '2023-05-12 08:00:00');

-- Volcando estructura para tabla forksoftware.chofer_camion_maneja
CREATE TABLE IF NOT EXISTS `chofer_camion_maneja` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  CONSTRAINT `chofer_camion_maneja_ibfk_1` FOREIGN KEY (`ID_Chofer`, `ID_Camion`) REFERENCES `chofer_camion` (`ID_Chofer`, `ID_Camion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer_camion_maneja: ~2 rows (aproximadamente)
INSERT INTO `chofer_camion_maneja` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Fin`) VALUES
	(8, 1, '2023-09-12 16:00:00'),
	(9, 2, '2023-05-12 16:00:00');

-- Volcando estructura para tabla forksoftware.chofer_tipo_libreta
CREATE TABLE IF NOT EXISTS `chofer_tipo_libreta` (
  `ID` smallint(6) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`ID`,`Tipo`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `chofer` (`ID`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_libreta` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer_tipo_libreta: ~2 rows (aproximadamente)
INSERT INTO `chofer_tipo_libreta` (`ID`, `Tipo`) VALUES
	(8, 'b'),
	(9, 'c');

-- Volcando estructura para tabla forksoftware.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.cliente: ~3 rows (aproximadamente)
INSERT INTO `cliente` (`ID`) VALUES
	(1),
	(2),
	(11);

-- Volcando estructura para tabla forksoftware.estante
CREATE TABLE IF NOT EXISTS `estante` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `estante_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.estante: ~9 rows (aproximadamente)
INSERT INTO `estante` (`ID`, `ID_Almacen`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3);

-- Volcando estructura para tabla forksoftware.forma
CREATE TABLE IF NOT EXISTS `forma` (
  `ID_Lote` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Lote` (`ID_Lote`),
  CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.forma: ~6 rows (aproximadamente)
INSERT INTO `forma` (`ID_Lote`, `ID_Paquete`, `Estado`) VALUES
	(1, 1, 'Pendiente'),
	(1, 2, 'Cargado'),
	(1, 3, 'Cargado'),
	(2, 4, 'Cargado'),
	(2, 5, 'Cargado'),
	(3, 6, 'Entregado');

-- Volcando estructura para tabla forksoftware.funcionario_almacen
CREATE TABLE IF NOT EXISTS `funcionario_almacen` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `funcionario_almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_almacen: ~2 rows (aproximadamente)
INSERT INTO `funcionario_almacen` (`ID`) VALUES
	(3),
	(4);

-- Volcando estructura para tabla forksoftware.funcionario_forma
CREATE TABLE IF NOT EXISTS `funcionario_forma` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_forma_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_forma: ~6 rows (aproximadamente)
INSERT INTO `funcionario_forma` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1),
	(3, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(4, 6);

-- Volcando estructura para tabla forksoftware.funcionario_paquete_estante
CREATE TABLE IF NOT EXISTS `funcionario_paquete_estante` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete_estante` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_paquete_estante: ~1 rows (aproximadamente)
INSERT INTO `funcionario_paquete_estante` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1);

-- Volcando estructura para tabla forksoftware.gerente_almacen
CREATE TABLE IF NOT EXISTS `gerente_almacen` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Gerente`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `gerente_almacen_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `persona` (`ID`),
  CONSTRAINT `gerente_almacen_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_almacen: ~3 rows (aproximadamente)
INSERT INTO `gerente_almacen` (`ID_Gerente`, `ID_Almacen`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando estructura para tabla forksoftware.gerente_forma
CREATE TABLE IF NOT EXISTS `gerente_forma` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `forma` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_forma: ~6 rows (aproximadamente)
INSERT INTO `gerente_forma` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

-- Volcando estructura para tabla forksoftware.gerente_lote
CREATE TABLE IF NOT EXISTS `gerente_lote` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_lote: ~3 rows (aproximadamente)
INSERT INTO `gerente_lote` (`ID_Gerente`, `ID_Lote`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando estructura para tabla forksoftware.gerente_paquete
CREATE TABLE IF NOT EXISTS `gerente_paquete` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_paquete: ~6 rows (aproximadamente)
INSERT INTO `gerente_paquete` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

-- Volcando estructura para tabla forksoftware.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.lote: ~3 rows (aproximadamente)
INSERT INTO `lote` (`ID`, `Descripcion`, `Peso_Kg`) VALUES
	(1, NULL, 8),
	(2, NULL, 17),
	(3, NULL, 30);

-- Volcando estructura para tabla forksoftware.lote_camion
CREATE TABLE IF NOT EXISTS `lote_camion` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `lote_camion_ibfk_1` (`ID_Camion`),
  CONSTRAINT `lote_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `lote_camion_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.lote_camion: ~3 rows (aproximadamente)
INSERT INTO `lote_camion` (`ID_Camion`, `ID_Lote`, `Fecha_Hora_Inicio`, `Estado`) VALUES
	(1, 1, '2023-09-12 09:00:00', 'Pendiente'),
	(1, 2, '2023-09-12 10:20:00', 'Cargado'),
	(2, 3, '2023-05-12 08:30:00', 'Entregado');

-- Volcando estructura para tabla forksoftware.paquete
CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` smallint(6) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.paquete: ~6 rows (aproximadamente)
INSERT INTO `paquete` (`ID`, `ID_Cliente`, `Descripcion`, `Peso_Kg`, `Estado`) VALUES
	(1, 1, NULL, 1, 'En almacen'),
	(2, 1, 'fragil', 2, 'En almacen'),
	(3, 1, NULL, 5, 'En almacen'),
	(4, 2, 'quimicos', 2, 'En transito'),
	(5, 2, NULL, 15, 'En transito'),
	(6, 11, NULL, 30, 'Entregado');

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

-- Volcando datos para la tabla forksoftware.paquete_estante: ~1 rows (aproximadamente)
INSERT INTO `paquete_estante` (`ID_Paquete`, `ID_Estante`, `ID_Almacen`) VALUES
	(1, 2, 1);

-- Volcando estructura para tabla forksoftware.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CI` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona: ~13 rows (aproximadamente)
INSERT INTO `persona` (`ID`, `CI`, `Nombre`, `Apellido`, `Correo`) VALUES
	(1, 46270322, 'Dr. Eldridge Willms', 'Kihn', 'grunolfsson@barrows.com'),
	(2, 49190150, 'Dr. Mark Marquardt DVM', 'Macejkovic', 'ckoepp@dooley.com'),
	(3, 62681135, 'Bria Larson Sr.', 'Raynor', 'christopher07@hotmail.com'),
	(4, 66354021, 'Isobel Jones', 'Gleason', 'tierra.ziemann@bins.com'),
	(5, 64963356, 'Xzavier Ankunding PhD', 'Stracke', 'velda.mertz@yahoo.com'),
	(6, 67947594, 'Maximo Upton II', 'Williamson', 'homenick.steve@abernathy.info'),
	(7, 48601422, 'Lexus Osinski', 'Lebsack', 'gdooley@hodkiewicz.info'),
	(8, 60978348, 'Prof. Jackson Marvin DVM', 'Kunze', 'rachel04@batz.com'),
	(9, 21679127, 'Turner Murphy', 'Farrell', 'veum.abbey@gmail.com'),
	(10, 83735196, 'Willow Friesen', 'Hilpert', 'feeney.keon@rutherford.net'),
	(11, 34337413, 'Jose Volkman', 'Hackett', 'vswaniawski@yahoo.com'),
	(12, 33556483, 'Saige Jakubowski', 'DuBuque', 'zanderson@lakin.org'),
	(13, 24185970, 'Una Terry', 'Wolf', 'ratke.christina@yahoo.com');

-- Volcando estructura para tabla forksoftware.persona_telefono
CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `ID` smallint(6) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`,`Telefono`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona_telefono: ~13 rows (aproximadamente)
INSERT INTO `persona_telefono` (`ID`, `Telefono`) VALUES
	(1, '+1-734-296-2438'),
	(2, '+1.380.395.5673'),
	(3, '1-262-806-3865'),
	(4, '385-379-0875'),
	(5, '815-756-8497'),
	(6, '+1.412.485.2736'),
	(7, '510.594.7951'),
	(8, '1-602-574-4465'),
	(9, '+1-463-212-1604'),
	(10, '+17434985158'),
	(11, '(984) 643-7858'),
	(12, '(740) 558-6997'),
	(13, '+1-626-684-9781');

-- Volcando estructura para tabla forksoftware.persona_usuario
CREATE TABLE IF NOT EXISTS `persona_usuario` (
  `ID` smallint(6) NOT NULL,
  `NomUsuario` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`,`NomUsuario`),
  KEY `NomUsuario` (`NomUsuario`),
  CONSTRAINT `persona_usuario_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`),
  CONSTRAINT `persona_usuario_ibfk_2` FOREIGN KEY (`NomUsuario`) REFERENCES `usuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona_usuario: ~13 rows (aproximadamente)
INSERT INTO `persona_usuario` (`ID`, `NomUsuario`) VALUES
	(1, 'dusty.hane'),
	(2, 'ehand'),
	(3, 'fred.fahey'),
	(4, 'garett82'),
	(5, 'gcremin'),
	(6, 'hbogisich'),
	(7, 'judson29'),
	(8, 'kara29'),
	(9, 'omraz'),
	(10, 'pschmitt'),
	(11, 'rstark'),
	(12, 'vallie19'),
	(13, 'ywisoky');

-- Volcando estructura para tabla forksoftware.plataforma
CREATE TABLE IF NOT EXISTS `plataforma` (
  `Numero` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`Numero`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.plataforma: ~18 rows (aproximadamente)
INSERT INTO `plataforma` (`Numero`, `ID_Almacen`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 3),
	(17, 3),
	(18, 3);

-- Volcando estructura para tabla forksoftware.tipo_libreta
CREATE TABLE IF NOT EXISTS `tipo_libreta` (
  `Tipo` varchar(2) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.tipo_libreta: ~2 rows (aproximadamente)
INSERT INTO `tipo_libreta` (`Tipo`, `PesoMaximoKg`) VALUES
	('b', 7000),
	('c', 8500);

-- Volcando estructura para tabla forksoftware.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `NomUsuario` varchar(50) NOT NULL,
  `Contrasenia` varchar(500) NOT NULL,
  PRIMARY KEY (`NomUsuario`),
  UNIQUE KEY `NomUsuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.usuario: ~13 rows (aproximadamente)
INSERT INTO `usuario` (`NomUsuario`, `Contrasenia`) VALUES
	('dusty.hane', '$2y$10$nTaWnUfQ8OiqpiVfBMZN/uhe0wbQzlROmcRlEG59fb59e.pzzVjT2'),
	('ehand', '$2y$10$iXNfkYutVpeU4U5YZE.lhOUFcpGJH4xAJolb2QJ0jzk1bAbkWTfv.'),
	('fred.fahey', '$2y$10$sDMq/jv.siGbqO147MQUg.5DDtL5CPCQ4/iW4.5sCH3QV99aIwhwe'),
	('garett82', '$2y$10$Lm9tvpkjKsITSBTnZH74guSuq3CnzkjhOe/3BpwRsCv987QYwPnLK'),
	('gcremin', '$2y$10$9m4x0nASRffu15HyOVf8sOucVXP5XI.2mgGb6fQ5VD6VSelFZ3UuG'),
	('hbogisich', '$2y$10$dyy1Z5KwsmDoDhzvJBTPCueCXgCDkgDlVEi0ZHWjspGpKXXCY86t6'),
	('judson29', '$2y$10$EMEaWF1g9ea0elApEedv4uw47N3zooHsQjxJ9l973REPcf.OerB7y'),
	('kara29', '$2y$10$OylMKB9t.NB3.mo6M/otoO6CLAuB2DzZq6CQ8V3o5l4OLL95BJPHG'),
	('omraz', '$2y$10$R3LiKNiPFezwcYL.c9N/HOSy4AY2DJHH2CepY3xj1qYEjDkcAyORq'),
	('pschmitt', '$2y$10$QbT8FqTBG56T8CEKPpApiOoYlvFoHbxw7aXsC4kqfUcBY40Ps1I4a'),
	('rstark', '$2y$10$pgCV6WSvC.0ktqL3MEXkJuQjkAXCRn8wdOErTTRlKf2LJpMSzbQ1O'),
	('vallie19', '$2y$10$PvRL8Uz9dxgmcZ/aLoogie86vimjo1o4AJVr8eqESazrm0gWdOicy'),
	('ywisoky', '$2y$10$XVzMsYaNf.yi5EB.YchnIutfyRwFahg.jSSYjtchaIaESaIScucZG');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

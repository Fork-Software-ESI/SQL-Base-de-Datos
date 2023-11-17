-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.administrador: ~4 rows (aproximadamente)
INSERT INTO `administrador` (`ID`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, NULL, NULL),
	(10, NULL, NULL, NULL),
	(16, '2023-11-17 05:21:26', '2023-11-17 07:19:14', NULL),
	(17, '2023-11-17 10:04:18', '2023-11-17 10:04:18', NULL);

-- Volcando estructura para tabla forksoftware.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.almacen: ~6 rows (aproximadamente)
INSERT INTO `almacen` (`ID`, `Direccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Bv Artigas, 2054, Montevideo', NULL, '2023-11-17 07:21:05', NULL),
	(2, 'Aparicio Saravia, 1011, Montevideo', NULL, NULL, NULL),
	(3, 'Palmar, 6666, Montevideo', NULL, NULL, NULL),
	(4, 'Bv Artigas, 2053, Montevideo', NULL, NULL, NULL),
	(5, 'Aparicio Saravia, 1011, Montevideo', NULL, NULL, NULL),
	(6, 'Palmar, 6666, Montevideo', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.camion
CREATE TABLE IF NOT EXISTS `camion` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(7) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Matricula` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.camion: ~2 rows (aproximadamente)
INSERT INTO `camion` (`ID`, `Matricula`, `PesoMaximoKg`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'abd2053', 2001, NULL, '2023-11-17 09:48:35', NULL),
	(2, 'sbu2150', 1500, NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.camion_lleva_lote
CREATE TABLE IF NOT EXISTS `camion_lleva_lote` (
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Lote`),
  CONSTRAINT `camion_lleva_lote_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote_camion` (`ID_Lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.camion_lleva_lote: ~2 rows (aproximadamente)
INSERT INTO `camion_lleva_lote` (`ID_Lote`, `Fecha_Hora_Fin`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '2023-09-12 15:40:00', NULL, '2023-10-30 07:00:39', NULL),
	(3, '2023-05-12 11:15:00', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.camion_plataforma
CREATE TABLE IF NOT EXISTS `camion_plataforma` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Llegada` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  KEY `ID_Almacen` (`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `camion_plataforma_ibfk_2` FOREIGN KEY (`ID_Almacen`, `Numero_Plataforma`) REFERENCES `plataforma` (`ID_Almacen`, `Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.camion_plataforma: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Llegada`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '2023-09-12 08:45:00', NULL, '2023-11-17 09:38:02', NULL),
	(2, 1, 2, '2023-05-12 09:00:00', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.camion_plataforma_salida
CREATE TABLE IF NOT EXISTS `camion_plataforma_salida` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Salida` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_salida_ibfk_1` FOREIGN KEY (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`) REFERENCES `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.camion_plataforma_salida: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma_salida` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Salida`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '2023-09-12 11:00:00', NULL, '2023-11-17 09:38:02', NULL),
	(2, 1, 2, '2023-05-12 12:23:00', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.chofer
CREATE TABLE IF NOT EXISTS `chofer` (
  `ID` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.chofer: ~3 rows (aproximadamente)
INSERT INTO `chofer` (`ID`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, NULL, NULL, NULL),
	(9, NULL, NULL, NULL),
	(20, '2023-11-17 10:11:56', '2023-11-17 10:11:56', NULL);

-- Volcando estructura para tabla forksoftware.chofer_camion
CREATE TABLE IF NOT EXISTS `chofer_camion` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `ID_Estado` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  KEY `ID_Camion` (`ID_Camion`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `chofer_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `chofer_camion_ibfk_2` FOREIGN KEY (`ID_Chofer`) REFERENCES `chofer` (`ID`),
  CONSTRAINT `chofer_camion_ibfk_3` FOREIGN KEY (`ID_Estado`) REFERENCES `estadoc` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.chofer_camion: ~2 rows (aproximadamente)
INSERT INTO `chofer_camion` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Inicio`, `ID_Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, 1, '2023-09-12 08:30:05', 2, '2023-11-14 05:04:32', '2023-11-17 09:38:02', NULL),
	(9, 2, '2023-11-17 04:20:16', 2, '2023-11-17 07:20:16', '2023-11-17 07:20:16', NULL);

-- Volcando estructura para tabla forksoftware.chofer_camion_maneja
CREATE TABLE IF NOT EXISTS `chofer_camion_maneja` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  CONSTRAINT `chofer_camion_maneja_ibfk_1` FOREIGN KEY (`ID_Chofer`, `ID_Camion`) REFERENCES `chofer_camion` (`ID_Chofer`, `ID_Camion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.chofer_camion_maneja: ~1 rows (aproximadamente)
INSERT INTO `chofer_camion_maneja` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Fin`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, 1, '2023-09-12 16:00:00', NULL, '2023-11-17 09:38:02', NULL);

-- Volcando estructura para tabla forksoftware.chofer_tipo_libreta
CREATE TABLE IF NOT EXISTS `chofer_tipo_libreta` (
  `ID` smallint(6) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`,`Tipo`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `chofer` (`ID`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_libreta` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.chofer_tipo_libreta: ~3 rows (aproximadamente)
INSERT INTO `chofer_tipo_libreta` (`ID`, `Tipo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, 'b', NULL, NULL, NULL),
	(9, 'c', NULL, NULL, NULL),
	(20, 'b', '2023-11-17 10:11:58', '2023-11-17 10:11:58', NULL);

-- Volcando estructura para tabla forksoftware.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.cliente: ~3 rows (aproximadamente)
INSERT INTO `cliente` (`ID`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, NULL, NULL, NULL),
	(11, NULL, '2023-11-17 07:11:11', NULL),
	(16, '2023-11-17 07:19:14', '2023-11-17 07:19:14', NULL);

-- Volcando estructura para tabla forksoftware.estadoc
CREATE TABLE IF NOT EXISTS `estadoc` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.estadoc: ~5 rows (aproximadamente)
INSERT INTO `estadoc` (`ID`, `Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Estacionado', NULL, NULL, NULL),
	(2, 'En plataforma', NULL, NULL, NULL),
	(3, 'Cargado', NULL, NULL, NULL),
	(4, 'En transito', NULL, NULL, NULL),
	(5, 'Completado', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.estadof
CREATE TABLE IF NOT EXISTS `estadof` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.estadof: ~3 rows (aproximadamente)
INSERT INTO `estadof` (`ID`, `Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Pendiente', NULL, NULL, NULL),
	(2, 'Cargado', NULL, NULL, NULL),
	(3, 'Entregado', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.estadol
CREATE TABLE IF NOT EXISTS `estadol` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.estadol: ~3 rows (aproximadamente)
INSERT INTO `estadol` (`ID`, `Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Pendiente', NULL, NULL, NULL),
	(2, 'Cargado', NULL, NULL, NULL),
	(3, 'Entregado', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.estadolt
CREATE TABLE IF NOT EXISTS `estadolt` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.estadolt: ~3 rows (aproximadamente)
INSERT INTO `estadolt` (`ID`, `Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Pendiente', NULL, NULL, NULL),
	(2, 'Cargado', NULL, NULL, NULL),
	(3, 'Entregado', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.estadop
CREATE TABLE IF NOT EXISTS `estadop` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.estadop: ~4 rows (aproximadamente)
INSERT INTO `estadop` (`ID`, `Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'En almacen', NULL, NULL, NULL),
	(2, 'En lote', NULL, NULL, NULL),
	(3, 'En transito', NULL, NULL, NULL),
	(4, 'Entregado', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.estante
CREATE TABLE IF NOT EXISTS `estante` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `estante_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.estante: ~10 rows (aproximadamente)
INSERT INTO `estante` (`ID`, `ID_Almacen`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, NULL, NULL, NULL),
	(2, 1, NULL, NULL, NULL),
	(3, 1, NULL, NULL, NULL),
	(4, 2, NULL, NULL, NULL),
	(5, 2, NULL, '2023-11-17 09:37:07', NULL),
	(6, 2, NULL, NULL, NULL),
	(7, 3, NULL, NULL, NULL),
	(8, 3, NULL, NULL, NULL),
	(9, 3, NULL, NULL, NULL),
	(10, 2, '2023-11-17 09:37:22', '2023-11-17 09:37:22', NULL);

-- Volcando estructura para tabla forksoftware.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla forksoftware.forma
CREATE TABLE IF NOT EXISTS `forma` (
  `ID_Lote` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `ID_Estado` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Lote` (`ID_Lote`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`),
  CONSTRAINT `forma_ibfk_3` FOREIGN KEY (`ID_Estado`) REFERENCES `estadof` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.forma: ~13 rows (aproximadamente)
INSERT INTO `forma` (`ID_Lote`, `ID_Paquete`, `ID_Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 2, '2023-11-13 04:31:33', '2023-11-14 05:56:31', NULL),
	(1, 2, 2, '2023-11-13 04:31:35', '2023-10-30 06:47:55', NULL),
	(1, 3, 2, NULL, '2023-10-30 06:47:55', NULL),
	(3, 4, 3, NULL, '2023-11-16 05:01:00', NULL),
	(3, 5, 3, NULL, '2023-11-16 05:02:50', NULL),
	(3, 6, 3, NULL, '2023-11-16 02:20:26', NULL),
	(4, 7, 1, '2023-10-30 01:46:58', '2023-10-30 01:46:58', NULL),
	(4, 8, 1, '2023-10-30 01:47:43', '2023-10-30 01:47:43', NULL),
	(4, 9, 1, '2023-10-30 01:48:49', '2023-10-30 01:48:49', NULL),
	(1, 10, 1, '2023-11-13 09:52:57', '2023-11-13 09:52:57', NULL),
	(3, 11, 1, '2023-10-30 01:52:04', '2023-10-30 01:52:04', NULL),
	(1, 12, 3, '2023-11-17 08:25:42', '2023-11-17 08:25:57', NULL),
	(1, 13, 2, '2023-11-14 06:53:19', '2023-11-14 06:53:20', NULL);

-- Volcando estructura para tabla forksoftware.funcionario_almacen
CREATE TABLE IF NOT EXISTS `funcionario_almacen` (
  `ID` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `funcionario_almacen_ibfk_2` (`ID_Almacen`),
  CONSTRAINT `funcionario_almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`),
  CONSTRAINT `funcionario_almacen_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.funcionario_almacen: ~3 rows (aproximadamente)
INSERT INTO `funcionario_almacen` (`ID`, `ID_Almacen`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 1, NULL, NULL, NULL),
	(4, 2, NULL, NULL, NULL),
	(28, 2, '2023-11-17 11:13:05', '2023-11-17 11:13:05', NULL);

-- Volcando estructura para tabla forksoftware.funcionario_forma
CREATE TABLE IF NOT EXISTS `funcionario_forma` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_forma_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.funcionario_forma: ~6 rows (aproximadamente)
INSERT INTO `funcionario_forma` (`ID_Funcionario`, `ID_Paquete`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 1, NULL, NULL, NULL),
	(3, 2, NULL, NULL, NULL),
	(3, 3, NULL, NULL, NULL),
	(4, 4, NULL, NULL, NULL),
	(4, 5, NULL, NULL, NULL),
	(4, 6, NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.funcionario_paquete_estante
CREATE TABLE IF NOT EXISTS `funcionario_paquete_estante` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete_estante` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.funcionario_paquete_estante: ~2 rows (aproximadamente)
INSERT INTO `funcionario_paquete_estante` (`ID_Funcionario`, `ID_Paquete`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 1, NULL, NULL, NULL),
	(3, 2, '2023-11-17 11:40:31', '2023-11-17 11:40:31', NULL);

-- Volcando estructura para tabla forksoftware.gerente_almacen
CREATE TABLE IF NOT EXISTS `gerente_almacen` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Gerente`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `gerente_almacen_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `persona` (`ID`),
  CONSTRAINT `gerente_almacen_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.gerente_almacen: ~4 rows (aproximadamente)
INSERT INTO `gerente_almacen` (`ID_Gerente`, `ID_Almacen`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 1, NULL, NULL, NULL),
	(6, 2, NULL, NULL, NULL),
	(7, 3, NULL, NULL, NULL),
	(29, 1, '2023-11-17 11:14:57', '2023-11-17 11:14:57', NULL);

-- Volcando estructura para tabla forksoftware.gerente_forma
CREATE TABLE IF NOT EXISTS `gerente_forma` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `forma` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.gerente_forma: ~7 rows (aproximadamente)
INSERT INTO `gerente_forma` (`ID_Gerente`, `ID_Paquete`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 1, '2023-11-13 04:13:32', '2023-11-13 04:16:38', NULL),
	(5, 2, '2023-11-13 04:13:33', '2023-11-13 04:16:38', NULL),
	(6, 3, NULL, NULL, NULL),
	(6, 4, NULL, NULL, NULL),
	(7, 5, NULL, NULL, NULL),
	(7, 6, NULL, NULL, NULL),
	(5, 10, '2023-11-13 09:52:57', '2023-11-13 09:52:57', NULL);

-- Volcando estructura para tabla forksoftware.gerente_lote
CREATE TABLE IF NOT EXISTS `gerente_lote` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.gerente_lote: ~3 rows (aproximadamente)
INSERT INTO `gerente_lote` (`ID_Gerente`, `ID_Lote`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 1, NULL, NULL, NULL),
	(7, 2, NULL, NULL, NULL),
	(7, 3, NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.gerente_paquete
CREATE TABLE IF NOT EXISTS `gerente_paquete` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.gerente_paquete: ~9 rows (aproximadamente)
INSERT INTO `gerente_paquete` (`ID_Gerente`, `ID_Paquete`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 1, NULL, NULL, NULL),
	(5, 2, NULL, NULL, NULL),
	(6, 3, NULL, NULL, NULL),
	(6, 4, NULL, NULL, NULL),
	(7, 5, NULL, NULL, NULL),
	(7, 6, NULL, NULL, NULL),
	(5, 8, '2023-11-15 23:07:54', '2023-11-15 23:07:55', NULL),
	(5, 10, NULL, NULL, NULL),
	(5, 13, '2023-11-13 08:06:40', '2023-11-13 08:06:40', NULL);

-- Volcando estructura para tabla forksoftware.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `ID_Estado` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estadolt` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.lote: ~6 rows (aproximadamente)
INSERT INTO `lote` (`ID`, `Descripcion`, `ID_Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, 1, '2023-10-30 07:00:19', '2023-11-17 08:26:24', NULL),
	(2, 'dsadsa', 1, '2023-10-30 07:00:39', '2023-11-17 08:55:19', NULL),
	(3, 'Algo', 2, '2023-10-30 05:36:55', '2023-10-30 05:36:55', NULL),
	(4, 'Tecnología', 1, '2023-10-30 01:28:59', '2023-10-30 01:28:59', NULL),
	(5, 'Santi', 1, '2023-11-13 00:57:41', '2023-11-13 00:57:42', NULL),
	(7, 'fdsafas', 1, '2023-11-17 08:56:37', '2023-11-17 08:56:37', NULL);

-- Volcando estructura para tabla forksoftware.lote_camion
CREATE TABLE IF NOT EXISTS `lote_camion` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `ID_Estado` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Camion` (`ID_Camion`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `lote_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `lote_camion_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `lote_camion_ibfk_3` FOREIGN KEY (`ID_Estado`) REFERENCES `estadol` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.lote_camion: ~5 rows (aproximadamente)
INSERT INTO `lote_camion` (`ID_Camion`, `ID_Lote`, `Fecha_Hora_Inicio`, `ID_Estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '2023-11-15 21:03:01', 1, '2023-11-16 00:03:01', '2023-11-17 09:38:02', NULL),
	(1, 2, '2023-09-12 10:20:00', 2, NULL, '2023-11-17 09:38:02', NULL),
	(2, 3, '2023-05-12 08:30:00', 2, NULL, '2023-11-14 04:49:14', NULL),
	(1, 4, '2023-11-13 03:27:22', 2, '2023-11-13 06:27:22', '2023-11-17 09:38:02', NULL),
	(1, 5, '2023-11-13 04:14:04', 2, '2023-11-13 07:14:04', '2023-11-17 09:38:02', NULL);

-- Volcando estructura para tabla forksoftware.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.migrations: ~66 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(10, '2023_09_29_021350_create_administrador_table', 1),
	(11, '2023_09_29_021350_create_almacen_table', 1),
	(12, '2023_09_29_021350_create_camion_lleva_lote_table', 1),
	(13, '2023_09_29_021350_create_camion_plataforma_salida_table', 1),
	(14, '2023_09_29_021350_create_camion_plataforma_table', 1),
	(15, '2023_09_29_021350_create_camion_table', 1),
	(16, '2023_09_29_021350_create_chofer_camion_maneja_table', 1),
	(17, '2023_09_29_021350_create_chofer_camion_table', 1),
	(18, '2023_09_29_021350_create_chofer_table', 1),
	(19, '2023_09_29_021350_create_chofer_tipo_libreta_table', 1),
	(20, '2023_09_29_021350_create_cliente_table', 1),
	(21, '2023_09_29_021350_create_estadoc_table', 1),
	(22, '2023_09_29_021350_create_estadof_table', 1),
	(23, '2023_09_29_021350_create_estadol_table', 1),
	(24, '2023_09_29_021350_create_estadop_table', 1),
	(25, '2023_09_29_021350_create_estante_table', 1),
	(26, '2023_09_29_021350_create_forma_table', 1),
	(27, '2023_09_29_021350_create_funcionario_almacen_table', 1),
	(28, '2023_09_29_021350_create_funcionario_forma_table', 1),
	(29, '2023_09_29_021350_create_funcionario_paquete_estante_table', 1),
	(30, '2023_09_29_021350_create_gerente_almacen_table', 1),
	(31, '2023_09_29_021350_create_gerente_forma_table', 1),
	(32, '2023_09_29_021350_create_gerente_lote_table', 1),
	(33, '2023_09_29_021350_create_gerente_paquete_table', 1),
	(34, '2023_09_29_021350_create_lote_camion_table', 1),
	(35, '2023_09_29_021350_create_lote_table', 1),
	(36, '2023_09_29_021350_create_paquete_estante_table', 1),
	(37, '2023_09_29_021350_create_paquete_table', 1),
	(38, '2023_09_29_021350_create_persona_table', 1),
	(39, '2023_09_29_021350_create_persona_telefono_table', 1),
	(40, '2023_09_29_021350_create_persona_usuario_table', 1),
	(41, '2023_09_29_021350_create_plataforma_table', 1),
	(42, '2023_09_29_021350_create_tipo_libreta_table', 1),
	(43, '2023_09_29_021353_add_foreign_keys_to_administrador_table', 1),
	(44, '2023_09_29_021353_add_foreign_keys_to_camion_lleva_lote_table', 1),
	(45, '2023_09_29_021353_add_foreign_keys_to_camion_plataforma_salida_table', 1),
	(46, '2023_09_29_021353_add_foreign_keys_to_camion_plataforma_table', 1),
	(47, '2023_09_29_021353_add_foreign_keys_to_chofer_camion_maneja_table', 1),
	(48, '2023_09_29_021353_add_foreign_keys_to_chofer_camion_table', 1),
	(49, '2023_09_29_021353_add_foreign_keys_to_chofer_table', 1),
	(50, '2023_09_29_021353_add_foreign_keys_to_chofer_tipo_libreta_table', 1),
	(51, '2023_09_29_021353_add_foreign_keys_to_cliente_table', 1),
	(52, '2023_09_29_021353_add_foreign_keys_to_estante_table', 1),
	(53, '2023_09_29_021353_add_foreign_keys_to_forma_table', 1),
	(54, '2023_09_29_021353_add_foreign_keys_to_funcionario_almacen_table', 1),
	(55, '2023_09_29_021353_add_foreign_keys_to_funcionario_forma_table', 1),
	(56, '2023_09_29_021353_add_foreign_keys_to_funcionario_paquete_estante_table', 1),
	(57, '2023_09_29_021353_add_foreign_keys_to_gerente_almacen_table', 1),
	(58, '2023_09_29_021353_add_foreign_keys_to_gerente_forma_table', 1),
	(59, '2023_09_29_021353_add_foreign_keys_to_gerente_lote_table', 1),
	(60, '2023_09_29_021353_add_foreign_keys_to_gerente_paquete_table', 1),
	(61, '2023_09_29_021353_add_foreign_keys_to_lote_camion_table', 1),
	(62, '2023_09_29_021353_add_foreign_keys_to_paquete_estante_table', 1),
	(63, '2023_09_29_021353_add_foreign_keys_to_paquete_table', 1),
	(64, '2023_09_29_021353_add_foreign_keys_to_persona_telefono_table', 1),
	(65, '2023_09_29_021353_add_foreign_keys_to_persona_usuario_table', 1),
	(66, '2023_09_29_021353_add_foreign_keys_to_plataforma_table', 1);

-- Volcando estructura para tabla forksoftware.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_access_tokens: ~12 rows (aproximadamente)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0686f1cce8194e9bec195e83bcee92fe94589992ee6c4422bfe811608f2ac8f7b116266c8ff3118e', 1, 15, 'auth_token', '[]', 1, '2023-11-17 10:02:54', '2023-11-17 10:02:54', '2024-05-17 07:02:54'),
	('3bfe435b5a8a82f35ee8610501cfca529464e0639ef6492ca8b93688dc533263e4c6d6e29339f5cb', 20, 15, 'auth_token', '[]', 0, '2023-11-17 13:22:27', '2023-11-17 13:22:27', '2024-05-17 10:22:27'),
	('59178291e4b8b8c8cb56d59a517e268c779afd934856b719d72fd5541f6433f5ce9e93482f55a533', 1, 15, 'auth_token', '[]', 1, '2023-11-17 05:44:14', '2023-11-17 05:44:14', '2024-05-17 02:44:14'),
	('6bd293c66cc92da62e9633c789f5b8af79172e5350a60eabf6d707d4b112512e962719f62173760d', 20, 15, 'auth_token', '[]', 0, '2023-11-17 13:06:20', '2023-11-17 13:06:20', '2024-05-17 10:06:20'),
	('877e9065af043b5e4ca7635c5ba2927f8cd51149de1b3583410da936ced4c42234cee57d7a89963a', 28, 15, 'auth_token', '[]', 0, '2023-11-17 11:52:45', '2023-11-17 11:52:45', '2024-05-17 08:52:45'),
	('96bed0780d62b1ec9f0b6a06572d7a0a8411a6bb37be29694e7ac30a7b9f45eb98c993bbfa9a55cc', 28, 15, 'auth_token', '[]', 0, '2023-11-17 11:31:55', '2023-11-17 11:31:55', '2024-05-17 08:31:55'),
	('a721a3efce33719b3d2f14921387d943e1e6e976358f598f7c56ed52bcdb4049f44ee208222f5552', 1, 15, 'auth_token', '[]', 0, '2023-11-17 10:39:45', '2023-11-17 10:39:45', '2024-05-17 07:39:45'),
	('b4e2dd0adb5db5b505d9d560320f47a2f50a9fb2433100d8ab53863d0920a689630104c657c425e3', 29, 15, 'auth_token', '[]', 0, '2023-11-17 12:14:34', '2023-11-17 12:14:34', '2024-05-17 09:14:34'),
	('d56de4a3914734a38862a4cb3d582e585bedfa2c7f495e4e7159f28a941cf2d0819e5a38bc6df172', 28, 15, 'auth_token', '[]', 0, '2023-11-17 11:32:50', '2023-11-17 11:32:50', '2024-05-17 08:32:50'),
	('d9eb8bec9580f4f11316d50982a970afbaaa4293f6eb126e36d79ec52fa3f8e8f5990921c257a029', 20, 15, 'auth_token', '[]', 0, '2023-11-17 13:06:57', '2023-11-17 13:06:57', '2024-05-17 10:06:57'),
	('f63565ca6d9ef9f3fc83046b76406e3b895a58c3f4a6d92010b02d5661b45ccd61d2c3a735664601', 28, 15, 'auth_token', '[]', 0, '2023-11-17 11:44:17', '2023-11-17 11:44:17', '2024-05-17 08:44:17'),
	('f99373030130c818e9c805e0fd682ad947f4295c1d0ad6c419d9edf60794143a50600fed9ca6a796', 17, 15, 'auth_token', '[]', 1, '2023-11-17 10:12:28', '2023-11-17 10:12:28', '2024-05-17 07:12:28');

-- Volcando estructura para tabla forksoftware.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_auth_codes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla forksoftware.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_clients: ~2 rows (aproximadamente)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(15, NULL, 'Laravel Personal Access Client', 'z9jfeaNPs2TtXyxV7qcAbMAofQYvcud1IYyrpYAB', NULL, 'http://localhost', 1, 0, 0, '2023-11-17 05:38:43', '2023-11-17 05:38:43'),
	(16, NULL, 'Laravel Password Grant Client', 'gSQsoFEHgVpCcq9LtXAJKrRUOcYqRZCIhnFF0TVZ', 'users', 'http://localhost', 0, 1, 0, '2023-11-17 05:38:43', '2023-11-17 05:38:43');

-- Volcando estructura para tabla forksoftware.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_personal_access_clients: ~1 rows (aproximadamente)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(8, 15, '2023-11-17 05:38:43', '2023-11-17 05:38:43');

-- Volcando estructura para tabla forksoftware.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_refresh_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla forksoftware.paquete
CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` smallint(6) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  `ID_Estado` smallint(6) NOT NULL,
  `Destino` varchar(255) NOT NULL,
  `Codigo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Codigo` (`Codigo`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `paquete_ibfk_2` FOREIGN KEY (`ID_Estado`) REFERENCES `estadop` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.paquete: ~13 rows (aproximadamente)
INSERT INTO `paquete` (`ID`, `ID_Cliente`, `Descripcion`, `Peso_Kg`, `ID_Estado`, `Destino`, `Codigo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 2, NULL, 1, 2, 'Charrua, 2275, Montevideo', '#89gnf', NULL, '2023-11-17 08:05:55', NULL),
	(2, 11, 'hola', 2, 4, 'Luisa Caceres, 3700, Montevideo', '#31nd9', NULL, '2023-11-17 08:31:25', NULL),
	(3, 2, NULL, 5, 1, 'Ramón González, 146, Tacuarembó', '#an93m', NULL, NULL, NULL),
	(4, 2, 'quimicos', 2, 4, 'Cagancha, 2063, Montevideo', '#012n9', NULL, '2023-11-16 05:01:00', NULL),
	(5, 2, NULL, 15, 4, 'Miguelete, 2259, Montevideo', '#lamf4', NULL, '2023-11-16 05:02:50', NULL),
	(6, 11, NULL, 30, 3, 'Barroso, 3725, Montevideo', '#m4n3m', NULL, '2023-11-16 02:20:26', NULL),
	(7, 2, 'prueba', 70, 4, 'Charrua, 2250, Montevideo', '0DhNOq', '2023-10-23 06:43:09', '2023-10-30 03:12:58', NULL),
	(8, 11, 'prueba', 50, 3, 'Charrua, 2265, Montevideo', 'aaaaaa', '2023-10-26 03:38:44', '2023-10-26 03:38:44', NULL),
	(9, 11, 'prueba', 50, 3, 'Charrua, 2300,  Montevideo', 'pJWgGf', '2023-10-26 03:40:48', '2023-10-26 03:40:48', NULL),
	(10, 2, 'prueba', 50, 2, 'Selva Negra, 20000, Maldonado', 'qmhr18', '2023-10-26 03:44:50', '2023-10-30 04:33:21', NULL),
	(11, 2, 'prueba', 50, 3, 'Charrua, 2364, Montevideo', 'SpXt52', '2023-10-26 04:03:13', '2023-11-13 02:34:22', NULL),
	(12, 11, 'matenmen', 50, 4, 'Luisa Caceres de Arismendi, 3640, Montevideo', 'CN3PZI', '2023-11-13 08:06:19', '2023-11-17 08:25:57', NULL),
	(13, 11, NULL, 50, 1, 'Luisa Caceres de Arismendi, 3600, Montevideo', 'ENZsk9', '2023-11-13 08:06:40', '2023-11-13 08:06:40', NULL);

-- Volcando estructura para tabla forksoftware.paquete_estante
CREATE TABLE IF NOT EXISTS `paquete_estante` (
  `ID_Paquete` smallint(6) NOT NULL,
  `ID_Estante` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Estante` (`ID_Estante`,`ID_Almacen`),
  CONSTRAINT `paquete_estante_ibfk_1` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`),
  CONSTRAINT `paquete_estante_ibfk_2` FOREIGN KEY (`ID_Estante`, `ID_Almacen`) REFERENCES `estante` (`ID`, `ID_Almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.paquete_estante: ~3 rows (aproximadamente)
INSERT INTO `paquete_estante` (`ID_Paquete`, `ID_Estante`, `ID_Almacen`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, NULL, '2023-10-26 06:26:40', NULL),
	(2, 1, 1, '2023-11-17 11:40:31', '2023-11-17 11:43:31', NULL),
	(10, 5, 2, '2023-10-26 06:00:17', '2023-10-30 04:33:21', NULL);

-- Volcando estructura para tabla forksoftware.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `username` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla forksoftware.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CI` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.persona: ~16 rows (aproximadamente)
INSERT INTO `persona` (`ID`, `CI`, `Nombre`, `Apellido`, `Correo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 46270322, 'Dr. Eldridge Willms', 'Kihn', 'grunolfsson@barrows.com', NULL, NULL, NULL),
	(2, 49190150, 'Dr. Mark Marquardt DVM', 'Macejkovic', 'ckoepp@dooley.com', NULL, NULL, NULL),
	(3, 62681135, 'Bria Larson Sr.', 'Raynor', 'christopher07@hotmail.com', NULL, NULL, NULL),
	(4, 66354021, 'Isobel Jones', 'Gleason', 'tierra.ziemann@bins.com', NULL, NULL, NULL),
	(5, 64963356, 'Xzavier Ankunding PhD', 'Stracke', 'velda.mertz@yahoo.com', NULL, NULL, NULL),
	(6, 67947594, 'Maximo Upton II', 'Williamson', 'homenick.steve@abernathy.info', NULL, NULL, NULL),
	(7, 48601422, 'Lexus Osinski', 'Lebsack', 'gdooley@hodkiewicz.info', NULL, NULL, NULL),
	(8, 60978348, 'Prof. Jackson Marvin DVM', 'Kunze', 'rachel04@batz.com', NULL, NULL, NULL),
	(9, 21679127, 'Turner Murphy', 'Farrell', 'veum.abbey@gmail.com', NULL, NULL, NULL),
	(10, 83735196, 'Willow Friesen', 'Hilpert', 'feeney.keon@rutherford.net', NULL, NULL, NULL),
	(11, 34337413, 'Jose Volkman', 'Hackett', 'vswaniawski@yahoo.com', NULL, '2023-11-17 07:11:11', NULL),
	(16, 12345678, 'Puba', 'Prueba', 'prueba@prueba.prueba', '2023-11-17 05:21:26', '2023-11-17 07:15:54', NULL),
	(17, 11223344, 'Brasil', 'Uruguay', '2acero@gmail.com', '2023-11-17 10:04:18', '2023-11-17 10:04:18', NULL),
	(20, 12398765, 'Maestro', 'Yi', 'nose@mentira.com', '2023-11-17 10:11:56', '2023-11-17 10:11:56', NULL),
	(28, 42187484, 'Mequiero', 'Lastimar', 'hola@chau.jiji', '2023-11-17 11:13:05', '2023-11-17 11:13:05', NULL),
	(29, 19283746, 'Sifunciona', 'Mencuero', 'quieropolenta@conqueso.com', '2023-11-17 11:14:57', '2023-11-17 11:14:57', NULL);

-- Volcando estructura para tabla forksoftware.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_username_foreign` (`username`),
  CONSTRAINT `personal_access_tokens_username_foreign` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla forksoftware.persona_telefono
CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Persona` smallint(6) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Persona` (`ID_Persona`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`),
  CONSTRAINT `persona_telefono_ibfk_2` FOREIGN KEY (`ID_Persona`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.persona_telefono: ~16 rows (aproximadamente)
INSERT INTO `persona_telefono` (`ID`, `ID_Persona`, `Telefono`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '+1-734-296-2438', NULL, NULL, NULL),
	(2, 2, '+1.380.395.5673', NULL, NULL, NULL),
	(3, 3, '1-262-806-3865', NULL, NULL, NULL),
	(4, 4, '385-379-0875', NULL, NULL, NULL),
	(5, 5, '815-756-8497', NULL, NULL, NULL),
	(6, 6, '+1.412.485.2736', NULL, NULL, NULL),
	(7, 7, '510.594.7951', NULL, NULL, NULL),
	(8, 8, '1-602-574-4465', NULL, NULL, NULL),
	(9, 9, '+1-463-212-1604', NULL, NULL, NULL),
	(10, 10, '+17434985158', NULL, NULL, NULL),
	(11, 11, '(984) 643-7858', NULL, NULL, NULL),
	(16, 16, '111111111', NULL, NULL, NULL),
	(17, 17, '099848222', NULL, NULL, NULL),
	(20, 20, '091234222', NULL, NULL, NULL),
	(28, 28, '091829102', NULL, NULL, NULL),
	(29, 29, '192847182', NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.persona_usuario
CREATE TABLE IF NOT EXISTS `persona_usuario` (
  `ID_Persona` smallint(6) NOT NULL,
  `ID_Usuario` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Persona`),
  UNIQUE KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `persona_usuario_ibfk_1` FOREIGN KEY (`ID_Persona`) REFERENCES `persona` (`ID`),
  CONSTRAINT `persona_usuario_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.persona_usuario: ~16 rows (aproximadamente)
INSERT INTO `persona_usuario` (`ID_Persona`, `ID_Usuario`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, NULL, NULL, NULL),
	(2, 2, NULL, NULL, NULL),
	(3, 3, NULL, NULL, NULL),
	(4, 4, NULL, NULL, NULL),
	(5, 5, NULL, NULL, NULL),
	(6, 6, NULL, NULL, NULL),
	(7, 7, NULL, NULL, NULL),
	(8, 8, NULL, NULL, NULL),
	(9, 9, NULL, NULL, NULL),
	(10, 10, NULL, NULL, NULL),
	(11, 11, NULL, '2023-11-17 07:11:11', NULL),
	(16, 16, '2023-11-17 05:21:26', '2023-11-17 07:13:59', NULL),
	(17, 17, '2023-11-17 10:04:18', '2023-11-17 10:04:18', NULL),
	(20, 20, '2023-11-17 10:11:56', '2023-11-17 10:11:56', NULL),
	(28, 28, '2023-11-17 11:13:05', '2023-11-17 11:13:05', NULL),
	(29, 29, '2023-11-17 11:14:57', '2023-11-17 11:14:57', NULL);

-- Volcando estructura para tabla forksoftware.plataforma
CREATE TABLE IF NOT EXISTS `plataforma` (
  `Numero` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Numero`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.plataforma: ~20 rows (aproximadamente)
INSERT INTO `plataforma` (`Numero`, `ID_Almacen`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, NULL, '2023-11-17 07:58:40', NULL),
	(1, 4, '2023-11-17 07:33:32', '2023-11-17 07:58:40', NULL),
	(2, 1, NULL, NULL, NULL),
	(3, 1, NULL, NULL, NULL),
	(4, 1, '2023-11-17 07:34:08', '2023-11-17 07:48:47', NULL),
	(4, 2, NULL, '2023-11-17 07:48:47', NULL),
	(5, 2, NULL, NULL, NULL),
	(6, 2, NULL, NULL, NULL),
	(7, 3, NULL, NULL, NULL),
	(8, 3, NULL, NULL, NULL),
	(9, 3, NULL, NULL, NULL),
	(10, 1, NULL, NULL, NULL),
	(11, 1, NULL, NULL, NULL),
	(12, 1, NULL, NULL, NULL),
	(13, 2, NULL, NULL, NULL),
	(14, 2, NULL, NULL, NULL),
	(15, 2, NULL, NULL, NULL),
	(16, 3, NULL, NULL, NULL),
	(17, 3, NULL, NULL, NULL),
	(18, 3, NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.tipo_libreta
CREATE TABLE IF NOT EXISTS `tipo_libreta` (
  `Tipo` varchar(2) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.tipo_libreta: ~2 rows (aproximadamente)
INSERT INTO `tipo_libreta` (`Tipo`, `PesoMaximoKg`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('b', 7000, NULL, NULL, NULL),
	('c', 8500, NULL, NULL, NULL);

-- Volcando estructura para tabla forksoftware.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.users: ~16 rows (aproximadamente)
INSERT INTO `users` (`ID`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'superadmin', '$2y$10$UjUsu9EWxkUKsBKiRHzsRerhh0VJgI86FdNMBU1u7ZTok42JyCjR2', '1ixcdifAyHNcQaranR7P7WaeHPXlxgnLVBOoqHPuhCfTBqvzBvVIZQotbKHO', NULL, NULL, NULL),
	(2, 'harold89', '$2y$10$QtWJiphimGZc2Otc/Mf0huwHT9RrmjeUhcgkU.tVmIU7ru3Nysl8G', NULL, NULL, NULL, NULL),
	(3, 'conor64', '$2y$10$Z9iF8sY99VLyZEuIWBpDs.CbLzfplus5kV1aqC80Pbo45ltgbnwQS', NULL, NULL, NULL, NULL),
	(4, 'nyah24', '$2y$10$WWOrTVgeBCiGaFxJ1RYKs.okj4NLb70wv2GqH1pPAIgKI5fXH4TjS', NULL, NULL, NULL, NULL),
	(5, 'pzboncak', '$2y$10$mTDVRoHL6Cqvcu2lPOKHuO60nSThE91PP8AwI0uKkgsoUDSHUev2G', NULL, NULL, NULL, NULL),
	(6, 'ebraun', '$2y$10$jIDEJksHCzWudJEwrD7SaeoMMhZK1mha1c4/Q3dOByI4HV1CzXblW', NULL, NULL, NULL, NULL),
	(7, 'garett.schmeler', '$2y$10$1pVOLikSomKCY9ZU.0sYo.5c07od41gOUc0cLz7iv1GS6U25Vl9Fy', NULL, NULL, NULL, NULL),
	(8, 'curt41', '$2y$10$XYmAzTGUjoLoCoOQZHGjTe/vnpedNTUVmhsVfq6Bd9IHQOBMJlEiu', NULL, NULL, NULL, NULL),
	(9, 'qwuckert', '$2y$10$rQgXjulN.sQUo4jbv1uipujA8Eu1Yb.nXzl6.LLWummTKV1Xscmr6', NULL, NULL, NULL, NULL),
	(10, 'mante.violet', '$2y$10$2YYwlCwhSQsQ/U6S4ijtwOr1twKbEFgG/DcwvgXHW4kDpgumZANT6', NULL, NULL, NULL, NULL),
	(11, 'mueller.matilde', '$2y$10$6za4dH1nGIsXIwRtcONCxO99d/Xed.Cdb4tZIeKjGGEGe8oOdg7xO', NULL, NULL, '2023-11-17 07:11:11', NULL),
	(16, 'prueba', '$2y$10$tL8DRVjpOxXI/AUecHJjRO6MBXBPI1VPxDcP/PC/LgFP1lNnQpY0e', NULL, '2023-11-17 05:21:26', '2023-11-17 07:13:59', NULL),
	(17, 'admin', '$2y$10$kuCSoOD.18QwUZCRRERi7.173FHjp0gohIw5YbWr.LO1OLQKyFj52', 'afUCXuusVkNzrl1CwdtOjMV6dhJhZcYR8Q6I4KW5keRO5281IGSOecYpS9oo', '2023-11-17 10:04:18', '2023-11-17 10:04:18', NULL),
	(20, 'chofer', '$2y$10$k/rMgdQ2IDbTE9jHri.nSOG4zz/cZ4G7xki6ZX85zAgAufnBD5xdy', NULL, '2023-11-17 10:11:56', '2023-11-17 10:11:56', NULL),
	(28, 'funcionario', '$2y$10$Ui1plXbn33GQMlxEfewFK.zVAwuL8UmqCuk2bMZpAwxAiulnzyIjy', NULL, '2023-11-17 11:13:05', '2023-11-17 11:13:05', NULL),
	(29, 'gerente', '$2y$10$iX5RH8.9SdhLoQ4xQc7QUeSoxG7GU2wTYXwqbTPvFFXX2trzM/A1u', NULL, '2023-11-17 11:14:57', '2023-11-17 11:14:57', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

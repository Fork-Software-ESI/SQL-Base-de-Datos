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
DROP DATABASE IF EXISTS `forksoftware`;
CREATE DATABASE IF NOT EXISTS `forksoftware` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `forksoftware`;

-- Volcando estructura para tabla forksoftware.administrador
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.administrador: ~2 rows (aproximadamente)
DELETE FROM `administrador`;
INSERT INTO `administrador` (`ID`) VALUES
	(1),
	(10);

-- Volcando estructura para tabla forksoftware.almacen
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.almacen: ~0 rows (aproximadamente)
DELETE FROM `almacen`;
INSERT INTO `almacen` (`ID`, `Direccion`) VALUES
	(1, 'Bv Artigas 2053'),
	(2, 'Aparicio Saravia 1011'),
	(3, 'Palmar 6666'),
	(4, 'Bv Artigas 2053'),
	(5, 'Aparicio Saravia 1011'),
	(6, 'Palmar 6666');

-- Volcando estructura para tabla forksoftware.camion
DROP TABLE IF EXISTS `camion`;
CREATE TABLE IF NOT EXISTS `camion` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(7) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Matricula` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion: ~0 rows (aproximadamente)
DELETE FROM `camion`;
INSERT INTO `camion` (`ID`, `Matricula`, `PesoMaximoKg`) VALUES
	(1, 'abd2053', 2000),
	(2, 'sbu2150', 1500);

-- Volcando estructura para tabla forksoftware.camion_lleva_lote
DROP TABLE IF EXISTS `camion_lleva_lote`;
CREATE TABLE IF NOT EXISTS `camion_lleva_lote` (
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  CONSTRAINT `camion_lleva_lote_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote_camion` (`ID_Lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion_lleva_lote: ~0 rows (aproximadamente)
DELETE FROM `camion_lleva_lote`;
INSERT INTO `camion_lleva_lote` (`ID_Lote`, `Fecha_Hora_Fin`) VALUES
	(1, '2023-09-12 13:23:00'),
	(2, '2023-09-12 15:40:00'),
	(3, '2023-05-12 11:15:00');

-- Volcando estructura para tabla forksoftware.camion_plataforma
DROP TABLE IF EXISTS `camion_plataforma`;
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

-- Volcando datos para la tabla forksoftware.camion_plataforma: ~0 rows (aproximadamente)
DELETE FROM `camion_plataforma`;
INSERT INTO `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Llegada`) VALUES
	(1, 1, 1, '2023-09-12 08:45:00'),
	(2, 1, 2, '2023-05-12 09:00:00');

-- Volcando estructura para tabla forksoftware.camion_plataforma_salida
DROP TABLE IF EXISTS `camion_plataforma_salida`;
CREATE TABLE IF NOT EXISTS `camion_plataforma_salida` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  `Numero_Plataforma` smallint(6) NOT NULL,
  `Fecha_Hora_Salida` datetime NOT NULL,
  PRIMARY KEY (`ID_Camion`,`ID_Almacen`,`Numero_Plataforma`),
  CONSTRAINT `camion_plataforma_salida_ibfk_1` FOREIGN KEY (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`) REFERENCES `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.camion_plataforma_salida: ~0 rows (aproximadamente)
DELETE FROM `camion_plataforma_salida`;
INSERT INTO `camion_plataforma_salida` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Salida`) VALUES
	(1, 1, 1, '2023-09-12 11:00:00'),
	(2, 1, 2, '2023-05-12 12:23:00');

-- Volcando estructura para tabla forksoftware.chofer
DROP TABLE IF EXISTS `chofer`;
CREATE TABLE IF NOT EXISTS `chofer` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer: ~0 rows (aproximadamente)
DELETE FROM `chofer`;
INSERT INTO `chofer` (`ID`) VALUES
	(8),
	(9);

-- Volcando estructura para tabla forksoftware.chofer_camion
DROP TABLE IF EXISTS `chofer_camion`;
CREATE TABLE IF NOT EXISTS `chofer_camion` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  KEY `ID_Camion` (`ID_Camion`),
  CONSTRAINT `chofer_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `chofer_camion_ibfk_2` FOREIGN KEY (`ID_Chofer`) REFERENCES `chofer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer_camion: ~0 rows (aproximadamente)
DELETE FROM `chofer_camion`;
INSERT INTO `chofer_camion` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Inicio`, `Estado`) VALUES
	(8, 1, '2023-09-12 08:30:05', ''),
	(9, 2, '2023-05-12 08:00:00', '');

-- Volcando estructura para tabla forksoftware.chofer_camion_maneja
DROP TABLE IF EXISTS `chofer_camion_maneja`;
CREATE TABLE IF NOT EXISTS `chofer_camion_maneja` (
  `ID_Chofer` smallint(6) NOT NULL,
  `ID_Camion` smallint(6) NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  PRIMARY KEY (`ID_Chofer`,`ID_Camion`),
  CONSTRAINT `chofer_camion_maneja_ibfk_1` FOREIGN KEY (`ID_Chofer`, `ID_Camion`) REFERENCES `chofer_camion` (`ID_Chofer`, `ID_Camion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer_camion_maneja: ~0 rows (aproximadamente)
DELETE FROM `chofer_camion_maneja`;
INSERT INTO `chofer_camion_maneja` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Fin`) VALUES
	(8, 1, '2023-09-12 16:00:00'),
	(9, 2, '2023-05-12 16:00:00');

-- Volcando estructura para tabla forksoftware.chofer_tipo_libreta
DROP TABLE IF EXISTS `chofer_tipo_libreta`;
CREATE TABLE IF NOT EXISTS `chofer_tipo_libreta` (
  `ID` smallint(6) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`ID`,`Tipo`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `chofer` (`ID`),
  CONSTRAINT `chofer_tipo_libreta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_libreta` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.chofer_tipo_libreta: ~0 rows (aproximadamente)
DELETE FROM `chofer_tipo_libreta`;
INSERT INTO `chofer_tipo_libreta` (`ID`, `Tipo`) VALUES
	(8, 'b'),
	(9, 'c');

-- Volcando estructura para tabla forksoftware.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.cliente: ~0 rows (aproximadamente)
DELETE FROM `cliente`;
INSERT INTO `cliente` (`ID`) VALUES
	(1),
	(2),
	(11);

-- Volcando estructura para tabla forksoftware.estante
DROP TABLE IF EXISTS `estante`;
CREATE TABLE IF NOT EXISTS `estante` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `estante_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.estante: ~0 rows (aproximadamente)
DELETE FROM `estante`;
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

-- Volcando estructura para tabla forksoftware.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
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
DELETE FROM `failed_jobs`;

-- Volcando estructura para tabla forksoftware.forma
DROP TABLE IF EXISTS `forma`;
CREATE TABLE IF NOT EXISTS `forma` (
  `ID_Lote` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Lote` (`ID_Lote`),
  CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`),
  CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.forma: ~0 rows (aproximadamente)
DELETE FROM `forma`;
INSERT INTO `forma` (`ID_Lote`, `ID_Paquete`, `Estado`) VALUES
	(1, 1, 'Pendiente'),
	(1, 2, 'Cargado'),
	(1, 3, 'Cargado'),
	(2, 4, 'Cargado'),
	(2, 5, 'Cargado'),
	(3, 6, 'Entregado');

-- Volcando estructura para tabla forksoftware.funcionario_almacen
DROP TABLE IF EXISTS `funcionario_almacen`;
CREATE TABLE IF NOT EXISTS `funcionario_almacen` (
  `ID` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `funcionario_almacen_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_almacen: ~0 rows (aproximadamente)
DELETE FROM `funcionario_almacen`;
INSERT INTO `funcionario_almacen` (`ID`) VALUES
	(3),
	(4);

-- Volcando estructura para tabla forksoftware.funcionario_forma
DROP TABLE IF EXISTS `funcionario_forma`;
CREATE TABLE IF NOT EXISTS `funcionario_forma` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_forma_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_forma: ~0 rows (aproximadamente)
DELETE FROM `funcionario_forma`;
INSERT INTO `funcionario_forma` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1),
	(3, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(4, 6);

-- Volcando estructura para tabla forksoftware.funcionario_paquete_estante
DROP TABLE IF EXISTS `funcionario_paquete_estante`;
CREATE TABLE IF NOT EXISTS `funcionario_paquete_estante` (
  `ID_Funcionario` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Funcionario` (`ID_Funcionario`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario_almacen` (`ID`),
  CONSTRAINT `funcionario_paquete_estante_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete_estante` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.funcionario_paquete_estante: ~0 rows (aproximadamente)
DELETE FROM `funcionario_paquete_estante`;
INSERT INTO `funcionario_paquete_estante` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1);

-- Volcando estructura para tabla forksoftware.gerente_almacen
DROP TABLE IF EXISTS `gerente_almacen`;
CREATE TABLE IF NOT EXISTS `gerente_almacen` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Gerente`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `gerente_almacen_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `persona` (`ID`),
  CONSTRAINT `gerente_almacen_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_almacen: ~0 rows (aproximadamente)
DELETE FROM `gerente_almacen`;
INSERT INTO `gerente_almacen` (`ID_Gerente`, `ID_Almacen`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando estructura para tabla forksoftware.gerente_forma
DROP TABLE IF EXISTS `gerente_forma`;
CREATE TABLE IF NOT EXISTS `gerente_forma` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_forma_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `forma` (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_forma: ~0 rows (aproximadamente)
DELETE FROM `gerente_forma`;
INSERT INTO `gerente_forma` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

-- Volcando estructura para tabla forksoftware.gerente_lote
DROP TABLE IF EXISTS `gerente_lote`;
CREATE TABLE IF NOT EXISTS `gerente_lote` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_lote_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_lote: ~0 rows (aproximadamente)
DELETE FROM `gerente_lote`;
INSERT INTO `gerente_lote` (`ID_Gerente`, `ID_Lote`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando estructura para tabla forksoftware.gerente_paquete
DROP TABLE IF EXISTS `gerente_paquete`;
CREATE TABLE IF NOT EXISTS `gerente_paquete` (
  `ID_Gerente` smallint(6) NOT NULL,
  `ID_Paquete` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Paquete`),
  KEY `ID_Gerente` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_1` FOREIGN KEY (`ID_Gerente`) REFERENCES `gerente_almacen` (`ID_Gerente`),
  CONSTRAINT `gerente_paquete_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.gerente_paquete: ~0 rows (aproximadamente)
DELETE FROM `gerente_paquete`;
INSERT INTO `gerente_paquete` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

-- Volcando estructura para tabla forksoftware.lote
DROP TABLE IF EXISTS `lote`;
CREATE TABLE IF NOT EXISTS `lote` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.lote: ~0 rows (aproximadamente)
DELETE FROM `lote`;
INSERT INTO `lote` (`ID`, `Descripcion`, `Peso_Kg`) VALUES
	(1, NULL, 8),
	(2, NULL, 17),
	(3, NULL, 30);

-- Volcando estructura para tabla forksoftware.lote_camion
DROP TABLE IF EXISTS `lote_camion`;
CREATE TABLE IF NOT EXISTS `lote_camion` (
  `ID_Camion` smallint(6) NOT NULL,
  `ID_Lote` smallint(6) NOT NULL,
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Lote`),
  KEY `ID_Camion` (`ID_Camion`),
  CONSTRAINT `lote_camion_ibfk_1` FOREIGN KEY (`ID_Camion`) REFERENCES `camion` (`ID`),
  CONSTRAINT `lote_camion_ibfk_2` FOREIGN KEY (`ID_Lote`) REFERENCES `lote` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.lote_camion: ~0 rows (aproximadamente)
DELETE FROM `lote_camion`;
INSERT INTO `lote_camion` (`ID_Camion`, `ID_Lote`, `Fecha_Hora_Inicio`, `Estado`) VALUES
	(1, 1, '2023-09-12 09:00:00', 'Pendiente'),
	(1, 2, '2023-09-12 10:20:00', 'Cargado'),
	(2, 3, '2023-05-12 08:30:00', 'Entregado');

-- Volcando estructura para tabla forksoftware.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.migrations: ~9 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Volcando estructura para tabla forksoftware.oauth_access_tokens
DROP TABLE IF EXISTS `oauth_access_tokens`;
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

-- Volcando datos para la tabla forksoftware.oauth_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `oauth_access_tokens`;

-- Volcando estructura para tabla forksoftware.oauth_auth_codes
DROP TABLE IF EXISTS `oauth_auth_codes`;
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
DELETE FROM `oauth_auth_codes`;

-- Volcando estructura para tabla forksoftware.oauth_clients
DROP TABLE IF EXISTS `oauth_clients`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_clients: ~0 rows (aproximadamente)
DELETE FROM `oauth_clients`;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'xp1idrUXl0bzS2XU6GLlotHTUf7w7p7c07ze6gBt', NULL, 'http://localhost', 1, 0, 0, '2023-09-21 07:36:44', '2023-09-21 07:36:44'),
	(2, NULL, 'Laravel Password Grant Client', 'jSD2D026eKUl8mSOwfLysBlZC2fxMJ5mJvjxxmvu', 'users', 'http://localhost', 0, 1, 0, '2023-09-21 07:36:44', '2023-09-21 07:36:44');

-- Volcando estructura para tabla forksoftware.oauth_personal_access_clients
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_personal_access_clients: ~1 rows (aproximadamente)
DELETE FROM `oauth_personal_access_clients`;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-09-21 07:36:44', '2023-09-21 07:36:44');

-- Volcando estructura para tabla forksoftware.oauth_refresh_tokens
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.oauth_refresh_tokens: ~0 rows (aproximadamente)
DELETE FROM `oauth_refresh_tokens`;

-- Volcando estructura para tabla forksoftware.paquete
DROP TABLE IF EXISTS `paquete`;
CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` smallint(6) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Peso_Kg` smallint(6) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Destino` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.paquete: ~6 rows (aproximadamente)
DELETE FROM `paquete`;
INSERT INTO `paquete` (`ID`, `ID_Cliente`, `Descripcion`, `Peso_Kg`, `Estado`, `Destino`) VALUES
	(1, 1, NULL, 1, 'En almacen', 'Charrua 2263'),
	(2, 1, 'fragil', 2, 'En almacen', 'Luisa Caceres 3600'),
	(3, 1, NULL, 5, 'En almacen', 'Carlos Anaya 2963'),
	(4, 2, 'quimicos', 2, 'En transito', 'Cagancha 2063'),
	(5, 2, NULL, 15, 'En transito', 'Miguelete 2259'),
	(6, 11, NULL, 30, 'Entregado', 'Barroso 3725');

-- Volcando estructura para tabla forksoftware.paquete_estante
DROP TABLE IF EXISTS `paquete_estante`;
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
DELETE FROM `paquete_estante`;
INSERT INTO `paquete_estante` (`ID_Paquete`, `ID_Estante`, `ID_Almacen`) VALUES
	(1, 2, 1);

-- Volcando estructura para tabla forksoftware.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `username` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;

-- Volcando estructura para tabla forksoftware.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CI` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona: ~11 rows (aproximadamente)
DELETE FROM `persona`;
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
	(11, 34337413, 'Jose Volkman', 'Hackett', 'vswaniawski@yahoo.com');

-- Volcando estructura para tabla forksoftware.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
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
DELETE FROM `personal_access_tokens`;

-- Volcando estructura para tabla forksoftware.persona_telefono
DROP TABLE IF EXISTS `persona_telefono`;
CREATE TABLE IF NOT EXISTS `persona_telefono` (
  `ID` smallint(6) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`,`Telefono`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona_telefono: ~11 rows (aproximadamente)
DELETE FROM `persona_telefono`;
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
	(11, '(984) 643-7858');

-- Volcando estructura para tabla forksoftware.persona_usuario
DROP TABLE IF EXISTS `persona_usuario`;
CREATE TABLE IF NOT EXISTS `persona_usuario` (
  `ID_Persona` smallint(6) NOT NULL,
  `ID_Usuario` smallint(6) NOT NULL,
  PRIMARY KEY (`ID_Persona`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `persona_usuario_ibfk_1` FOREIGN KEY (`ID_Persona`) REFERENCES `persona` (`ID`),
  CONSTRAINT `persona_usuario_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.persona_usuario: ~11 rows (aproximadamente)
DELETE FROM `persona_usuario`;
INSERT INTO `persona_usuario` (`ID_Persona`, `ID_Usuario`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11);

-- Volcando estructura para tabla forksoftware.plataforma
DROP TABLE IF EXISTS `plataforma`;
CREATE TABLE IF NOT EXISTS `plataforma` (
  `Numero` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_Almacen` smallint(6) NOT NULL,
  PRIMARY KEY (`Numero`,`ID_Almacen`),
  KEY `ID_Almacen` (`ID_Almacen`),
  CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.plataforma: ~18 rows (aproximadamente)
DELETE FROM `plataforma`;
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
DROP TABLE IF EXISTS `tipo_libreta`;
CREATE TABLE IF NOT EXISTS `tipo_libreta` (
  `Tipo` varchar(2) NOT NULL,
  `PesoMaximoKg` smallint(6) NOT NULL,
  PRIMARY KEY (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla forksoftware.tipo_libreta: ~2 rows (aproximadamente)
DELETE FROM `tipo_libreta`;
INSERT INTO `tipo_libreta` (`Tipo`, `PesoMaximoKg`) VALUES
	('b', 7000),
	('c', 8500);

-- Volcando estructura para tabla forksoftware.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla forksoftware.users: ~11 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`ID`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'superadmin', '$2y$10$UjUsu9EWxkUKsBKiRHzsRerhh0VJgI86FdNMBU1u7ZTok42JyCjR2', NULL, NULL, NULL, NULL),
	(2, 'harold89', '$2y$10$QtWJiphimGZc2Otc/Mf0huwHT9RrmjeUhcgkU.tVmIU7ru3Nysl8G', NULL, NULL, NULL, NULL),
	(3, 'conor64', '$2y$10$Z9iF8sY99VLyZEuIWBpDs.CbLzfplus5kV1aqC80Pbo45ltgbnwQS', NULL, NULL, NULL, NULL),
	(4, 'nyah24', '$2y$10$WWOrTVgeBCiGaFxJ1RYKs.okj4NLb70wv2GqH1pPAIgKI5fXH4TjS', NULL, NULL, NULL, NULL),
	(5, 'pzboncak', '$2y$10$mTDVRoHL6Cqvcu2lPOKHuO60nSThE91PP8AwI0uKkgsoUDSHUev2G', NULL, NULL, NULL, NULL),
	(6, 'ebraun', '$2y$10$jIDEJksHCzWudJEwrD7SaeoMMhZK1mha1c4/Q3dOByI4HV1CzXblW', NULL, NULL, NULL, NULL),
	(7, 'garett.schmeler', '$2y$10$1pVOLikSomKCY9ZU.0sYo.5c07od41gOUc0cLz7iv1GS6U25Vl9Fy', NULL, NULL, NULL, NULL),
	(8, 'curt41', '$2y$10$XYmAzTGUjoLoCoOQZHGjTe/vnpedNTUVmhsVfq6Bd9IHQOBMJlEiu', NULL, NULL, NULL, NULL),
	(9, 'qwuckert', '$2y$10$rQgXjulN.sQUo4jbv1uipujA8Eu1Yb.nXzl6.LLWummTKV1Xscmr6', NULL, NULL, NULL, NULL),
	(10, 'mante.violet', '$2y$10$2YYwlCwhSQsQ/U6S4ijtwOr1twKbEFgG/DcwvgXHW4kDpgumZANT6', NULL, NULL, NULL, NULL),
	(11, 'mueller.matilde', '$2y$10$6za4dH1nGIsXIwRtcONCxO99d/Xed.Cdb4tZIeKjGGEGe8oOdg7xO', NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

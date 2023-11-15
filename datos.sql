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

-- Volcando datos para la tabla forksoftware.administrador: ~2 rows (aproximadamente)
use forksoftware;
INSERT INTO `administrador` (`ID`) VALUES
	(1),
	(10);

-- Volcando datos para la tabla forksoftware.almacen: ~6 rows (aproximadamente)
INSERT INTO `almacen` (`ID`, `Direccion`) VALUES
	(1, 'Bv Artigas 2053'),
	(2, 'Aparicio Saravia 1011'),
	(3, 'Palmar 6666'),
	(4, 'Bv Artigas 2053'),
	(5, 'Aparicio Saravia 1011'),
	(6, 'Palmar 6666');

-- Volcando datos para la tabla forksoftware.camion: ~2 rows (aproximadamente)
INSERT INTO `camion` (`ID`, `Matricula`, `PesoMaximoKg`) VALUES
	(1, 'abd2053', 2000),
	(2, 'sbu2150', 1500);

-- Volcando datos para la tabla forksoftware.camion_lleva_lote: ~3 rows (aproximadamente)
INSERT INTO `camion_lleva_lote` (`ID_Lote`, `Fecha_Hora_Fin`) VALUES
	(1, '2023-09-12 13:23:00'),
	(2, '2023-09-12 15:40:00'),
	(3, '2023-05-12 11:15:00');

-- Volcando datos para la tabla forksoftware.camion_plataforma: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Llegada`) VALUES
	(1, 1, 1, '2023-09-12 08:45:00'),
	(2, 1, 2, '2023-05-12 09:00:00');

-- Volcando datos para la tabla forksoftware.camion_plataforma_salida: ~2 rows (aproximadamente)
INSERT INTO `camion_plataforma_salida` (`ID_Camion`, `ID_Almacen`, `Numero_Plataforma`, `Fecha_Hora_Salida`) VALUES
	(1, 1, 1, '2023-09-12 11:00:00'),
	(2, 1, 2, '2023-05-12 12:23:00');

-- Volcando datos para la tabla forksoftware.chofer: ~2 rows (aproximadamente)
INSERT INTO `chofer` (`ID`) VALUES
	(8),
	(9);

INSERT INTO `EstadoC` (`ID`, `Estado`) VALUES
	(1, 'Estacionado'),
	(2, 'En plataforma'),
	(3, 'Cargado'),
	(4, 'En transito'),
	(5, 'Completado');

-- Volcando datos para la tabla forksoftware.chofer_camion: ~2 rows (aproximadamente)
INSERT INTO `chofer_camion` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Inicio`, `ID_Estado`) VALUES
	(8, 1, '2023-09-12 08:30:05', '4'),
	(9, 2, '2023-05-12 08:00:00', '5');

-- Volcando datos para la tabla forksoftware.chofer_camion_maneja: ~2 rows (aproximadamente)
INSERT INTO `chofer_camion_maneja` (`ID_Chofer`, `ID_Camion`, `Fecha_Hora_Fin`) VALUES
	(8, 1, '2023-09-12 16:00:00'),
	(9, 2, '2023-05-12 16:00:00');

-- Volcando datos para la tabla forksoftware.chofer_tipo_libreta: ~2 rows (aproximadamente)
INSERT INTO `chofer_tipo_libreta` (`ID`, `Tipo`) VALUES
	(8, 'b'),
	(9, 'c');

-- Volcando datos para la tabla forksoftware.cliente: ~3 rows (aproximadamente)
INSERT INTO `cliente` (`ID`) VALUES
	(1),
	(2),
	(11);

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

-- Volcando datos para la tabla forksoftware.failed_jobs: ~0 rows (aproximadamente)

INSERT INTO `EstadoF` (`ID`, `Estado`) VALUES
	(1, 'Pendiente'),
	(2, 'Cargado'),
	(3, 'Entregado');

-- Volcando datos para la tabla forksoftware.forma: ~6 rows (aproximadamente)
INSERT INTO `forma` (`ID_Lote`, `ID_Paquete`, `ID_Estado`) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(1, 3, 2),
	(2, 4, 2),
	(2, 5, 2),
	(3, 6, 3);

-- Volcando datos para la tabla forksoftware.funcionario_almacen: ~2 rows (aproximadamente)
INSERT INTO `funcionario_almacen` (`ID`, `ID_Almacen`) VALUES
	(3, 1),
	(4, 3);

-- Volcando datos para la tabla forksoftware.funcionario_forma: ~6 rows (aproximadamente)
INSERT INTO `funcionario_forma` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1),
	(3, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(4, 6);

-- Volcando datos para la tabla forksoftware.funcionario_paquete_estante: ~1 rows (aproximadamente)
INSERT INTO `funcionario_paquete_estante` (`ID_Funcionario`, `ID_Paquete`) VALUES
	(3, 1);

-- Volcando datos para la tabla forksoftware.gerente_almacen: ~3 rows (aproximadamente)
INSERT INTO `gerente_almacen` (`ID_Gerente`, `ID_Almacen`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando datos para la tabla forksoftware.gerente_forma: ~6 rows (aproximadamente)
INSERT INTO `gerente_forma` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

-- Volcando datos para la tabla forksoftware.gerente_lote: ~3 rows (aproximadamente)
INSERT INTO `gerente_lote` (`ID_Gerente`, `ID_Lote`) VALUES
	(5, 1),
	(6, 2),
	(7, 3);

-- Volcando datos para la tabla forksoftware.gerente_paquete: ~6 rows (aproximadamente)
INSERT INTO `gerente_paquete` (`ID_Gerente`, `ID_Paquete`) VALUES
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(7, 5),
	(7, 6);

INSERT INTO `estadolt` (`ID`, `Estado`) VALUES
	(1, 'Pendiente'),
	(2, 'Cargado'),
	(3, 'Entregado');

-- Volcando datos para la tabla forksoftware.lote: ~3 rows (aproximadamente)
INSERT INTO `lote` (`ID`, `Descripcion`, `ID_Estado`) VALUES
	(1, NULL, 1),
	(2, NULL, 2),
	(3, NULL, 3);

INSERT INTO `EstadoL` (`ID`, `Estado`) VALUES
	(1, 'Pendiente'),
	(2, 'Cargado'),
	(3, 'Entregado');

-- Volcando datos para la tabla forksoftware.lote_camion: ~3 rows (aproximadamente)
INSERT INTO `lote_camion` (`ID_Camion`, `ID_Lote`, `Fecha_Hora_Inicio`, `ID_Estado`) VALUES
	(1, 1, '2023-09-12 09:00:00', 'Pendiente'),
	(1, 2, '2023-09-12 10:20:00', 'Cargado'),
	(2, 3, '2023-05-12 08:30:00', 'Entregado');

INSERT INTO `EstadoP` (`ID`, `Estado`) VALUES
	(1, 'En almacen'),
	(2, 'En lote'),
	(3, 'En transito'),
	(4, 'Entregado');

-- Volcando datos para la tabla forksoftware.paquete: ~6 rows (aproximadamente)
INSERT INTO `paquete` (`ID`, `ID_Cliente`, `Descripcion`, `Peso_Kg`, `ID_Estado`, `Destino`, `Codigo`) VALUES
	(1, 1, NULL, 1, 1, 'Charrua 2263', '#89gnf'),
	(2, 1, 'fragil', 2, 1, 'Luisa Caceres 3600', '#31nd9'),
	(3, 1, NULL, 5, 2, 'Carlos Anaya 2963', '#an93m'),
	(4, 2, 'quimicos', 2, 2, 'Cagancha 2063', '#012n9'),
	(5, 2, NULL, 15, 3, 'Miguelete 2259', '#lamf4'),
	(6, 11, NULL, 30, 4, 'Barroso 3725', '#m4n3m');

-- Volcando datos para la tabla forksoftware.paquete_estante: ~1 rows (aproximadamente)
INSERT INTO `paquete_estante` (`ID_Paquete`, `ID_Estante`, `ID_Almacen`) VALUES
	(1, 2, 1);

-- Volcando datos para la tabla forksoftware.password_resets: ~0 rows (aproximadamente)

-- Volcando datos para la tabla forksoftware.persona: ~11 rows (aproximadamente)
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

-- Volcando datos para la tabla forksoftware.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando datos para la tabla forksoftware.persona_telefono: ~11 rows (aproximadamente)
INSERT INTO `persona_telefono` (`ID`, `ID_Persona`, `Telefono`) VALUES
	(1, 1, '+1-734-296-2438'),
	(2, 2, '+1.380.395.5673'),
	(3, 3, '1-262-806-3865'),
	(4, 4, '385-379-0875'),
	(5, 5, '815-756-8497'),
	(6, 6, '+1.412.485.2736'),
	(7, 7, '510.594.7951'),
	(8, 8, '1-602-574-4465'),
	(9, 9, '+1-463-212-1604'),
	(10, 10, '+17434985158'),
	(11, 11, '(984) 643-7858');

-- Volcando datos para la tabla forksoftware.persona_usuario: ~11 rows (aproximadamente)
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

-- Volcando datos para la tabla forksoftware.tipo_libreta: ~2 rows (aproximadamente)
INSERT INTO `tipo_libreta` (`Tipo`, `PesoMaximoKg`) VALUES
	('b', 7000),
	('c', 8500);

-- Volcando datos para la tabla forksoftware.users: ~11 rows (aproximadamente)
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

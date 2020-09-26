-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para reepis
DROP DATABASE IF EXISTS `reepis`;
CREATE DATABASE IF NOT EXISTS `reepis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `reepis`;

-- Volcando estructura para tabla reepis.mdl_asignacion
DROP TABLE IF EXISTS `mdl_asignacion`;
CREATE TABLE IF NOT EXISTS `mdl_asignacion` (
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `Cod_Asignacion` varchar(8) NOT NULL,
  `Id_Asignacion` varchar(8) NOT NULL,
  `NomAsignacion` varchar(1024) NOT NULL,
  `TipoAsignacion` varchar(200) DEFAULT NULL,
  `Participantes` int(11) DEFAULT NULL,
  `Presentados` int(11) DEFAULT NULL,
  `Pendientes` int(11) DEFAULT NULL,
  `Cod_Unidad` varchar(8) DEFAULT NULL,
  `Flag_Activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Cod_Asignacion`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_asignacion_ibfk_1` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_asignacion: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_asignacion` DISABLE KEYS */;
INSERT INTO `mdl_asignacion` (`Cod_Curso`, `Cod_Asignacion`, `Id_Asignacion`, `NomAsignacion`, `TipoAsignacion`, `Participantes`, `Presentados`, `Pendientes`, `Cod_Unidad`, `Flag_Activo`) VALUES
	('5', '115', '48', 'Mapa mental lectura - que es la ciencia', 'assign', 25, 17, 0, '13', 1),
	('5', '119', '49', 'Mapa mental lectura - capítulos del 01 al 04', 'assign', 25, 15, 1, '13', 1),
	('5', '121', '50', 'Infografia lectura - capítulos del 05 al 08', 'assign', 25, 15, 0, '13', 1),
	('5', '123', '51', 'Zotero -  Organizar referencias', 'assign', 25, 15, 0, '13', 1),
	('5', '125', '52', 'Mapa mental lectura - el método de la ciencia', 'assign', 25, 17, 0, '13', 1),
	('5', '127', '53', 'Infografía lectura - capítulos del 09 al 12', 'assign', 25, 17, 1, '13', 1),
	('5', '129', '54', 'Mapa mental', 'assign', 25, 11, 0, '13', 1),
	('5', '133', '55', 'Ensayo - ¿Qué es la ciencia?', 'assign', 25, 17, 0, '13', 1),
	('5', '135', '56', 'Responsabilidad Social - informe', 'assign', 25, 19, 0, '13', 1);
/*!40000 ALTER TABLE `mdl_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_asignacionindicador
DROP TABLE IF EXISTS `mdl_asignacionindicador`;
CREATE TABLE IF NOT EXISTS `mdl_asignacionindicador` (
  `Cod_AsignacionIndicador` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Curso` varchar(8) NOT NULL,
  `Cod_Rubrica` varchar(16) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `NivelCriterio` varchar(8) NOT NULL,
  `Cod_Resultado` varchar(16) NOT NULL,
  `Posicion_Ind` int(11) NOT NULL,
  PRIMARY KEY (`Cod_AsignacionIndicador`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_asignacionindicador: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_asignacionindicador` DISABLE KEYS */;
INSERT INTO `mdl_asignacionindicador` (`Cod_AsignacionIndicador`, `Cod_Curso`, `Cod_Rubrica`, `Cod_Criterio`, `NivelCriterio`, `Cod_Resultado`, `Posicion_Ind`) VALUES
	(1, '5', 'R48', 'C481', '1', 'OB1-RE_A-A1', 1),
	(2, '5', 'R48', 'C481', '1', 'OB1-RE_F-F1', 2),
	(3, '5', 'R48', 'C482', '2', 'OB1-RE_F-F2', 1),
	(4, '5', 'R48', 'C483', '3', 'OB1-RE_A-A4', 1),
	(5, '5', 'R48', 'C480', '0', 'OB1-RE_A-A1', 1),
	(6, '5', 'R49', 'C491', '1', 'OB1-RE_A-A1', 1),
	(7, '5', 'R49', 'C493', '3', 'OB1-RE_F-F1', 1),
	(8, '5', 'R50', 'C503', '3', 'OB1-RE_A-A4', 1),
	(9, '5', 'R50', 'C502', '2', 'OB1-RE_A-A4', 1),
	(10, '5', 'R56', 'C560', '0', 'OB1-RE_A-A4', 1),
	(11, '5', 'R56', 'C562', '2', 'OB1-RE_F-F2', 1),
	(12, '5', 'R56', 'C563', '3', 'OB1-RE_A-A1', 1),
	(13, '5', 'R56', 'C564', '4', 'OB1-RE_A-A4', 1),
	(14, '5', 'R55', 'C550', '0', 'OB1-RE_A-A4', 1),
	(15, '5', 'R55', 'C552', '2', 'OB1-RE_F-F1', 1),
	(16, '5', 'R55', 'C554', '4', 'OB1-RE_A-A1', 1),
	(17, '5', 'R53', 'C533', '3', 'OB1-RE_A-A4', 1),
	(18, '5', 'R53', 'C532', '2', 'OB1-RE_A-A4', 1),
	(19, '5', 'R53', 'C531', '1', 'OB1-RE_F-F2', 1),
	(20, '5', 'R53', 'C530', '0', 'OB1-RE_A-A1', 1),
	(21, '5', 'R52', 'C521', '1', 'OB1-RE_A-A4', 1),
	(22, '5', 'R52', 'C523', '3', 'OB1-RE_A-A4', 1),
	(23, '5', 'R52', 'C522', '2', 'OB1-RE_A-A1', 1);
/*!40000 ALTER TABLE `mdl_asignacionindicador` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_criterio
DROP TABLE IF EXISTS `mdl_criterio`;
CREATE TABLE IF NOT EXISTS `mdl_criterio` (
  `Cod_RubricaPersona` varchar(16) NOT NULL,
  `Cod_Criterio` varchar(16) NOT NULL,
  `NivelCriterio` varchar(8) NOT NULL,
  `DesCriterio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Criterio`),
  KEY `Cod_RubricaPersona` (`Cod_RubricaPersona`),
  CONSTRAINT `mdl_criterio_ibfk_1` FOREIGN KEY (`Cod_RubricaPersona`) REFERENCES `mdl_rubrica` (`Cod_RubricaPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_criterio: ~678 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_criterio` DISABLE KEYS */;
INSERT INTO `mdl_criterio` (`Cod_RubricaPersona`, `Cod_Criterio`, `NivelCriterio`, `DesCriterio`) VALUES
	('r48-117', 'c48n0a117', '0', 'puntualidad'),
	('r48-124', 'c48n0a124', '0', 'puntualidad'),
	('r48-127', 'c48n0a127', '0', 'puntualidad'),
	('r48-128', 'c48n0a128', '0', 'puntualidad'),
	('r48-13', 'c48n0a13', '0', 'puntualidad'),
	('r48-32', 'c48n0a32', '0', 'puntualidad'),
	('r48-34', 'c48n0a34', '0', 'puntualidad'),
	('r48-44', 'c48n0a44', '0', 'puntualidad'),
	('r48-55', 'c48n0a55', '0', 'puntualidad'),
	('r48-60', 'c48n0a60', '0', 'puntualidad'),
	('r48-61', 'c48n0a61', '0', 'puntualidad'),
	('r48-62', 'c48n0a62', '0', 'puntualidad'),
	('r48-69', 'c48n0a69', '0', 'puntualidad'),
	('r48-72', 'c48n0a72', '0', 'puntualidad'),
	('r48-76', 'c48n0a76', '0', 'puntualidad'),
	('r48-77', 'c48n0a77', '0', 'puntualidad'),
	('r48-84', 'c48n0a84', '0', 'puntualidad'),
	('r48-117', 'c48n1a117', '1', 'a mano'),
	('r48-124', 'c48n1a124', '1', 'a mano'),
	('r48-127', 'c48n1a127', '1', 'a mano'),
	('r48-128', 'c48n1a128', '1', 'a mano'),
	('r48-13', 'c48n1a13', '1', 'a mano'),
	('r48-32', 'c48n1a32', '1', 'a mano'),
	('r48-34', 'c48n1a34', '1', 'a mano'),
	('r48-44', 'c48n1a44', '1', 'a mano'),
	('r48-55', 'c48n1a55', '1', 'a mano'),
	('r48-60', 'c48n1a60', '1', 'a mano'),
	('r48-61', 'c48n1a61', '1', 'a mano'),
	('r48-62', 'c48n1a62', '1', 'a mano'),
	('r48-69', 'c48n1a69', '1', 'a mano'),
	('r48-72', 'c48n1a72', '1', 'a mano'),
	('r48-76', 'c48n1a76', '1', 'a mano'),
	('r48-77', 'c48n1a77', '1', 'a mano'),
	('r48-84', 'c48n1a84', '1', 'a mano'),
	('r48-117', 'c48n2a117', '2', 'contenido'),
	('r48-124', 'c48n2a124', '2', 'contenido'),
	('r48-127', 'c48n2a127', '2', 'contenido'),
	('r48-128', 'c48n2a128', '2', 'contenido'),
	('r48-13', 'c48n2a13', '2', 'contenido'),
	('r48-32', 'c48n2a32', '2', 'contenido'),
	('r48-34', 'c48n2a34', '2', 'contenido'),
	('r48-44', 'c48n2a44', '2', 'contenido'),
	('r48-55', 'c48n2a55', '2', 'contenido'),
	('r48-60', 'c48n2a60', '2', 'contenido'),
	('r48-61', 'c48n2a61', '2', 'contenido'),
	('r48-62', 'c48n2a62', '2', 'contenido'),
	('r48-69', 'c48n2a69', '2', 'contenido'),
	('r48-72', 'c48n2a72', '2', 'contenido'),
	('r48-76', 'c48n2a76', '2', 'contenido'),
	('r48-77', 'c48n2a77', '2', 'contenido'),
	('r48-84', 'c48n2a84', '2', 'contenido'),
	('r48-117', 'c48n3a117', '3', 'imagenes'),
	('r48-124', 'c48n3a124', '3', 'imagenes'),
	('r48-127', 'c48n3a127', '3', 'imagenes'),
	('r48-128', 'c48n3a128', '3', 'imagenes'),
	('r48-13', 'c48n3a13', '3', 'imagenes'),
	('r48-32', 'c48n3a32', '3', 'imagenes'),
	('r48-34', 'c48n3a34', '3', 'imagenes'),
	('r48-44', 'c48n3a44', '3', 'imagenes'),
	('r48-55', 'c48n3a55', '3', 'imagenes'),
	('r48-60', 'c48n3a60', '3', 'imagenes'),
	('r48-61', 'c48n3a61', '3', 'imagenes'),
	('r48-62', 'c48n3a62', '3', 'imagenes'),
	('r48-69', 'c48n3a69', '3', 'imagenes'),
	('r48-72', 'c48n3a72', '3', 'imagenes'),
	('r48-76', 'c48n3a76', '3', 'imagenes'),
	('r48-77', 'c48n3a77', '3', 'imagenes'),
	('r48-84', 'c48n3a84', '3', 'imagenes'),
	('r49-117', 'c49n0a117', '0', 'puntualidad'),
	('r49-125', 'c49n0a125', '0', 'puntualidad'),
	('r49-127', 'c49n0a127', '0', 'puntualidad'),
	('r49-128', 'c49n0a128', '0', 'puntualidad'),
	('r49-13', 'c49n0a13', '0', 'puntualidad'),
	('r49-27', 'c49n0a27', '0', 'puntualidad'),
	('r49-32', 'c49n0a32', '0', 'puntualidad'),
	('r49-34', 'c49n0a34', '0', 'puntualidad'),
	('r49-44', 'c49n0a44', '0', 'puntualidad'),
	('r49-60', 'c49n0a60', '0', 'puntualidad'),
	('r49-62', 'c49n0a62', '0', 'puntualidad'),
	('r49-69', 'c49n0a69', '0', 'puntualidad'),
	('r49-76', 'c49n0a76', '0', 'puntualidad'),
	('r49-77', 'c49n0a77', '0', 'puntualidad'),
	('r49-117', 'c49n1a117', '1', 'a mano'),
	('r49-125', 'c49n1a125', '1', 'a mano'),
	('r49-127', 'c49n1a127', '1', 'a mano'),
	('r49-128', 'c49n1a128', '1', 'a mano'),
	('r49-13', 'c49n1a13', '1', 'a mano'),
	('r49-27', 'c49n1a27', '1', 'a mano'),
	('r49-32', 'c49n1a32', '1', 'a mano'),
	('r49-34', 'c49n1a34', '1', 'a mano'),
	('r49-44', 'c49n1a44', '1', 'a mano'),
	('r49-60', 'c49n1a60', '1', 'a mano'),
	('r49-62', 'c49n1a62', '1', 'a mano'),
	('r49-69', 'c49n1a69', '1', 'a mano'),
	('r49-76', 'c49n1a76', '1', 'a mano'),
	('r49-77', 'c49n1a77', '1', 'a mano'),
	('r49-117', 'c49n2a117', '2', 'contenido'),
	('r49-125', 'c49n2a125', '2', 'contenido'),
	('r49-127', 'c49n2a127', '2', 'contenido'),
	('r49-128', 'c49n2a128', '2', 'contenido'),
	('r49-13', 'c49n2a13', '2', 'contenido'),
	('r49-27', 'c49n2a27', '2', 'contenido'),
	('r49-32', 'c49n2a32', '2', 'contenido'),
	('r49-34', 'c49n2a34', '2', 'contenido'),
	('r49-44', 'c49n2a44', '2', 'contenido'),
	('r49-60', 'c49n2a60', '2', 'contenido'),
	('r49-62', 'c49n2a62', '2', 'contenido'),
	('r49-69', 'c49n2a69', '2', 'contenido'),
	('r49-76', 'c49n2a76', '2', 'contenido'),
	('r49-77', 'c49n2a77', '2', 'contenido'),
	('r49-117', 'c49n3a117', '3', 'imagenes'),
	('r49-125', 'c49n3a125', '3', 'imagenes'),
	('r49-127', 'c49n3a127', '3', 'imagenes'),
	('r49-128', 'c49n3a128', '3', 'imagenes'),
	('r49-13', 'c49n3a13', '3', 'imagenes'),
	('r49-27', 'c49n3a27', '3', 'imagenes'),
	('r49-32', 'c49n3a32', '3', 'imagenes'),
	('r49-34', 'c49n3a34', '3', 'imagenes'),
	('r49-44', 'c49n3a44', '3', 'imagenes'),
	('r49-60', 'c49n3a60', '3', 'imagenes'),
	('r49-62', 'c49n3a62', '3', 'imagenes'),
	('r49-69', 'c49n3a69', '3', 'imagenes'),
	('r49-76', 'c49n3a76', '3', 'imagenes'),
	('r49-77', 'c49n3a77', '3', 'imagenes'),
	('r50-125', 'c50n0a125', '0', 'Material'),
	('r50-128', 'c50n0a128', '0', 'Material'),
	('r50-13', 'c50n0a13', '0', 'Material'),
	('r50-27', 'c50n0a27', '0', 'Material'),
	('r50-32', 'c50n0a32', '0', 'Material'),
	('r50-34', 'c50n0a34', '0', 'Material'),
	('r50-41', 'c50n0a41', '0', 'Material'),
	('r50-44', 'c50n0a44', '0', 'Material'),
	('r50-60', 'c50n0a60', '0', 'Material'),
	('r50-61', 'c50n0a61', '0', 'Material'),
	('r50-62', 'c50n0a62', '0', 'Material'),
	('r50-69', 'c50n0a69', '0', 'Material'),
	('r50-72', 'c50n0a72', '0', 'Material'),
	('r50-83', 'c50n0a83', '0', 'Material'),
	('r50-84', 'c50n0a84', '0', 'Material'),
	('r50-125', 'c50n1a125', '1', 'Exposición'),
	('r50-128', 'c50n1a128', '1', 'Exposición'),
	('r50-13', 'c50n1a13', '1', 'Exposición'),
	('r50-27', 'c50n1a27', '1', 'Exposición'),
	('r50-32', 'c50n1a32', '1', 'Exposición'),
	('r50-34', 'c50n1a34', '1', 'Exposición'),
	('r50-41', 'c50n1a41', '1', 'Exposición'),
	('r50-44', 'c50n1a44', '1', 'Exposición'),
	('r50-60', 'c50n1a60', '1', 'Exposición'),
	('r50-61', 'c50n1a61', '1', 'Exposición'),
	('r50-62', 'c50n1a62', '1', 'Exposición'),
	('r50-69', 'c50n1a69', '1', 'Exposición'),
	('r50-72', 'c50n1a72', '1', 'Exposición'),
	('r50-83', 'c50n1a83', '1', 'Exposición'),
	('r50-84', 'c50n1a84', '1', 'Exposición'),
	('r50-125', 'c50n2a125', '2', 'Lee'),
	('r50-128', 'c50n2a128', '2', 'Lee'),
	('r50-13', 'c50n2a13', '2', 'Lee'),
	('r50-27', 'c50n2a27', '2', 'Lee'),
	('r50-32', 'c50n2a32', '2', 'Lee'),
	('r50-34', 'c50n2a34', '2', 'Lee'),
	('r50-41', 'c50n2a41', '2', 'Lee'),
	('r50-44', 'c50n2a44', '2', 'Lee'),
	('r50-60', 'c50n2a60', '2', 'Lee'),
	('r50-61', 'c50n2a61', '2', 'Lee'),
	('r50-62', 'c50n2a62', '2', 'Lee'),
	('r50-69', 'c50n2a69', '2', 'Lee'),
	('r50-72', 'c50n2a72', '2', 'Lee'),
	('r50-83', 'c50n2a83', '2', 'Lee'),
	('r50-84', 'c50n2a84', '2', 'Lee'),
	('r50-125', 'c50n3a125', '3', 'Conclusiones'),
	('r50-128', 'c50n3a128', '3', 'Conclusiones'),
	('r50-13', 'c50n3a13', '3', 'Conclusiones'),
	('r50-27', 'c50n3a27', '3', 'Conclusiones'),
	('r50-32', 'c50n3a32', '3', 'Conclusiones'),
	('r50-34', 'c50n3a34', '3', 'Conclusiones'),
	('r50-41', 'c50n3a41', '3', 'Conclusiones'),
	('r50-44', 'c50n3a44', '3', 'Conclusiones'),
	('r50-60', 'c50n3a60', '3', 'Conclusiones'),
	('r50-61', 'c50n3a61', '3', 'Conclusiones'),
	('r50-62', 'c50n3a62', '3', 'Conclusiones'),
	('r50-69', 'c50n3a69', '3', 'Conclusiones'),
	('r50-72', 'c50n3a72', '3', 'Conclusiones'),
	('r50-83', 'c50n3a83', '3', 'Conclusiones'),
	('r50-84', 'c50n3a84', '3', 'Conclusiones'),
	('r50-125', 'c50n4a125', '4', 'Preguntas'),
	('r50-128', 'c50n4a128', '4', 'Preguntas'),
	('r50-13', 'c50n4a13', '4', 'Preguntas'),
	('r50-27', 'c50n4a27', '4', 'Preguntas'),
	('r50-32', 'c50n4a32', '4', 'Preguntas'),
	('r50-34', 'c50n4a34', '4', 'Preguntas'),
	('r50-41', 'c50n4a41', '4', 'Preguntas'),
	('r50-44', 'c50n4a44', '4', 'Preguntas'),
	('r50-60', 'c50n4a60', '4', 'Preguntas'),
	('r50-61', 'c50n4a61', '4', 'Preguntas'),
	('r50-62', 'c50n4a62', '4', 'Preguntas'),
	('r50-69', 'c50n4a69', '4', 'Preguntas'),
	('r50-72', 'c50n4a72', '4', 'Preguntas'),
	('r50-83', 'c50n4a83', '4', 'Preguntas'),
	('r50-84', 'c50n4a84', '4', 'Preguntas'),
	('r51-125', 'c51n0a125', '0', 'Componente'),
	('r51-127', 'c51n0a127', '0', 'Componente'),
	('r51-128', 'c51n0a128', '0', 'Componente'),
	('r51-13', 'c51n0a13', '0', 'Componente'),
	('r51-27', 'c51n0a27', '0', 'Componente'),
	('r51-32', 'c51n0a32', '0', 'Componente'),
	('r51-34', 'c51n0a34', '0', 'Componente'),
	('r51-41', 'c51n0a41', '0', 'Componente'),
	('r51-44', 'c51n0a44', '0', 'Componente'),
	('r51-55', 'c51n0a55', '0', 'Componente'),
	('r51-61', 'c51n0a61', '0', 'Componente'),
	('r51-62', 'c51n0a62', '0', 'Componente'),
	('r51-69', 'c51n0a69', '0', 'Componente'),
	('r51-72', 'c51n0a72', '0', 'Componente'),
	('r51-83', 'c51n0a83', '0', 'Componente'),
	('r51-125', 'c51n1a125', '1', 'Objetivos'),
	('r51-127', 'c51n1a127', '1', 'Objetivos'),
	('r51-128', 'c51n1a128', '1', 'Objetivos'),
	('r51-13', 'c51n1a13', '1', 'Objetivos'),
	('r51-27', 'c51n1a27', '1', 'Objetivos'),
	('r51-32', 'c51n1a32', '1', 'Objetivos'),
	('r51-34', 'c51n1a34', '1', 'Objetivos'),
	('r51-41', 'c51n1a41', '1', 'Objetivos'),
	('r51-44', 'c51n1a44', '1', 'Objetivos'),
	('r51-55', 'c51n1a55', '1', 'Objetivos'),
	('r51-61', 'c51n1a61', '1', 'Objetivos'),
	('r51-62', 'c51n1a62', '1', 'Objetivos'),
	('r51-69', 'c51n1a69', '1', 'Objetivos'),
	('r51-72', 'c51n1a72', '1', 'Objetivos'),
	('r51-83', 'c51n1a83', '1', 'Objetivos'),
	('r51-125', 'c51n2a125', '2', 'Desarrollo'),
	('r51-127', 'c51n2a127', '2', 'Desarrollo'),
	('r51-128', 'c51n2a128', '2', 'Desarrollo'),
	('r51-13', 'c51n2a13', '2', 'Desarrollo'),
	('r51-27', 'c51n2a27', '2', 'Desarrollo'),
	('r51-32', 'c51n2a32', '2', 'Desarrollo'),
	('r51-34', 'c51n2a34', '2', 'Desarrollo'),
	('r51-41', 'c51n2a41', '2', 'Desarrollo'),
	('r51-44', 'c51n2a44', '2', 'Desarrollo'),
	('r51-55', 'c51n2a55', '2', 'Desarrollo'),
	('r51-61', 'c51n2a61', '2', 'Desarrollo'),
	('r51-62', 'c51n2a62', '2', 'Desarrollo'),
	('r51-69', 'c51n2a69', '2', 'Desarrollo'),
	('r51-72', 'c51n2a72', '2', 'Desarrollo'),
	('r51-83', 'c51n2a83', '2', 'Desarrollo'),
	('r51-125', 'c51n3a125', '3', 'Conclusiones y recomendaciones'),
	('r51-127', 'c51n3a127', '3', 'Conclusiones y recomendaciones'),
	('r51-128', 'c51n3a128', '3', 'Conclusiones y recomendaciones'),
	('r51-13', 'c51n3a13', '3', 'Conclusiones y recomendaciones'),
	('r51-27', 'c51n3a27', '3', 'Conclusiones y recomendaciones'),
	('r51-32', 'c51n3a32', '3', 'Conclusiones y recomendaciones'),
	('r51-34', 'c51n3a34', '3', 'Conclusiones y recomendaciones'),
	('r51-41', 'c51n3a41', '3', 'Conclusiones y recomendaciones'),
	('r51-44', 'c51n3a44', '3', 'Conclusiones y recomendaciones'),
	('r51-55', 'c51n3a55', '3', 'Conclusiones y recomendaciones'),
	('r51-61', 'c51n3a61', '3', 'Conclusiones y recomendaciones'),
	('r51-62', 'c51n3a62', '3', 'Conclusiones y recomendaciones'),
	('r51-69', 'c51n3a69', '3', 'Conclusiones y recomendaciones'),
	('r51-72', 'c51n3a72', '3', 'Conclusiones y recomendaciones'),
	('r51-83', 'c51n3a83', '3', 'Conclusiones y recomendaciones'),
	('r51-125', 'c51n4a125', '4', 'Ortografia'),
	('r51-127', 'c51n4a127', '4', 'Ortografia'),
	('r51-128', 'c51n4a128', '4', 'Ortografia'),
	('r51-13', 'c51n4a13', '4', 'Ortografia'),
	('r51-27', 'c51n4a27', '4', 'Ortografia'),
	('r51-32', 'c51n4a32', '4', 'Ortografia'),
	('r51-34', 'c51n4a34', '4', 'Ortografia'),
	('r51-41', 'c51n4a41', '4', 'Ortografia'),
	('r51-44', 'c51n4a44', '4', 'Ortografia'),
	('r51-55', 'c51n4a55', '4', 'Ortografia'),
	('r51-61', 'c51n4a61', '4', 'Ortografia'),
	('r51-62', 'c51n4a62', '4', 'Ortografia'),
	('r51-69', 'c51n4a69', '4', 'Ortografia'),
	('r51-72', 'c51n4a72', '4', 'Ortografia'),
	('r51-83', 'c51n4a83', '4', 'Ortografia'),
	('r51-125', 'c51n5a125', '5', 'Puntualidad'),
	('r51-127', 'c51n5a127', '5', 'Puntualidad'),
	('r51-128', 'c51n5a128', '5', 'Puntualidad'),
	('r51-13', 'c51n5a13', '5', 'Puntualidad'),
	('r51-27', 'c51n5a27', '5', 'Puntualidad'),
	('r51-32', 'c51n5a32', '5', 'Puntualidad'),
	('r51-34', 'c51n5a34', '5', 'Puntualidad'),
	('r51-41', 'c51n5a41', '5', 'Puntualidad'),
	('r51-44', 'c51n5a44', '5', 'Puntualidad'),
	('r51-55', 'c51n5a55', '5', 'Puntualidad'),
	('r51-61', 'c51n5a61', '5', 'Puntualidad'),
	('r51-62', 'c51n5a62', '5', 'Puntualidad'),
	('r51-69', 'c51n5a69', '5', 'Puntualidad'),
	('r51-72', 'c51n5a72', '5', 'Puntualidad'),
	('r51-83', 'c51n5a83', '5', 'Puntualidad'),
	('r52-117', 'c52n0a117', '0', 'puntualidad'),
	('r52-125', 'c52n0a125', '0', 'puntualidad'),
	('r52-127', 'c52n0a127', '0', 'puntualidad'),
	('r52-128', 'c52n0a128', '0', 'puntualidad'),
	('r52-13', 'c52n0a13', '0', 'puntualidad'),
	('r52-27', 'c52n0a27', '0', 'puntualidad'),
	('r52-32', 'c52n0a32', '0', 'puntualidad'),
	('r52-34', 'c52n0a34', '0', 'puntualidad'),
	('r52-41', 'c52n0a41', '0', 'puntualidad'),
	('r52-44', 'c52n0a44', '0', 'puntualidad'),
	('r52-55', 'c52n0a55', '0', 'puntualidad'),
	('r52-60', 'c52n0a60', '0', 'puntualidad'),
	('r52-61', 'c52n0a61', '0', 'puntualidad'),
	('r52-62', 'c52n0a62', '0', 'puntualidad'),
	('r52-69', 'c52n0a69', '0', 'puntualidad'),
	('r52-72', 'c52n0a72', '0', 'puntualidad'),
	('r52-76', 'c52n0a76', '0', 'puntualidad'),
	('r52-117', 'c52n1a117', '1', 'a mano'),
	('r52-125', 'c52n1a125', '1', 'a mano'),
	('r52-127', 'c52n1a127', '1', 'a mano'),
	('r52-128', 'c52n1a128', '1', 'a mano'),
	('r52-13', 'c52n1a13', '1', 'a mano'),
	('r52-27', 'c52n1a27', '1', 'a mano'),
	('r52-32', 'c52n1a32', '1', 'a mano'),
	('r52-34', 'c52n1a34', '1', 'a mano'),
	('r52-41', 'c52n1a41', '1', 'a mano'),
	('r52-44', 'c52n1a44', '1', 'a mano'),
	('r52-55', 'c52n1a55', '1', 'a mano'),
	('r52-60', 'c52n1a60', '1', 'a mano'),
	('r52-61', 'c52n1a61', '1', 'a mano'),
	('r52-62', 'c52n1a62', '1', 'a mano'),
	('r52-69', 'c52n1a69', '1', 'a mano'),
	('r52-72', 'c52n1a72', '1', 'a mano'),
	('r52-76', 'c52n1a76', '1', 'a mano'),
	('r52-117', 'c52n2a117', '2', 'contenido'),
	('r52-125', 'c52n2a125', '2', 'contenido'),
	('r52-127', 'c52n2a127', '2', 'contenido'),
	('r52-128', 'c52n2a128', '2', 'contenido'),
	('r52-13', 'c52n2a13', '2', 'contenido'),
	('r52-27', 'c52n2a27', '2', 'contenido'),
	('r52-32', 'c52n2a32', '2', 'contenido'),
	('r52-34', 'c52n2a34', '2', 'contenido'),
	('r52-41', 'c52n2a41', '2', 'contenido'),
	('r52-44', 'c52n2a44', '2', 'contenido'),
	('r52-55', 'c52n2a55', '2', 'contenido'),
	('r52-60', 'c52n2a60', '2', 'contenido'),
	('r52-61', 'c52n2a61', '2', 'contenido'),
	('r52-62', 'c52n2a62', '2', 'contenido'),
	('r52-69', 'c52n2a69', '2', 'contenido'),
	('r52-72', 'c52n2a72', '2', 'contenido'),
	('r52-76', 'c52n2a76', '2', 'contenido'),
	('r52-117', 'c52n3a117', '3', 'imagenes'),
	('r52-125', 'c52n3a125', '3', 'imagenes'),
	('r52-127', 'c52n3a127', '3', 'imagenes'),
	('r52-128', 'c52n3a128', '3', 'imagenes'),
	('r52-13', 'c52n3a13', '3', 'imagenes'),
	('r52-27', 'c52n3a27', '3', 'imagenes'),
	('r52-32', 'c52n3a32', '3', 'imagenes'),
	('r52-34', 'c52n3a34', '3', 'imagenes'),
	('r52-41', 'c52n3a41', '3', 'imagenes'),
	('r52-44', 'c52n3a44', '3', 'imagenes'),
	('r52-55', 'c52n3a55', '3', 'imagenes'),
	('r52-60', 'c52n3a60', '3', 'imagenes'),
	('r52-61', 'c52n3a61', '3', 'imagenes'),
	('r52-62', 'c52n3a62', '3', 'imagenes'),
	('r52-69', 'c52n3a69', '3', 'imagenes'),
	('r52-72', 'c52n3a72', '3', 'imagenes'),
	('r52-76', 'c52n3a76', '3', 'imagenes'),
	('r53-117', 'c53n0a117', '0', 'Material'),
	('r53-128', 'c53n0a128', '0', 'Material'),
	('r53-13', 'c53n0a13', '0', 'Material'),
	('r53-27', 'c53n0a27', '0', 'Material'),
	('r53-34', 'c53n0a34', '0', 'Material'),
	('r53-41', 'c53n0a41', '0', 'Material'),
	('r53-44', 'c53n0a44', '0', 'Material'),
	('r53-55', 'c53n0a55', '0', 'Material'),
	('r53-60', 'c53n0a60', '0', 'Material'),
	('r53-61', 'c53n0a61', '0', 'Material'),
	('r53-62', 'c53n0a62', '0', 'Material'),
	('r53-72', 'c53n0a72', '0', 'Material'),
	('r53-76', 'c53n0a76', '0', 'Material'),
	('r53-77', 'c53n0a77', '0', 'Material'),
	('r53-83', 'c53n0a83', '0', 'Material'),
	('r53-84', 'c53n0a84', '0', 'Material'),
	('r53-117', 'c53n1a117', '1', 'Exposición'),
	('r53-128', 'c53n1a128', '1', 'Exposición'),
	('r53-13', 'c53n1a13', '1', 'Exposición'),
	('r53-27', 'c53n1a27', '1', 'Exposición'),
	('r53-34', 'c53n1a34', '1', 'Exposición'),
	('r53-41', 'c53n1a41', '1', 'Exposición'),
	('r53-44', 'c53n1a44', '1', 'Exposición'),
	('r53-55', 'c53n1a55', '1', 'Exposición'),
	('r53-60', 'c53n1a60', '1', 'Exposición'),
	('r53-61', 'c53n1a61', '1', 'Exposición'),
	('r53-62', 'c53n1a62', '1', 'Exposición'),
	('r53-72', 'c53n1a72', '1', 'Exposición'),
	('r53-76', 'c53n1a76', '1', 'Exposición'),
	('r53-77', 'c53n1a77', '1', 'Exposición'),
	('r53-83', 'c53n1a83', '1', 'Exposición'),
	('r53-84', 'c53n1a84', '1', 'Exposición'),
	('r53-117', 'c53n2a117', '2', 'Lee'),
	('r53-128', 'c53n2a128', '2', 'Lee'),
	('r53-13', 'c53n2a13', '2', 'Lee'),
	('r53-27', 'c53n2a27', '2', 'Lee'),
	('r53-34', 'c53n2a34', '2', 'Lee'),
	('r53-41', 'c53n2a41', '2', 'Lee'),
	('r53-44', 'c53n2a44', '2', 'Lee'),
	('r53-55', 'c53n2a55', '2', 'Lee'),
	('r53-60', 'c53n2a60', '2', 'Lee'),
	('r53-61', 'c53n2a61', '2', 'Lee'),
	('r53-62', 'c53n2a62', '2', 'Lee'),
	('r53-72', 'c53n2a72', '2', 'Lee'),
	('r53-76', 'c53n2a76', '2', 'Lee'),
	('r53-77', 'c53n2a77', '2', 'Lee'),
	('r53-83', 'c53n2a83', '2', 'Lee'),
	('r53-84', 'c53n2a84', '2', 'Lee'),
	('r53-117', 'c53n3a117', '3', 'Conclusiones'),
	('r53-128', 'c53n3a128', '3', 'Conclusiones'),
	('r53-13', 'c53n3a13', '3', 'Conclusiones'),
	('r53-27', 'c53n3a27', '3', 'Conclusiones'),
	('r53-34', 'c53n3a34', '3', 'Conclusiones'),
	('r53-41', 'c53n3a41', '3', 'Conclusiones'),
	('r53-44', 'c53n3a44', '3', 'Conclusiones'),
	('r53-55', 'c53n3a55', '3', 'Conclusiones'),
	('r53-60', 'c53n3a60', '3', 'Conclusiones'),
	('r53-61', 'c53n3a61', '3', 'Conclusiones'),
	('r53-62', 'c53n3a62', '3', 'Conclusiones'),
	('r53-72', 'c53n3a72', '3', 'Conclusiones'),
	('r53-76', 'c53n3a76', '3', 'Conclusiones'),
	('r53-77', 'c53n3a77', '3', 'Conclusiones'),
	('r53-83', 'c53n3a83', '3', 'Conclusiones'),
	('r53-84', 'c53n3a84', '3', 'Conclusiones'),
	('r53-117', 'c53n4a117', '4', 'Preguntas'),
	('r53-128', 'c53n4a128', '4', 'Preguntas'),
	('r53-13', 'c53n4a13', '4', 'Preguntas'),
	('r53-27', 'c53n4a27', '4', 'Preguntas'),
	('r53-34', 'c53n4a34', '4', 'Preguntas'),
	('r53-41', 'c53n4a41', '4', 'Preguntas'),
	('r53-44', 'c53n4a44', '4', 'Preguntas'),
	('r53-55', 'c53n4a55', '4', 'Preguntas'),
	('r53-60', 'c53n4a60', '4', 'Preguntas'),
	('r53-61', 'c53n4a61', '4', 'Preguntas'),
	('r53-62', 'c53n4a62', '4', 'Preguntas'),
	('r53-72', 'c53n4a72', '4', 'Preguntas'),
	('r53-76', 'c53n4a76', '4', 'Preguntas'),
	('r53-77', 'c53n4a77', '4', 'Preguntas'),
	('r53-83', 'c53n4a83', '4', 'Preguntas'),
	('r53-84', 'c53n4a84', '4', 'Preguntas'),
	('r54-125', 'c54n0a125', '0', 'puntualidad'),
	('r54-127', 'c54n0a127', '0', 'puntualidad'),
	('r54-128', 'c54n0a128', '0', 'puntualidad'),
	('r54-27', 'c54n0a27', '0', 'puntualidad'),
	('r54-32', 'c54n0a32', '0', 'puntualidad'),
	('r54-34', 'c54n0a34', '0', 'puntualidad'),
	('r54-44', 'c54n0a44', '0', 'puntualidad'),
	('r54-60', 'c54n0a60', '0', 'puntualidad'),
	('r54-61', 'c54n0a61', '0', 'puntualidad'),
	('r54-69', 'c54n0a69', '0', 'puntualidad'),
	('r54-72', 'c54n0a72', '0', 'puntualidad'),
	('r54-125', 'c54n1a125', '1', 'a mano'),
	('r54-127', 'c54n1a127', '1', 'a mano'),
	('r54-128', 'c54n1a128', '1', 'a mano'),
	('r54-27', 'c54n1a27', '1', 'a mano'),
	('r54-32', 'c54n1a32', '1', 'a mano'),
	('r54-34', 'c54n1a34', '1', 'a mano'),
	('r54-44', 'c54n1a44', '1', 'a mano'),
	('r54-60', 'c54n1a60', '1', 'a mano'),
	('r54-61', 'c54n1a61', '1', 'a mano'),
	('r54-69', 'c54n1a69', '1', 'a mano'),
	('r54-72', 'c54n1a72', '1', 'a mano'),
	('r54-125', 'c54n2a125', '2', 'contenido'),
	('r54-127', 'c54n2a127', '2', 'contenido'),
	('r54-128', 'c54n2a128', '2', 'contenido'),
	('r54-27', 'c54n2a27', '2', 'contenido'),
	('r54-32', 'c54n2a32', '2', 'contenido'),
	('r54-34', 'c54n2a34', '2', 'contenido'),
	('r54-44', 'c54n2a44', '2', 'contenido'),
	('r54-60', 'c54n2a60', '2', 'contenido'),
	('r54-61', 'c54n2a61', '2', 'contenido'),
	('r54-69', 'c54n2a69', '2', 'contenido'),
	('r54-72', 'c54n2a72', '2', 'contenido'),
	('r54-125', 'c54n3a125', '3', 'imagenes'),
	('r54-127', 'c54n3a127', '3', 'imagenes'),
	('r54-128', 'c54n3a128', '3', 'imagenes'),
	('r54-27', 'c54n3a27', '3', 'imagenes'),
	('r54-32', 'c54n3a32', '3', 'imagenes'),
	('r54-34', 'c54n3a34', '3', 'imagenes'),
	('r54-44', 'c54n3a44', '3', 'imagenes'),
	('r54-60', 'c54n3a60', '3', 'imagenes'),
	('r54-61', 'c54n3a61', '3', 'imagenes'),
	('r54-69', 'c54n3a69', '3', 'imagenes'),
	('r54-72', 'c54n3a72', '3', 'imagenes'),
	('r55-125', 'c55n0a125', '0', 'Componente'),
	('r55-127', 'c55n0a127', '0', 'Componente'),
	('r55-128', 'c55n0a128', '0', 'Componente'),
	('r55-13', 'c55n0a13', '0', 'Componente'),
	('r55-27', 'c55n0a27', '0', 'Componente'),
	('r55-32', 'c55n0a32', '0', 'Componente'),
	('r55-34', 'c55n0a34', '0', 'Componente'),
	('r55-41', 'c55n0a41', '0', 'Componente'),
	('r55-44', 'c55n0a44', '0', 'Componente'),
	('r55-55', 'c55n0a55', '0', 'Componente'),
	('r55-60', 'c55n0a60', '0', 'Componente'),
	('r55-61', 'c55n0a61', '0', 'Componente'),
	('r55-62', 'c55n0a62', '0', 'Componente'),
	('r55-69', 'c55n0a69', '0', 'Componente'),
	('r55-72', 'c55n0a72', '0', 'Componente'),
	('r55-83', 'c55n0a83', '0', 'Componente'),
	('r55-84', 'c55n0a84', '0', 'Componente'),
	('r55-125', 'c55n1a125', '1', 'Objetivos'),
	('r55-127', 'c55n1a127', '1', 'Objetivos'),
	('r55-128', 'c55n1a128', '1', 'Objetivos'),
	('r55-13', 'c55n1a13', '1', 'Objetivos'),
	('r55-27', 'c55n1a27', '1', 'Objetivos'),
	('r55-32', 'c55n1a32', '1', 'Objetivos'),
	('r55-34', 'c55n1a34', '1', 'Objetivos'),
	('r55-41', 'c55n1a41', '1', 'Objetivos'),
	('r55-44', 'c55n1a44', '1', 'Objetivos'),
	('r55-55', 'c55n1a55', '1', 'Objetivos'),
	('r55-60', 'c55n1a60', '1', 'Objetivos'),
	('r55-61', 'c55n1a61', '1', 'Objetivos'),
	('r55-62', 'c55n1a62', '1', 'Objetivos'),
	('r55-69', 'c55n1a69', '1', 'Objetivos'),
	('r55-72', 'c55n1a72', '1', 'Objetivos'),
	('r55-83', 'c55n1a83', '1', 'Objetivos'),
	('r55-84', 'c55n1a84', '1', 'Objetivos'),
	('r55-125', 'c55n2a125', '2', 'Desarrollo'),
	('r55-127', 'c55n2a127', '2', 'Desarrollo'),
	('r55-128', 'c55n2a128', '2', 'Desarrollo'),
	('r55-13', 'c55n2a13', '2', 'Desarrollo'),
	('r55-27', 'c55n2a27', '2', 'Desarrollo'),
	('r55-32', 'c55n2a32', '2', 'Desarrollo'),
	('r55-34', 'c55n2a34', '2', 'Desarrollo'),
	('r55-41', 'c55n2a41', '2', 'Desarrollo'),
	('r55-44', 'c55n2a44', '2', 'Desarrollo'),
	('r55-55', 'c55n2a55', '2', 'Desarrollo'),
	('r55-60', 'c55n2a60', '2', 'Desarrollo'),
	('r55-61', 'c55n2a61', '2', 'Desarrollo'),
	('r55-62', 'c55n2a62', '2', 'Desarrollo'),
	('r55-69', 'c55n2a69', '2', 'Desarrollo'),
	('r55-72', 'c55n2a72', '2', 'Desarrollo'),
	('r55-83', 'c55n2a83', '2', 'Desarrollo'),
	('r55-84', 'c55n2a84', '2', 'Desarrollo'),
	('r55-125', 'c55n3a125', '3', 'Conclusiones y recomendaciones'),
	('r55-127', 'c55n3a127', '3', 'Conclusiones y recomendaciones'),
	('r55-128', 'c55n3a128', '3', 'Conclusiones y recomendaciones'),
	('r55-13', 'c55n3a13', '3', 'Conclusiones y recomendaciones'),
	('r55-27', 'c55n3a27', '3', 'Conclusiones y recomendaciones'),
	('r55-32', 'c55n3a32', '3', 'Conclusiones y recomendaciones'),
	('r55-34', 'c55n3a34', '3', 'Conclusiones y recomendaciones'),
	('r55-41', 'c55n3a41', '3', 'Conclusiones y recomendaciones'),
	('r55-44', 'c55n3a44', '3', 'Conclusiones y recomendaciones'),
	('r55-55', 'c55n3a55', '3', 'Conclusiones y recomendaciones'),
	('r55-60', 'c55n3a60', '3', 'Conclusiones y recomendaciones'),
	('r55-61', 'c55n3a61', '3', 'Conclusiones y recomendaciones'),
	('r55-62', 'c55n3a62', '3', 'Conclusiones y recomendaciones'),
	('r55-69', 'c55n3a69', '3', 'Conclusiones y recomendaciones'),
	('r55-72', 'c55n3a72', '3', 'Conclusiones y recomendaciones'),
	('r55-83', 'c55n3a83', '3', 'Conclusiones y recomendaciones'),
	('r55-84', 'c55n3a84', '3', 'Conclusiones y recomendaciones'),
	('r55-125', 'c55n4a125', '4', 'Ortografia'),
	('r55-127', 'c55n4a127', '4', 'Ortografia'),
	('r55-128', 'c55n4a128', '4', 'Ortografia'),
	('r55-13', 'c55n4a13', '4', 'Ortografia'),
	('r55-27', 'c55n4a27', '4', 'Ortografia'),
	('r55-32', 'c55n4a32', '4', 'Ortografia'),
	('r55-34', 'c55n4a34', '4', 'Ortografia'),
	('r55-41', 'c55n4a41', '4', 'Ortografia'),
	('r55-44', 'c55n4a44', '4', 'Ortografia'),
	('r55-55', 'c55n4a55', '4', 'Ortografia'),
	('r55-60', 'c55n4a60', '4', 'Ortografia'),
	('r55-61', 'c55n4a61', '4', 'Ortografia'),
	('r55-62', 'c55n4a62', '4', 'Ortografia'),
	('r55-69', 'c55n4a69', '4', 'Ortografia'),
	('r55-72', 'c55n4a72', '4', 'Ortografia'),
	('r55-83', 'c55n4a83', '4', 'Ortografia'),
	('r55-84', 'c55n4a84', '4', 'Ortografia'),
	('r55-125', 'c55n5a125', '5', 'Puntualidad'),
	('r55-127', 'c55n5a127', '5', 'Puntualidad'),
	('r55-128', 'c55n5a128', '5', 'Puntualidad'),
	('r55-13', 'c55n5a13', '5', 'Puntualidad'),
	('r55-27', 'c55n5a27', '5', 'Puntualidad'),
	('r55-32', 'c55n5a32', '5', 'Puntualidad'),
	('r55-34', 'c55n5a34', '5', 'Puntualidad'),
	('r55-41', 'c55n5a41', '5', 'Puntualidad'),
	('r55-44', 'c55n5a44', '5', 'Puntualidad'),
	('r55-55', 'c55n5a55', '5', 'Puntualidad'),
	('r55-60', 'c55n5a60', '5', 'Puntualidad'),
	('r55-61', 'c55n5a61', '5', 'Puntualidad'),
	('r55-62', 'c55n5a62', '5', 'Puntualidad'),
	('r55-69', 'c55n5a69', '5', 'Puntualidad'),
	('r55-72', 'c55n5a72', '5', 'Puntualidad'),
	('r55-83', 'c55n5a83', '5', 'Puntualidad'),
	('r55-84', 'c55n5a84', '5', 'Puntualidad'),
	('r56-117', 'c56n0a117', '0', 'Componente'),
	('r56-125', 'c56n0a125', '0', 'Componente'),
	('r56-127', 'c56n0a127', '0', 'Componente'),
	('r56-128', 'c56n0a128', '0', 'Componente'),
	('r56-13', 'c56n0a13', '0', 'Componente'),
	('r56-27', 'c56n0a27', '0', 'Componente'),
	('r56-32', 'c56n0a32', '0', 'Componente'),
	('r56-34', 'c56n0a34', '0', 'Componente'),
	('r56-41', 'c56n0a41', '0', 'Componente'),
	('r56-44', 'c56n0a44', '0', 'Componente'),
	('r56-55', 'c56n0a55', '0', 'Componente'),
	('r56-60', 'c56n0a60', '0', 'Componente'),
	('r56-61', 'c56n0a61', '0', 'Componente'),
	('r56-62', 'c56n0a62', '0', 'Componente'),
	('r56-69', 'c56n0a69', '0', 'Componente'),
	('r56-72', 'c56n0a72', '0', 'Componente'),
	('r56-76', 'c56n0a76', '0', 'Componente'),
	('r56-77', 'c56n0a77', '0', 'Componente'),
	('r56-83', 'c56n0a83', '0', 'Componente'),
	('r56-84', 'c56n0a84', '0', 'Componente'),
	('r56-117', 'c56n1a117', '1', 'Objetivos'),
	('r56-125', 'c56n1a125', '1', 'Objetivos'),
	('r56-127', 'c56n1a127', '1', 'Objetivos'),
	('r56-128', 'c56n1a128', '1', 'Objetivos'),
	('r56-13', 'c56n1a13', '1', 'Objetivos'),
	('r56-27', 'c56n1a27', '1', 'Objetivos'),
	('r56-32', 'c56n1a32', '1', 'Objetivos'),
	('r56-34', 'c56n1a34', '1', 'Objetivos'),
	('r56-41', 'c56n1a41', '1', 'Objetivos'),
	('r56-44', 'c56n1a44', '1', 'Objetivos'),
	('r56-55', 'c56n1a55', '1', 'Objetivos'),
	('r56-60', 'c56n1a60', '1', 'Objetivos'),
	('r56-61', 'c56n1a61', '1', 'Objetivos'),
	('r56-62', 'c56n1a62', '1', 'Objetivos'),
	('r56-69', 'c56n1a69', '1', 'Objetivos'),
	('r56-72', 'c56n1a72', '1', 'Objetivos'),
	('r56-76', 'c56n1a76', '1', 'Objetivos'),
	('r56-77', 'c56n1a77', '1', 'Objetivos'),
	('r56-83', 'c56n1a83', '1', 'Objetivos'),
	('r56-84', 'c56n1a84', '1', 'Objetivos'),
	('r56-117', 'c56n2a117', '2', 'Desarrollo'),
	('r56-125', 'c56n2a125', '2', 'Desarrollo'),
	('r56-127', 'c56n2a127', '2', 'Desarrollo'),
	('r56-128', 'c56n2a128', '2', 'Desarrollo'),
	('r56-13', 'c56n2a13', '2', 'Desarrollo'),
	('r56-27', 'c56n2a27', '2', 'Desarrollo'),
	('r56-32', 'c56n2a32', '2', 'Desarrollo'),
	('r56-34', 'c56n2a34', '2', 'Desarrollo'),
	('r56-41', 'c56n2a41', '2', 'Desarrollo'),
	('r56-44', 'c56n2a44', '2', 'Desarrollo'),
	('r56-55', 'c56n2a55', '2', 'Desarrollo'),
	('r56-60', 'c56n2a60', '2', 'Desarrollo'),
	('r56-61', 'c56n2a61', '2', 'Desarrollo'),
	('r56-62', 'c56n2a62', '2', 'Desarrollo'),
	('r56-69', 'c56n2a69', '2', 'Desarrollo'),
	('r56-72', 'c56n2a72', '2', 'Desarrollo'),
	('r56-76', 'c56n2a76', '2', 'Desarrollo'),
	('r56-77', 'c56n2a77', '2', 'Desarrollo'),
	('r56-83', 'c56n2a83', '2', 'Desarrollo'),
	('r56-84', 'c56n2a84', '2', 'Desarrollo'),
	('r56-117', 'c56n3a117', '3', 'Conclusiones y recomendaciones'),
	('r56-125', 'c56n3a125', '3', 'Conclusiones y recomendaciones'),
	('r56-127', 'c56n3a127', '3', 'Conclusiones y recomendaciones'),
	('r56-128', 'c56n3a128', '3', 'Conclusiones y recomendaciones'),
	('r56-13', 'c56n3a13', '3', 'Conclusiones y recomendaciones'),
	('r56-27', 'c56n3a27', '3', 'Conclusiones y recomendaciones'),
	('r56-32', 'c56n3a32', '3', 'Conclusiones y recomendaciones'),
	('r56-34', 'c56n3a34', '3', 'Conclusiones y recomendaciones'),
	('r56-41', 'c56n3a41', '3', 'Conclusiones y recomendaciones'),
	('r56-44', 'c56n3a44', '3', 'Conclusiones y recomendaciones'),
	('r56-55', 'c56n3a55', '3', 'Conclusiones y recomendaciones'),
	('r56-60', 'c56n3a60', '3', 'Conclusiones y recomendaciones'),
	('r56-61', 'c56n3a61', '3', 'Conclusiones y recomendaciones'),
	('r56-62', 'c56n3a62', '3', 'Conclusiones y recomendaciones'),
	('r56-69', 'c56n3a69', '3', 'Conclusiones y recomendaciones'),
	('r56-72', 'c56n3a72', '3', 'Conclusiones y recomendaciones'),
	('r56-76', 'c56n3a76', '3', 'Conclusiones y recomendaciones'),
	('r56-77', 'c56n3a77', '3', 'Conclusiones y recomendaciones'),
	('r56-83', 'c56n3a83', '3', 'Conclusiones y recomendaciones'),
	('r56-84', 'c56n3a84', '3', 'Conclusiones y recomendaciones'),
	('r56-117', 'c56n4a117', '4', 'Ortografia'),
	('r56-125', 'c56n4a125', '4', 'Ortografia'),
	('r56-127', 'c56n4a127', '4', 'Ortografia'),
	('r56-128', 'c56n4a128', '4', 'Ortografia'),
	('r56-13', 'c56n4a13', '4', 'Ortografia'),
	('r56-27', 'c56n4a27', '4', 'Ortografia'),
	('r56-32', 'c56n4a32', '4', 'Ortografia'),
	('r56-34', 'c56n4a34', '4', 'Ortografia'),
	('r56-41', 'c56n4a41', '4', 'Ortografia'),
	('r56-44', 'c56n4a44', '4', 'Ortografia'),
	('r56-55', 'c56n4a55', '4', 'Ortografia'),
	('r56-60', 'c56n4a60', '4', 'Ortografia'),
	('r56-61', 'c56n4a61', '4', 'Ortografia'),
	('r56-62', 'c56n4a62', '4', 'Ortografia'),
	('r56-69', 'c56n4a69', '4', 'Ortografia'),
	('r56-72', 'c56n4a72', '4', 'Ortografia'),
	('r56-76', 'c56n4a76', '4', 'Ortografia'),
	('r56-77', 'c56n4a77', '4', 'Ortografia'),
	('r56-83', 'c56n4a83', '4', 'Ortografia'),
	('r56-84', 'c56n4a84', '4', 'Ortografia'),
	('r56-117', 'c56n5a117', '5', 'Puntualidad'),
	('r56-125', 'c56n5a125', '5', 'Puntualidad'),
	('r56-127', 'c56n5a127', '5', 'Puntualidad'),
	('r56-128', 'c56n5a128', '5', 'Puntualidad'),
	('r56-13', 'c56n5a13', '5', 'Puntualidad'),
	('r56-27', 'c56n5a27', '5', 'Puntualidad'),
	('r56-32', 'c56n5a32', '5', 'Puntualidad'),
	('r56-34', 'c56n5a34', '5', 'Puntualidad'),
	('r56-41', 'c56n5a41', '5', 'Puntualidad'),
	('r56-44', 'c56n5a44', '5', 'Puntualidad'),
	('r56-55', 'c56n5a55', '5', 'Puntualidad'),
	('r56-60', 'c56n5a60', '5', 'Puntualidad'),
	('r56-61', 'c56n5a61', '5', 'Puntualidad'),
	('r56-62', 'c56n5a62', '5', 'Puntualidad'),
	('r56-69', 'c56n5a69', '5', 'Puntualidad'),
	('r56-72', 'c56n5a72', '5', 'Puntualidad'),
	('r56-76', 'c56n5a76', '5', 'Puntualidad'),
	('r56-77', 'c56n5a77', '5', 'Puntualidad'),
	('r56-83', 'c56n5a83', '5', 'Puntualidad'),
	('r56-84', 'c56n5a84', '5', 'Puntualidad');
/*!40000 ALTER TABLE `mdl_criterio` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_curso
DROP TABLE IF EXISTS `mdl_curso`;
CREATE TABLE IF NOT EXISTS `mdl_curso` (
  `Cod_Curso` varchar(8) NOT NULL,
  `NomCurso` varchar(1024) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Docente` varchar(200) DEFAULT NULL,
  `Semestre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_curso: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_curso` DISABLE KEYS */;
INSERT INTO `mdl_curso` (`Cod_Curso`, `NomCurso`, `Descripcion`, `Docente`, `Semestre`) VALUES
	('4', 'IS-Desarrollo de Software I', 'Miscelánea', 'IVAN MOLERO DELGADO', 'imolero-2018-1-IS-Desarrollo de Software I'),
	('5', 'IS-Metodología de la Investigación', 'Miscelánea', 'IVAN MOLERO DELGADO', 'imolero-2018-2-IS-Metodología de la Investigación');
/*!40000 ALTER TABLE `mdl_curso` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_cursoobjetivo
DROP TABLE IF EXISTS `mdl_cursoobjetivo`;
CREATE TABLE IF NOT EXISTS `mdl_cursoobjetivo` (
  `Cod_CursoObjetivo` varchar(16) NOT NULL,
  `Cod_Objetivo` varchar(16) NOT NULL,
  `Cod_Curso` varchar(16) NOT NULL,
  PRIMARY KEY (`Cod_CursoObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_cursoobjetivo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_cursoobjetivo` DISABLE KEYS */;
INSERT INTO `mdl_cursoobjetivo` (`Cod_CursoObjetivo`, `Cod_Objetivo`, `Cod_Curso`) VALUES
	('5-OB1', 'OB1', '5');
/*!40000 ALTER TABLE `mdl_cursoobjetivo` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_escuela
DROP TABLE IF EXISTS `mdl_escuela`;
CREATE TABLE IF NOT EXISTS `mdl_escuela` (
  `Cod_Escuela` varchar(8) NOT NULL,
  `Sede` varchar(30) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Cod_Escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_escuela: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_escuela` DISABLE KEYS */;
INSERT INTO `mdl_escuela` (`Cod_Escuela`, `Sede`, `Descripcion`) VALUES
	('AMB', 'LARAPA', 'Ingeneria Ambiental'),
	('CIV', 'LARAPA', 'Ingeneria Civil'),
	('IND', 'LARAPA', 'Ingeneria Industrial'),
	('SIS', 'Larapa', 'Ingeneria de Sistemas');
/*!40000 ALTER TABLE `mdl_escuela` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_gcriterio
DROP TABLE IF EXISTS `mdl_gcriterio`;
CREATE TABLE IF NOT EXISTS `mdl_gcriterio` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `NivelCriterio` varchar(8) NOT NULL,
  `DesCriterio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Criterio`),
  KEY `Cod_Rubrica` (`Cod_Rubrica`),
  CONSTRAINT `mdl_gcriterio_ibfk_1` FOREIGN KEY (`Cod_Rubrica`) REFERENCES `mdl_grubrica` (`Cod_Rubrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_gcriterio: ~43 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gcriterio` DISABLE KEYS */;
INSERT INTO `mdl_gcriterio` (`Cod_Rubrica`, `Cod_Criterio`, `NivelCriterio`, `DesCriterio`) VALUES
	('r48', 'c480', '0', 'puntualidad'),
	('r48', 'c481', '1', 'a mano'),
	('r48', 'c482', '2', 'contenido'),
	('r48', 'c483', '3', 'imagenes'),
	('r49', 'c490', '0', 'puntualidad'),
	('r49', 'c491', '1', 'a mano'),
	('r49', 'c492', '2', 'contenido'),
	('r49', 'c493', '3', 'imagenes'),
	('r50', 'c500', '0', 'Material'),
	('r50', 'c501', '1', 'Exposición'),
	('r50', 'c502', '2', 'Lee'),
	('r50', 'c503', '3', 'Conclusiones'),
	('r50', 'c504', '4', 'Preguntas'),
	('r51', 'c510', '0', 'Componente'),
	('r51', 'c511', '1', 'Objetivos'),
	('r51', 'c512', '2', 'Desarrollo'),
	('r51', 'c513', '3', 'Conclusiones y recomendaciones'),
	('r51', 'c514', '4', 'Ortografia'),
	('r51', 'c515', '5', 'Puntualidad'),
	('r52', 'c520', '0', 'puntualidad'),
	('r52', 'c521', '1', 'a mano'),
	('r52', 'c522', '2', 'contenido'),
	('r52', 'c523', '3', 'imagenes'),
	('r53', 'c530', '0', 'Material'),
	('r53', 'c531', '1', 'Exposición'),
	('r53', 'c532', '2', 'Lee'),
	('r53', 'c533', '3', 'Conclusiones'),
	('r53', 'c534', '4', 'Preguntas'),
	('r54', 'c540', '0', 'puntualidad'),
	('r54', 'c541', '1', 'a mano'),
	('r54', 'c542', '2', 'contenido'),
	('r54', 'c543', '3', 'imagenes'),
	('r55', 'c550', '0', 'Componente'),
	('r55', 'c551', '1', 'Objetivos'),
	('r55', 'c552', '2', 'Desarrollo'),
	('r55', 'c553', '3', 'Conclusiones y recomendaciones'),
	('r55', 'c554', '4', 'Ortografia'),
	('r55', 'c555', '5', 'Puntualidad'),
	('r56', 'c560', '0', 'Componente'),
	('r56', 'c561', '1', 'Objetivos'),
	('r56', 'c562', '2', 'Desarrollo'),
	('r56', 'c563', '3', 'Conclusiones y recomendaciones'),
	('r56', 'c564', '4', 'Ortografia'),
	('r56', 'c565', '5', 'Puntualidad');
/*!40000 ALTER TABLE `mdl_gcriterio` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_grubrica
DROP TABLE IF EXISTS `mdl_grubrica`;
CREATE TABLE IF NOT EXISTS `mdl_grubrica` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Asignacion` varchar(8) DEFAULT NULL,
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `NomRubrica` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Cod_Rubrica`),
  KEY `Cod_Asignacion` (`Cod_Asignacion`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_grubrica_ibfk_1` FOREIGN KEY (`Cod_Asignacion`) REFERENCES `mdl_asignacion` (`Cod_Asignacion`),
  CONSTRAINT `mdl_grubrica_ibfk_2` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_grubrica: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grubrica` DISABLE KEYS */;
INSERT INTO `mdl_grubrica` (`Cod_Rubrica`, `Cod_Asignacion`, `Cod_Curso`, `NomRubrica`) VALUES
	('r48', '115', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)'),
	('r49', '119', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)'),
	('r50', '121', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)'),
	('r51', '123', '5', 'Rubrica (Zotero -  Organizar referencias)'),
	('r52', '125', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)'),
	('r53', '127', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)'),
	('r54', '129', '5', 'Rubrica (Mapa mental)'),
	('r55', '133', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)'),
	('r56', '135', '5', 'Rubrica (Responsabilidad Social - informe)');
/*!40000 ALTER TABLE `mdl_grubrica` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_indicador
DROP TABLE IF EXISTS `mdl_indicador`;
CREATE TABLE IF NOT EXISTS `mdl_indicador` (
  `Cod_Resultado` varchar(8) DEFAULT NULL,
  `Cod_Indicadornivel` varchar(8) DEFAULT NULL,
  `Cod_Indicador` varchar(8) NOT NULL,
  `DescripcionLarga` varchar(1024) NOT NULL,
  `DescripcionCorta` varchar(200) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Indicador`),
  KEY `Cod_Resultado` (`Cod_Resultado`),
  KEY `Cod_Indicadornivel` (`Cod_Indicadornivel`),
  CONSTRAINT `mdl_indicador_ibfk_1` FOREIGN KEY (`Cod_Resultado`) REFERENCES `mdl_resultadoestudiante` (`Cod_Resultado`),
  CONSTRAINT `mdl_indicador_ibfk_2` FOREIGN KEY (`Cod_Indicadornivel`) REFERENCES `mdl_indicadornivel` (`Cod_Indicadornivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_indicador: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_indicador` DISABLE KEYS */;
INSERT INTO `mdl_indicador` (`Cod_Resultado`, `Cod_Indicadornivel`, `Cod_Indicador`, `DescripcionLarga`, `DescripcionCorta`, `valor`) VALUES
	('RE_A', 'N1', 'A1', 'Aplica conocimientos de ciencias en la solución de problemas de la disciplina del programa.', 'Aplica conocimientos de ciencias en la solución de problemas de la disciplina del programa.', 1),
	('RE_A', 'N1', 'A2', 'Maneja y utiliza herramientas computacionales en la implementación de algoritmos con lógica matemática o pensamiento computacional.', 'Maneja y utiliza herramientas computacionales en la implementación de algoritmos con lógica matemática o pensamiento computacional.', 1),
	('RE_A', 'N1', 'A3', 'Plantea y resuelve problemas aplicando lógica matemática y pensamiento computacional, así como el pensamiento sistémico.', 'Plantea y resuelve problemas aplicando lógica matemática y pensamiento computacional, así como el pensamiento sistémico.', 1),
	('RE_A', 'N1', 'A4', 'Argumenta la solución de problemas complejos del área de especialidad.', 'Argumenta la solución de problemas complejos del área de especialidad.', 1),
	('RE_B', 'N1', 'B1', 'Identifica y formula problemas complejos de computación.', 'Identifica y formula problemas complejos de computación.', 1),
	('RE_B', 'N1', 'B2', 'Plantea alternativas de solución considerando la factibilidad operativa, técnica, económica y legal.', 'Plantea alternativas de solución considerando la factibilidad operativa, técnica, económica y legal.', 1),
	('RE_B', 'N1', 'B3', 'Plantea alternativas de solución considerando el impacto de la solución en el entorno de su aplicación.', 'Plantea alternativas de solución considerando el impacto de la solución en el entorno de su aplicación.', 1),
	('RE_B', 'N1', 'B4', 'Aplica métodos de investigación para fundamentar las propuestas de solución.', 'Aplica métodos de investigación para fundamentar las propuestas de solución.', 1),
	('RE_B', 'N1', 'B5', 'Identifica oportunidades para aplicar enfoques multidisciplinarios en la solución de problemas complejos.', 'Identifica oportunidades para aplicar enfoques multidisciplinarios en la solución de problemas complejos.', 1),
	('RE_C', 'N1', 'C1', 'Identifica y define los requerimientos de computación apropiados para la solución de problemas complejos.', 'Identifica y define los requerimientos de computación apropiados para la solución de problemas complejos.', 1),
	('RE_C', 'N1', 'C2', 'Modela y diseña soluciones a problemas complejos de computación para satisfacer necesidades y cumplir requisitos dentro de restricciones realistas.', 'Modela y diseña soluciones a problemas complejos de computación para satisfacer necesidades y cumplir requisitos dentro de restricciones realistas.', 1),
	('RE_C', 'N1', 'C3', 'Implementa procesos y componentes para la solución de problemas complejos basados en computadoras.', 'Implementa procesos y componentes para la solución de problemas complejos basados en computadoras.', 1),
	('RE_C', 'N1', 'C4', 'Evalúa con objetividad la solución considerando metodologías y estándares del área de especialidad.', 'Evalúa con objetividad la solución considerando metodologías y estándares del área de especialidad.', 1),
	('RE_D', 'N1', 'D1', 'Cumple con responsabilidad el rol correspondiente en un equipo de trabajo.', 'Cumple con responsabilidad el rol correspondiente en un equipo de trabajo.', 1),
	('RE_D', 'N1', 'D2', 'Demuestra responsabilidad en el cumplimiento de labores individuales.', 'Demuestra responsabilidad en el cumplimiento de labores individuales.', 1),
	('RE_E', 'N1', 'E1', 'Emplea la terminología técnica de la especialidad.', 'Emplea la terminología técnica de la especialidad.', 1),
	('RE_E', 'N1', 'E2', 'Demuestra capacidad de expresión oral y escrita clara de acuerdo al contexto profesional.', 'Demuestra capacidad de expresión oral y escrita clara de acuerdo al contexto profesional.', 1),
	('RE_E', 'N1', 'E3', 'Comunica sus ideas con eficacia a su audiencia.', 'Comunica sus ideas con eficacia a su audiencia.', 1),
	('RE_F', 'N1', 'F1', 'Aplica principios deontológicos de la profesión en las actividades de su formación.', 'Aplica principios deontológicos de la profesión en las actividades de su formación.', 1),
	('RE_F', 'N1', 'F2', 'Identifica el impacto de la computación sobre las personas, organizaciones y sociedad.', 'Identifica el impacto de la computación sobre las personas, organizaciones y sociedad.', 1),
	('RE_G', 'N1', 'G1', 'Reconoce estados del arte y tendencias tecnológicas relacionadas al área de la especialidad.', 'Reconoce estados del arte y tendencias tecnológicas relacionadas al área de la especialidad.', 1),
	('RE_G', 'N1', 'G2', 'Elabora informes usando bibliografía actualizada y pertinente de fuentes reconocidas.', 'Elabora informes usando bibliografía actualizada y pertinente de fuentes reconocidas.', 1),
	('RE_H', 'N1', 'H1', 'Crea herramientas para la práctica de la computación.', 'Crea herramientas para la práctica de la computación.', 1),
	('RE_H', 'N1', 'H2', 'Selecciona y utiliza herramientas modernas para la práctica de la computación.', 'Selecciona y utiliza herramientas modernas para la práctica de la computación.', 1),
	('RE_H', 'N1', 'H3', 'Adapta y aplica técnicas, recursos o herramientas para la práctica de la computación con la comprensión de las limitaciones.', 'Adapta y aplica técnicas, recursos o herramientas para la práctica de la computación con la comprensión de las limitaciones.', 1),
	('RE_I', 'N1', 'I1', 'Conoce principios y prácticas de gestión de sistemas de información.', 'Conoce principios y prácticas de gestión de sistemas de información.', 1),
	('RE_I', 'N1', 'I2', 'Conoce las normas que se aplican en la gestión de sistemas de información.', 'Conoce las normas que se aplican en la gestión de sistemas de información.', 1),
	('RE_I', 'N1', 'I3', 'Selecciona y usa herramientas para la de gestión de sistemas de información.', 'Selecciona y usa herramientas para la de gestión de sistemas de información.', 1),
	('RE_I', 'N1', 'I4', 'Conoce y aplica técnicas para la gestión de sistemas de información.', 'Conoce y aplica técnicas para la gestión de sistemas de información.', 1),
	('RE_I', 'N1', 'I5', 'Elabora informes técnicos adecuados a normatividad vigente.', 'Elabora informes técnicos adecuados a normatividad vigente.', 1);
/*!40000 ALTER TABLE `mdl_indicador` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_indicadornivel
DROP TABLE IF EXISTS `mdl_indicadornivel`;
CREATE TABLE IF NOT EXISTS `mdl_indicadornivel` (
  `Cod_Indicadornivel` varchar(8) NOT NULL,
  `valor` varchar(5) DEFAULT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Cod_Indicadornivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_indicadornivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_indicadornivel` DISABLE KEYS */;
INSERT INTO `mdl_indicadornivel` (`Cod_Indicadornivel`, `valor`, `descripcion`) VALUES
	('N1', '1', 'NIVEL 1'),
	('N2', '2', 'NIVEL 2'),
	('N3', '3', 'NIVEL 3');
/*!40000 ALTER TABLE `mdl_indicadornivel` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_indrecursobjetivo
DROP TABLE IF EXISTS `mdl_indrecursobjetivo`;
CREATE TABLE IF NOT EXISTS `mdl_indrecursobjetivo` (
  `Cod_IndicarResultado` varchar(16) NOT NULL,
  `Cod_Resultado` varchar(16) NOT NULL,
  `Cod_Indicador` varchar(16) DEFAULT NULL,
  `Cod_Curso` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Cod_IndicarResultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_indrecursobjetivo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_indrecursobjetivo` DISABLE KEYS */;
INSERT INTO `mdl_indrecursobjetivo` (`Cod_IndicarResultado`, `Cod_Resultado`, `Cod_Indicador`, `Cod_Curso`) VALUES
	('OB1-RE_A-A1', 'OB1-RE_A', 'A1', '5'),
	('OB1-RE_A-A4', 'OB1-RE_A', 'A4', '5'),
	('OB1-RE_F-F1', 'OB1-RE_F', 'F1', '5'),
	('OB1-RE_F-F2', 'OB1-RE_F', 'F2', '5');
/*!40000 ALTER TABLE `mdl_indrecursobjetivo` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_matricula
DROP TABLE IF EXISTS `mdl_matricula`;
CREATE TABLE IF NOT EXISTS `mdl_matricula` (
  `Cod_Persona` varchar(8) NOT NULL,
  `Cod_Curso` varchar(8) NOT NULL,
  `Cod_Matricula` varchar(25) NOT NULL,
  `Semestre` varchar(20) DEFAULT NULL,
  `Docente` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`Cod_Matricula`),
  KEY `Cod_Persona` (`Cod_Persona`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_matricula_ibfk_1` FOREIGN KEY (`Cod_Persona`) REFERENCES `mdl_persona` (`Cod_Persona`),
  CONSTRAINT `mdl_matricula_ibfk_2` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_matricula: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_matricula` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_nivel
DROP TABLE IF EXISTS `mdl_nivel`;
CREATE TABLE IF NOT EXISTS `mdl_nivel` (
  `Cod_Nivel` varchar(16) NOT NULL,
  `Cod_Criterio` varchar(16) NOT NULL,
  `Descripcion` varchar(1024) DEFAULT NULL,
  `Puntaje` int(11) DEFAULT NULL,
  `PuntajeObtenido` int(11) DEFAULT NULL,
  `PuntajeFinal` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Nivel`),
  KEY `Cod_Criterio` (`Cod_Criterio`),
  CONSTRAINT `mdl_nivel_ibfk_1` FOREIGN KEY (`Cod_Criterio`) REFERENCES `mdl_criterio` (`Cod_Criterio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_nivel: ~633 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_nivel` DISABLE KEYS */;
INSERT INTO `mdl_nivel` (`Cod_Nivel`, `Cod_Criterio`, `Descripcion`, `Puntaje`, `PuntajeObtenido`, `PuntajeFinal`) VALUES
	('n0as48|117', 'c48n0a117', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|124', 'c48n0a124', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|127', 'c48n0a127', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|128', 'c48n0a128', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|13', 'c48n0a13', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|32', 'c48n0a32', 'presenta a tiempo', 4, 4, 0.99),
	('n0as48|34', 'c48n0a34', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|44', 'c48n0a44', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|55', 'c48n0a55', 'presenta a tiempo', 4, 4, 0.99),
	('n0as48|60', 'c48n0a60', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|61', 'c48n0a61', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|62', 'c48n0a62', 'presenta a tiempo', 4, 4, 0.99),
	('n0as48|69', 'c48n0a69', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|72', 'c48n0a72', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|76', 'c48n0a76', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|77', 'c48n0a77', 'presenta a tiempo', 4, 0, 0.00),
	('n0as48|84', 'c48n0a84', 'presenta a tiempo', 4, 0, 0.00),
	('n0as49|117', 'c49n0a117', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|125', 'c49n0a125', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|127', 'c49n0a127', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|128', 'c49n0a128', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|13', 'c49n0a13', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|27', 'c49n0a27', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|32', 'c49n0a32', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|34', 'c49n0a34', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|44', 'c49n0a44', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|60', 'c49n0a60', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|62', 'c49n0a62', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|69', 'c49n0a69', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|76', 'c49n0a76', 'presenta a tiempo', 4, 4, 0.99),
	('n0as49|77', 'c49n0a77', 'presenta a tiempo', 4, 4, 0.99),
	('n0as50|125', 'c50n0a125', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as50|128', 'c50n0a128', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as50|13', 'c50n0a13', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|27', 'c50n0a27', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as50|32', 'c50n0a32', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|34', 'c50n0a34', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|41', 'c50n0a41', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|44', 'c50n0a44', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|60', 'c50n0a60', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|61', 'c50n0a61', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|62', 'c50n0a62', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|69', 'c50n0a69', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as50|72', 'c50n0a72', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|83', 'c50n0a83', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as50|84', 'c50n0a84', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as51|125', 'c51n0a125', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|127', 'c51n0a127', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|128', 'c51n0a128', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|13', 'c51n0a13', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as51|27', 'c51n0a27', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|32', 'c51n0a32', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|34', 'c51n0a34', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|41', 'c51n0a41', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|44', 'c51n0a44', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|55', 'c51n0a55', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|61', 'c51n0a61', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|62', 'c51n0a62', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|69', 'c51n0a69', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|72', 'c51n0a72', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as51|83', 'c51n0a83', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as52|117', 'c52n0a117', 'presenta a tiempo', 4, 4, 0.99),
	('n0as52|125', 'c52n0a125', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|127', 'c52n0a127', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|128', 'c52n0a128', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|13', 'c52n0a13', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|27', 'c52n0a27', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|32', 'c52n0a32', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|34', 'c52n0a34', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|41', 'c52n0a41', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|44', 'c52n0a44', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|55', 'c52n0a55', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|60', 'c52n0a60', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|61', 'c52n0a61', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|62', 'c52n0a62', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|69', 'c52n0a69', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|72', 'c52n0a72', 'presenta a tiempo', 4, 0, 0.00),
	('n0as52|76', 'c52n0a76', 'presenta a tiempo', 4, 0, 0.00),
	('n0as53|117', 'c53n0a117', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as53|128', 'c53n0a128', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as53|13', 'c53n0a13', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as53|27', 'c53n0a27', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as53|34', 'c53n0a34', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as53|41', 'c53n0a41', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as53|44', 'c53n0a44', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as53|55', 'c53n0a55', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 0, 0.00),
	('n0as53|60', 'c53n0a60', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 0, 0.00),
	('n0as53|61', 'c53n0a61', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 4, 0.99),
	('n0as53|62', 'c53n0a62', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 0, 0.00),
	('n0as53|72', 'c53n0a72', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 3, 0.75),
	('n0as53|76', 'c53n0a76', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as53|77', 'c53n0a77', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 1, 0.25),
	('n0as53|83', 'c53n0a83', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 4, 0.99),
	('n0as53|84', 'c53n0a84', 'el material hace buen uso del texto e imágenes como referencia para el expositor', 4, 4, 0.99),
	('n0as54|125', 'c54n0a125', 'presenta a tiempo', 4, 0, 0.00),
	('n0as54|127', 'c54n0a127', 'presenta a tiempo', 4, 4, 0.99),
	('n0as54|128', 'c54n0a128', 'presenta a tiempo', 4, 0, 0.00),
	('n0as54|27', 'c54n0a27', 'presenta a tiempo', 4, 0, 0.00),
	('n0as54|32', 'c54n0a32', 'presenta a tiempo', 4, 4, 0.99),
	('n0as54|34', 'c54n0a34', 'presenta a tiempo', 4, 4, 0.99),
	('n0as54|44', 'c54n0a44', 'presenta a tiempo', 4, 0, 0.00),
	('n0as54|60', 'c54n0a60', 'presenta a tiempo', 4, 4, 0.99),
	('n0as54|61', 'c54n0a61', 'presenta a tiempo', 4, 0, 0.00),
	('n0as54|69', 'c54n0a69', 'presenta a tiempo', 4, 4, 0.99),
	('n0as54|72', 'c54n0a72', 'presenta a tiempo', 4, 4, 0.99),
	('n0as55|125', 'c55n0a125', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|127', 'c55n0a127', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|128', 'c55n0a128', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|13', 'c55n0a13', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|27', 'c55n0a27', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|32', 'c55n0a32', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|34', 'c55n0a34', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|41', 'c55n0a41', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|44', 'c55n0a44', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|55', 'c55n0a55', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|60', 'c55n0a60', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|61', 'c55n0a61', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|62', 'c55n0a62', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|69', 'c55n0a69', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|72', 'c55n0a72', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|83', 'c55n0a83', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as55|84', 'c55n0a84', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|117', 'c56n0a117', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|125', 'c56n0a125', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|127', 'c56n0a127', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|128', 'c56n0a128', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|13', 'c56n0a13', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as56|27', 'c56n0a27', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|32', 'c56n0a32', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|34', 'c56n0a34', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as56|41', 'c56n0a41', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|44', 'c56n0a44', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as56|55', 'c56n0a55', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|60', 'c56n0a60', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as56|61', 'c56n0a61', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|62', 'c56n0a62', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|69', 'c56n0a69', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|72', 'c56n0a72', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|76', 'c56n0a76', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|77', 'c56n0a77', 'Entrega con todos los componentes solicitados', 3, 3, 0.99),
	('n0as56|83', 'c56n0a83', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n0as56|84', 'c56n0a84', 'Entrega con todos los componentes solicitados', 3, 1, 0.33),
	('n1as48|117', 'c48n1a117', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|124', 'c48n1a124', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|127', 'c48n1a127', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|128', 'c48n1a128', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|13', 'c48n1a13', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|32', 'c48n1a32', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|34', 'c48n1a34', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|44', 'c48n1a44', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|55', 'c48n1a55', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|60', 'c48n1a60', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|61', 'c48n1a61', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|62', 'c48n1a62', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|69', 'c48n1a69', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|72', 'c48n1a72', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|76', 'c48n1a76', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|77', 'c48n1a77', 'esta hecho a mano', 4, 4, 0.99),
	('n1as48|84', 'c48n1a84', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|117', 'c49n1a117', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|125', 'c49n1a125', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|127', 'c49n1a127', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|128', 'c49n1a128', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|13', 'c49n1a13', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|27', 'c49n1a27', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|32', 'c49n1a32', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|34', 'c49n1a34', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|44', 'c49n1a44', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|60', 'c49n1a60', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|62', 'c49n1a62', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|69', 'c49n1a69', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|76', 'c49n1a76', 'esta hecho a mano', 4, 4, 0.99),
	('n1as49|77', 'c49n1a77', 'esta hecho a mano', 4, 4, 0.99),
	('n1as50|125', 'c50n1a125', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|128', 'c50n1a128', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|13', 'c50n1a13', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 5, 0.99),
	('n1as50|27', 'c50n1a27', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|32', 'c50n1a32', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 1, 0.20),
	('n1as50|34', 'c50n1a34', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|41', 'c50n1a41', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 1, 0.20),
	('n1as50|44', 'c50n1a44', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 1, 0.20),
	('n1as50|60', 'c50n1a60', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|61', 'c50n1a61', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|62', 'c50n1a62', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|69', 'c50n1a69', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|72', 'c50n1a72', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as50|83', 'c50n1a83', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 1, 0.20),
	('n1as50|84', 'c50n1a84', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as51|125', 'c51n1a125', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|127', 'c51n1a127', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|128', 'c51n1a128', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|13', 'c51n1a13', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|27', 'c51n1a27', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|32', 'c51n1a32', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|34', 'c51n1a34', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|41', 'c51n1a41', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|44', 'c51n1a44', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|55', 'c51n1a55', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|61', 'c51n1a61', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|62', 'c51n1a62', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as51|69', 'c51n1a69', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|72', 'c51n1a72', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as51|83', 'c51n1a83', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as52|117', 'c52n1a117', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|125', 'c52n1a125', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|127', 'c52n1a127', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|128', 'c52n1a128', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|13', 'c52n1a13', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|27', 'c52n1a27', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|32', 'c52n1a32', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|34', 'c52n1a34', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|41', 'c52n1a41', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|44', 'c52n1a44', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|55', 'c52n1a55', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|60', 'c52n1a60', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|61', 'c52n1a61', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|62', 'c52n1a62', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|69', 'c52n1a69', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|72', 'c52n1a72', 'esta hecho a mano', 4, 4, 0.99),
	('n1as52|76', 'c52n1a76', 'esta hecho a mano', 4, 4, 0.99),
	('n1as53|117', 'c53n1a117', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|128', 'c53n1a128', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|13', 'c53n1a13', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 5, 0.99),
	('n1as53|27', 'c53n1a27', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|34', 'c53n1a34', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 5, 0.99),
	('n1as53|41', 'c53n1a41', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|44', 'c53n1a44', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 5, 0.99),
	('n1as53|55', 'c53n1a55', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 0, 0.00),
	('n1as53|60', 'c53n1a60', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|61', 'c53n1a61', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|62', 'c53n1a62', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 0, 0.00),
	('n1as53|72', 'c53n1a72', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 5, 0.99),
	('n1as53|76', 'c53n1a76', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|77', 'c53n1a77', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|83', 'c53n1a83', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as53|84', 'c53n1a84', 'Usa el nivel de voz adecuado así como la postura idonea durante la exposición', 5, 3, 0.60),
	('n1as54|125', 'c54n1a125', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|127', 'c54n1a127', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|128', 'c54n1a128', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|27', 'c54n1a27', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|32', 'c54n1a32', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|34', 'c54n1a34', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|44', 'c54n1a44', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|60', 'c54n1a60', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|61', 'c54n1a61', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|69', 'c54n1a69', 'esta hecho a mano', 4, 4, 0.99),
	('n1as54|72', 'c54n1a72', 'esta hecho a mano', 4, 4, 0.99),
	('n1as55|125', 'c55n1a125', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|127', 'c55n1a127', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|128', 'c55n1a128', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|13', 'c55n1a13', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as55|27', 'c55n1a27', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|32', 'c55n1a32', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as55|34', 'c55n1a34', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|41', 'c55n1a41', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|44', 'c55n1a44', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|55', 'c55n1a55', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as55|60', 'c55n1a60', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as55|61', 'c55n1a61', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|62', 'c55n1a62', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as55|69', 'c55n1a69', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|72', 'c55n1a72', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|83', 'c55n1a83', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as55|84', 'c55n1a84', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|117', 'c56n1a117', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|125', 'c56n1a125', 'los objetivos del trabajo son alcanzados', 4, 0, 0.00),
	('n1as56|127', 'c56n1a127', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|128', 'c56n1a128', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|13', 'c56n1a13', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|27', 'c56n1a27', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|32', 'c56n1a32', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|34', 'c56n1a34', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as56|41', 'c56n1a41', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|44', 'c56n1a44', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as56|55', 'c56n1a55', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|60', 'c56n1a60', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|61', 'c56n1a61', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|62', 'c56n1a62', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|69', 'c56n1a69', 'los objetivos del trabajo son alcanzados', 4, 0, 0.00),
	('n1as56|72', 'c56n1a72', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|76', 'c56n1a76', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|77', 'c56n1a77', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n1as56|83', 'c56n1a83', 'los objetivos del trabajo son alcanzados', 4, 4, 0.99),
	('n1as56|84', 'c56n1a84', 'los objetivos del trabajo son alcanzados', 4, 2, 0.50),
	('n2as48|117', 'c48n2a117', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|124', 'c48n2a124', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|127', 'c48n2a127', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|128', 'c48n2a128', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|13', 'c48n2a13', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|32', 'c48n2a32', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|34', 'c48n2a34', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|44', 'c48n2a44', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|55', 'c48n2a55', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|60', 'c48n2a60', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|61', 'c48n2a61', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|62', 'c48n2a62', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|69', 'c48n2a69', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|72', 'c48n2a72', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|76', 'c48n2a76', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|77', 'c48n2a77', 'contenido solicitado', 8, 8, 0.99),
	('n2as48|84', 'c48n2a84', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|117', 'c49n2a117', 'contenido solicitado', 8, 4, 0.50),
	('n2as49|125', 'c49n2a125', 'contenido solicitado', 8, 4, 0.50),
	('n2as49|127', 'c49n2a127', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|128', 'c49n2a128', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|13', 'c49n2a13', 'contenido solicitado', 8, 4, 0.50),
	('n2as49|27', 'c49n2a27', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|32', 'c49n2a32', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|34', 'c49n2a34', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|44', 'c49n2a44', 'contenido solicitado', 8, 4, 0.50),
	('n2as49|60', 'c49n2a60', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|62', 'c49n2a62', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|69', 'c49n2a69', 'contenido solicitado', 8, 8, 0.99),
	('n2as49|76', 'c49n2a76', 'contenido solicitado', 8, 4, 0.50),
	('n2as49|77', 'c49n2a77', 'contenido solicitado', 8, 4, 0.50),
	('n2as50|125', 'c50n2a125', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|128', 'c50n2a128', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as50|13', 'c50n2a13', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as50|27', 'c50n2a27', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as50|32', 'c50n2a32', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|34', 'c50n2a34', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as50|41', 'c50n2a41', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|44', 'c50n2a44', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as50|60', 'c50n2a60', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as50|61', 'c50n2a61', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as50|62', 'c50n2a62', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|69', 'c50n2a69', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|72', 'c50n2a72', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|83', 'c50n2a83', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as50|84', 'c50n2a84', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as51|125', 'c51n2a125', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|127', 'c51n2a127', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|128', 'c51n2a128', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|13', 'c51n2a13', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as51|27', 'c51n2a27', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|32', 'c51n2a32', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as51|34', 'c51n2a34', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|41', 'c51n2a41', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|44', 'c51n2a44', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|55', 'c51n2a55', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as51|61', 'c51n2a61', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|62', 'c51n2a62', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as51|69', 'c51n2a69', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|72', 'c51n2a72', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as51|83', 'c51n2a83', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as52|117', 'c52n2a117', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|125', 'c52n2a125', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|127', 'c52n2a127', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|128', 'c52n2a128', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|13', 'c52n2a13', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|27', 'c52n2a27', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|32', 'c52n2a32', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|34', 'c52n2a34', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|41', 'c52n2a41', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|44', 'c52n2a44', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|55', 'c52n2a55', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|60', 'c52n2a60', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|61', 'c52n2a61', 'contenido solicitado', 8, 4, 0.50),
	('n2as52|62', 'c52n2a62', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|69', 'c52n2a69', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|72', 'c52n2a72', 'contenido solicitado', 8, 8, 0.99),
	('n2as52|76', 'c52n2a76', 'contenido solicitado', 8, 8, 0.99),
	('n2as53|117', 'c53n2a117', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as53|128', 'c53n2a128', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|13', 'c53n2a13', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|27', 'c53n2a27', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|34', 'c53n2a34', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as53|41', 'c53n2a41', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|44', 'c53n2a44', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|55', 'c53n2a55', 'Casi no lee las diapositivas durante la exposición', 5, 0, 0.00),
	('n2as53|60', 'c53n2a60', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as53|61', 'c53n2a61', 'Casi no lee las diapositivas durante la exposición', 5, 5, 0.99),
	('n2as53|62', 'c53n2a62', 'Casi no lee las diapositivas durante la exposición', 5, 0, 0.00),
	('n2as53|72', 'c53n2a72', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|76', 'c53n2a76', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as53|77', 'c53n2a77', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|83', 'c53n2a83', 'Casi no lee las diapositivas durante la exposición', 5, 3, 0.60),
	('n2as53|84', 'c53n2a84', 'Casi no lee las diapositivas durante la exposición', 5, 1, 0.20),
	('n2as54|125', 'c54n2a125', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|127', 'c54n2a127', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|128', 'c54n2a128', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|27', 'c54n2a27', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|32', 'c54n2a32', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|34', 'c54n2a34', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|44', 'c54n2a44', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|60', 'c54n2a60', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|61', 'c54n2a61', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|69', 'c54n2a69', 'contenido solicitado', 8, 8, 0.99),
	('n2as54|72', 'c54n2a72', 'contenido solicitado', 8, 8, 0.99),
	('n2as55|125', 'c55n2a125', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|127', 'c55n2a127', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|128', 'c55n2a128', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|13', 'c55n2a13', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as55|27', 'c55n2a27', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|32', 'c55n2a32', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as55|34', 'c55n2a34', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|41', 'c55n2a41', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|44', 'c55n2a44', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|55', 'c55n2a55', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as55|60', 'c55n2a60', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as55|61', 'c55n2a61', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|62', 'c55n2a62', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as55|69', 'c55n2a69', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|72', 'c55n2a72', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|83', 'c55n2a83', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as55|84', 'c55n2a84', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as56|117', 'c56n2a117', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|125', 'c56n2a125', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|127', 'c56n2a127', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|128', 'c56n2a128', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|13', 'c56n2a13', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as56|27', 'c56n2a27', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|32', 'c56n2a32', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|34', 'c56n2a34', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as56|41', 'c56n2a41', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|44', 'c56n2a44', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as56|55', 'c56n2a55', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|60', 'c56n2a60', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n2as56|61', 'c56n2a61', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|62', 'c56n2a62', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|69', 'c56n2a69', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|72', 'c56n2a72', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|76', 'c56n2a76', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|77', 'c56n2a77', 'se desarrolla completamente el contenido solicitado', 4, 0, 0.00),
	('n2as56|83', 'c56n2a83', 'se desarrolla completamente el contenido solicitado', 4, 4, 0.99),
	('n2as56|84', 'c56n2a84', 'se desarrolla completamente el contenido solicitado', 4, 2, 0.50),
	('n3as48|117', 'c48n3a117', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|124', 'c48n3a124', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|127', 'c48n3a127', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|128', 'c48n3a128', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|13', 'c48n3a13', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|32', 'c48n3a32', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|34', 'c48n3a34', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|44', 'c48n3a44', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|55', 'c48n3a55', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|60', 'c48n3a60', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|61', 'c48n3a61', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|62', 'c48n3a62', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|69', 'c48n3a69', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|72', 'c48n3a72', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|76', 'c48n3a76', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|77', 'c48n3a77', 'tiene imágenes', 4, 4, 0.99),
	('n3as48|84', 'c48n3a84', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|117', 'c49n3a117', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|125', 'c49n3a125', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|127', 'c49n3a127', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|128', 'c49n3a128', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|13', 'c49n3a13', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|27', 'c49n3a27', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|32', 'c49n3a32', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|34', 'c49n3a34', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|44', 'c49n3a44', 'tiene imágenes', 4, 4, 0.99),
	('n3as49|60', 'c49n3a60', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|62', 'c49n3a62', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|69', 'c49n3a69', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|76', 'c49n3a76', 'tiene imágenes', 4, 0, 0.00),
	('n3as49|77', 'c49n3a77', 'tiene imágenes', 4, 0, 0.00),
	('n3as50|125', 'c50n3a125', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|128', 'c50n3a128', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|13', 'c50n3a13', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|27', 'c50n3a27', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|32', 'c50n3a32', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|34', 'c50n3a34', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|41', 'c50n3a41', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|44', 'c50n3a44', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|60', 'c50n3a60', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|61', 'c50n3a61', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|62', 'c50n3a62', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|69', 'c50n3a69', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|72', 'c50n3a72', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|83', 'c50n3a83', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as50|84', 'c50n3a84', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as51|125', 'c51n3a125', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|127', 'c51n3a127', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as51|128', 'c51n3a128', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as51|13', 'c51n3a13', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|27', 'c51n3a27', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as51|32', 'c51n3a32', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|34', 'c51n3a34', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|41', 'c51n3a41', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|44', 'c51n3a44', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as51|55', 'c51n3a55', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|61', 'c51n3a61', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|62', 'c51n3a62', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|69', 'c51n3a69', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|72', 'c51n3a72', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as51|83', 'c51n3a83', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as52|117', 'c52n3a117', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|125', 'c52n3a125', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|127', 'c52n3a127', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|128', 'c52n3a128', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|13', 'c52n3a13', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|27', 'c52n3a27', 'tiene imágenes', 4, 0, 0.00),
	('n3as52|32', 'c52n3a32', 'tiene imágenes', 4, 0, 0.00),
	('n3as52|34', 'c52n3a34', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|41', 'c52n3a41', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|44', 'c52n3a44', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|55', 'c52n3a55', 'tiene imágenes', 4, 0, 0.00),
	('n3as52|60', 'c52n3a60', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|61', 'c52n3a61', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|62', 'c52n3a62', 'tiene imágenes', 4, 0, 0.00),
	('n3as52|69', 'c52n3a69', 'tiene imágenes', 4, 4, 0.99),
	('n3as52|72', 'c52n3a72', 'tiene imágenes', 4, 0, 0.00),
	('n3as52|76', 'c52n3a76', 'tiene imágenes', 4, 4, 0.99),
	('n3as53|117', 'c53n3a117', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|128', 'c53n3a128', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|13', 'c53n3a13', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|27', 'c53n3a27', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|34', 'c53n3a34', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|41', 'c53n3a41', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|44', 'c53n3a44', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|55', 'c53n3a55', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|60', 'c53n3a60', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|61', 'c53n3a61', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|62', 'c53n3a62', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|72', 'c53n3a72', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|76', 'c53n3a76', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|77', 'c53n3a77', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|83', 'c53n3a83', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as53|84', 'c53n3a84', 'Las conclusiones aportan al tema de exposición', 3, 2, 0.67),
	('n3as54|125', 'c54n3a125', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|127', 'c54n3a127', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|128', 'c54n3a128', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|27', 'c54n3a27', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|32', 'c54n3a32', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|34', 'c54n3a34', 'tiene imágenes', 4, 4, 0.99),
	('n3as54|44', 'c54n3a44', 'tiene imágenes', 4, 4, 0.99),
	('n3as54|60', 'c54n3a60', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|61', 'c54n3a61', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|69', 'c54n3a69', 'tiene imágenes', 4, 0, 0.00),
	('n3as54|72', 'c54n3a72', 'tiene imágenes', 4, 0, 0.00),
	('n3as55|125', 'c55n3a125', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|127', 'c55n3a127', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|128', 'c55n3a128', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|13', 'c55n3a13', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as55|27', 'c55n3a27', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|32', 'c55n3a32', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|34', 'c55n3a34', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|41', 'c55n3a41', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as55|44', 'c55n3a44', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|55', 'c55n3a55', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|60', 'c55n3a60', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as55|61', 'c55n3a61', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as55|62', 'c55n3a62', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|69', 'c55n3a69', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|72', 'c55n3a72', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|83', 'c55n3a83', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as55|84', 'c55n3a84', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|117', 'c56n3a117', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|125', 'c56n3a125', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|127', 'c56n3a127', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|128', 'c56n3a128', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|13', 'c56n3a13', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|27', 'c56n3a27', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|32', 'c56n3a32', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|34', 'c56n3a34', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|41', 'c56n3a41', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|44', 'c56n3a44', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|55', 'c56n3a55', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|60', 'c56n3a60', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|61', 'c56n3a61', 'las conclusiones o recomendaciones aportan al trabajo', 4, 4, 0.99),
	('n3as56|62', 'c56n3a62', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|69', 'c56n3a69', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|72', 'c56n3a72', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|76', 'c56n3a76', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|77', 'c56n3a77', 'las conclusiones o recomendaciones aportan al trabajo', 4, 0, 0.00),
	('n3as56|83', 'c56n3a83', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n3as56|84', 'c56n3a84', 'las conclusiones o recomendaciones aportan al trabajo', 4, 2, 0.50),
	('n4as50|125', 'c50n4a125', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|128', 'c50n4a128', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|13', 'c50n4a13', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|27', 'c50n4a27', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|32', 'c50n4a32', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|34', 'c50n4a34', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|41', 'c50n4a41', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|44', 'c50n4a44', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|60', 'c50n4a60', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|61', 'c50n4a61', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|62', 'c50n4a62', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|69', 'c50n4a69', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|72', 'c50n4a72', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as50|83', 'c50n4a83', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as50|84', 'c50n4a84', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as51|125', 'c51n4a125', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|127', 'c51n4a127', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|128', 'c51n4a128', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|13', 'c51n4a13', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|27', 'c51n4a27', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|32', 'c51n4a32', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|34', 'c51n4a34', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|41', 'c51n4a41', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|44', 'c51n4a44', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|55', 'c51n4a55', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|61', 'c51n4a61', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|62', 'c51n4a62', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|69', 'c51n4a69', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|72', 'c51n4a72', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as51|83', 'c51n4a83', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as53|117', 'c53n4a117', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|128', 'c53n4a128', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|13', 'c53n4a13', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|27', 'c53n4a27', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|34', 'c53n4a34', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|41', 'c53n4a41', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|44', 'c53n4a44', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|55', 'c53n4a55', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as53|60', 'c53n4a60', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|61', 'c53n4a61', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|62', 'c53n4a62', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as53|72', 'c53n4a72', 'Contesta con sustento y adecuadamente a las preguntas', 3, 3, 0.99),
	('n4as53|76', 'c53n4a76', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|77', 'c53n4a77', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|83', 'c53n4a83', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as53|84', 'c53n4a84', 'Contesta con sustento y adecuadamente a las preguntas', 3, 2, 0.67),
	('n4as55|125', 'c55n4a125', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|127', 'c55n4a127', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|128', 'c55n4a128', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|13', 'c55n4a13', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|27', 'c55n4a27', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|32', 'c55n4a32', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as55|34', 'c55n4a34', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|41', 'c55n4a41', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|44', 'c55n4a44', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|55', 'c55n4a55', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as55|60', 'c55n4a60', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|61', 'c55n4a61', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|62', 'c55n4a62', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as55|69', 'c55n4a69', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|72', 'c55n4a72', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|83', 'c55n4a83', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as55|84', 'c55n4a84', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|117', 'c56n4a117', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|125', 'c56n4a125', 'no tiene faltas ortograficas ni de redaccion', 2, 0, 0.00),
	('n4as56|127', 'c56n4a127', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|128', 'c56n4a128', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|13', 'c56n4a13', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|27', 'c56n4a27', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|32', 'c56n4a32', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|34', 'c56n4a34', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|41', 'c56n4a41', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|44', 'c56n4a44', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|55', 'c56n4a55', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|60', 'c56n4a60', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|61', 'c56n4a61', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|62', 'c56n4a62', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|69', 'c56n4a69', 'no tiene faltas ortograficas ni de redaccion', 2, 0, 0.00),
	('n4as56|72', 'c56n4a72', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|76', 'c56n4a76', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|77', 'c56n4a77', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n4as56|83', 'c56n4a83', 'no tiene faltas ortograficas ni de redaccion', 2, 2, 0.99),
	('n4as56|84', 'c56n4a84', 'no tiene faltas ortograficas ni de redaccion', 2, 1, 0.50),
	('n5as51|125', 'c51n5a125', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|127', 'c51n5a127', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|128', 'c51n5a128', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|13', 'c51n5a13', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|27', 'c51n5a27', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|32', 'c51n5a32', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|34', 'c51n5a34', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|41', 'c51n5a41', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|44', 'c51n5a44', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|55', 'c51n5a55', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|61', 'c51n5a61', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|62', 'c51n5a62', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|69', 'c51n5a69', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|72', 'c51n5a72', 'entrega a tiempo', 3, 3, 0.99),
	('n5as51|83', 'c51n5a83', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|125', 'c55n5a125', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|127', 'c55n5a127', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|128', 'c55n5a128', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|13', 'c55n5a13', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|27', 'c55n5a27', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|32', 'c55n5a32', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|34', 'c55n5a34', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|41', 'c55n5a41', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|44', 'c55n5a44', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|55', 'c55n5a55', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|60', 'c55n5a60', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|61', 'c55n5a61', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|62', 'c55n5a62', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|69', 'c55n5a69', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|72', 'c55n5a72', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|83', 'c55n5a83', 'entrega a tiempo', 3, 3, 0.99),
	('n5as55|84', 'c55n5a84', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|117', 'c56n5a117', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|125', 'c56n5a125', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|127', 'c56n5a127', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|128', 'c56n5a128', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|13', 'c56n5a13', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|27', 'c56n5a27', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|32', 'c56n5a32', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|34', 'c56n5a34', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|41', 'c56n5a41', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|44', 'c56n5a44', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|55', 'c56n5a55', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|60', 'c56n5a60', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|61', 'c56n5a61', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|62', 'c56n5a62', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|69', 'c56n5a69', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|72', 'c56n5a72', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|76', 'c56n5a76', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|77', 'c56n5a77', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|83', 'c56n5a83', 'entrega a tiempo', 3, 3, 0.99),
	('n5as56|84', 'c56n5a84', 'entrega a tiempo', 3, 3, 0.99);
/*!40000 ALTER TABLE `mdl_nivel` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_objetivoeducacional
DROP TABLE IF EXISTS `mdl_objetivoeducacional`;
CREATE TABLE IF NOT EXISTS `mdl_objetivoeducacional` (
  `Cod_Escuela` varchar(8) DEFAULT NULL,
  `Cod_Objetivo` varchar(8) NOT NULL,
  `Descripcion` varchar(1024) NOT NULL,
  PRIMARY KEY (`Cod_Objetivo`),
  KEY `Cod_Escuela` (`Cod_Escuela`),
  CONSTRAINT `mdl_objetivoeducacional_ibfk_1` FOREIGN KEY (`Cod_Escuela`) REFERENCES `mdl_escuela` (`Cod_Escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_objetivoeducacional: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_objetivoeducacional` DISABLE KEYS */;
INSERT INTO `mdl_objetivoeducacional` (`Cod_Escuela`, `Cod_Objetivo`, `Descripcion`) VALUES
	('SIS', 'OB1', 'Dominar Tecnologías de Información y Comunicación siendo capaz de investigar e innovar de acuerdo a la exigencia del mercado.'),
	('SIS', 'OB2', 'Liderar y/o conformar a nivel regional, nacional e internacional equipos de carácter interdisciplinario y multidisciplinario demostrando conducta ética y practicando valores andinos.'),
	('SIS', 'OB3', 'Desarrollar y gestionar proyectos de sistemas de información que satisfagan y respondan las necesidades organizacionales para el desarrollo sostenible de la sociedad.');
/*!40000 ALTER TABLE `mdl_objetivoeducacional` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_persona
DROP TABLE IF EXISTS `mdl_persona`;
CREATE TABLE IF NOT EXISTS `mdl_persona` (
  `Cod_Persona` varchar(20) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(150) DEFAULT NULL,
  `NomPersona` varchar(200) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Grado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_persona: ~54 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_persona` DISABLE KEYS */;
INSERT INTO `mdl_persona` (`Cod_Persona`, `Nombre`, `Apellidos`, `NomPersona`, `Correo`, `Grado`) VALUES
	('100', 'LUIS ANTONY', 'MERMA LOPEZ', '014100841B', '014100841B@uandina.edu.pe', 'Student'),
	('101', 'PAVEL RODRIGO', 'ARIZABAL CACERES', '015301071I', '015301071I@uandina.edu.pe', 'Student'),
	('102', 'ALIVELI', 'BALLON GRANDE', '011300132H', '011300132H@uandina.edu.pe', 'Student'),
	('103', 'FRIDMAN URIEL', 'HUALLPA SERRANO', '015200492I', '015200492I@uandina.edu.pe', 'Student'),
	('104', 'BRIAL LOBSANG', 'REVILLA CASTRO', '015301130E', '015301130E@uandina.edu.pe', 'Student'),
	('105', 'GIANFRANCO RAMIRO', 'ALEJO MEDINA', '016100037G', '016100037G@uandina.edu.pe', 'Student'),
	('106', 'JOHAN NICOLAS', 'ROJAS ASTETE', '014200814G', '014200814G@uandina.edu.pe', 'Student'),
	('107', 'ROY ERICK', 'TRUJILLANO ORUE', '012200698I', '012200698I@uandina.edu.pe', 'Student'),
	('108', 'JHONATAN ELVIS HUMBERTO', 'VALLE VALENCIA', '013300554H', '013300554H@uandina.edu.pe', 'Student'),
	('109', 'KENYI ALEXIS', 'CHILLITUPA MONJE', '013100343C', '013100343C@uandina.edu.pe', 'Student'),
	('110', 'JOSUE JÜRKEN', 'CHOQUE CCANCCAHUA', '015200256C', '015200256C@uandina.edu.pe', 'Student'),
	('111', 'DANIELA DEL CARMEN', 'GUTIERREZ GONZALES', '015100662J', '015100662J@uandina.edu.pe', 'Student'),
	('112', 'BRAYAN SNADER', 'SIERRA RIVEROS', '018101768C', '018101768C@uandina.edu.pe', 'Student'),
	('117', 'JOHN WILBERT', 'SALAS FERRANDIZ', '011100247F', '011100247F@uandina.edu.pe', 'Student'),
	('122', 'YOSIMAR', 'MEDRANO TIPO', '012100603F', '012100603F@uandina.edu.pe', 'Student'),
	('124', 'ALFREDO OSCAR', 'YUPANQUI CUBA', '009100969F', '009100969F@uandina.edu.pe', 'Student'),
	('125', 'JUNIOR EDU', 'CONTRERAS QUISPEINGA', '010100916F', '010100916F@uandina.edu.pe', 'Student'),
	('127', 'ANGELA FERNANDA', 'SALIZAR ROZAS', '013300200A', '013300200A@uandina.edu.pe', 'Student'),
	('128', 'MELISSA', 'PALOMINO MORA', '014200116H', '014200116H@uandina.edu.pe', 'Student'),
	('13', 'YISHAR NAHUM', 'YANQUI CUELLO', '014100608F', '014100608F@uandina.edu.pe', 'Student'),
	('20', 'DANIEL GREGORIO', 'PARI JALISTO', '009200563A', '009200563A@uandina.edu.pe', 'Student'),
	('27', 'OLGER WALDIR', 'PEÑA PALOMINO', '010200862E', '010200862E@uandina.edu.pe', 'Student'),
	('32', 'EDU GUMER', 'CACERES HUAMAN', '014100829B', '014100829B@uandina.edu.pe', 'Student'),
	('33', 'DILMELITH', 'KATEGARI ITURRIAGA', '015100690C', '015100690C@uandina.edu.pe', 'Student'),
	('34', 'LUCY ALEXANDRA', 'CCOSCO HANCCO', '015200223H', '015200223H@uandina.edu.pe', 'Student'),
	('41', 'JOSEP JAIRO', 'ROJAS BACA', '014200310I', '014200310I@uandina.edu.pe', 'Student'),
	('44', 'ALEXANDER', 'PAUCCAR HUAMAN', '014200451A', '014200451A@uandina.edu.pe', 'Student'),
	('51', 'GARY SIXTO', 'ORTIZ SANCHEZ', '013100586C', '013100586C@uandina.edu.pe', 'Student'),
	('55', 'ALBERT ANTHONY', 'CARDENAS NUÑEZ', '000061427E', '000061427E@uandina.edu.pe', 'Student'),
	('6', 'IVAN', 'MOLERO DELGADO', 'imolero', 'imolero@uandina.edu.pe', 'Student'),
	('60', 'CARLOS', 'SANTOS CASTRO', '013300074F', '013300074F@uandina.edu.pe', 'Student'),
	('61', 'ROMARIO', 'COAQUIRA HUILLCA', '014200255H', '014200255H@uandina.edu.pe', 'Student'),
	('62', 'OSKAR', 'CUNISI CHUQUITAPA', '008100800B', '008100800B@uandina.edu.pe', 'Student'),
	('69', 'CESAR AUGUSTO', 'ALVAREZ ALARCON', '013300613D', '013300613D@uandina.edu.pe', 'Student'),
	('72', 'HAROLD THOMAS', 'GALDO BAUTISTA', '014101125I', '014101125I@uandina.edu.pe', 'Student'),
	('76', 'LUIS ALBERTO', 'VIZCARRA VARGAS', '011100251C', '011100251C@uandina.edu.pe', 'Student'),
	('77', 'HENRY', 'HUANCA SONCCO', '013100188H', '013100188H@uandina.edu.pe', 'Student'),
	('83', 'JONATHAN STEVE', 'LA TORRE HOLGUIN', '014200404C', '014200404C@uandina.edu.pe', 'Student'),
	('84', 'DIEGO DAVID', 'ORTIZ CARMELINO', '013300415H', '013300415H@uandina.edu.pe', 'Student'),
	('85', 'STEFANO MICHAEL', 'PORTILLO USCAMAITA', '015200815B', '015200815B@uandina.edu.pe', 'Student'),
	('86', 'ANTHONY BREAN', 'SANCHEZ ORMACHEA', '015300879B', '015300879B@uandina.edu.pe', 'Student'),
	('87', 'JOSE WILFREDO', 'SEGUNDO GARCIA', '012200368I', '012200368I@uandina.edu.pe', 'Student'),
	('88', 'YORDDY LUIS', 'VALENCIA MOLINA', '014100390K', '014100390K@uandina.edu.pe', 'Student'),
	('89', 'ROMULO GERARDO', 'SANCHEZ ISMODES', '016101476D', '016101476D@uandina.edu.pe', 'Student'),
	('90', 'JUAN CARLOS', 'FLOREZ PHACSI', '013100675F', '013100675F@uandina.edu.pe', 'Student'),
	('91', 'ALVARO ALFONSO', 'PEREZ GALICIA', '015100337A', '015100337A@uandina.edu.pe', 'Student'),
	('92', 'DANY NICOLAS', 'CAMACHO TELLO', '011200415H', '011200415H@uandina.edu.pe', 'Student'),
	('93', 'ANTHONY MARCELO', 'ALVAREZ ASTETE', '015100742C', '015100742C@uandina.edu.pe', 'Student'),
	('94', 'DILMAR', 'RAMOS RIQUELME', '014100586B', '014100586B@uandina.edu.pe', 'Student'),
	('95', 'KRISMAN EXEL', 'QUISPE HUANCA', '012200381E', '012200381E@uandina.edu.pe', 'Student'),
	('96', 'ARACELI YESEMIA', 'KCANA CCOHUANQUI', '015301100I', '015301100I@uandina.edu.pe', 'Student'),
	('97', 'JUAN ANTONIO', 'BANDERA CONDORI', '013200286A', '013200286A@uandina.edu.pe', 'Student'),
	('98', 'DARCY JONATAN', 'SUCLLI PACHACUTEC', '015100773F', '015100773F@uandina.edu.pe', 'Student'),
	('99', 'JEAN MARCELO', 'PRADA VALDERRAMA', '016101246I', '016101246I@uandina.edu.pe', 'Student');
/*!40000 ALTER TABLE `mdl_persona` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_resulcursobjetivo
DROP TABLE IF EXISTS `mdl_resulcursobjetivo`;
CREATE TABLE IF NOT EXISTS `mdl_resulcursobjetivo` (
  `Cod_ResulCursObjetivo` varchar(16) NOT NULL,
  `Cod_Resultado` varchar(16) NOT NULL,
  `Cod_Curso` varchar(16) NOT NULL,
  PRIMARY KEY (`Cod_ResulCursObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_resulcursobjetivo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_resulcursobjetivo` DISABLE KEYS */;
INSERT INTO `mdl_resulcursobjetivo` (`Cod_ResulCursObjetivo`, `Cod_Objetivo`, `Cod_Resultado`, `Cod_Curso`) VALUES
	('OB1-RE_A', 'OB1', 'RE_A', '5'),
	('OB1-RE_F', 'OB1', 'RE_F', '5');
/*!40000 ALTER TABLE `mdl_resulcursobjetivo` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_resultadoestudiante
DROP TABLE IF EXISTS `mdl_resultadoestudiante`;
CREATE TABLE IF NOT EXISTS `mdl_resultadoestudiante` (
  `Cod_Resultado` varchar(8) NOT NULL,
  `NomResultado` varchar(200) NOT NULL,
  `Descripcion` varchar(1024) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_resultadoestudiante: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_resultadoestudiante` DISABLE KEYS */;
INSERT INTO `mdl_resultadoestudiante` (`Cod_Resultado`, `NomResultado`, `Descripcion`, `valor`) VALUES
	('RE_A', 'Conocimientos de Computación', 'La capacidad de aplicar conocimientos de matemáticas, ciencias, computación y una especialidad de computación apropiados para los resultados del estudiante y la disciplina del programa.', 1),
	('RE_B', 'Análisis de Problemas', 'La capacidad de identificar, formular, investigar literatura y resolver problemas complejos de computación y otras disciplinas relevantes en el dominio.', 1),
	('RE_C', 'Diseño y Desarrollo de Soluciones', 'La capacidad de diseñar, implementar y evaluar soluciones a problemas complejos de computación y diseñar y evaluar sistemas, componentes o procesos que satisfacen las necesidades específicas.', 1),
	('RE_D', 'Trabajo Individual y en Equipo', 'La capacidad de desenvolverse eficazmente como individuo, como miembro o líder de equipos diversos.', 1),
	('RE_E', 'Comunicación', 'La capacidad de comunicarse eficazmente, de forma oral y escrita, en una variedad de contextos profesionales.', 1),
	('RE_F', 'Profesionalismo y Sociedad', 'La capacidad de analizar el impacto local y global de la computación sobre las personas, las organizaciones y la sociedad.', 1),
	('RE_G', 'Aprendizaje continuo', 'La capacidad de reconocer la necesidad del aprendizaje y el desarrollo profesional continuo.', 1),
	('RE_H', 'Uso de Herramientas Modernas', 'La capacidad de crear, seleccionar, adaptar y aplicar técnicas, recursos y herramientas modernas para la práctica de la computación, con la comprensión de sus limitaciones.', 1),
	('RE_I', 'Apoyo en Ejecución', 'La comprensión y la capacidad para apoyar el uso, ejecución y gestión de sistemas de información dentro de un entorno de aplicación.', 1);
/*!40000 ALTER TABLE `mdl_resultadoestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_rubrica
DROP TABLE IF EXISTS `mdl_rubrica`;
CREATE TABLE IF NOT EXISTS `mdl_rubrica` (
  `Cod_RubricaPersona` varchar(16) NOT NULL,
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Asignacion` varchar(8) DEFAULT NULL,
  `Cod_Persona` varchar(8) DEFAULT NULL,
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `NomRubrica` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(1024) DEFAULT NULL,
  `Nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_RubricaPersona`),
  KEY `Cod_Asignacion` (`Cod_Asignacion`),
  KEY `Cod_Persona` (`Cod_Persona`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_rubrica_ibfk_1` FOREIGN KEY (`Cod_Asignacion`) REFERENCES `mdl_asignacion` (`Cod_Asignacion`),
  CONSTRAINT `mdl_rubrica_ibfk_2` FOREIGN KEY (`Cod_Persona`) REFERENCES `mdl_persona` (`Cod_Persona`),
  CONSTRAINT `mdl_rubrica_ibfk_3` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_rubrica: ~142 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_rubrica` DISABLE KEYS */;
INSERT INTO `mdl_rubrica` (`Cod_RubricaPersona`, `Cod_Rubrica`, `Cod_Asignacion`, `Cod_Persona`, `Cod_Curso`, `NomRubrica`, `Descripcion`, `Nota`) VALUES
	('r48-117', 'r48', '115', '117', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|534|48|117', 16),
	('r48-124', 'r48', '115', '124', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|546|48|124', 16),
	('r48-127', 'r48', '115', '127', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|547|48|127', 16),
	('r48-128', 'r48', '115', '128', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|548|48|128', 16),
	('r48-13', 'r48', '115', '13', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|532|48|13', 16),
	('r48-32', 'r48', '115', '32', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|533|48|32', 20),
	('r48-34', 'r48', '115', '34', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|535|48|34', 16),
	('r48-44', 'r48', '115', '44', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|537|48|44', 16),
	('r48-55', 'r48', '115', '55', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|538|48|55', 20),
	('r48-60', 'r48', '115', '60', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|539|48|60', 16),
	('r48-61', 'r48', '115', '61', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|540|48|61', 16),
	('r48-62', 'r48', '115', '62', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|541|48|62', 20),
	('r48-69', 'r48', '115', '69', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|542|48|69', 16),
	('r48-72', 'r48', '115', '72', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|543|48|72', 16),
	('r48-76', 'r48', '115', '76', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|544|48|76', 16),
	('r48-77', 'r48', '115', '77', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|545|48|77', 16),
	('r48-84', 'r48', '115', '84', '5', 'Rubrica (Mapa mental lectura - que es la ciencia)', 'Rubrica(Mapa mental lectura - que es la ciencia)|549|48|84', 16),
	('r49-117', 'r49', '119', '117', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|553|49|117', 12),
	('r49-125', 'r49', '119', '125', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|561|49|125', 12),
	('r49-127', 'r49', '119', '127', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|562|49|127', 20),
	('r49-128', 'r49', '119', '128', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|563|49|128', 20),
	('r49-13', 'r49', '119', '13', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|550|49|13', 16),
	('r49-27', 'r49', '119', '27', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|551|49|27', 20),
	('r49-32', 'r49', '119', '32', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|552|49|32', 16),
	('r49-34', 'r49', '119', '34', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|554|49|34', 20),
	('r49-44', 'r49', '119', '44', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|555|49|44', 16),
	('r49-60', 'r49', '119', '60', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|556|49|60', 16),
	('r49-62', 'r49', '119', '62', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|557|49|62', 16),
	('r49-69', 'r49', '119', '69', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|558|49|69', 16),
	('r49-76', 'r49', '119', '76', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|559|49|76', 12),
	('r49-77', 'r49', '119', '77', '5', 'Rubrica (Mapa mental lectura - capítulos del 01 al 04)', 'Rubrica(Mapa mental lectura - capítulos del 01 al 04)|560|49|77', 12),
	('r50-125', 'r50', '121', '125', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|576|50|125', 9),
	('r50-128', 'r50', '121', '128', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|578|50|128', 11),
	('r50-13', 'r50', '121', '13', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|565|50|13', 18),
	('r50-27', 'r50', '121', '27', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|566|50|27', 11),
	('r50-32', 'r50', '121', '32', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|567|50|32', 10),
	('r50-34', 'r50', '121', '34', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|568|50|34', 16),
	('r50-41', 'r50', '121', '41', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|569|50|41', 9),
	('r50-44', 'r50', '121', '44', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|570|50|44', 12),
	('r50-60', 'r50', '121', '60', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|571|50|60', 15),
	('r50-61', 'r50', '121', '61', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|572|50|61', 15),
	('r50-62', 'r50', '121', '62', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|573|50|62', 12),
	('r50-69', 'r50', '121', '69', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|574|50|69', 9),
	('r50-72', 'r50', '121', '72', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|575|50|72', 11),
	('r50-83', 'r50', '121', '83', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|577|50|83', 10),
	('r50-84', 'r50', '121', '84', '5', 'Rubrica (Infografia lectura - capítulos del 05 al 08)', 'Rubrica(Infografia lectura - capítulos del 05 al 08)|579|50|84', 14),
	('r51-125', 'r51', '123', '125', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|591|51|125', 16),
	('r51-127', 'r51', '123', '127', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|592|51|127', 12),
	('r51-128', 'r51', '123', '128', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|594|51|128', 12),
	('r51-13', 'r51', '123', '13', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|580|51|13', 20),
	('r51-27', 'r51', '123', '27', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|581|51|27', 12),
	('r51-32', 'r51', '123', '32', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|582|51|32', 16),
	('r51-34', 'r51', '123', '34', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|583|51|34', 16),
	('r51-41', 'r51', '123', '41', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|584|51|41', 16),
	('r51-44', 'r51', '123', '44', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|585|51|44', 14),
	('r51-55', 'r51', '123', '55', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|586|51|55', 16),
	('r51-61', 'r51', '123', '61', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|587|51|61', 16),
	('r51-62', 'r51', '123', '62', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|588|51|62', 16),
	('r51-69', 'r51', '123', '69', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|589|51|69', 16),
	('r51-72', 'r51', '123', '72', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|590|51|72', 16),
	('r51-83', 'r51', '123', '83', '5', 'Rubrica (Zotero -  Organizar referencias)', 'Rubrica(Zotero -  Organizar referencias)|593|51|83', 14),
	('r52-117', 'r52', '125', '117', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|598|52|117', 20),
	('r52-125', 'r52', '125', '125', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|609|52|125', 16),
	('r52-127', 'r52', '125', '127', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|610|52|127', 16),
	('r52-128', 'r52', '125', '128', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|611|52|128', 16),
	('r52-13', 'r52', '125', '13', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|595|52|13', 16),
	('r52-27', 'r52', '125', '27', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|596|52|27', 12),
	('r52-32', 'r52', '125', '32', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|597|52|32', 12),
	('r52-34', 'r52', '125', '34', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|599|52|34', 16),
	('r52-41', 'r52', '125', '41', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|600|52|41', 16),
	('r52-44', 'r52', '125', '44', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|601|52|44', 16),
	('r52-55', 'r52', '125', '55', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|602|52|55', 12),
	('r52-60', 'r52', '125', '60', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|603|52|60', 16),
	('r52-61', 'r52', '125', '61', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|604|52|61', 12),
	('r52-62', 'r52', '125', '62', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|605|52|62', 12),
	('r52-69', 'r52', '125', '69', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|606|52|69', 16),
	('r52-72', 'r52', '125', '72', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|607|52|72', 12),
	('r52-76', 'r52', '125', '76', '5', 'Rubrica (Mapa mental lectura - el método de la ciencia)', 'Rubrica(Mapa mental lectura - el método de la ciencia)|608|52|76', 16),
	('r53-117', 'r53', '127', '117', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|614|53|117', 9),
	('r53-128', 'r53', '127', '128', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|627|53|128', 13),
	('r53-13', 'r53', '127', '13', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|612|53|13', 15),
	('r53-27', 'r53', '127', '27', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|613|53|27', 11),
	('r53-34', 'r53', '127', '34', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|615|53|34', 17),
	('r53-41', 'r53', '127', '41', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|616|53|41', 11),
	('r53-44', 'r53', '127', '44', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|617|53|44', 15),
	('r53-55', 'r53', '127', '55', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|618|53|55', 5),
	('r53-60', 'r53', '127', '60', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|619|53|60', 12),
	('r53-61', 'r53', '127', '61', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|620|53|61', 16),
	('r53-62', 'r53', '127', '62', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|621|53|62', 5),
	('r53-72', 'r53', '127', '72', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|622|53|72', 16),
	('r53-76', 'r53', '127', '76', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|623|53|76', 9),
	('r53-77', 'r53', '127', '77', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|624|53|77', 11),
	('r53-83', 'r53', '127', '83', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|626|53|83', 14),
	('r53-84', 'r53', '127', '84', '5', 'Rubrica (Infografía lectura - capítulos del 09 al 12)', 'Rubrica(Infografía lectura - capítulos del 09 al 12)|628|53|84', 12),
	('r54-125', 'r54', '129', '125', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|637|54|125', 12),
	('r54-127', 'r54', '129', '127', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|638|54|127', 16),
	('r54-128', 'r54', '129', '128', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|639|54|128', 12),
	('r54-27', 'r54', '129', '27', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|629|54|27', 12),
	('r54-32', 'r54', '129', '32', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|630|54|32', 16),
	('r54-34', 'r54', '129', '34', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|631|54|34', 20),
	('r54-44', 'r54', '129', '44', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|632|54|44', 16),
	('r54-60', 'r54', '129', '60', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|633|54|60', 16),
	('r54-61', 'r54', '129', '61', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|634|54|61', 12),
	('r54-69', 'r54', '129', '69', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|635|54|69', 16),
	('r54-72', 'r54', '129', '72', '5', 'Rubrica (Mapa mental)', 'Rubrica(Mapa mental)|636|54|72', 16),
	('r55-125', 'r55', '133', '125', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|652|55|125', 17),
	('r55-127', 'r55', '133', '127', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|653|55|127', 17),
	('r55-128', 'r55', '133', '128', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|655|55|128', 17),
	('r55-13', 'r55', '133', '13', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|640|55|13', 15),
	('r55-27', 'r55', '133', '27', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|641|55|27', 17),
	('r55-32', 'r55', '133', '32', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|642|55|32', 12),
	('r55-34', 'r55', '133', '34', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|643|55|34', 17),
	('r55-41', 'r55', '133', '41', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|644|55|41', 19),
	('r55-44', 'r55', '133', '44', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|645|55|44', 17),
	('r55-55', 'r55', '133', '55', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|646|55|55', 12),
	('r55-60', 'r55', '133', '60', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|647|55|60', 15),
	('r55-61', 'r55', '133', '61', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|648|55|61', 19),
	('r55-62', 'r55', '133', '62', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|649|55|62', 12),
	('r55-69', 'r55', '133', '69', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|650|55|69', 17),
	('r55-72', 'r55', '133', '72', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|651|55|72', 17),
	('r55-83', 'r55', '133', '83', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|654|55|83', 17),
	('r55-84', 'r55', '133', '84', '5', 'Rubrica (Ensayo - ¿Qué es la ciencia?)', 'Rubrica(Ensayo - ¿Qué es la ciencia?)|656|55|84', 15),
	('r56-117', 'r56', '135', '117', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|660|56|117', 9),
	('r56-125', 'r56', '135', '125', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|672|56|125', 6),
	('r56-127', 'r56', '135', '127', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|673|56|127', 14),
	('r56-128', 'r56', '135', '128', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|675|56|128', 14),
	('r56-13', 'r56', '135', '13', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|657|56|13', 11),
	('r56-27', 'r56', '135', '27', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|658|56|27', 14),
	('r56-32', 'r56', '135', '32', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|659|56|32', 9),
	('r56-34', 'r56', '135', '34', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|661|56|34', 16),
	('r56-41', 'r56', '135', '41', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|662|56|41', 14),
	('r56-44', 'r56', '135', '44', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|663|56|44', 16),
	('r56-55', 'r56', '135', '55', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|664|56|55', 9),
	('r56-60', 'r56', '135', '60', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|665|56|60', 11),
	('r56-61', 'r56', '135', '61', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|666|56|61', 14),
	('r56-62', 'r56', '135', '62', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|667|56|62', 9),
	('r56-69', 'r56', '135', '69', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|668|56|69', 6),
	('r56-72', 'r56', '135', '72', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|669|56|72', 11),
	('r56-76', 'r56', '135', '76', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|670|56|76', 9),
	('r56-77', 'r56', '135', '77', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|671|56|77', 9),
	('r56-83', 'r56', '135', '83', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|674|56|83', 16),
	('r56-84', 'r56', '135', '84', '5', 'Rubrica (Responsabilidad Social - informe)', 'Rubrica(Responsabilidad Social - informe)|676|56|84', 11);
/*!40000 ALTER TABLE `mdl_rubrica` ENABLE KEYS */;

-- Volcando estructura para función reepis.TraerCod_Escuela
DROP FUNCTION IF EXISTS `TraerCod_Escuela`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `TraerCod_Escuela`(pDescripcion VARCHAR(255)) RETURNS varchar(8) CHARSET utf8
RETURN (SELECT Cod_Escuela  FROM mdl_escuela WHERE Descripcion = pDescripcion)//
DELIMITER ;

-- Volcando estructura para función reepis.TraerPosicion
DROP FUNCTION IF EXISTS `TraerPosicion`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `TraerPosicion`(pCod_Resultado VARCHAR(16), pNivelCriterio VARCHAR(16), pCod_Criterio VARCHAR(16)) RETURNS int(11)
    DETERMINISTIC
BEGIN 
IF EXISTS ( SELECT Posicion_Ind FROM mdl_asignacionindicador
WHERE (Cod_Resultado = pCod_Resultado) AND (NivelCriterio = pNivelCriterio) AND (Cod_Criterio = pCod_Criterio))
THEN
RETURN (
SELECT Posicion_Ind FROM mdl_asignacionindicador
WHERE Cod_Resultado = pCod_Resultado AND NivelCriterio = pNivelCriterio AND Cod_Criterio = pCod_Criterio
ORDER BY Posicion_Ind DESC
LIMIT 1);
ELSEIF EXISTS (SELECT * FROM mdl_asignacionindicador 
WHERE (NivelCriterio = pNivelCriterio) AND (Cod_Criterio = pCod_Criterio))
THEN
RETURN (SELECT Posicion_Ind + 1 FROM mdl_asignacionindicador
WHERE (NivelCriterio = pNivelCriterio) AND (Cod_Criterio = pCod_Criterio) 
ORDER BY Posicion_Ind DESC
LIMIT 1);
ELSE 
RETURN (1);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_asignacionIndicador_E
DROP PROCEDURE IF EXISTS `USP_MDL_asignacionIndicador_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_asignacionIndicador_E`(
	 IN pCod_AsignacionIndicador VARCHAR(8)
	   )
BEGIN
	   DELETE FROM MDL_asignacionIndicador
	   WHERE (Cod_AsignacionIndicador = pCod_AsignacionIndicador);
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_asignacionIndicador_G
DROP PROCEDURE IF EXISTS `USP_MDL_asignacionIndicador_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_asignacionIndicador_G`(
	IN pCod_Criterio VARCHAR(8),
	IN pCod_Curso VARCHAR(8),
	IN pCod_Resultado VARCHAR(16),
	IN pCod_Rubrica VARCHAR(16),
	IN pNivelCriterio VARCHAR(8),
	IN pTCod_Resultado VARCHAR(16)
	)
BEGIN
	DECLARE pPosicion_Ind INT;
	IF (pTCod_Resultado = '0')
	THEN
	SET pPosicion_Ind = (SELECT `TraerPosicion`((pCod_Resultado), (pNivelCriterio), (pCod_Criterio)));
	IF EXISTS(SELECT Cod_AsignacionIndicador FROM MDL_asignacionIndicador WHERE (Cod_Resultado=pCod_Resultado) AND (NivelCriterio=pNivelCriterio) AND (Cod_Criterio=pCod_Criterio)
	THEN
	UPDATE MDL_asignacionIndicador
	SET
	Cod_Curso=pCod_Curso,
	Cod_Rubrica=pCod_Rubrica,
	Cod_Criterio=pCod_Criterio,
	NivelCriterio=pNivelCriterio,
	Cod_Resultado=pCod_Resultado,
	Posicion_Ind=pPosicion_Ind
	WHERE ((Cod_Resultado=pCod_Resultado) AND (NivelCriterio=pNivelCriterio) AND (Cod_Criterio=pCod_Criterio));
	ELSE
	INSERT INTO MDL_asignacionIndicador(
	Cod_Curso,
	Cod_Rubrica,
	Cod_Criterio,
	NivelCriterio,
	Cod_Resultado,
	Posicion_Ind
	)
	VALUES (
	pCod_Curso,
	pCod_Rubrica,
	pCod_Criterio,
	pNivelCriterio,
	pCod_Resultado,
	pPosicion_Ind
	);
	END IF;
	ELSE
	SET pPosicion_Ind = (SELECT `TraerPosicion`((pTCod_Resultado), (pNivelCriterio), (pCod_Criterio)));
	UPDATE MDL_asignacionIndicador
	SET
	Cod_Curso=pCod_Curso,
	Cod_Rubrica=pCod_Rubrica,
	Cod_Criterio=pCod_Criterio,
	NivelCriterio=pNivelCriterio,
	Cod_Resultado=pCod_Resultado,
	Posicion_Ind=pPosicion_Ind
	WHERE ((Cod_Resultado=pTCod_Resultado) AND (NivelCriterio=pNivelCriterio) AND (Cod_Criterio=pCod_Criterio));
	END IF;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_asignacionIndicador_TT
DROP PROCEDURE IF EXISTS `USP_MDL_asignacionIndicador_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_asignacionIndicador_TT`()
BEGIN
	SELECT * FROM MDL_asignacionIndicador;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_asignacionIndicador_TU
DROP PROCEDURE IF EXISTS `USP_MDL_asignacionIndicador_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_asignacionIndicador_TU`(
   IN pCod_AsignacionIndicador VARCHAR(16)
   )
BEGIN
   SELECT *
   FROM MDL_asignacionIndicador
   WHERE (Cod_AsignacionIndicador = pCod_AsignacionIndicador) ;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACIONINDICADOR_TxRubrica
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACIONINDICADOR_TxRubrica`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACIONINDICADOR_TxRubrica`(
   IN pCod_Curso varchar(8),
	IN pCod_Asignacion varchar(8),
	IN pId_Asignacion varchar(8))
BEGIN
		SELECT A.Cod_Asignacion, A.Id_Asignacion, A.NomRubrica, A.NivelCriterio, A.DesCriterio FROM mdl_asignacionindicador A
		WHERE A.Cod_Curso = pCod_Curso AND A.Id_Asignacion = pId_Asignacion AND A.Cod_Asignacion = pCod_Asignacion
		ORDER BY A.NivelCriterio ASC;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_E
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_E`(
	IN pCod_Asignacion varchar(8)
	)
BEGIN
	DELETE FROM mdl_asignacion
	WHERE (Cod_Asignacion=pCod_Asignacion);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_G
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_G`(
IN pCod_Curso varchar(8),
IN pCod_Asignacion varchar(8),
IN pId_Asignacion VARCHAR(8),
IN pNomAsignacion varchar(1024),
IN pTipoAsignacion varchar(200),
IN pParticipantes INT,
IN pPresentados INT,
IN pPendientes INT,
IN pCod_Unidad VARCHAR(8),
IN pFlag_Activo BOOL
)
BEGIN
IF NOT EXISTS (SELECT pCod_Asignacion, pCod_Curso FROM mdl_Asignacion WHERE ((Cod_Asignacion = pCod_Asignacion) AND (Cod_Curso= pCod_Curso)))
THEN
INSERT INTO mdl_Asignacion (
Cod_Curso,
Cod_Asignacion,
Id_Asignacion,
NomAsignacion,
TipoAsignacion,
Participantes,
Presentados,
Pendientes,
Cod_Unidad,
Flag_Activo
)
VALUES (
pCod_Curso,
pCod_Asignacion,
pId_Asignacion,
pNomAsignacion,
pTipoAsignacion,
pParticipantes,
pPresentados,
pPendientes,
pCod_Unidad,
pFlag_Activo
);
ELSE
UPDATE mdl_Asignacion
SET
Cod_Curso=pCod_Curso,
Cod_Asignacion=pCod_Asignacion,
Id_Asignacion=pId_Asignacion,
NomAsignacion=pNomAsignacion,
TipoAsignacion=pTipoAsignacion,
Participantes=pParticipantes,
Presentados=pPresentados,
Pendientes=pPendientes,
Cod_Unidad= pCod_Unidad,
Flag_Activo=pFlag_Activo
WHERE (Cod_Asignacion = pCod_Asignacion) AND (Cod_Curso = pCod_Curso);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_GxParticipantes
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_GxParticipantes`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_GxParticipantes`(
IN pCod_Asignacion VARCHAR(8),
IN pParticipantes INT,
IN pPresentados INT,
IN pPendientes INT
)
BEGIN
UPDATE mdl_asignacion
SET
Cod_Asignacion=pCod_Asignacion,
Participantes=pParticipantes,
Presentados=pPresentados,
Pendientes=pPendientes
WHERE (Cod_Asignacion=pCod_Asignacion);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_TT
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_TT`()
BEGIN
	SELECT * FROM mdl_asignacion;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_TU
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_TU`(
   IN pCod_Asignacion varchar(8)
	)
BEGIN
   SELECT *
   FROM mdl_asignacion
   WHERE (Cod_Asignacion=pCod_Asignacion);
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_TxRubrica
DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_TxRubrica`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_TxRubrica`(
   IN pCod_Curso varchar(8),
	IN pCod_Asignacion varchar(8),
	IN pId_Asignacion varchar(8))
BEGIN
		DECLARE pCod_Rubrica varchar(8);
		SET pCod_Rubrica = CONCAT('r',pId_Asignacion);
		SELECT A.Cod_Asignacion, A.Id_Asignacion, GR.NomRubrica, GC.NivelCriterio, GC.DesCriterio, AI.Cod_AsignacionIndicador, AI.Cod_Resultado 
		FROM mdl_asignacion A
		INNER JOIN mdl_grubrica AS GR ON A.Cod_Asignacion = GR.Cod_Asignacion AND A.Cod_Curso = GR.Cod_Curso AND GR.Cod_Rubrica = pCod_Rubrica
		INNER JOIN mdl_gcriterio AS GC ON GR.Cod_Rubrica = GC.Cod_Rubrica
		LEFT JOIN mdl_asignacionindicador AS AI ON AI.Cod_Criterio = GC.Cod_Criterio 
		WHERE A.Id_Asignacion = pId_Asignacion AND A.Cod_Curso = pCod_Curso  AND A.Cod_Asignacion = pCod_Asignacion
		ORDER BY GC.NivelCriterio ASC;
   END//
DELIMITER ;



-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_E
DROP PROCEDURE IF EXISTS `USP_MDL_CRITERIO_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CRITERIO_E`(
   IN pCod_Criterio varchar(8)
   )
BEGIN
   DELETE FROM mdl_Criterio
   WHERE (Cod_Criterio = pCod_Criterio);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_G
DROP PROCEDURE IF EXISTS `USP_MDL_CRITERIO_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CRITERIO_G`(
IN pCod_RubricaPersona VARCHAR(16),
IN pCod_Criterio VARCHAR(16),
IN pNivelCriterio VARCHAR(8),
IN pDesCriterio VARCHAR(100)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Criterio FROM mdl_Criterio WHERE Cod_Criterio = pCod_Criterio)
THEN
INSERT INTO mdl_Criterio(
Cod_RubricaPersona,
Cod_Criterio,
NivelCriterio,
DesCriterio
)
VALUES (
pCod_RubricaPersona,
pCod_Criterio,
pNivelCriterio,
pDesCriterio
);
ELSE
UPDATE mdl_Criterio
SET
Cod_RubricaPersona=pCod_RubricaPersona,
Cod_Criterio=pCod_Criterio,
NivelCriterio=pNivelCriterio,
DesCriterio=pDesCriterio
WHERE (Cod_Criterio=pCod_Criterio);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_TT
DROP PROCEDURE IF EXISTS `USP_MDL_CRITERIO_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CRITERIO_TT`()
BEGIN
	SELECT * FROM mdl_Criterio;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_TU
DROP PROCEDURE IF EXISTS `USP_MDL_CRITERIO_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CRITERIO_TU`(
   IN pId_Rubrica INT)
BEGIN
   SELECT *
   FROM mdl_Criterio
   where Id_Rubrica=pId_Rubrica;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_E`(
   IN pCod_CursoObjetivo VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_CursoObjetivo
   WHERE (Cod_CursoObjetivo = pCod_CursoObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_G
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_G`(
IN pCod_CursoObjetivo VARCHAR(16),
IN pCod_Objetivo VARCHAR(16),
IN pCod_Curso VARCHAR(16)
)
BEGIN
IF NOT EXISTS (SELECT Cod_CursoObjetivo FROM mdl_CursoObjetivo WHERE Cod_CursoObjetivo = pCod_CursoObjetivo)
THEN
INSERT INTO mdl_CursoObjetivo(
Cod_CursoObjetivo,
Cod_Objetivo,
Cod_Curso
)
VALUES (
pCod_CursoObjetivo,
pCod_Objetivo,
pCod_Curso
);
ELSE
UPDATE mdl_CursoObjetivo
SET
Cod_CursoObjetivo=pCod_CursoObjetivo,
Cod_Objetivo=pCod_Objetivo,
Cod_Curso=pCod_Curso
WHERE (Cod_CursoObjetivo=pCod_CursoObjetivo);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TobxCod_Curso
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_TobxCod_Curso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_TobxCod_Curso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
   SELECT Cod_Objetivo AS value, Cod_Objetivo AS label
   FROM mdl_CursoObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TT
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_TT`()
BEGIN
	SELECT * FROM mdl_CursoObjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TU
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_TU`(
   IN pCod_CursoObjetivo VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_CursoObjetivo=pCod_CursoObjetivo;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TxCod_Curso
DROP PROCEDURE IF EXISTS `USP_MDL_CURSOBJETIVO_TxCod_Curso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSOBJETIVO_TxCod_Curso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_E
DROP PROCEDURE IF EXISTS `USP_MDL_CURSO_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSO_E`(
	IN pCod_Curso varchar(8),
	IN pCod_Resultado VARCHAR(8)
	)
BEGIN
	DELETE FROM mdl_Curso
WHERE (Cod_Curso=pCod_Curso) AND (Cod_Resultado=pCod_Resultado);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_G
DROP PROCEDURE IF EXISTS `USP_MDL_CURSO_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSO_G`(
IN pCod_Curso varchar(8),
IN pNomCurso varchar(1024),
IN pDescripcion varchar(200),
IN pDocente varchar(200),
IN pSemestre varchar(100)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Curso FROM mdl_curso WHERE  (Cod_Curso = pCod_Curso))
THEN
INSERT INTO mdl_curso (
Cod_Curso,
NomCurso,
Descripcion,
Docente,
Semestre
)
VALUES (
pCod_Curso,
pNomCurso,
pDescripcion,
pDocente,
pSemestre
);
ELSE
UPDATE mdl_curso
SET
Cod_Curso=pCod_Curso,
NomCurso=pNomCurso,
Descripcion=pDescripcion,
Docente=pDocente,
Semestre=pSemestre
WHERE (Cod_Curso=pCod_Curso);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_TT
DROP PROCEDURE IF EXISTS `USP_MDL_CURSO_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSO_TT`()
BEGIN
	SELECT * FROM mdl_Curso;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_TU
DROP PROCEDURE IF EXISTS `USP_MDL_CURSO_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_CURSO_TU`(
   IN pCod_Resultado VARCHAR(8),
	IN pCod_Curso varchar(8)
	)
BEGIN
   SELECT *
   FROM mdl_Curso
   WHERE (Cod_Resultado=pCod_Resultado) AND (Cod_Curso=pCod_Curso);
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_E
DROP PROCEDURE IF EXISTS `USP_MDL_ESCUELA_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_E`(
   IN pCod_Escuela varchar(8)
   )
BEGIN
   DELETE FROM mdl_Escuela
   WHERE (Cod_Escuela = pCod_Escuela);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_G
DROP PROCEDURE IF EXISTS `USP_MDL_ESCUELA_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_G`(
IN pCod_Escuela VARCHAR(8),
IN pSede VARCHAR(30),
IN pDescripcion VARCHAR(255)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Escuela FROM mdl_Escuela WHERE  Cod_Escuela = pCod_Escuela)
THEN
INSERT INTO mdl_Escuela(
Cod_Escuela,
Sede,
Descripcion
)
VALUES (
pCod_Escuela,
pSede,
pDescripcion
);
ELSE
UPDATE mdl_Escuela
SET
Cod_Escuela=pCod_Escuela,
Sede=pSede,
Descripcion=pDescripcion
WHERE (Cod_Escuela=pCod_Escuela);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_TT
DROP PROCEDURE IF EXISTS `USP_MDL_ESCUELA_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_TT`()
BEGIN
	SELECT * FROM mdl_Escuela;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_TT_CodDesc
DROP PROCEDURE IF EXISTS `USP_MDL_ESCUELA_TT_CodDesc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_TT_CodDesc`()
BEGIN
	SELECT Descripcion AS value, Descripcion AS label  FROM mdl_Escuela;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_TU
DROP PROCEDURE IF EXISTS `USP_MDL_ESCUELA_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_TU`(
   IN pCod_Escuela varchar(8))
BEGIN
   SELECT *
   FROM mdl_Escuela
   where Cod_Escuela = pCod_Escuela;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GCRITERIO_E
DROP PROCEDURE IF EXISTS `USP_MDL_GCRITERIO_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GCRITERIO_E`(
   IN pCod_Criterio varchar(8)
   )
BEGIN
   DELETE FROM MDL_GCRITERIO
   WHERE (Cod_Criterio = pCod_Criterio);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GCRITERIO_G
DROP PROCEDURE IF EXISTS `USP_MDL_GCRITERIO_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GCRITERIO_G`(
IN pCod_Rubrica VARCHAR(8),
IN pCod_Criterio VARCHAR(8),
IN pNivelCriterio VARCHAR(8),
IN pDesCriterio VARCHAR(100)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Criterio FROM MDL_GCRITERIO WHERE Cod_Criterio = pCod_Criterio)
THEN
INSERT INTO MDL_GCRITERIO(
Cod_Rubrica,
Cod_Criterio,
NivelCriterio,
DesCriterio
)
VALUES (
pCod_Rubrica,
pCod_Criterio,
pNivelCriterio,
pDesCriterio
);
ELSE
UPDATE MDL_GCRITERIO
SET
Cod_Rubrica=pCod_Rubrica,
Cod_Criterio=pCod_Criterio,
NivelCriterio=pNivelCriterio,
DesCriterio=pDesCriterio
WHERE (Cod_Criterio=pCod_Criterio);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GCRITERIO_TT
DROP PROCEDURE IF EXISTS `USP_MDL_GCRITERIO_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GCRITERIO_TT`()
BEGIN
	SELECT * FROM MDL_GCRITERIO;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GCRITERIO_TU
DROP PROCEDURE IF EXISTS `USP_MDL_GCRITERIO_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GCRITERIO_TU`(
   IN pId_Rubrica INT)
BEGIN
   SELECT *
   FROM MDL_GCRITERIO
   where Id_Rubrica=pId_Rubrica;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GRUBRICA_E
DROP PROCEDURE IF EXISTS `USP_MDL_GRUBRICA_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GRUBRICA_E`(
 IN pCod_Rubrica VARCHAR(8),
 IN pCod_Asignacion VARCHAR(8)
   )
BEGIN
   DELETE FROM MDL_GRUBRICA
   WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion));
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GRUBRICA_G
DROP PROCEDURE IF EXISTS `USP_MDL_GRUBRICA_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GRUBRICA_G`(
IN pCod_Rubrica VARCHAR(8),
IN pCod_Asignacion VARCHAR(8),
IN pCod_Curso VARCHAR(8), 
IN pNomRubrica VARCHAR(150)
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica, pCod_Asignacion FROM MDL_GRUBRICA WHERE ( (Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion)))
THEN
INSERT INTO MDL_GRUBRICA(
Cod_Rubrica,
Cod_Asignacion,
Cod_Curso,
NomRubrica
)
VALUES (
pCod_Rubrica,
pCod_Asignacion,
pCod_Curso,
pNomRubrica
);
ELSE
UPDATE MDL_GRUBRICA
SET
Cod_Rubrica=pCod_Rubrica,
Cod_Asignacion=pCod_Asignacion,
Cod_Curso=pCod_Curso,
NomRubrica=pNomRubrica
WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion));
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GRUBRICA_TT
DROP PROCEDURE IF EXISTS `USP_MDL_GRUBRICA_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GRUBRICA_TT`()
BEGIN
	SELECT * FROM MDL_GRUBRICA;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_GRUBRICA_TU
DROP PROCEDURE IF EXISTS `USP_MDL_GRUBRICA_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_GRUBRICA_TU`(
   IN pCod_Rubrica VARCHAR(8),
   IN pCod_Asignacion VARCHAR(8)
   )
BEGIN
   SELECT *
   FROM MDL_GRUBRICA
   WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion));
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_E
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADORNIVEL_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADORNIVEL_E`(
IN pCod_IndicadorNivel VARCHAR(8)
)
BEGIN
DELETE FROM mdl_indicadornivel
WHERE (Cod_IndicadorNivel=pCod_IndicadorNivel);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_G
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADORNIVEL_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADORNIVEL_G`(
IN pCod_IndicadorNivel VARCHAR(8),
In pValor VARCHAR (5),
IN pDescripcion VARCHAR (25)
)
BEGIN
IF NOT EXISTS (SELECT pCod_IndicadorNivel FROM mdl_indicadornivel WHERE (Cod_IndicadorNivel= pCod_IndicadorNivel))
THEN
INSERT INTO mdl_indicadornivel(
Cod_IndicadorNivel,
Valor,
Descripcion

)
VALUES (
pCod_IndicadorNivel,
pValor,
pDescripcion
);
ELSE
UPDATE mdl_indicadornivel
SET
Cod_IndicadorNivel=pCod_IndicadorNivel,
Valor=pValor,
Descripcion=pDescripcion
WHERE (Cod_IndicadorNivel=pCod_IndicadorNivel);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_TT
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADORNIVEL_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADORNIVEL_TT`()
BEGIN
SELECT * FROM mdl_indicadornivel;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `USP_MDL_INDICADORNIVEL_TCB`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADORNIVEL_TCB`()
BEGIN
	SELECT Cod_IndicadorNivel AS value, Cod_IndicadorNivel AS label  FROM mdl_indicadornivel;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_TU
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADORNIVEL_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADORNIVEL_TU`(
IN pCod_IndicadorNivel VARCHAR(8)
)
BEGIN
SELECT * FROM mdl_indicadornivel
WHERE (Cod_IndicadorNivel=pCod_IndicadorNivel);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_E
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_E`(
	IN pCod_Indicador varchar(8),
	IN pCod_Resultado varchar(8),
	IN pCod_IndicadorNivel VARCHAR(8)
	)
BEGIN
	DELETE FROM mdl_Indicador
	WHERE ((Cod_Indicador = pCod_Indicador) AND (Cod_Resultado = pCod_Resultado) AND (Cod_IndicadorNivel= pCod_IndicadorNivel));
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_G
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_G`(
IN pCod_Resultado VARCHAR(8),
IN pCod_IndicadorNivel VARCHAR(8),
IN pCod_Indicador VARCHAR(8),
IN pDescripcionLarga varchar(1024),
IN pDescripcionCorta varchar(200),
IN pvalor INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Resultado,pCod_IndicadorNivel,pCod_Indicador  FROM mdl_Indicador WHERE  (Cod_Resultado = pCod_Resultado) AND (Cod_IndicadorNivel=pCod_IndicadorNivel) AND (Cod_Indicador= pCod_Indicador))
THEN
INSERT INTO mdl_Indicador(
Cod_Resultado,
Cod_IndicadorNivel,
Cod_Indicador,
DescripcionLarga,
DescripcionCorta,
valor
)
VALUES (
pCod_Resultado,
pCod_IndicadorNivel,
pCod_Indicador,
pDescripcionLarga,
pDescripcionCorta,
pvalor
);
ELSE
UPDATE mdl_Indicador
SET
Cod_Resultado=pCod_Resultado,
Cod_IndicadorNivel=pCod_IndicadorNivel,
Cod_Indicador=pCod_Indicador,
DescripcionLarga=pDescripcionLarga,
DescripcionCorta=pDescripcionCorta,
valor=pvalor
WHERE ((Cod_Resultado=pCod_Resultado) AND (Cod_IndicadorNivel=pCod_IndicadorNivel)) AND (Cod_Indicador=pCod_Indicador);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TT
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_TT`()
BEGIN
SELECT * FROM mdl_indicador;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TT_CodDesc
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_TT_CodDesc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_TT_CodDesc`()
BEGIN
	SELECT Cod_Indicador AS value, Cod_Indicador AS label  FROM mdl_indicador;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TU
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_TU`(
IN pCod_Indicador varchar(8),
IN pCod_Resultado VARCHAR(8),
IN pCod_IndicadorNivel VARCHAR(8)
)
BEGIN
SELECT *
FROM mdl_Indicador
WHERE ((Cod_Indicador = pCod_Indicador) AND (Cod_Resultado = pCod_Resultado) AND (Cod_IndicadorNivel= pCod_IndicadorNivel));
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TxCod_Resultado
DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_TxCod_Resultado`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_TxCod_Resultado`(
   IN pCod_ResulCursObjetivo varchar(16))
BEGIN
   SELECT Ind.Cod_Indicador AS value, Ind.Cod_Indicador AS label FROM mdl_resulcursobjetivo rc
INNER JOIN mdl_indicador AS Ind ON  rc.Cod_Resultado = Ind.Cod_Resultado
 WHERE rc.Cod_ResulCursObjetivo = pCod_ResulCursObjetivo;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_E
DROP PROCEDURE IF EXISTS `USP_MDL_IndRecursobjetivo_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_IndRecursobjetivo_E`(
   IN pCod_IndicarResultado VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_IndRecursobjetivo
   WHERE (Cod_IndicarResultado = pCod_IndicarResultado);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_G
DROP PROCEDURE IF EXISTS `USP_MDL_IndRecursobjetivo_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_IndRecursobjetivo_G`(
IN pCod_IndicarResultado VARCHAR(16),
IN pCod_Resultado VARCHAR(16),
IN pCod_Indicador VARCHAR(16),
IN pCod_Curso VARCHAR(16)
)
BEGIN
IF NOT EXISTS (SELECT Cod_IndicarResultado FROM mdl_IndRecursobjetivo WHERE Cod_IndicarResultado = pCod_IndicarResultado)
THEN
INSERT INTO mdl_IndRecursobjetivo(
Cod_IndicarResultado,
Cod_Resultado,
Cod_Indicador,
Cod_Curso
)
VALUES (
pCod_IndicarResultado,
pCod_Resultado,
pCod_Indicador,
pCod_Curso
);
ELSE
UPDATE mdl_IndRecursobjetivo
SET
Cod_IndicarResultado=pCod_IndicarResultado,
Cod_Resultado=pCod_Resultado,
Cod_Indicador=pCod_Indicador,
Cod_Curso=pCod_Curso
WHERE (Cod_IndicarResultado=pCod_IndicarResultado);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_TT
DROP PROCEDURE IF EXISTS `USP_MDL_IndRecursobjetivo_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_IndRecursobjetivo_TT`()
BEGIN
	SELECT * FROM mdl_IndRecursobjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_TU
DROP PROCEDURE IF EXISTS `USP_MDL_IndRecursobjetivo_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_IndRecursobjetivo_TU`(
   IN pCod_IndicarResultado VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_IndRecursobjetivo
   where Cod_IndicarResultado=pCod_IndicarResultado;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_TxCod_Curso
DROP PROCEDURE IF EXISTS `USP_MDL_IndRecursobjetivo_TxCod_Curso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_IndRecursobjetivo_TxCod_Curso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
   SELECT ir.Cod_IndicarResultado, rc.Cod_Resultado, ir.Cod_Indicador, ir.Cod_Curso
   FROM mdl_indrecursobjetivo AS ir
   INNER JOIN mdl_resulcursobjetivo AS rc ON ir.Cod_Resultado = rc.Cod_ResulCursObjetivo 
   where ir.Cod_Curso=pCod_Curso;
   
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDRecursoObjetivo_TxCurso
DROP PROCEDURE IF EXISTS `USP_MDL_INDRecursoObjetivo_TxCurso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDRecursoObjetivo_TxCurso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
	SELECT Cod_IndicarResultado AS value, Cod_IndicarResultado AS label
   FROM mdl_indrecursobjetivo
   where Cod_Curso=pCod_Curso;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_E
DROP PROCEDURE IF EXISTS `USP_MDL_MATRICULA_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_MATRICULA_E`(
   IN pCod_Persona varchar(8),
	IN pCod_Curso varchar(8)
	)
BEGIN
   DELETE FROM mdl_Matricula
  WHERE (Cod_Persona = pCod_Persona) AND (Cod_Curso=pCod_Curso);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_G
DROP PROCEDURE IF EXISTS `USP_MDL_MATRICULA_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_MATRICULA_G`(
IN pCod_Persona varchar (8),
IN pCod_Curso varchar (8),
IN pCod_Matricula VARCHAR(8),
IN pSemestre VARCHAR(20),
IN pDocente VARCHAR(70)
)
BEGIN
IF NOT EXISTS (SELECT pCod_Persona, pCod_Curso FROM mdl_Matricula WHERE ((Cod_Persona = pCod_Persona) AND (Cod_Curso=pCod_Curso)))
THEN
INSERT INTO mdl_Matricula(
Cod_Persona,
Cod_Curso,
Cod_Matricula,
Semestre,
Docente
)
VALUES (
pCod_Persona,
pCod_Curso,
pCod_Matricula,
pSemestre,
pDocente
);
ELSE
UPDATE mdl_Matricula
SET
Cod_Persona=pCod_Persona,
Cod_Curso=pCod_Curso,
Cod_Matricula=pCod_Matricula,
Semestre=pSemestre,
Docente=pDocente
WHERE (Cod_Persona = pCod_Persona) AND (Cod_Curso=pCod_Curso);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_TT
DROP PROCEDURE IF EXISTS `USP_MDL_MATRICULA_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_MATRICULA_TT`()
BEGIN
	SELECT * FROM mdl_Matricula;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_TU
DROP PROCEDURE IF EXISTS `USP_MDL_MATRICULA_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_MATRICULA_TU`(
IN pCod_Persona varchar(8),
IN pCod_Curso varchar(8)
)
BEGIN
SELECT *
FROM mdl_Matricula
WHERE (Cod_Persona = pCod_Persona) AND (Cod_Curso=pCod_Curso);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_E
DROP PROCEDURE IF EXISTS `USP_MDL_NIVEL_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_NIVEL_E`(
   IN pCod_Rubrica varchar(8)
   )
BEGIN
   DELETE FROM mdl_Nivel
   WHERE (Cod_Rubrica = pCod_Rubrica);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_G
DROP PROCEDURE IF EXISTS `USP_MDL_NIVEL_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_NIVEL_G`(
IN pCod_Nivel VARCHAR(16),
IN pCod_Criterio VARCHAR(16),
IN pDescripcion VARCHAR(1024),
IN pPuntaje INT,
IN pPuntajeObtenido INT,
IN pPuntajeFinal DECIMAL(10,2)
)
BEGIN

IF NOT EXISTS (SELECT Cod_Nivel  FROM mdl_Nivel WHERE  (Cod_Nivel=pCod_Nivel))
THEN
INSERT INTO mdl_Nivel(
Cod_Nivel,
Cod_Criterio,
Descripcion,
Puntaje,
PuntajeObtenido,
PuntajeFinal
)
VALUES (
pCod_Nivel,
pCod_Criterio,
pDescripcion,
pPuntaje,
pPuntajeObtenido,
pPuntajeFinal
);
ELSE
UPDATE mdl_Nivel
SET
Cod_Nivel=pCod_Nivel,
Cod_Criterio=pCod_Criterio,
Descripcion=pDescripcion,
Puntaje=pPuntaje,
PuntajeObtenido=pPuntajeObtenido,
PuntajeFinal=pPuntajeFinal
WHERE (Cod_Nivel=pCod_Nivel);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_TT
DROP PROCEDURE IF EXISTS `USP_MDL_NIVEL_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_NIVEL_TT`()
BEGIN
	SELECT * FROM mdl_Nivel;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_TU
DROP PROCEDURE IF EXISTS `USP_MDL_NIVEL_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_NIVEL_TU`(
   IN pCod_Nivel varchar(8))
BEGIN
   SELECT *
   FROM mdl_Nivel
   where Cod_Nivel = pCod_Nivel;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_E
DROP PROCEDURE IF EXISTS `USP_MDL_OBJETIVOEDUCACIONAL_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_E`(
   IN pCod_Objetivo VARCHAR(8)
   )
BEGIN
   DELETE FROM mdl_objetivoeducacional
   WHERE (Cod_Objetivo = pCod_Objetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_G
DROP PROCEDURE IF EXISTS `USP_MDL_OBJETIVOEDUCACIONAL_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_G`(
IN pCod_Objetivo VARCHAR(8),
IN pDes_Escuela VARCHAR(255),
IN pDescripcion VARCHAR(1024))
BEGIN
DECLARE pCod_Escuela VARCHAR(255);
SET pCod_Escuela = (SELECT `TraerCod_Escuela`(pDes_Escuela));
IF NOT EXISTS (SELECT Cod_Objetivo FROM mdl_objetivoeducacional WHERE  Cod_Objetivo = pCod_Objetivo)
THEN
INSERT INTO mdl_objetivoeducacional(
Cod_Objetivo,
Cod_Escuela,
Descripcion
)
VALUES (
pCod_Objetivo,
pCod_Escuela,
pDescripcion
);
ELSE
UPDATE mdl_objetivoeducacional
SET
Cod_Objetivo=pCod_Objetivo,
Cod_Escuela=pCod_Escuela,
Descripcion=pDescripcion
WHERE (Cod_Objetivo=pCod_Objetivo);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_TT
DROP PROCEDURE IF EXISTS `USP_MDL_OBJETIVOEDUCACIONAL_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_TT`()
BEGIN
	SELECT E.Descripcion  AS Cod_Escuela, OB.Cod_Objetivo, OB.Descripcion  FROM mdl_objetivoeducacional AS OB INNER JOIN mdl_escuela AS E ON OB.Cod_Escuela = E.Cod_Escuela;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_TT_CodDesc
DROP PROCEDURE IF EXISTS `USP_MDL_OBJETIVOEDUCACIONAL_TT_CodDesc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_TT_CodDesc`()
BEGIN
	SELECT Cod_Objetivo AS value, Cod_Objetivo AS label  FROM mdl_objetivoeducacional;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_TU
DROP PROCEDURE IF EXISTS `USP_MDL_OBJETIVOEDUCACIONAL_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_TU`(
   IN pCod_Objetivo VARCHAR(8))
BEGIN
   SELECT *
   FROM mdl_objetivoeducacional
   where Cod_Objetivo = pCod_Objetivo;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_E
DROP PROCEDURE IF EXISTS `USP_MDL_PERSONA_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_PERSONA_E`(
   IN pCod_Persona varchar(8)
   )
BEGIN
   DELETE FROM mdl_Persona
   WHERE (Cod_Persona = pCod_Persona);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_G
DROP PROCEDURE IF EXISTS `USP_MDL_PERSONA_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_PERSONA_G`(
IN pCod_Persona VARCHAR(20),
IN pNombre VARCHAR(50),
IN pApellidos VARCHAR(150),
IN pNomPersona VARCHAR(200),
IN pCorreo VARCHAR(50),
IN pGrado VARCHAR(100)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Persona FROM mdl_Persona WHERE  Cod_Persona = pCod_Persona)
THEN
INSERT INTO mdl_Persona(
Cod_Persona,
Nombre,
Apellidos,
NomPersona,
Correo,
Grado
)
VALUES (
pCod_Persona,
pNombre,
pApellidos,
pNomPersona,
pCorreo,
pGrado
);
ELSE
UPDATE mdl_Persona
SET
Cod_Persona=pCod_Persona,
Nombre=pNombre,
Apellidos=pApellidos,
NomPersona=pNomPersona,
Correo=pCorreo,
Grado=pGrado
WHERE (Cod_Persona=pCod_Persona);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_TT
DROP PROCEDURE IF EXISTS `USP_MDL_PERSONA_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_PERSONA_TT`()
BEGIN
	SELECT * FROM mdl_Persona;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_TU
DROP PROCEDURE IF EXISTS `USP_MDL_PERSONA_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_PERSONA_TU`(
   IN pCod_Persona varchar(8))
BEGIN
   SELECT *
   FROM mdl_Persona
   where Cod_Persona=pCod_Persona;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_E
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_E`(
   IN pCod_ResulCursObjetivo VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_ResulCursObjetivo
   WHERE (Cod_ResulCursObjetivo = pCod_ResulCursObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_G
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_G`(
IN pCod_ResulCursObjetivo VARCHAR(16),
IN pCod_Resultado VARCHAR(16),
IN pCod_Curso VARCHAR(16)
)
BEGIN
IF NOT EXISTS (SELECT Cod_ResulCursObjetivo FROM mdl_ResulCursObjetivo WHERE Cod_ResulCursObjetivo = pCod_ResulCursObjetivo)
THEN
INSERT INTO mdl_ResulCursObjetivo(
Cod_ResulCursObjetivo,
Cod_Resultado,
Cod_Curso
)
VALUES (
pCod_ResulCursObjetivo,
pCod_Resultado,
pCod_Curso
);
ELSE
UPDATE mdl_ResulCursObjetivo
SET
Cod_ResulCursObjetivo=pCod_ResulCursObjetivo,
Cod_Resultado=pCod_Resultado,
Cod_Curso=pCod_Curso
WHERE (Cod_ResulCursObjetivo=pCod_ResulCursObjetivo);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TrexCod_Curso
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_TrexCod_Curso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_TrexCod_Curso`(
   IN pCod_Curso varchar(16))
BEGIN
   SELECT Cod_ResulCursObjetivo AS value, Cod_ResulCursObjetivo AS label
   FROM mdl_ResulCursObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TT
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_TT`()
BEGIN
	SELECT * FROM mdl_ResulCursObjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TU
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_TU`(
   IN pCod_ResulCursObjetivo varchar(16))
BEGIN
   SELECT *
   FROM mdl_ResulCursObjetivo
   where Cod_ResulCursObjetivo=pCod_ResulCursObjetivo;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TxCod_Curso
DROP PROCEDURE IF EXISTS `USP_MDL_ResulCursObjetivo_TxCod_Curso`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ResulCursObjetivo_TxCod_Curso`(
   IN pCod_Curso varchar(16))
BEGIN
   SELECT *
   FROM mdl_ResulCursObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_E
DROP PROCEDURE IF EXISTS `USP_MDL_RESULTADOESTUDIANTE_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_E`(
   IN pCod_Resultado varchar(8)
   )
BEGIN
   DELETE FROM mdl_ResultadoEstudiante
   WHERE (Cod_Resultado = pCod_Resultado);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_G
DROP PROCEDURE IF EXISTS `USP_MDL_RESULTADOESTUDIANTE_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_G`(
IN pCod_Resultado VARCHAR(8),
IN pNomResultado VARCHAR(200),
IN pDescripcion varchar(1024),
IN pvalor INT
)
BEGIN
IF NOT EXISTS (SELECT Cod_Resultado FROM mdl_ResultadoEstudiante WHERE  Cod_Resultado = pCod_Resultado)
THEN
INSERT INTO mdl_ResultadoEstudiante(
Cod_Resultado,
NomResultado,
Descripcion,
valor
)
VALUES (
pCod_Resultado,
pNomResultado,
pDescripcion,
pvalor
);
ELSE
UPDATE mdl_ResultadoEstudiante
SET
Cod_Resultado=pCod_Resultado,
NomResultado=pNomResultado,
Descripcion=pDescripcion,
valor=pvalor
WHERE (Cod_Resultado=pCod_Resultado);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_TT
DROP PROCEDURE IF EXISTS `USP_MDL_RESULTADOESTUDIANTE_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_TT`()
BEGIN
	SELECT * FROM mdl_ResultadoEstudiante;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_TT_CodDesc
DROP PROCEDURE IF EXISTS `USP_MDL_RESULTADOESTUDIANTE_TT_CodDesc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_TT_CodDesc`()
BEGIN
	SELECT Cod_Resultado AS value, Cod_Resultado AS label  FROM mdl_resultadoestudiante;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_TU
DROP PROCEDURE IF EXISTS `USP_MDL_RESULTADOESTUDIANTE_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_TU`(
   IN pCod_Resultado varchar(8))
BEGIN
   SELECT *
   FROM mdl_ResultadoEstudiante
   where Cod_Resultado=pCod_Resultado;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_E
DROP PROCEDURE IF EXISTS `USP_MDL_RUBRICA_E`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RUBRICA_E`(
 IN pCod_Rubrica VARCHAR(8),
 IN pCod_Asignacion VARCHAR(8),
 IN pCod_Persona VARCHAR(8)

   )
BEGIN
   DELETE FROM mdl_Rubrica
   WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona));
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_G
DROP PROCEDURE IF EXISTS `USP_MDL_RUBRICA_G`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RUBRICA_G`(
IN pCod_RubricaPersona VARCHAR(16),
IN pCod_Rubrica VARCHAR(8),
IN pCod_Asignacion VARCHAR(8),
IN pCod_Persona VARCHAR(8),
IN pCod_Curso VARCHAR(8), 
IN pNomRubrica VARCHAR(150),
IN pDescripcion VARCHAR(1024),
IN pNota INT
)
BEGIN
IF NOT EXISTS (SELECT Cod_RubricaPersona FROM mdl_Rubrica WHERE ( (Cod_RubricaPersona = pCod_RubricaPersona)))
THEN
INSERT INTO mdl_Rubrica(
Cod_RubricaPersona,
Cod_Rubrica,
Cod_Asignacion,
Cod_Persona,
Cod_Curso,
NomRubrica,
Descripcion,
Nota
)
VALUES (
pCod_RubricaPersona,
pCod_Rubrica,
pCod_Asignacion,
pCod_Persona,
pCod_Curso,
pNomRubrica,
pDescripcion,
pNota
);
ELSE
UPDATE mdl_Rubrica
SET
Cod_RubricaPersona=pCod_RubricaPersona,
Cod_Rubrica=pCod_Rubrica,
Cod_Asignacion=pCod_Asignacion,
Cod_Persona=pCod_Persona,
Cod_Curso=pCod_Curso,
NomRubrica=pNomRubrica,
Descripcion=pDescripcion,
Nota=pNota
WHERE (Cod_RubricaPersona = pCod_RubricaPersona);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_TT
DROP PROCEDURE IF EXISTS `USP_MDL_RUBRICA_TT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RUBRICA_TT`()
BEGIN
	SELECT * FROM mdl_Rubrica;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_TU
DROP PROCEDURE IF EXISTS `USP_MDL_RUBRICA_TU`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_RUBRICA_TU`(
   IN pCod_Rubrica VARCHAR(8),
   IN pCod_Asignacion VARCHAR(8)
   )
BEGIN
   SELECT *
   FROM mdl_Rubrica
   WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion));
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

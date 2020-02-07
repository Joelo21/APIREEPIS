-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para reepis
CREATE DATABASE IF NOT EXISTS `reepis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `reepis`;

-- Volcando estructura para tabla reepis.mdl_asignacion
CREATE TABLE IF NOT EXISTS `mdl_asignacion` (
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `Cod_Asignacion` varchar(8) NOT NULL,
  `NomAsignacion` varchar(1024) NOT NULL,
  `TipoAsignacion` varchar(200) DEFAULT NULL,
  `Participantes` int(11) DEFAULT NULL,
  `Presentados` int(11) DEFAULT NULL,
  `Pendientes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Asignacion`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_asignacion_ibfk_1` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_asignacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_criterio
CREATE TABLE IF NOT EXISTS `mdl_criterio` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `DesCriterio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Criterio`),
  KEY `Cod_Rubrica` (`Cod_Rubrica`),
  CONSTRAINT `mdl_criterio_ibfk_1` FOREIGN KEY (`Cod_Rubrica`) REFERENCES `mdl_rubrica` (`Cod_Rubrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_criterio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_criterio` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_criterio` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_curso
CREATE TABLE IF NOT EXISTS `mdl_curso` (
  `Cod_Resultado` varchar(8) DEFAULT NULL,
  `Cod_Curso` varchar(8) NOT NULL,
  `NomCurso` varchar(1024) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Docente` varchar(200) DEFAULT NULL,
  `Semestre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Curso`),
  KEY `Cod_Resultado` (`Cod_Resultado`),
  CONSTRAINT `mdl_curso_ibfk_1` FOREIGN KEY (`Cod_Resultado`) REFERENCES `mdl_resultadoestudiante` (`Cod_Resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_curso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_curso` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_escuela
CREATE TABLE IF NOT EXISTS `mdl_escuela` (
  `Cod_Escuela` varchar(8) NOT NULL,
  `Sede` varchar(30) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Cod_Escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_escuela: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_escuela` DISABLE KEYS */;
REPLACE INTO `mdl_escuela` (`Cod_Escuela`, `Sede`, `Descripcion`) VALUES
	('AMB', 'LARAPA', 'Ingeneria Ambiental'),
	('CIV', 'LARAPA', 'Ingeneria Civil'),
	('IND', 'LARAPA', 'Ingeneria Industrial'),
	('SIS', 'Larapa', 'Ingeneria de Sistemas');
/*!40000 ALTER TABLE `mdl_escuela` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_indicador
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

-- Volcando datos para la tabla reepis.mdl_indicador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_indicador` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_indicadornivel
CREATE TABLE IF NOT EXISTS `mdl_indicadornivel` (
  `Cod_Indicadornivel` varchar(8) NOT NULL,
  `valor` varchar(5) DEFAULT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Cod_Indicadornivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_indicadornivel: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_indicadornivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_indicadornivel` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_matricula
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
CREATE TABLE IF NOT EXISTS `mdl_nivel` (
  `Cod_Rubrica` varchar(8) DEFAULT NULL,
  `Cod_Nivel` varchar(8) NOT NULL,
  `Descripcion` varchar(10) DEFAULT NULL,
  `Puntaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Nivel`),
  KEY `Cod_Rubrica` (`Cod_Rubrica`),
  CONSTRAINT `mdl_nivel_ibfk_1` FOREIGN KEY (`Cod_Rubrica`) REFERENCES `mdl_rubrica` (`Cod_Rubrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_nivel: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_nivel` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_objetivoeducacional
CREATE TABLE IF NOT EXISTS `mdl_objetivoeducacional` (
  `Cod_Escuela` varchar(8) DEFAULT NULL,
  `Cod_Objetivo` varchar(8) NOT NULL,
  `Descripcion` varchar(1024) NOT NULL,
  PRIMARY KEY (`Cod_Objetivo`),
  KEY `Cod_Escuela` (`Cod_Escuela`),
  CONSTRAINT `mdl_objetivoeducacional_ibfk_1` FOREIGN KEY (`Cod_Escuela`) REFERENCES `mdl_escuela` (`Cod_Escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_objetivoeducacional: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_objetivoeducacional` DISABLE KEYS */;
REPLACE INTO `mdl_objetivoeducacional` (`Cod_Escuela`, `Cod_Objetivo`, `Descripcion`) VALUES
	('SIS', 'OB1', 'Liderar y/o conformar a nivel regional, nacional e internacional equipos de carácter interdisciplinario y multidisciplinario demostrando conducta ética y practicando valores andinos.'),
	('SIS', 'OB3', 'Desarrollar y gestionar proyectos de sistemas de información que satisfagan y respondan las necesidades organizacionales para el desarrollo sostenible de la sociedad.');
/*!40000 ALTER TABLE `mdl_objetivoeducacional` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_persona
CREATE TABLE IF NOT EXISTS `mdl_persona` (
  `Cod_Persona` varchar(8) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `ApPaterno` varchar(30) DEFAULT NULL,
  `ApMaterno` varchar(30) DEFAULT NULL,
  `NomPersona` varchar(200) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Grado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cod_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_persona` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_resultadoestudiante
CREATE TABLE IF NOT EXISTS `mdl_resultadoestudiante` (
  `Cod_Resultado` varchar(8) NOT NULL,
  `NomResultado` varchar(200) NOT NULL,
  `Descripcion` varchar(1024) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_resultadoestudiante: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_resultadoestudiante` DISABLE KEYS */;
REPLACE INTO `mdl_resultadoestudiante` (`Cod_Resultado`, `NomResultado`, `Descripcion`, `valor`) VALUES
	('RE_A', 'Conocimientos de Computación', 'La capacidad de aplicar conocimientos de matemáticas, ciencias, computación y una especialidad de computación apropiados para los resultados del estudiante y la disciplina del programa.', 1),
	('RE_B', 'Análisis de Problemas', 'La capacidad de identificar, formular, investigar literatura y resolver problemas complejos de computación y otras disciplinas relevantes en el dominio.', 1),
	('RE_D', 'Trabajo Individual y en Equipo', 'La capacidad de desenvolverse eficazmente como individuo, como miembro o líder de equipos diversos.', 1),
	('RE_E', 'Comunicación', 'La capacidad de comunicarse eficazmente, de forma oral y escrita, en una variedad de contextos profesionales.', 1),
	('RE_F', 'Profesionalismo y Sociedad', 'La capacidad de analizar el impacto local y global de la computación sobre las personas, las organizaciones y la sociedad.', 1),
	('RE_G', 'Aprendizaje continuo', 'La capacidad de reconocer la necesidad del aprendizaje y el desarrollo profesional continuo.', 1),
	('RE_H', 'Uso de Herramientas Modernas', 'La capacidad de crear, seleccionar, adaptar y aplicar técnicas, recursos y herramientas modernas para la práctica de la computación, con la comprensión de sus limitaciones.', 1),
	('RE_I', 'Apoyo en Ejecución', 'La comprensión y la capacidad para apoyar el uso, ejecución y gestión de sistemas de información dentro de un entorno de aplicación.', 1);
/*!40000 ALTER TABLE `mdl_resultadoestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_rubrica
CREATE TABLE IF NOT EXISTS `mdl_rubrica` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Asignacion` varchar(8) DEFAULT NULL,
  `Cod_Persona` varchar(8) DEFAULT NULL,
  `NomRubrica` varchar(30) DEFAULT NULL,
  `Nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Rubrica`),
  KEY `Cod_Asignacion` (`Cod_Asignacion`),
  KEY `Cod_Persona` (`Cod_Persona`),
  CONSTRAINT `mdl_rubrica_ibfk_1` FOREIGN KEY (`Cod_Asignacion`) REFERENCES `mdl_asignacion` (`Cod_Asignacion`),
  CONSTRAINT `mdl_rubrica_ibfk_2` FOREIGN KEY (`Cod_Persona`) REFERENCES `mdl_persona` (`Cod_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_rubrica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_rubrica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rubrica` ENABLE KEYS */;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_E
DELIMITER //
	IN pCod_Asignacion varchar(8),
	 IN pCod_Curso VARCHAR (8)
	)
BEGIN
	DELETE FROM mdl_asignacion
	WHERE (Cod_Asignacion=pCod_Asignacion) AND (Cod_Curso=pCod_Curso);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_ASIGNACION_G`(
IN pCod_Curso varchar(8),
IN pCod_Asignacion varchar(8),
IN pNomAsignacion varchar(1024),
IN pTipoAsignacion varchar(200),
IN pParticipantes INT,
IN pPresentados INT,
IN pPendientes INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Asignacion, pCod_Curso FROM mdl_Asignacion WHERE ((Cod_Asignacion = pCod_Asignacion) AND (Cod_Curso= pCod_Curso)))
THEN
INSERT INTO mdl_Asignacion (
Cod_Curso,
Cod_Asignacion,
NomAsignacion,
TipoAsignacion,
Participantes,
Presentados,
Pendientes
)
VALUES (
pCod_Curso,
pCod_Asignacion,
pNomAsignacion,
pTipoAsignacion,
pParticipantes,
pPresentados,
pPendientes
);
ELSE
UPDATE mdl_Asignacion
SET
Cod_Curso=pCod_Curso,
Cod_Asignacion=pCod_Asignacion,
NomAsignacion=pNomAsignacion,
TipoAsignacion=pTipoAsignacion,
Participantes=pParticipantes,
Presentados=pPresentados,
Pendientes=pPendientes
WHERE (Cod_Asignacion = pCod_Asignacion) AND (Cod_Curso = pCod_Curso);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_ASIGNACION_TT`()
BEGIN
	SELECT * FROM mdl_asignacion;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ASIGNACION_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_ASIGNACION_TU`(
   IN pCod_Asignacion varchar(8),
	IN pCod_Resultado varchar(8)
	)
BEGIN
   SELECT *
   FROM mdl_asignacion
   WHERE (Cod_Asignacion=pCod_Asignacion) AND (Cod_Resultado=pCod_Resultado);
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CRITERIO_E`(
   IN pCod_Criterio varchar(8)
   )
BEGIN
   DELETE FROM mdl_Criterio
   WHERE (Cod_Criterio = pCod_Criterio);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CRITERIO_G`(
IN pCod_Rubrica VARCHAR(8),
IN pCod_Criterio VARCHAR(8),
IN pDesCriterio VARCHAR(20)
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica FROM mdl_Criterio WHERE Cod_Rubrica = pCod_Rubrica)
THEN
INSERT INTO mdl_Criterio(
Cod_Rubrica,
DesCriterio,
Cod_Criterio
)
VALUES (
pCod_Rubrica,
pDesCriterio,
pCod_Criterio
);
ELSE
UPDATE mdl_Criterio
SET
Cod_Rubrica=pCod_Rubrica,
DesCriterio=pDesCriterio,
Cod_Criterio=pCod_Criterio
WHERE (Cod_Rubrica=pCod_Rubrica);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CRITERIO_TT`()
BEGIN
	SELECT * FROM mdl_Criterio;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CRITERIO_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CRITERIO_TU`(
   IN pId_Rubrica INT)
BEGIN
   SELECT *
   FROM mdl_Criterio
   where Id_Rubrica=pId_Rubrica;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CURSO_E`(
	IN pCod_Curso varchar(8),
	IN pCod_Resultado VARCHAR(8)
	)
BEGIN
	DELETE FROM mdl_Curso
WHERE (Cod_Curso=pCod_Curso) AND (Cod_Resultado=pCod_Resultado);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CURSO_G`(
IN pCod_Curso varchar(8),
IN pCod_Resultado VARCHAR(8),
IN pNomCurso varchar(1024),
IN pDescripcion varchar(200),
IN pDocente varchar(200),
IN pSemestre varchar(100)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Curso, Cod_Resultado FROM mdl_curso WHERE  (Cod_Curso = pCod_Curso) AND (Cod_Resultado=pCod_Resultado))
THEN
INSERT INTO mdl_curso (
Cod_Curso,
Cod_Resultado,
NomCurso,
Descripcion,
Docente,
Semestre
)
VALUES (
pCod_Curso,
pCod_Resultado,
pNomCurso,
pNomCurso,
pDescripcion,
pDocente,
pSemestre
);
ELSE
UPDATE mdl_curso
SET
Cod_Curso=pCod_Curso,
Cod_Resultado=pCod_Resultado,
NomCurso=pNomCurso,
Descripcion=pDescripcion,
Docente=pDocente,
Semestre=pSemestre
WHERE (Cod_Curso=pCod_Curso) AND (Cod_Resultado=pCod_Resultado);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CURSO_TT`()
BEGIN
	SELECT * FROM mdl_Curso;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSO_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_CURSO_TU`(
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
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_TT`()
BEGIN
	SELECT * FROM mdl_Escuela;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ESCUELA_TU
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ESCUELA_TU`(
   IN pCod_Escuela varchar(8))
BEGIN
   SELECT *
   FROM mdl_Escuela
   where Cod_Escuela = pCod_Escuela;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADORNIVEL_E`(
IN pCod_IndicadorNivel VARCHAR(8)
)
BEGIN
DELETE FROM mdl_indicadornivel
WHERE (Cod_IndicadorNivel=pCod_IndicadorNivel);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADORNIVEL_G`(
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADORNIVEL_TT`()
BEGIN
SELECT * FROM mdl_indicadornivel;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADORNIVEL_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADORNIVEL_TU`(
IN pCod_IndicadorNivel VARCHAR(8)
)
BEGIN
SELECT * FROM mdl_indicadornivel
WHERE (Cod_IndicadorNivel=pCod_IndicadorNivel);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADOR_E`(
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADOR_G`(
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
Cod_Indicador=pCod_Indicador,
DescripcionLarga=pDescripcionLarga,
DescripcionCorta=pDescripcionCorta,
valor=pvalor
WHERE ((Cod_Resultado=pCod_Resultado) AND (Cod_IndicadorNivel=pCod_IndicadorNivel)) AND (Cod_Indicador=pCod_Indicador);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADOR_TT`()
BEGIN
SELECT * FROM mdl_indicador;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_INDICADOR_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_INDICADOR_TU`(
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

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_MATRICULA_E`(
   IN pCod_Persona varchar(8),
	IN pCod_Curso varchar(8)
	)
BEGIN
   DELETE FROM mdl_Matricula
  WHERE (Cod_Persona = pCod_Persona) AND (Cod_Curso=pCod_Curso);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_MATRICULA_G`(
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_MATRICULA_TT`()
BEGIN
	SELECT * FROM mdl_Matricula;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_MATRICULA_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_MATRICULA_TU`(
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_NIVEL_E`(
   IN pCod_Rubrica varchar(8)
   )
BEGIN
   DELETE FROM mdl_Nivel
   WHERE (Cod_Rubrica = pCod_Rubrica);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_NIVEL_G`(
IN pCod_Rubrica VARCHAR(8),
IN pCod_Nivel VARCHAR(8),
IN pDescripcion VARCHAR(10),
IN pPuntaje INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica,pCod_Nivel  FROM mdl_Nivel WHERE  (pCod_Rubrica = pCod_Rubrica) AND (Cod_Nivel=pCod_Nivel))
THEN
INSERT INTO mdl_Nivel(
Cod_Rubrica,
Cod_Nivel.
Descripcion,
Puntaje
)
VALUES (
pCod_Rubrica,
pCod_Nivel,
pDescripcion,
pPuntaje
);
ELSE
UPDATE mdl_Nivel
SET
Cod_Rubrica=pCod_Rubrica,
Cod_Nivel=pCod_Nivel,
Descripcion=pDescripcion,
Puntaje=pPuntaje
WHERE (Cod_Rubrica=pCod_Rubrica) AND (Cod_Nivel=pCod_Nivel);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_NIVEL_TT`()
BEGIN
	SELECT * FROM mdl_Nivel;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_NIVEL_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_NIVEL_TU`(
   IN pCod_Rubrica varchar(8))
BEGIN
   SELECT *
   FROM mdl_Nivel
   where Cod_Rubrica = pCod_Rubrica;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_E
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
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_G`(
IN pCod_Objetivo VARCHAR(8),
IN pCod_Escuela VARCHAR(8),
IN pDescripcion VARCHAR(1024)
)
BEGIN
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
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_TT`()
BEGIN
	SELECT * FROM mdl_objetivoeducacional;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_OBJETIVOEDUCACIONAL_TU
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_PERSONA_E`(
   IN pCod_Persona varchar(8)
   )
BEGIN
   DELETE FROM mdl_Persona
   WHERE (Cod_Persona = pCod_Persona);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_G
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_PERSONA_G`(
IN pCod_Persona VARCHAR(8),
IN pNombre VARCHAR(50),
IN pApPaterno VARCHAR(30),
IN pApMaterno VARCHAR(30),
IN pNomPersona VARCHAR(200),
IN pCorreo VARCHAR(50),
IN pGrado VARCHAR(15)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Persona FROM mdl_Persona WHERE  Cod_Persona = pCod_Persona)
THEN
INSERT INTO mdl_Persona(
Cod_Persona,
Nombre,
ApPaterno,
ApMaterno,
NomPersona,
Correo,
Grado
)
VALUES (
pCod_Persona,
pNombre,
pApPaterno,
pApMaterno,
pNomPersona,
pCorreo,
pGrado
);
ELSE
UPDATE mdl_Persona
SET
Cod_Persona=pCod_Persona,
Nombre=pNombre,
ApPaterno=pApPaterno,
ApMaterno=pApMaterno,
NomPersona=pNomPersona,
Correo=pCorreo,
Grado=pGrado
WHERE (Cod_Persona=pCod_Persona);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_PERSONA_TT`()
BEGIN
	SELECT * FROM mdl_Persona;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_PERSONA_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_PERSONA_TU`(
   IN pCod_Persona varchar(8))
BEGIN
   SELECT *
   FROM mdl_Persona
   where Cod_Persona=pCod_Persona;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_E`(
   IN pCod_Resultado varchar(8)
   )
BEGIN
   DELETE FROM mdl_ResultadoEstudiante
   WHERE (Cod_Resultado = pCod_Resultado);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_G
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_TT`()
BEGIN
	SELECT * FROM mdl_ResultadoEstudiante;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RESULTADOESTUDIANTE_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RESULTADOESTUDIANTE_TU`(
   IN pCod_Resultado varchar(8))
BEGIN
   SELECT *
   FROM mdl_ResultadoEstudiante
   where Cod_Resultado=pCod_Resultado;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_E
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RUBRICA_E`(
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
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RUBRICA_G`(
IN pCod_Rubrica VARCHAR(8),
IN pCod_Asignacion VARCHAR(8),
IN pCod_Persona VARCHAR(8),
IN pNomRubrica VARCHAR(30),
IN pNota INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica, pCod_Asignacion, pCod_Persona FROM mdl_Rubrica WHERE ( (Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona)))
THEN
INSERT INTO mdl_Rubrica(
Cod_Rubrica,
Cod_Asignacion,
Cod_Persona,
NomRubrica,
Nota
)
VALUES (
pCod_Rubrica,
pCod_Asignacion,
pCod_Persona,
pNomRubrica,
pNota
);
ELSE
UPDATE mdl_Rubrica
SET
Cod_Rubrica=pCod_Rubrica,
Cod_Asignacion=pCod_Asignacion,
Cod_Persona=pCod_Persona,
NomRubrica=pNomRubrica,
Nota=pNota
WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona));
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_TT
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RUBRICA_TT`()
BEGIN
	SELECT * FROM mdl_Rubrica;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_RUBRICA_TU
DELIMITER //
CREATE DEFINER=`root`@`pc-lenovo` PROCEDURE `USP_MDL_RUBRICA_TU`(
   IN pCod_Rubrica VARCHAR(8),
   IN pCod_Asignacion VARCHAR(8),
   IN pCod_Persona VARCHAR(8)
   )
BEGIN
   SELECT *
   FROM mdl_Rubrica
   WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona));
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

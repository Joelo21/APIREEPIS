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
  `Flag_Activo` bool DEFAULT NULL,
  PRIMARY KEY (`Cod_Asignacion`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_asignacion_ibfk_1` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_asignacion: ~0 rows (aproximadamente)
DELETE FROM `mdl_asignacion`;
/*!40000 ALTER TABLE `mdl_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_criterio
DROP TABLE IF EXISTS `mdl_criterio`;
CREATE TABLE IF NOT EXISTS `mdl_criterio` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `NivelCriterio` varchar(8) NOT NULL,
  `DesCriterio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Criterio`),
  KEY `Cod_Rubrica` (`Cod_Rubrica`),
  CONSTRAINT `mdl_criterio_ibfk_1` FOREIGN KEY (`Cod_Rubrica`) REFERENCES `mdl_rubrica` (`Cod_Rubrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_criterio: ~0 rows (aproximadamente)
DELETE FROM `mdl_criterio`;
/*!40000 ALTER TABLE `mdl_criterio` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_criterio` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_gcriterio
DROP TABLE IF EXISTS `mdl_gcriterio`;
CREATE TABLE IF NOT EXISTS `mdl_gcriterio` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `NivelCriterio` varchar(8) NOT NULL,
  `DesCriterio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Criterio`),
  KEY `Cod_Rubrica` (`Cod_Rubrica`),
  CONSTRAINT `mdl_gcriterio_ibfk_1` FOREIGN KEY (`Cod_Rubrica`) REFERENCES `mdl_grubrica` (`Cod_Rubrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_gcriterio: ~0 rows (aproximadamente)
DELETE FROM `mdl_gcriterio`;
/*!40000 ALTER TABLE `mdl_gcriterio` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gcriterio` ENABLE KEYS */;

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

-- Volcando datos para la tabla reepis.mdl_curso: ~0 rows (aproximadamente)
DELETE FROM `mdl_curso`;
/*!40000 ALTER TABLE `mdl_curso` DISABLE KEYS */;
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
DELETE FROM `mdl_cursoobjetivo`;
/*!40000 ALTER TABLE `mdl_cursoobjetivo` DISABLE KEYS */;
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
DELETE FROM `mdl_escuela`;
/*!40000 ALTER TABLE `mdl_escuela` DISABLE KEYS */;
INSERT INTO `mdl_escuela` (`Cod_Escuela`, `Sede`, `Descripcion`) VALUES
	('AMB', 'LARAPA', 'Ingeneria Ambiental'),
	('CIV', 'LARAPA', 'Ingeneria Civil'),
	('IND', 'LARAPA', 'Ingeneria Industrial'),
	('SIS', 'Larapa', 'Ingeneria de Sistemas');
/*!40000 ALTER TABLE `mdl_escuela` ENABLE KEYS */;

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
DELETE FROM `mdl_indicador`;
/*!40000 ALTER TABLE `mdl_indicador` DISABLE KEYS */;
INSERT INTO `mdl_indicador` (`Cod_Resultado`, `Cod_Indicadornivel`, `Cod_Indicador`, `DescripcionLarga`, `DescripcionCorta`, `valor`) VALUES
	('RE_I', 'N1', '13', 'Selecciona y usa herramientas para la de gestión de sistemas de información.', 'Selecciona y usa herramientas para la de gestión de sistemas de información.', 1),
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
DELETE FROM `mdl_indicadornivel`;
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

-- Volcando datos para la tabla reepis.mdl_indrecursobjetivo: ~0 rows (aproximadamente)
DELETE FROM `mdl_indrecursobjetivo`;
/*!40000 ALTER TABLE `mdl_indrecursobjetivo` DISABLE KEYS */;
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
DELETE FROM `mdl_matricula`;
/*!40000 ALTER TABLE `mdl_matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_matricula` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_nivel
DROP TABLE IF EXISTS `mdl_nivel`;
CREATE TABLE IF NOT EXISTS `mdl_nivel` (
  `Cod_Nivel` varchar(8) NOT NULL,
  `Cod_Criterio` varchar(8) NOT NULL,
  `Descripcion` varchar(10) DEFAULT NULL,
  `Puntaje` int DEFAULT NULL,
  `PuntajeObtenido` int DEFAULT NULL,
  `PuntajeFinal` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Nivel`),
  KEY `Cod_Criterio` (`Cod_Criterio`),
  CONSTRAINT `mdl_nivel_ibfk_1` FOREIGN KEY (`Cod_Criterio`) REFERENCES `mdl_criterio` (`Cod_Criterio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_nivel: ~3 rows (aproximadamente)
DELETE FROM `mdl_nivel`;
/*!40000 ALTER TABLE `mdl_nivel` DISABLE KEYS */;
INSERT INTO `mdl_nivel` (`Cod_Nivel`, `Descripcion`, `Puntaje`) VALUES
	('N1', 'NIVEL 1', 1),
	('N2', 'NIVEL 2', 2),
	('N3', 'NIVEL 3', 3);
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
DELETE FROM `mdl_objetivoeducacional`;
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

-- Volcando datos para la tabla reepis.mdl_persona: ~0 rows (aproximadamente)
DELETE FROM `mdl_persona`;
/*!40000 ALTER TABLE `mdl_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_persona` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_resulcursobjetivo
DROP TABLE IF EXISTS `mdl_resulcursobjetivo`;
CREATE TABLE IF NOT EXISTS `mdl_resulcursobjetivo` (
  `Cod_ResulCursObjetivo` varchar(16) NOT NULL,
  `Cod_Objetivo` varchar(16) NOT NULL,
  `Cod_Resultado` varchar(16) NOT NULL,
  `Cod_Curso` varchar(16) NOT NULL,
  PRIMARY KEY (`Cod_ResulCursObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_resulcursobjetivo: ~0 rows (aproximadamente)
DELETE FROM `mdl_resulcursobjetivo`;
/*!40000 ALTER TABLE `mdl_resulcursobjetivo` DISABLE KEYS */;
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
DELETE FROM `mdl_resultadoestudiante`;
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
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Asignacion` varchar(8) DEFAULT NULL,
  `Cod_Persona` varchar(8) DEFAULT NULL,
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `NomRubrica` varchar(30) DEFAULT NULL,
  `Descripcion` VARCHAR(1024) DEFAULT NULL,
  `Nota` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Rubrica`),
  KEY `Cod_Asignacion` (`Cod_Asignacion`),
  KEY `Cod_Persona` (`Cod_Persona`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_rubrica_ibfk_1` FOREIGN KEY (`Cod_Asignacion`) REFERENCES `mdl_asignacion` (`Cod_Asignacion`),
  CONSTRAINT `mdl_rubrica_ibfk_2` FOREIGN KEY (`Cod_Persona`) REFERENCES `mdl_persona` (`Cod_Persona`),
  CONSTRAINT `mdl_rubrica_ibfk_3` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_rubrica: ~0 rows (aproximadamente)
DELETE FROM `mdl_rubrica`;
/*!40000 ALTER TABLE `mdl_rubrica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rubrica` ENABLE KEYS */;

-- Volcando estructura para tabla reepis.mdl_grubrica
DROP TABLE IF EXISTS `mdl_grubrica`;
CREATE TABLE IF NOT EXISTS `mdl_grubrica` (
  `Cod_Rubrica` varchar(8) NOT NULL,
  `Cod_Asignacion` varchar(8) DEFAULT NULL,
  `Cod_Curso` varchar(8) DEFAULT NULL,
  `NomRubrica` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Rubrica`),
  KEY `Cod_Asignacion` (`Cod_Asignacion`),
  KEY `Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `mdl_grubrica_ibfk_1` FOREIGN KEY (`Cod_Asignacion`) REFERENCES `mdl_asignacion` (`Cod_Asignacion`),
  CONSTRAINT `mdl_grubrica_ibfk_2` FOREIGN KEY (`Cod_Curso`) REFERENCES `mdl_curso` (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla reepis.mdl_grubrica: ~0 rows (aproximadamente)
DELETE FROM `mdl_grubrica`;
/*!40000 ALTER TABLE `mdl_grubrica` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grubrica` ENABLE KEYS */;

-- Volcando estructura para función reepis.TraerCod_Escuela
DROP FUNCTION IF EXISTS `TraerCod_Escuela`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `TraerCod_Escuela`(pDescripcion VARCHAR(255)) RETURNS varchar(8) CHARSET utf8
RETURN (SELECT Cod_Escuela  FROM mdl_escuela WHERE Descripcion = pDescripcion)//
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
IN pCod_Rubrica VARCHAR(8),
IN pCod_Criterio VARCHAR(8),
IN pNivelCriterio VARCHAR(8),
IN pDesCriterio VARCHAR(20)
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica FROM mdl_Criterio WHERE Cod_Rubrica = pCod_Rubrica)
THEN
INSERT INTO mdl_Criterio(
Cod_Rubrica,
DesCriterio,
NivelCriterio,
Cod_Criterio
)
VALUES (
pCod_Rubrica,
pDesCriterio,
pNivelCriterio,
pCod_Criterio
);
ELSE
UPDATE mdl_Criterio
SET
Cod_Rubrica=pCod_Rubrica,
DesCriterio=pDesCriterio,
NivelCriterio=pNivelCriterio,
Cod_Criterio=pCod_Criterio
WHERE (Cod_Rubrica=pCod_Rubrica);
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
IN pDesCriterio VARCHAR(20)
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica FROM MDL_GCRITERIO WHERE Cod_Rubrica = pCod_Rubrica)
THEN
INSERT INTO MDL_GCRITERIO(
Cod_Rubrica,
DesCriterio,
NivelCriterio,
Cod_Criterio
)
VALUES (
pCod_Rubrica,
pDesCriterio,
pNivelCriterio,
pCod_Criterio
);
ELSE
UPDATE MDL_GCRITERIO
SET
Cod_Rubrica=pCod_Rubrica,
DesCriterio=pDesCriterio,
NivelCriterio=pNivelCriterio,
Cod_Criterio=pCod_Criterio
WHERE (Cod_Rubrica=pCod_Rubrica);
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
   SELECT *
   FROM mdl_IndRecursobjetivo
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
IN pCod_Nivel VARCHAR(8),
IN pCod_Criterio VARCHAR(8),
IN pDescripcion VARCHAR(10),
IN pPuntaje INT,
IN pPuntajeOb INT,
IN pPuntajeFinal INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Nivel  FROM mdl_Nivel WHERE  (Cod_Nivel=pCod_Nivel))
THEN
INSERT INTO mdl_Nivel(
Cod_Nivel,
Cod_Criterio,
Descripcion,
Puntaje,
PuntajeOb,
PuntajeFinal
)
VALUES (
pCod_Nivel,
pCod_Criterio,
pDescripcion,
pPuntaje,
pPuntajeOb,
pPuntajeFinal
);
ELSE
UPDATE mdl_Nivel
SET
Cod_Nivel=pCod_Nivel,
Cod_Criterio=pCod_Criterio,
Descripcion=pDescripcion,
Puntaje=pPuntaje,
PuntajeOb=pPuntajeOb,
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
IN pCod_Objetivo VARCHAR(16),
IN pCod_Resultado VARCHAR(16),
IN pCod_Curso VARCHAR(16)
)
BEGIN
IF NOT EXISTS (SELECT Cod_ResulCursObjetivo FROM mdl_ResulCursObjetivo WHERE Cod_ResulCursObjetivo = pCod_ResulCursObjetivo)
THEN
INSERT INTO mdl_ResulCursObjetivo(
Cod_ResulCursObjetivo,
Cod_Objetivo,
Cod_Resultado,
Cod_Curso
)
VALUES (
pCod_ResulCursObjetivo,
pCod_Objetivo,
pCod_Resultado,
pCod_Curso
);
ELSE
UPDATE mdl_ResulCursObjetivo
SET
Cod_ResulCursObjetivo=pCod_ResulCursObjetivo,
Cod_Objetivo=pCod_Objetivo,
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
IN pCod_Rubrica VARCHAR(8),
IN pCod_Asignacion VARCHAR(8),
IN pCod_Persona VARCHAR(8),
IN pCod_Curso VARCHAR(8), 
IN pNomRubrica VARCHAR(30),
IN pDescripcion VARCHAR(1024),
IN pNota INT
)
BEGIN
IF NOT EXISTS (SELECT pCod_Rubrica, pCod_Asignacion, pCod_Persona FROM mdl_Rubrica WHERE ( (Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona)))
THEN
INSERT INTO mdl_Rubrica(
Cod_Rubrica,
Cod_Asignacion,
Cod_Persona,
Cod_Curso,
NomRubrica,
Descripcion,
Nota
)
VALUES (
pCod_Rubrica,
pCod_Asignacion,
pCod_Persona,
pCod_Curso,
pNomRubrica,
pCod_Curso,
pNota
);
ELSE
UPDATE mdl_Rubrica
SET
Cod_Rubrica=pCod_Rubrica,
Cod_Asignacion=pCod_Asignacion,
Cod_Persona=pCod_Persona,
Cod_Curso=pCod_Curso,
NomRubrica=pNomRubrica,
Cod_Curso=pCod_Curso,
Nota=pNota
WHERE ((Cod_Rubrica = pCod_Rubrica) AND (Cod_Asignacion = pCod_Asignacion) AND (Cod_Persona = pCod_Persona));
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
IN pNomRubrica VARCHAR(30)
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

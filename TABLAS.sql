-- Volcando estructura para tabla reepis.mdl_CursoObjetivo
CREATE TABLE IF NOT EXISTS `mdl_CursoObjetivo` (
  `Cod_CursoObjetivo` varchar(8) NOT NULL,
  `Cod_Objetivo` varchar(8)  NOT NULL,
  `Cod_Curso` varchar(8)  NOT NULL,
  PRIMARY KEY (`Cod_CursoObjetivo`,`Cod_Objetivo`,`Cod_Curso`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--STORED PROCEDURE--

-- Volcando estructura para tabla reepis.mdl_ResulCursOjetivo
CREATE TABLE IF NOT EXISTS `mdl_ResulCursOjetivo` (
  `Cod_ResulCursOjetivo` varchar(8) NULL,
  `Cod_Objetivo` varchar(8)  NOT NULL,
  PRIMARY KEY (`Cod_ResulCursOjetivo`,`Cod_Objetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_E`(
   IN pCod_CursoObjetivo VARCHAR(8)
   )
BEGIN
   DELETE FROM mdl_CursoObjetivo
   WHERE (Cod_CursoObjetivo = pCod_CursoObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_G`(
IN pCod_CursoObjetivo VARCHAR(8),
IN pCod_Objetivo VARCHAR(8),
IN pCod_Curso VARCHAR(8)
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

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TT
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_TT`()
BEGIN
	SELECT * FROM mdl_CursoObjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TU
DELIMITER //
CREATE PROCEDURE  `USP_MDL_CURSOBJETIVO_TU`(
   IN pCod_CursoObjetivo INT)
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_CursoObjetivo=pCod_CursoObjetivo;
   END//
DELIMITER ;


-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_E`(
   IN pCod_CursoObjetivo VARCHAR(8)
   )
BEGIN
   DELETE FROM mdl_CursoObjetivo
   WHERE (Cod_CursoObjetivo = pCod_CursoObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_G`(
IN pCod_CursoObjetivo VARCHAR(8),
IN pCod_Objetivo VARCHAR(8),
IN pCod_Curso VARCHAR(8)
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

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TT
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_TT`()
BEGIN
	SELECT * FROM mdl_CursoObjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TU
DELIMITER //
CREATE PROCEDURE  `USP_MDL_CURSOBJETIVO_TU`(
   IN pCod_CursoObjetivo INT)
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_CursoObjetivo=pCod_CursoObjetivo;
   END//
DELIMITER ;

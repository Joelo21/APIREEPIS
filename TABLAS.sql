-- Volcando estructura para tabla reepis.mdl_CursoObjetivo
CREATE TABLE IF NOT EXISTS `mdl_CursoObjetivo` (
  `Cod_CursoObjetivo` VARCHAR(16) NOT NULL,
  `Cod_Objetivo` VARCHAR(16)  NOT NULL,
  `Cod_Curso` VARCHAR(16)  NOT NULL,
  PRIMARY KEY (`Cod_CursoObjetivo`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TT
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_TT`()
BEGIN
	SELECT * FROM mdl_CursoObjetivo;
	END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_TxCod_Curso`(
IN pCod_Curso VARCHAR(16))
BEGIN
	SELECT * FROM mdl_CursoObjetivo
	 where Cod_Curso=pCod_Curso;
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

-- Volcando estructura para tabla reepis.mdl_IndRecursobjetivo
CREATE TABLE IF NOT EXISTS `mdl_IndRecursobjetivo` (
  `Cod_Indrecursobjetivo` varchar(8) NULL,
  `Cod_ResulCursOjetivo` varchar(8)  NOT NULL,
  PRIMARY KEY (`Cod_Indrecursobjetivo`,`Cod_ResulCursOjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;


-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_IndRecursobjetivo_E`(
   IN pCod_Indrecursobjetivo VARCHAR(8)
   )
BEGIN
   DELETE FROM mdl_IndRecursobjetivo
   WHERE (Cod_Indrecursobjetivo = pCod_Indrecursobjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_G
DELIMITER //
CREATE PROCEDURE `USP_MDL_IndRecursobjetivo_G`(
IN pCod_Indrecursobjetivo VARCHAR(8),
IN pCod_ResulCursOjetivo VARCHAR(8)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Indrecursobjetivo FROM mdl_IndRecursobjetivo WHERE Cod_Indrecursobjetivo = pCod_Indrecursobjetivo)
THEN
INSERT INTO mdl_IndRecursobjetivo(
Cod_Indrecursobjetivo,
Cod_ResulCursOjetivo
)
VALUES (
pCod_Indrecursobjetivo,
pCod_ResulCursOjetivo
);
ELSE
UPDATE mdl_IndRecursobjetivo
SET
Cod_Indrecursobjetivo=pCod_Indrecursobjetivo,
Cod_ResulCursOjetivo=pCod_ResulCursOjetivo
WHERE (Cod_Indrecursobjetivo=pCod_Indrecursobjetivo);
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_TT
DELIMITER //
CREATE PROCEDURE `USP_MDL_IndRecursobjetivo_TT`()
BEGIN
	SELECT * FROM mdl_IndRecursobjetivo;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_TU
DELIMITER //
CREATE PROCEDURE  `USP_MDL_IndRecursobjetivo_TU`(
   IN pCod_Indrecursobjetivo INT)
BEGIN
   SELECT *
   FROM mdl_IndRecursobjetivo
   where Cod_Indrecursobjetivo=pCod_Indrecursobjetivo;
   END//
DELIMITER ;
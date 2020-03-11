-- Tabla reepis.mdl_CursoObjetivo
CREATE TABLE IF NOT EXISTS `mdl_CursoObjetivo` (
  `Cod_CursoObjetivo` varchar(16) NOT NULL,
  `Cod_Objetivo` varchar(16)  NOT NULL,
  `Cod_Curso` varchar(16)  NOT NULL,
  PRIMARY KEY (`Cod_CursoObjetivo`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--STORED PROCEDURE--
-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_CURSOBJETIVO_E`(
   IN pCod_CursoObjetivo VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_CursoObjetivo
   WHERE (Cod_CursoObjetivo = pCod_CursoObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_G
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
CREATE PROCEDURE  `USP_MDL_CURSOBJETIVO_TxCod_Curso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE  `USP_MDL_CURSOBJETIVO_TobxCod_Curso`(
   IN pCod_Curso VARCHAR(16))
BEGIN
   SELECT Cod_Objetivo AS value, Cod_Objetivo AS label
   FROM mdl_CursoObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_CURSOBJETIVO_TU
DELIMITER //
CREATE PROCEDURE  `USP_MDL_CURSOBJETIVO_TU`(
   IN pCod_CursoObjetivo VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_CursoObjetivo
   where Cod_CursoObjetivo=pCod_CursoObjetivo;
   END//
DELIMITER ;

-- tabla reepis.mdl_ResulCursObjetivo
CREATE TABLE IF NOT EXISTS `mdl_ResulCursObjetivo` (
  `Cod_ResulCursObjetivo` varchar(16) NULL,
  `Cod_Objetivo` varchar(16)  NOT NULL,
  `Cod_Resultado` varchar(16)  NOT NULL,  
  `Cod_Curso` varchar(16)  NOT NULL,
  PRIMARY KEY (`Cod_ResulCursObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_ResulCursObjetivo_E`(
   IN pCod_ResulCursObjetivo VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_ResulCursObjetivo
   WHERE (Cod_ResulCursObjetivo = pCod_ResulCursObjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_G
DELIMITER //
CREATE PROCEDURE `USP_MDL_ResulCursObjetivo_G`(
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

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TT
DELIMITER //
CREATE PROCEDURE `USP_MDL_ResulCursObjetivo_TT`()
BEGIN
	SELECT * FROM mdl_ResulCursObjetivo;
	END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `USP_MDL_ResulCursObjetivo_TxCod_Curso`(
   IN pCod_Curso varchar(16))
BEGIN
   SELECT *
   FROM mdl_ResulCursObjetivo
   where Cod_Curso=pCod_Curso;
   END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_ResulCursObjetivo_TU
DELIMITER //
CREATE PROCEDURE `USP_MDL_ResulCursObjetivo_TU`(
   IN pCod_ResulCursObjetivo varchar(16))
BEGIN
   SELECT *
   FROM mdl_ResulCursObjetivo
   where Cod_ResulCursObjetivo=pCod_ResulCursObjetivo;
   END//
DELIMITER ;


-- tabla reepis.mdl_IndRecursobjetivo
CREATE TABLE IF NOT EXISTS `mdl_IndRecursobjetivo` (
  `Cod_Indrecursobjetivo` VARCHAR(16) NOT NULL,
  `Cod_ResulCursObjetivo` VARCHAR(16)  NOT NULL,
  PRIMARY KEY (`Cod_Indrecursobjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_E
DELIMITER //
CREATE PROCEDURE `USP_MDL_IndRecursobjetivo_E`(
   IN pCod_Indrecursobjetivo VARCHAR(16)
   )
BEGIN
   DELETE FROM mdl_IndRecursobjetivo
   WHERE (Cod_Indrecursobjetivo = pCod_Indrecursobjetivo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento reepis.USP_MDL_IndRecursobjetivo_G
DELIMITER //
CREATE PROCEDURE `USP_MDL_IndRecursobjetivo_G`(
IN pCod_Indrecursobjetivo VARCHAR(16),
IN pCod_ResulCursObjetivo VARCHAR(16)
)
BEGIN
IF NOT EXISTS (SELECT Cod_Indrecursobjetivo FROM mdl_IndRecursobjetivo WHERE Cod_Indrecursobjetivo = pCod_Indrecursobjetivo)
THEN
INSERT INTO mdl_IndRecursobjetivo(
Cod_Indrecursobjetivo,
Cod_ResulCursObjetivo
)
VALUES (
pCod_Indrecursobjetivo,
pCod_ResulCursObjetivo
);
ELSE
UPDATE mdl_IndRecursobjetivo
SET
Cod_Indrecursobjetivo=pCod_Indrecursobjetivo,
Cod_ResulCursObjetivo=pCod_ResulCursObjetivo
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
   IN pCod_Indrecursobjetivo VARCHAR(16))
BEGIN
   SELECT *
   FROM mdl_IndRecursobjetivo
   where Cod_Indrecursobjetivo=pCod_Indrecursobjetivo;
   END//
DELIMITER ;

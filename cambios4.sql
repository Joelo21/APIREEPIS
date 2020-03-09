1111
DELIMITER //
CREATE PROCEDURE `USP_MDL_ESCUELA_TT_CodDesc`()
BEGIN
	SELECT Descripcion AS value, Descripcion AS label  FROM mdl_Escuela;
	END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_TT`()
BEGIN
	SELECT E.Descripcion  AS Cod_Escuela, OB.Cod_Objetivo, OB.Descripcion  FROM mdl_objetivoeducacional AS OB INNER JOIN mdl_escuela AS E ON OB.Cod_Escuela = E.Cod_Escuela;
	END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION TraerCod_Escuela(pDescripcion VARCHAR(255)) 
RETURNS VARCHAR(8) 
	RETURN (SELECT Cod_Escuela  FROM mdl_escuela WHERE Descripcion = pDescripcion)
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `USP_MDL_OBJETIVOEDUCACIONAL_G`(
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
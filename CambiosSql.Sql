DROP PROCEDURE IF EXISTS `USP_MDL_INDICADOR_TT_CodDesc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_INDICADOR_TT_CodDesc`()
BEGIN
	SELECT Cod_Indicador AS value, Cod_Indicador AS label  FROM mdl_indicador;
	END//
DELIMITER ;

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


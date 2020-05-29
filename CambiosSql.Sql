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

DROP PROCEDURE IF EXISTS `USP_MDL_ASIGNACION_TxRubrica`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_MDL_ASIGNACION_TxRubrica`(
   IN pCod_Curso varchar(8),
	IN pCod_Asignacion varchar(8),
	IN pId_Asignacion varchar(8))
BEGIN
		SELECT A.Cod_Asignacion, A.Id_Asignacion, GR.NomRubrica, GC.NivelCriterio, GC.DesCriterio, AI.Cod_AsignacionIndicador, AI.Cod_Resultado FROM mdl_asignacion A
		INNER JOIN mdl_grubrica AS GR ON A.Cod_Asignacion = GR.Cod_Asignacion AND A.Cod_Curso = GR.Cod_Curso
		INNER JOIN mdl_gcriterio AS GC ON GR.Cod_Rubrica = GC.Cod_Rubrica
		LEFT JOIN mdl_asignacionindicador AS AI ON AI.Cod_Criterio = GC.Cod_Criterio 
		WHERE A.Cod_Curso = pCod_Curso AND A.Id_Asignacion = pId_Asignacion AND A.Cod_Asignacion = pCod_Asignacion
		ORDER BY GC.NivelCriterio ASC;
   END//
DELIMITER ; 

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

DROP FUNCTION IF EXISTS `TraerPosicion`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `TraerPosicion`
(pCod_Resultado VARCHAR(16), pNivelCriterio VARCHAR(16), pCod_Criterio VARCHAR(16)) 
RETURNS INT DETERMINISTIC
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
END;
//
DELIMITER ;


SELECT A.NomAsignacion, 
P.Nombre, C.NivelCriterio, GC.DesCriterio, CO.Cod_Objetivo, RO.Cod_Resultado, IR.Cod_Indicador, IF(N.PuntajeFinal=0.99, 1, N.PuntajeFinal) AS PuntajeFinal FROM mdl_nivel AS N
INNER JOIN mdl_criterio AS C ON N.Cod_Criterio = C.Cod_Criterio
INNER JOIN mdl_rubrica AS R ON C.Cod_RubricaPersona = R.Cod_RubricaPersona
INNER JOIN mdl_persona AS P ON R.Cod_Persona = P.Cod_Persona
INNER JOIN mdl_asignacion AS A ON R.Cod_Asignacion = A.Cod_Asignacion AND A.Id_Asignacion = '48' AND A.Cod_Unidad = '13'
INNER JOIN mdl_grubrica AS GR ON A.Cod_Asignacion = GR.Cod_Asignacion
INNER JOIN mdl_gcriterio AS GC ON GR.Cod_Rubrica = GC.Cod_Rubrica AND GC.DesCriterio = C.DesCriterio
INNER JOIN mdl_asignacionindicador AS AI ON GC.Cod_Criterio = AI.Cod_Criterio AND GC.NivelCriterio = AI.NivelCriterio
INNER JOIN mdl_indrecursobjetivo AS IR ON AI.Cod_Resultado = IR.Cod_IndicarResultado
INNER JOIN mdl_resulcursobjetivo AS RO ON IR.Cod_Resultado = RO.Cod_ResulCursObjetivo
INNER JOIN mdl_cursoobjetivo AS CO ON RO.Cod_Objetivo = CO.Cod_Objetivo AND CO.Cod_Curso = '5'
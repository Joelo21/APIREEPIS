const express = require("express");
const router = express.Router();
const CResultadoIndicadorServicio = require("../services/SresultadoIndicador");
const ResultadoIndicadorServicio = new CResultadoIndicadorServicio();

router.get("/List", async function(req, res, next) {
  try {
    const TresultadoIndicador = await ResultadoIndicadorServicio.TraerTodos(
      "CALL USP_MDL_IndRecursobjetivo_TT"
    ).then(resultadoIndicador => {
      if (resultadoIndicador[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          ResultadoIndicadors: resultadoIndicador[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ListreinCod_Curso", async function(req, res, next) {
  const { Cod_Curso } = req.body;
  try {
    const TresultadoIndicador = await ResultadoIndicadorServicio.TraerUno(
      "CALL USP_MDL_IndRecursobjetivo_TxCod_Curso(?)",
      [Cod_Curso]
    ).then(resultadoIndicador => {
      if (resultadoIndicador[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          resultadoIndicadors: resultadoIndicador[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_IndicarResultado", async function(req, res, next) {
  const { Cod_IndicarResultado } = req.params;
  try {
    const TresultadoIndicador = await ResultadoIndicadorServicio.TraerUno(
      "CALL USP_MDL_IndRecursobjetivo_TU(?)",
      [Cod_IndicarResultado]
    ).then(resultadoIndicador => {
      if (resultadoIndicador[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          resultadoIndicadors: resultadoIndicador[0][0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Guardar", async function(req, res, next) {
  const { 
    Cod_IndicarResultado, 
    Cod_Resultado, 
    Cod_Indicador,
    Cod_Curso 
  } = req.body;
  try {
    const GresultadoIndicador = await ResultadoIndicadorServicio.Guardar(
      "CALL USP_MDL_IndRecursobjetivo_G(?,?,?,?)",
      [Cod_IndicarResultado, Cod_Resultado, Cod_Indicador, Cod_Curso]
    ).then(resultadoIndicador => {
      res.status(201).json({
        ResultadoIndicador: resultadoIndicador,
        Codigo: "Resultado Indicador guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_IndicarResultado } = req.body;
  try {
    const EresultadoIndicador = await ResultadoIndicadorServicio.Eliminar(
      "CALL USP_MDL_IndRecursobjetivo_E(?)",
      [Cod_IndicarResultado]  
    ).then(resultadoIndicador => {
      if (resultadoIndicador.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          resultadoIndicador: "Objetivo  Resutado Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

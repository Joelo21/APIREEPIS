const express = require("express");
const router = express.Router();
const CResultadoIndicadorServicio = require("../services/SresultadoIndicador");
const resultadoIndicadorServicio = new CResultadoIndicadorServicio();

router.get("/List", async function(req, res, next) {
  try {
    const TresultadoIndicador = await resultadoIndicadorServicio.TraerTodos(
      "CALL USP_MDL_ResulCursObjetivo_TT"
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

router.post("/ListCod_Curso", async function(req, res, next) {
  const { Cod_Curso } = req.body;
  try {
    const TresultadoIndicador = await resultadoIndicadorServicio.TraerUno(
      "CALL USP_MDL_ResulCursObjetivo_TxCod_Curso(?)",
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

router.get("/:Cod_resultadoIndicador", async function(req, res, next) {
  const { Cod_resultadoIndicador } = req.params;
  try {
    const TresultadoIndicador = await resultadoIndicadorServicio.TraerUno(
      "CALL UUSP_MDL_ResulCursObjetivo_TU(?)",
      [Cod_resultadoIndicador]
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
    Cod_ResulCursObjetivo, 
    Cod_Objetivo, 
    Cod_Resultado,
    Cod_Curso 
  } = req.body;
  try {
    const GresultadoIndicador = await resultadoIndicadorServicio.Guardar(
      "CALL USP_MDL_ResulCursObjetivo_G(?,?,?,?)",
      [Cod_ResulCursObjetivo, Cod_Objetivo, Cod_Resultado, Cod_Curso]
    ).then(resultadoIndicador => {
      res.status(201).json({
        resultadoIndicador: resultadoIndicador,
        Codigo: "Objetivo Resutado guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del:Cod_resultadoIndicador", async function(req, res, next) {
  const { Cod_resultadoIndicador } = req.params;
  try {
    const EresultadoIndicador = await resultadoIndicadorServicio.Eliminar(
      "CALL USP_MDL_ResulCursObjetivo_E(?)",
      [Cod_resultadoIndicador]
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

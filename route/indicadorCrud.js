const express = require("express");
const router = express.Router();
const CIndicadorServicio = require("../services/Sindicador");
const IndicadorServicio = new CIndicadorServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tindicador = await IndicadorServicio.TraerTodos(
      "CALL USP_MDL_INDICADOR_TT"
    ).then(indicadores => {
      if (indicadores[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Indicadores: indicadores[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ListInxRe", async function(req, res, next) {
  const { Cod_ResulCursObjetivo } = req.body;
  try {
    const TresultadoIndicador = await IndicadorServicio.TraerUno(
      "CALL USP_MDL_INDICADOR_TxCod_Resultado(?)",
      [Cod_ResulCursObjetivo]
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

router.get("/ListCom", async function(req, res, next) {
  try {
    const Tindicador = await IndicadorServicio.TraerTodos(
      "CALL USP_MDL_INDICADOR_TT_CodDesc"
    ).then(indicadores => {
      if (indicadores[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Indicadores: indicadores[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Indicador/:Cod_Resultado/:Cod_Indicadornivel", async function(req, res, next) {
  const {Cod_Indicador, Cod_Resultado, Cod_Indicadornivel} = req.params;

  try {
    const TUindicador = await IndicadorServicio.TraerUno(
      "CALL USP_MDL_INDICADOR_TU(?,?,?)",
      [Cod_Indicador, Cod_Resultado, Cod_Indicadornivel]
    ).then(indicador => {
      if (indicador[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Indicador: indicador[0][0],
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
    Cod_Resultado,
    Cod_Indicadornivel,
    Cod_Indicador,
    DescripcionLarga,
    DescripcionCorta,
    valor
  } = req.body;

  try {
    const Gindicador = await IndicadorServicio.Guardar(
      "CALL USP_MDL_INDICADOR_G(?,?,?,?,?,?)",
      [
        Cod_Resultado,
        Cod_Indicadornivel,
        Cod_Indicador,
        DescripcionLarga,
        DescripcionCorta,
        valor
      ]
    ).then(indicador => {
      res.status(201).json({
        Resultado: indicador,
        Codigo: "Indicador guardado"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Indicador, Cod_Resultado, Cod_Indicadornivel } = req.body;

  try {
    const Eindicador = await IndicadorServicio.Eliminar(
      "CALL USP_MDL_INDICADOR_E(?,?,?)",
      [Cod_Indicador, Cod_Resultado, Cod_Indicadornivel]
    ).then(indicador => {
      if (indicador.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Indicador: "Escuela Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

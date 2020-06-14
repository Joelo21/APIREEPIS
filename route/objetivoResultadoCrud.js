const express = require("express");
const router = express.Router();
const CObjetivoResultadoServicio = require("../services/SobjetivoResultado");
const ObjetivoResultadoServicio = new CObjetivoResultadoServicio();

router.get("/List", async function(req, res, next) {
  try {
    const TobjetivoResultado = await ObjetivoResultadoServicio.TraerTodos(
      "CALL USP_MDL_ResulCursObjetivo_TT"
    ).then(objetivoResultado => {
      if (objetivoResultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          ObjetivoResultados: objetivoResultado[0],
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
    const TobjetivoResultado = await ObjetivoResultadoServicio.TraerUno(
      "CALL USP_MDL_ResulCursObjetivo_TxCod_Curso(?)",
      [Cod_Curso]
    ).then(objetivoResultado => {
      if (objetivoResultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          ObjetivoResultados: objetivoResultado[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ListRExCod_Curso", async function(req, res, next) {
  const { Cod_Curso } = req.body;
  try {
    const TcursoObjetivo = await ObjetivoResultadoServicio.TraerUno(
      "CALL USP_MDL_ResulCursObjetivo_TrexCod_Curso(?)",
      [Cod_Curso]
    ).then(objetivoResultado => {
      if (objetivoResultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          ObjetivoResultados: objetivoResultado[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_objetivoResultado", async function(req, res, next) {
  const { Cod_objetivoResultado } = req.params;
  try {
    const TobjetivoResultado = await ObjetivoResultadoServicio.TraerUno(
      "CALL USP_MDL_ResulCursObjetivo_TU(?)",
      [Cod_objetivoResultado]
    ).then(objetivoResultado => {
      if (objetivoResultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          ObjetivoResultados: objetivoResultado[0][0],
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
    const GobjetivoResultado = await ObjetivoResultadoServicio.Guardar(
      "CALL USP_MDL_ResulCursObjetivo_G(?,?,?,?)",
      [Cod_ResulCursObjetivo, Cod_Objetivo, Cod_Resultado, Cod_Curso]
    ).then(objetivoResultado => {
      res.status(201).json({
        ObjetivoResultado: objetivoResultado[0],
        Codigo: "Objetivo Resutado guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_objetivoResultado } = req.body;
  try {
    const EobjetivoResultado = await ObjetivoResultadoServicio.Eliminar(
      "CALL USP_MDL_ResulCursObjetivo_E(?)",
      [Cod_objetivoResultado]
    ).then(objetivoResultado => {
      if (objetivoResultado.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          ObjetivoResultado: "Objetivo  Resutado Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

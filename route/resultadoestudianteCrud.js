const express = require("express");
const router = express.Router();
const CResultadoServicio = require("../services/Sresultadoestudiante");
const ResultadoServicio = new CResultadoServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tresultados = await ResultadoServicio.TraerTodos(
      "CALL USP_MDL_RESULTADOESTUDIANTE_TT"
    ).then(resultado => {
      if (resultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Resultados: resultado[0],
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
    const Tresultados = await ResultadoServicio.TraerTodos(
      "CALL USP_MDL_RESULTADOESTUDIANTE_TT_CodDesc"
    ).then(resultado => {
      if (resultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Resultado: resultado[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Resultado", async function(req, res, next) {
  const { Cod_Resultado } = req.params;
  try {
    const TUresultado = await ResultadoServicio.TraerUno(
      "CALL USP_MDL_RESULTADOESTUDIANTE_TU(?)",
      [Cod_Resultado]
    ).then(resultado => {
      if (resultado[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Resultado: resultado[0][0],
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
    NomResultado,
    Descripcion,
    valor
  } = req.body;

  try {
    const Gresultado = await ResultadoServicio.Guardar(
      "CALL USP_MDL_RESULTADOESTUDIANTE_G(?,?,?,?)",
      [
        Cod_Resultado,
        NomResultado,
        Descripcion,
        valor
      ]
    ).then(resultado => {
      res.status(201).json({
        Resultado: resultado,
        Codigo: "Resultado guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del:Cod_Resultado", async function(req, res, next) {
  const { Cod_Resultado } = req.params;

  try {
    const Eresutado = await ResultadoServicio.Eliminar(
      "CALL USP_MDL_RESULTADOESTUDIANTE_E(?)",
      [Cod_Resultado]
    ).then(resultado => {
      if (resultado.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Resultado: "Resultado Eliminada",
          Codigo: 1
        });
      }
      console.log(resultado);
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

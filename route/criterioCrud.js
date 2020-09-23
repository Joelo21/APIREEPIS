const express = require("express");
const router = express.Router();
const CCriterioServicio = require("../services/Scriterio");
const CriterioServicio = new CCriterioServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tcriterio = await CriterioServicio.TraerTodos(
      "CALL USP_MDL_CRITERIO_TT"
    ).then(criterio => {
      if (criterio[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Criterio: criterio[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Criterio", async function(req, res, next) {
  const { Cod_Criterio } = req.params;
  try {
    const TUcriterio = await CriterioServicio.TraerUno(
      "CALL USP_MDL_CRITERIO_TU(?)",
      [Cod_Criterio]
    ).then(criterio => {
      res.status(200).json({
        Criterio: criterio[0],
        Mensaje: "Criterio Listado"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Guardar", async function(req, res, next) {
  const {
    Cod_RubricaPersona,
    Cod_Criterio,
    NivelCriterio,
    DesCriterio
  } = req.body;
  try {
    const Gcriterio = await CriterioServicio.Guardar(
      "CALL USP_MDL_CRITERIO_G(?,?,?,?)",
      [Cod_RubricaPersona, Cod_Criterio, NivelCriterio, DesCriterio]
    ).then(criterio => {
      res.status(201).json({
        Criterio: criterio[0],
        message: "Criterio guardado"+Cod_Criterio
      });
    });
  } catch (err) {
    next(err+Cod_Criterio);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Criterio } = req.body;
  try {
    const Ecriterio = await CriterioServicio.Eliminar(
      "CALL USP_MDL_CRITERIO_E(?)",
      [Cod_Criterio]
    ).then(criterio => {
      res.status(201).json({
        Criterio: criterio[0],
        Mensaje: "Criterio Eliminado"
      });
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

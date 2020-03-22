const express = require("express");
const router = express.Router();
const CGCriterioServicio = require("../services/Sgcriterio");
const GCriterioServicio = new CGCriterioServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tcriterio = await GCriterioServicio.TraerTodos(
      "CALL USP_MDL_GCRITERIO_TT"
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
    const TUcriterio = await GCriterioServicio.TraerUno(
      "CALL USP_MDL_GCRITERIO_TU(?)",
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
    Cod_Criterio, 
    Cod_Rubrica, 
    NivelCriterio, 
    Descripcion 
  } = req.body;
  try {
    const Gcriterio = await GCriterioServicio.Guardar(
      "CALL USP_MDL_GCRITERIO_G(?,?,?,?)",
      [
        Cod_Criterio, 
        Cod_Rubrica, 
        NivelCriterio, 
        Descripcion
      ]
    ).then(criterio => {
      if (criterio[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Criterio: criterio[0][0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Criterio } = req.body;
  try {
    const Ecriterio = await GCriterioServicio.Eliminar(
      "CALL USP_MDL_GCRITERIO_E(?)",
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

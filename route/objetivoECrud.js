const express = require("express");
const router = express.Router();
const CObjetivoServicio = require("../services/Sobjetivoeducacional");
const ObjetivoServicio = new CObjetivoServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tobjetivo = await ObjetivoServicio.TraerTodos(
      "CALL USP_MDL_OBJETIVOEDUCACIONAL_TT"
    ).then(objetivo => {
      if (objetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Objetivos: objetivo[0],
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
    const Tescuela = await ObjetivoServicio.TraerTodos(
      "CALL USP_MDL_OBJETIVOEDUCACIONAL_TT_CodDesc"
    ).then(objetivo => {
      if (objetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Objetivos: objetivo[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Objetivo", async function(req, res, next) {
  const { Cod_Objetivo } = req.params;
  try {
    const TUescuela = await ObjetivoServicio.TraerUno(
      "CALL USP_MDL_OBJETIVOEDUCACIONAL_TU(?)",
      [Cod_Objetivo]
    ).then(objetivo => {
      if (objetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Objetivo: objetivo[0][0],
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
    Cod_Objetivo, 
    Cod_Escuela, 
    Descripcion, 
  } = req.body;
  try {
    const Gobjetivo = await ObjetivoServicio.Guardar(
      "CALL USP_MDL_OBJETIVOEDUCACIONAL_G(?,?,?)",
      [Cod_Objetivo, Cod_Escuela, Descripcion]
    ).then(objetivo => {
      res.status(201).json({
        Objetivo: objetivo,
        Codigo: "Objetivo guardada"
      });
      console.log(escuela);
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del:Cod_Objetivo", async function(req, res, next) {
  const { Cod_Objetivo } = req.params;
  try {
    const Eobjetivo = await ObjetivoServicio.Eliminar(
      "CALL USP_MDL_OBJETIVOEDUCACIONAL_E(?)",
      [Cod_Objetivo]
    ).then(objetivo => {    
      if (objetivo.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Objetivo: "Objetivo Eliminada",
          Codigo: 1
        });
      }
    });
    
  } catch (err) {
    next(err);
  }
});

module.exports = router;

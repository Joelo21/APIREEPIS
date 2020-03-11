const express = require("express");
const router = express.Router();
const CCursoObjetivoServicio = require("../services/ScursoObjetivo");
const CursoObjetivoServicio = new CCursoObjetivoServicio();

router.get("/List", async function(req, res, next) {
  try {
    const TcursoObjetivo = await CursoObjetivoServicio.TraerTodos(
      "CALL USP_MDL_CURSOBJETIVO_TT"
    ).then(cursoObjetivo => {
      if (cursoObjetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          CursoObjetivos: cursoObjetivo[0],
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
    const TcursoObjetivo = await CursoObjetivoServicio.TraerUno(
      "CALL USP_MDL_CURSOBJETIVO_TxCod_Curso(?)",
      [Cod_Curso]
    ).then(cursoObjetivo => {
      if (cursoObjetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          CursoObjetivos: cursoObjetivo[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ListOBxCod_Curso", async function(req, res, next) {
  const { Cod_Curso } = req.body;
  try {
    const TcursoObjetivo = await CursoObjetivoServicio.TraerUno(
      "CALL USP_MDL_CURSOBJETIVO_TobxCod_Curso(?)",
      [Cod_Curso]
    ).then(cursoObjetivo => {
      if (cursoObjetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          CursoObjetivos: cursoObjetivo[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_CursoObjetivo", async function(req, res, next) {
  const { Cod_CursoObjetivo } = req.params;
  try {
    const TcursoObjetivo = await CursoObjetivoServicio.TraerUno(
      "CALL USP_MDL_CURSOBJETIVO_TU(?)",
      [Cod_CursoObjetivo]
    ).then(cursoObjetivo => {
      if (cursoObjetivo[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          CursoObjetivos: cursoObjetivo[0][0],
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
    Cod_CursoObjetivo, 
    Cod_Objetivo, 
    Cod_Curso 
  } = req.body;
  try {
    const GcursoObjetivo = await CursoObjetivoServicio.Guardar(
      "CALL USP_MDL_CURSOBJETIVO_G(?,?,?)",
      [Cod_CursoObjetivo, Cod_Objetivo, Cod_Curso]
    ).then(cursoObjetivo => {
      res.status(201).json({
        CursoObjetivo: cursoObjetivo,
        Codigo: "Curso Objetivo guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del:Cod_CursoObjetivo", async function(req, res, next) {
  const { Cod_CursoObjetivo } = req.params;
  try {
    const EcursoObjetivo = await CursoObjetivoServicio.Eliminar(
      "CALL USP_MDL_CURSOBJETIVO_E(?)",
      [Cod_CursoObjetivo]
    ).then(cursoObjetivo => {
      if (cursoObjetivo.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          CursoObjetivo: "Curso Objetivo Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

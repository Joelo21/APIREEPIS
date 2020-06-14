const express = require("express");
const router = express.Router();
const CCursoServicio = require("../services/Scurso");
const CursoServicio = new CCursoServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tcurso = await CursoServicio.TraerTodos(
      "CALL USP_MDL_CURSO_TT"
      ).then(curso => {
        if (curso[0].length === 0) {
          res.json({
            Codigo: 0
          });
        } else {
          res.status(200).json({
            Curso: curso[0],
            Codigo: 1
          });
        }
      });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Curso", async function(req, res, next) {
  const { Cod_Curso } = req.params;
  try {
    const TUcurso = await CursoServicio.TraerUno(
      "CALL USP_MDL_CURSO_TU(?)", [Cod_Curso]
      ).then(curso => {
      if (curso[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Curso: curso[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/guardar", async function(req, res, next) {
  const {
    Cod_Curso,
    NomCurso,
    Descripcion,
    Docente,
    Semestre
  } = req.body;
  try {
    const Gcurso = await CursoServicio.Guardar(
      "CALL USP_MDL_CURSO_G(?,?,?,?,?)",
      [
        Cod_Curso,
        NomCurso,
        Descripcion,
        Docente,
        Semestre
      ]
    ).then(curso => {
      res.status(201).json({
        Curso: curso[0],
        Codigo: "Curso Guardado"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Curso } = req.body;

  try {
    const Ecurso = await CursoServicio.Eliminar("CALL USP_MDL_CURSO_E(?)", [
      Cod_Curso
    ]).then(curso => {
      if (curso.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Curso: "Curso Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

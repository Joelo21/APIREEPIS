const express = require("express");
const router = express.Router();
const CRubricaServicio = require("../services/Srubrica");
const RubricaServicio = new CRubricaServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Trubrica = await RubricaServicio.TraerTodos(
      "CALL USP_MDL_RUBRICA_TT"
    ).then(rubricas => {
      if (rubricas[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Rubricas: rubricas[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Rubrica", async function(req, res, next) {
  const { Cod_Rubrica } = req.params;

  try {
    const TUrubrica = await RubricaServicio.TraerUno(
      "CALL USP_MDL_RUBRICA_TU(?)",
      [Cod_Rubrica]
    ).then(rubrica => {
      if (rubrica[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Grubrica: rubrica[0][0],
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
    Cod_RubricaPersona,
    Cod_Rubrica,
    Cod_Asignacion,
    Cod_Persona,
    Cod_Curso,
    NomRubrica,
    Descripcion,
    Nota
  } = req.body;

  try {
    const Grubrica = await RubricaServicio.Guardar(
      "CALL USP_MDL_RUBRICA_G(?,?,?,?,?,?,?,?)",
      [
        Cod_RubricaPersona,
        Cod_Rubrica,
        Cod_Asignacion,
        Cod_Persona,
        Cod_Curso,
        NomRubrica,
        Descripcion,
        Nota
      ]
    ).then(rubricaG => {
      res.status(201).json({
        Resultado: rubricaG,
        message: "Rubrica guardado"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Rubrica } = req.body;
  const { Cod_Asignacion } = req.body;
  const { Cod_Persona } = req.body;

  try {
    const Erubrica = await RubricaServicio.Eliminar(
      "CALL USP_MDL_RUBRICA_E(?,?,?)",
      [Cod_Rubrica, Cod_Asignacion, Cod_Persona]
    ).then(rubrica => {
      if (rubrica.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Rubrica: "Rubrica Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

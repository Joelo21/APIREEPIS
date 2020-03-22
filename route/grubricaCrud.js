const express = require("express");
const router = express.Router();
const CGRubricaServicio = require("../services/Sgrubrica");
const GRubricaServicio = new CGRubricaServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Trubrica = await GRubricaServicio.TraerTodos(
      "CALL USP_MDL_GRUBRICA_TT"
    ).then(rubricas => {
      if (grubrica[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Grubrica: grubrica[0],
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
    const TUrubrica = await GRubricaServicio.TraerUno(
      "CALL USP_MDL_GRUBRICA_TU(?)",
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
    Cod_Rubrica,
    Cod_Asignacion,
    Cod_Curso,
    NomRubrica
  } = req.body;

  try {
    const Grubrica = await GRubricaServicio.Guardar(
      "CALL USP_MDL_GRUBRICA_G(?,?,?,?)",
      [Cod_Rubrica, Cod_Asignacion, Cod_Curso, NomRubrica]
    ).then(rubricaG => {
      res.status(201).json({
        Grubrica: rubricaG[0],
        Mensaje: "Rubrica guardado"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Rubrica } = req.body;
  const { Cod_Asignacion } = req.body;

  try {
    const Erubrica = await GRubricaServicio.Eliminar(
      "CALL USP_MDL_GRUBRICA_E(?,?)",
      [Cod_Rubrica, Cod_Asignacion]
    ).then(rubrica => {
      if (rubrica.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Rubrica: "G Rubrica Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

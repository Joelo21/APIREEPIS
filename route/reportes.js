const express = require("express");
const router = express.Router();
const CReportesServicio = require("../services/Sreportes");
const ReportesServicio = new CReportesServicio();

router.post("/ValidateReporte", async function(req, res, next) {
  const { 
    Cod_Curso
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL USP_VALIDAR_Rubrica(?)",
      [Cod_Curso]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ReportexActividad", async function(req, res, next) {
  const { 
    Cod_Curso,
    Cod_Unidad,
    Id_Asignacion
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL URP_TRAER_NOTAS_UNIDAD(?,?,?)",
      [Cod_Curso, Cod_Unidad, Id_Asignacion]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Validar_RelacionIndCri", async function(req, res, next) {
  const { 
    Cod_Curso,
    Cod_Rubrica,
    
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL USP_VALIDAR_RelacionIndCri(?,?)",
      [Cod_Curso, Cod_Rubrica,]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

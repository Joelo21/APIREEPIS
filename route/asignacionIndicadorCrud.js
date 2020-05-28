const express = require("express");
const router = express.Router();
const CAsignacionIndServicio = require("../services/SasignacionIndicador");
const AsignacionIndServicio = new CAsignacionIndServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tasignaturas = await AsignacionIndServicio.TraerTodos(
      "CALL USP_MDL_asignacionIndicador_TT"
    ).then(asignacionIND => {
      if (asignacionIND[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Asignaturas: asignacionIND[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_AsignacionIndicador", async function(req, res, next) {
  const { Cod_AsignacionIndicador } = req.params;

  try {
    const TUasignatura = await AsignacionIndServicio.TraerUno(
      "CALL USP_MDL_asignacionIndicador_TU(?)",
      [Cod_AsignacionIndicador]
    ).then(asignacionIND => {
      if (asignacionIND[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Asignatura: asignacionIND[0][0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/TxRubrica", async function(req, res, next) {
  const { Cod_Curso, Cod_Asignacion , Id_Asignacion} = req.body;
  try {
    const TresultadoIndicador = await AsignacionIndServicio.TraerUno(
      "CALL USP_MDL_ASIGNACIONINDICADOR_TxRubrica(?,?,?)",
      [Cod_Curso, Cod_Asignacion , Id_Asignacion]
    ).then(RubricaAsignacion => {
      if (RubricaAsignacion[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RubricaAsignacion: RubricaAsignacion[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});


router.post("/GParticipantes", async function(req, res, next) {
  const {
    Cod_Asignacion,
    Participantes,
    Presentados,
    Pendientes   
  } = req.body;

  try {
    const Gasignatura = await AsignacionIndServicio.Guardar(
      "CALL USP_MDL_ASIGNACION_GxParticipantes(?,?,?,?)",
      [
        Cod_Asignacion,
        Participantes,
        Presentados,
        Pendientes,
      ]
    ).then(asignaturas => {
      res.status(201).json({
        Asignaturas: asignaturas[0],
        Mensaje: "Asignatura participantes Guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Guardar", async function(req, res, next) {
  const {
    Cod_Curso,
    Cod_Rubrica,
    Cod_Criterio,
    NivelCriterio,
    Cod_Resultado,
    TCod_Resultado
  } = req.body;

  try {
    const Gasignatura = await AsignacionIndServicio.Guardar(
      "CALL USP_MDL_asignacionIndicador_G(?,?,?,?,?,?)",
      [
        Cod_Curso,
        Cod_Rubrica,
        Cod_Criterio,
        NivelCriterio,
        Cod_Resultado,
        TCod_Resultado
      ]
    ).then(asignaturas => {
      res.status(201).json({
        Asignaturas: asignaturas[0],
        Mensaje: "ASignacion Indicador Guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Asignacion } = req.body;

  try {
    const asds = await AsignacionIndServicio.Eliminar(
      "CALL USP_MDL_asignacionIndicador_E(?)",
      [Cod_Asignacion]
    ).then(asignacionIND => {
      if (asignacionIND.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Asinacion: "Asigancion  Eliminada",
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

// router.post("/TRubrica", async function(req, res, next) {
//   const { Cod_Curso, Cod_Asignacion , Id_Asignacion} = req.body;
//   try {
//     const TresultadoIndicador = await AsignacionIndServicio.TraerUno(
//       "CALL USP_MDL_ASIGNACION_TxRubrica(?,?,?)",
//       [Cod_Curso, Cod_Asignacion , Id_Asignacion]
//     ).then(RubricaAsignacion => {
//       if (RubricaAsignacion[0].length === 0) {
//         res.json({
//           Codigo: 0
//         });
//       } else {
//         res.status(200).json({
//           RubricaAsignacion: RubricaAsignacion[0],
//           Codigo: 1
//         });
//       }
//     });
//   } catch (err) {
//     next(err);
//   }
// });

module.exports = router;

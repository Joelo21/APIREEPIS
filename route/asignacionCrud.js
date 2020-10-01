const express = require("express");
const router = express.Router();
const CAsignacionServicio = require("../services/Sasignacion");
const AsignacionServicio = new CAsignacionServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tasignaturas = await AsignacionServicio.TraerTodos(
      "CALL USP_MDL_ASIGNACION_TT"
    ).then(asignatura => {
      if (asignatura[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Asignaturas: asignatura[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Asignacion", async function(req, res, next) {
  const { Cod_Asignacion } = req.params;

  try {
    const TUasignatura = await AsignacionServicio.TraerUno(
      "CALL USP_MDL_ASIGNACION_TU(?)",
      [Cod_Asignacion]
    ).then(asignatura => {
      if (asignatura[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Asignatura: asignatura[0][0],
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
    Cod_Asignacion,
    Participantes,
    Presentados,
    Pendientes   
  } = req.body;

  try {
    const Gasignatura = await AsignacionServicio.Guardar(
      "CALL USP_MDL_ASIGNACION_GxParticipantes(?,?,?,?)",
      [
        Cod_Asignacion,
        Participantes,
        Presentados,
        Pendientes,
      ]
    ).then(asignaturas => {
      res.status(201).json({
        Asignaturas: asignaturas[0][0],
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
    Cod_Asignacion,
    Id_Asignacion,
    NomAsignacion,
    TipoAsignacion,
    Participantes,
    Presentados,
    Pendientes,
    Cod_Unidad,
    Flag_Activo    
  } = req.body;

  try {
    const Gasignatura = await AsignacionServicio.Guardar(
      "CALL USP_MDL_ASIGNACION_G(?,?,?,?,?,?,?,?,?,?)",
      [
        Cod_Curso,
        Cod_Asignacion,
        Id_Asignacion,
        NomAsignacion,
        TipoAsignacion,
        Participantes,
        Presentados,
        Pendientes,
        Cod_Unidad,
        Flag_Activo
      ]
    ).then(asignaturas => {
      res.status(201).json({
        Asignaturas: asignaturas[0],
        Mensaje: "Asignatura Guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del", async function(req, res, next) {
  const { Cod_Asignacion } = req.body;

  try {
    const asds = await AsignacionServicio.Eliminar(
      "CALL USP_MDL_ASIGNACION_E(?)",
      [Cod_Asignacion]
    ).then(asignacion => {
      if (asignacion.affectedRows === 0) {
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

router.post("/TRubrica", async function(req, res, next) {
  const { Cod_Curso, Cod_Asignacion , Id_Asignacion} = req.body;
  try {
    const TresultadoIndicador = await AsignacionServicio.TraerUno(
      "CALL USP_MDL_ASIGNACION_TxRubrica(?,?,?)",
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

router.post("/TEstado", async function(req, res, next) {
  const { Cod_Curso, Cod_Asignacion , Id_Asignacion} = req.body;
  try {
    const TresultadoIndicador = await AsignacionServicio.TraerUno(
      "CALL USP_MDL_ASIGNACION_TxEstado(?,?,?)",
      [Cod_Curso, Cod_Asignacion , Id_Asignacion]
    ).then(RubricaAsignacion => {
      if (RubricaAsignacion[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RubricaAsignacion: RubricaAsignacion[0][0].Flag_Activo[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Validar_RelacionIndCri2", async function(req, res, next) {
  const { Cod_Curso, Cod_Rubrica } = req.body;
  try {
    const TresultadoIndicador = await AsignacionServicio.TraerUno(
      "CALL USP_VALIDAR_RelacionIndCri(?,?)",
      [Cod_Curso, Cod_Rubrica]
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

router.post("/AEstado", async function(req, res, next) {
  const { Cod_Curso, Cod_Asignacion , Flag_Estado, Id_Asignacion} = req.body;
  try {
    const TresultadoIndicador = await AsignacionServicio.Guardar(
      "CALL USP_MDL_ASIGNACION_AxEstado(?,?,?,?)",
      [Cod_Curso, Cod_Asignacion , Flag_Estado, Id_Asignacion]
    ).then(asignaturas => {
      res.status(201).json({
        Asignaturas: asignaturas[0],
        Mensaje: "Asignatura Guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});



module.exports = router;

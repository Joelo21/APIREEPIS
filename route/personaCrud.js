const express = require("express");
const router = express.Router();
const CPersonaServicio = require("../services/Spersona");
const PersonaServicio = new CPersonaServicio();

router.get("/List", async function(req, res, next) {
  try {
    const Tpersonas = await PersonaServicio.TraerTodos(
      "CALL USP_MDL_PERSONA_TT"
    ).then(persona => {
      if (persona[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Personas: persona[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.get("/:Cod_Persona", async function(req, res, next) {
  const { Cod_Persona } = req.params;
  try {
    const TUpersona = await PersonaServicio.TraerUno(
      "CALL USP_MDL_PERSONA_TU(?)",
      [Cod_Persona]
    ).then(persona => {
      if (persona[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          Persona: persona[0][0],
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
    Cod_Persona,
    Nombre,
    Apellidos,
    NomPersona,
    Correo,
    Grado
  } = req.body;
  try {
    const Gpersona = await PersonaServicio.Guardar(
      "CALL USP_MDL_PERSONA_G(?,?,?,?,?,?)",
      [Cod_Persona, Nombre, Apellidos, NomPersona, Correo, Grado]
    ).then(persona => {
      res.status(201).json({
        Persona: persona,
        message: "Persona guardada"
      });
    });
  } catch (err) {
    next(err);
  }
});

router.delete("/Del:Cod_Persona", async function(req, res, next) {
  const { Cod_Persona } = req.params;

  try {
    console.log("1 paso");
    const Epersona = await PersonaServicio.Eliminar(
      "CALL USP_MDL_PERSONA_E(?)",
      [Cod_Persona]
    ).then(persona => {
      if (persona.affectedRows === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(201).json({
          Persona: "Persona Eliminada",
          Codigo: 1
        });
      }
      console.log(escuela);
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

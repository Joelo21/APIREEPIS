const express = require("express");
const router = express.Router();
const CPersonaServicio = require("../services/Spersona");
const PersonaServicio = new CPersonaServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tpersonas= await PersonaServicio.TraerTodos('CALL USP_MDL_PERSONA_TT').then(personas =>
      {
        res.status(200).json({
          Resultado:personas,
          mensaje:'Personas listadas'
        })
      });
  }
  catch(err)
  {
    next(err);
  }
});

router.get('/id',async function(req,res,next)
{
   const {Cod_Persona}=req.body;

  try
  {
    const TUpersona = await PersonaServicio.TraerUno("CALL USP_MDL_PERSONA_TU(?)",[Cod_Persona]).then(persona=>{
      res.status(200).json({
        Resultado:persona,
        message:'Persona listada'
      });
    });
  }
    catch(err)
    {
      next(err);
    }
});

router.post('/guardar',async function(req,res,next)
{
  const {Cod_Persona,Nombre,ApPaterno,ApMaterno,NomPersona,Correo,Grado,Cod_UsuarioReg}=req.body;

    try
    {
      const Gpersona  = await PersonaServicio.Guardar("CALL USP_MDL_PERSONA_G(?,?,?,?,?,?,?,?)",[Cod_Persona,Nombre,ApPaterno,ApMaterno,NomPersona,Correo,Grado,Cod_UsuarioReg]).then(personaG =>{
          res.status(201).json({
            Resultado: personaG,
            message: 'Persona guardada'
          });
        });
    }
    catch(err)
    {
      next(err);
    }
});


router.delete('/',async function(req,res,next)
{
  const {Cod_Persona}=req.body;

  try
  {
    console.log("1 paso");
    const Epersona = await PersonaServicio.Eliminar('CALL USP_MDL_PERSONA_E(?)',[Cod_Persona]).then(personaE =>{
      res.status(201).json({
        Resultado: personaE,
        message: 'Persona eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
const express = require("express");
const router = express.Router();
const CNivelServicio = require("../services/Snivel");
const NivelServicio = new CNivelServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tniveles = await NivelServicio.TraerTodos('CALL USP_MDL_NIVEL_TT').then(niveles =>
      {
        res.status(200).json({
          Resultado:niveles,
          mensaje:'Niveles listadas'
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
   const {Id_Rubrica}=req.body;

  try
  {
    const TUmatricula = await NivelServicio.TraerUno("CALL USP_MDL_NIVEL_TU(?)",[Id_Rubrica]).then(nivel=>{
      res.status(200).json({
        Resultado:nivel,
        message:'Nivel Lista'
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
  const {Id_Rubrica,Descripcion,Puntaje,FlagSeleccionado,Cod_UsuarioReg}=req.body;

    try
    {
      const Gmatricula  = await NivelServicio.Guardar("CALL USP_MDL_NIVEL_G(?,?,?,?,?)",[Id_Rubrica,Descripcion,Puntaje,FlagSeleccionado,Cod_UsuarioReg]).then(matriculaG =>{
          res.status(201).json({
            Resultado: matriculaG,
            message: 'Nivel guardado'
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
  const {Id_Rubrica}=req.body;

  try
  {

    const Ematricula = await NivelServicio.Eliminar('CALL USP_MDL_NIVEL_E(?)',[Id_Rubrica]).then(nivelE =>{
      res.status(201).json({
        Resultado: nivelE,
        message: 'Nivel eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
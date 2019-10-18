const express = require("express");
const router = express.Router();
const CObjetivoServicio = require("../services/Sobjetivoeducacional");
const ObjetivoServicio = new CObjetivoServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tobjetivo= await ObjetivoServicio.TraerTodos('CALL USP_MDL_OBJETIVOEDUCACIONAL_TT').then(objetivos =>
      {
        res.status(200).json({
          Resultado:objetivos,
          mensaje:'Objetivos listados'
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
   const {Cod_Objetivo}=req.body;

  try
  {
    const TUobjetivo = await ObjetivoServicio.TraerUno("CALL USP_MDL_OBJETIVOEDUCACIONAL_TU(?)",[Cod_Objetivo]).then(nivel=>{
      res.status(200).json({
        Resultado:nivel,
        message:'Objetivo Listado'
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
  const {Cod_Objetivo,Id_Escuela,Descripcion,Cod_UsuarioReg}=req.body;

    try
    {
      const Gobjetivo  = await ObjetivoServicio.Guardar("CALL USP_MDL_OBJETIVOEDUCACIONAL_G(?,?,?,?)",[Cod_Objetivo,Id_Escuela,Descripcion,Cod_UsuarioReg]).then(objetivoG =>{
          res.status(201).json({
            Resultado: objetivoG,
            message: 'Objetivo guardado'
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
  const {Cod_Objetivo}=req.body;

  try
  {
    console.log("1 paso");
    const Eobjetivo = await ObjetivoServicio.Eliminar('CALL USP_MDL_OBJETIVOEDUCACIONAL_E(?)',[Cod_Objetivo]).then(objetivoE =>{
      res.status(201).json({
        Resultado: objetivoE,
        message: 'Objetivo eliminado'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
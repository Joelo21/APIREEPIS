const express = require("express");
const router = express.Router();
const CResultadoServicio = require("../services/Sresultadoestudiante");
const ResultadoServicio = new CResultadoServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tresultados= await ResultadoServicio.TraerTodos('CALL USP_MDL_RESULTADOESTUDIANTE_TT').then(resultados =>
      {
        res.status(200).json({
          Resultado:resultados,
          mensaje:'Resultados listados'
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
   const {Cod_Resultado}=req.body;

  try
  {
    const TUresultado= await ResultadoServicio.TraerUno("CALL USP_MDL_RESULTADOESTUDIANTE_TU(?)",[Cod_Resultado]).then(resultado=>{
      res.status(200).json({
        Resultado:resultado,
        message:'Resultado Listado'
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
  const {Cod_Resultado,Id_Escuela,NomResultado,Descripcion,valor,Cod_UsuarioReg}=req.body;

    try
    {
      const Gresultado  = await ResultadoServicio.Guardar("CALL USP_MDL_RESULTADOESTUDIANTE_G(?,?,?,?,?,?)",[Cod_Resultado,Id_Escuela,NomResultado,Descripcion,valor,Cod_UsuarioReg]).then(resultadoG =>{
          res.status(201).json({
            Resultado: resultadoG,
            message: 'Resultado guardado'
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
  const {Cod_Resultado}=req.body;

  try
  {
   
    const Eresutado = await ResultadoServicio.Eliminar('CALL USP_MDL_RESULTADOESTUDIANTE_E(?)',[Cod_Resultado]).then(resultadoE =>{
      res.status(201).json({
        Resultado: resultadoE,
        message: 'Resultado eliminado'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
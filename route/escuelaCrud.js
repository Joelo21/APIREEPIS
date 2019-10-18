const express = require("express");
const router = express.Router();
const CEscuelaServicio = require("../services/Sescuela");
const EscuelaServicio = new CEscuelaServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tescuela = await EscuelaServicio.TraerTodos('CALL USP_MDL_ESCUELA_TT').then(escuelas =>
      {
        res.status(200).json({
          Resultado:escuelas,
          mensaje:'Escuelas listadas'
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
   const {Cod_Escuela}=req.body;

  try
  {
    const TUescuela = await EscuelaServicio.TraerUno("CALL USP_MDL_ESCUELA_TU(?)",[Cod_Escuela]).then(escuela=>{
      res.status(200).json({
        Resultado:escuela,
        message:'Escuela Lista'
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
  const {Cod_Escuela,Sede,Descripcion,Cod_UsuarioReg}=req.body;

    try
    {
      const Gescuela = await EscuelaServicio.Guardar("CALL USP_MDL_ESCUELA_G(?,?,?,?)",[Cod_Escuela,Sede,Descripcion,Cod_UsuarioReg]).then(escuelaG =>{
          res.status(201).json({
            Resultado: escuelaG,
            message: 'Escuela guardado'
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
  const {Cod_Escuela}=req.body;

  try
  {
    console.log("1 paso");
    const Eescuela  = await EscuelaServicio.Eliminar('CALL USP_MDL_ESCUELA_E(?)',[Cod_Escuela]).then(escuelaE =>{
      res.status(201).json({
        Resultado: escuelaE,
        message: 'Escuela eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
const express = require("express");
const router = express.Router();
const CCriterioServicio = require("../services/Scriterio");
const CriterioServicio = new CCriterioServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tcriterio= await CriterioServicio.TraerTodos('CALL USP_MDL_CRITERIO_TT').then(criterios =>
      {
        res.status(200).json({
          Resultado:criterios,
          mensaje:'Criterios listadas'
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
    const TUcriterio = await CriterioServicio.TraerUno("CALL USP_MDL_CRITERIO_TU(?)",[Id_Rubrica]).then(criterio=>{
      res.status(200).json({
        Resultado:criterio,
        message:'Criterio Listado'
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
  const {DesCriterio,Id_Rubrica,Cod_UsuarioReg}=req.body;

    try
    {
      const Gcriterio = await CriterioServicio.Guardar("CALL USP_MDL_CRITERIO_G(?,?,?)",[DesCriterio,Id_Rubrica,Cod_UsuarioReg]).then(criterioG =>{
          res.status(201).json({
            Resultado: criterioG,
            message: 'Criterio guardado'
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
   const {DesCriterio}=req.body;

  try
  {
    const Ecriterio = await CriterioServicio.Eliminar('CALL USP_MDL_CRITERIO_E(?)',[DesCriterio]).then(criterioE =>{
      res.status(201).json({
        Resultado: criterioE,
        message: 'Criterio eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
const express = require("express");
const router = express.Router();
const CEscuelaServicio = require("../services/Sescuela");
const EscuelaServicio = new CEscuelaServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tescuela = await EscuelaServicio.TraerTodos('CALL USP_MDL_ESCUELA_TT').then(escuela =>{
      if (escuela[0].length===0) {
        res.json({
          Cod: 0
        });             
      } else {
        res.status(200).json({
          Escuela: escuela[0],
          Mensaje:'Escuelas listadas'
      });
      }
    });  
  }
  catch(err)
  {
    next(err);
  }
});

router.get('/:Cod_Escuela',async function(req,res,next)
{
  const {Cod_Escuela}=req.params;
  try
  {
    const TUescuela = await EscuelaServicio.TraerUno("CALL USP_MDL_ESCUELA_TU(?)",[Cod_Escuela]).then(escuela=>{
      if (escuela[0].length===0) {
        res.json({
          Cod: 0
        });       
      } else {
        res.status(200).json({
          Escuela: escuela[0][0],
          Cod: 1
        });
      }
    });
  
  }
    catch(err)
    {
      next(err);
    }
});

router.post('/Guardar',async function(req,res,next)
{
  const {Cod_Escuela,Sede,Descripcion}=req.body;

    try
    {
      const Gescuela = await EscuelaServicio.Guardar("CALL USP_MDL_ESCUELA_G(?,?,?)",[Cod_Escuela,Sede,Descripcion]).then(escuela =>{
          res.status(201).json({
            Escuela: escuela,
            Mensaje: 'Escuela guardada'
          });
        });
    }
    catch(err)
    {
      next(err);
    }
});


router.delete('/:Cod_Escuela',async function(req,res,next)
{
  const {Cod_Escuela}=req.params;

  try
  {
    const Eescuela  = await EscuelaServicio.Eliminar('CALL USP_MDL_ESCUELA_E(?)',[Cod_Escuela]).then(escuela =>{
      res.status(201).json({
        Resultado: escuela,
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
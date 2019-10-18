const express = require("express");
const router = express.Router();
const CIndicadorServicio = require("../services/Sindicador");
const IndicadorServicio = new CIndicadorServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tindicador = await IndicadorServicio.TraerTodos('CALL USP_MDL_INDICADOR_TT').then(indicadores =>
      {
        res.status(200).json({
          Resultado:indicadores,
          mensaje:'Indicadores listadas'
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
   const {Cod_Indicador}=req.body;
   const {Id_Resultado}=req.body;

  try
  {
    const TUindicador = await IndicadorServicio.TraerUno("CALL USP_MDL_INDICADOR_TU(?,?)",[Cod_Indicador,Id_Resultado]).then(indicador=>{
      res.status(200).json({
        Resultado:indicador,
        message:'Indicador Listada'
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
  const {Id_Indicador,Id_Escuela,Id_Resultado,Cod_Indicador,DescripcionLarga,DescripcionCorta,valor,Cod_UsuarioReg}=req.body;

    try
    {
      const Gindicador  = await IndicadorServicio.Guardar("CALL USP_MDL_INDICADOR_G(?,?,?,?,?,?,?,?)",[Id_Indicador,Id_Escuela,Id_Resultado,Cod_Indicador,DescripcionLarga,DescripcionCorta,valor,Cod_UsuarioReg]).then(indicadorG =>{
          res.status(201).json({
            Resultado: indicadorG,
            message: 'Indicador guardado'
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
  const {Cod_Indicador}=req.body;
  const {Id_Resultado}=req.body;

  try
  {
    console.log("1 paso");
    const Eindicador  = await IndicadorServicio.Eliminar('CALL USP_MDL_INDICADOR_E(?,?)',[Cod_Indicador,Id_Resultado]).then(indicadorE =>{
      res.status(201).json({
        Resultado: indicadorE,
        message: 'Indicador eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
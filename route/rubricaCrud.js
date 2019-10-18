const express = require("express");
const router = express.Router();
const CRubricaServicio = require("../services/Srubrica");
const RubricaServicio = new CRubricaServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Trubrica= await RubricaServicio.TraerTodos('CALL USP_MDL_RUBRICA_TT').then(rubricas =>
      {
        res.status(200).json({
          Resultado:rubricas,
          mensaje:'Rubricas listadas'
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
   const {Id_Asignacion}=req.body;
   const {Id_Persona}=req.body;

  try
  {
    const TUrubrica= await RubricaServicio.TraerUno("CALL USP_MDL_RUBRICA_TU(?,?,?)",[Id_Rubrica,Id_Asignacion,Id_Persona]).then(rubrica=>{
      res.status(200).json({
        Resultado:rubrica,
        message:'Rubrica Lista'
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
  const {Id_Rubrica,Id_Asignacion,Id_Persona,NomRubrica,Nota,Cod_UsuarioReg}=req.body;

    try
    {
      const Grubrica  = await RubricaServicio.Guardar("CALL USP_MDL_RUBRICA_G(?,?,?,?,?,?)",[Id_Rubrica,Id_Asignacion,Id_Persona,NomRubrica,Nota,Cod_UsuarioReg]).then(rubricaG =>{
          res.status(201).json({
            Resultado: rubricaG,
            message: 'Rubrica guardado'
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
  const {Id_Asignacion}=req.body;
  const {Id_Persona}=req.body;

  try
  {
    const Erubrica = await RubricaServicio.Eliminar('CALL USP_MDL_RUBRICA_E(?,?,?)',[Id_Rubrica,Id_Asignacion,Id_Persona]).then(rubricaE =>{
      res.status(201).json({
        Resultado: rubricaE,
        message: 'Rubrica eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
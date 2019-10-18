const express = require("express");
const router = express.Router();
const CMatriculaServicio = require("../services/Smatricula");
const MatriculaServicio = new CMatriculaServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tmatriculas = await MatriculaServicio.TraerTodos('CALL USP_MDL_MATRICULA_TT').then(matriculas =>
      {
        res.status(200).json({
          Resultado:matriculas,
          mensaje:'Matriculas listadas'
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
   const {Id_Persona}=req.body;
   const {Id_Curso}=req.body;

  try
  {
    const TUmatricula = await MatriculaServicio.TraerUno("CALL USP_MDL_MATRICULA_TU(?,?)",[Id_Persona,Id_Curso]).then(matricula=>{
      res.status(200).json({
        Resultado:matricula,
        message:'Matricula Listada'
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
  const {Id_Persona,Id_Curso,Semestre,Docente,Cod_UsuarioReg}=req.body;

    try
    {
      const Gmatricula = await MatriculaServicio.Guardar("CALL USP_MDL_MATRICULA_G(?,?,?,?,?)",[Id_Persona,Id_Curso,Semestre,Docente,Cod_UsuarioReg]).then(matriculaG =>{
          res.status(201).json({
            Resultado: matriculaG,
            message: 'Matricula guardado'
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
  const {Id_Persona}=req.body;
  const {Id_Curso}=req.body;

  try
  {
    console.log("1 paso");
    const Ematricula = await MatriculaServicio.Eliminar('CALL USP_MDL_MATRICULA_E(?,?)',[Id_Persona,Id_Curso]).then(matriculaE =>{
      res.status(201).json({
        Resultado: matriculaE,
        message: 'Matricula eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
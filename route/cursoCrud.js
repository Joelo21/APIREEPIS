const express = require("express");
const router = express.Router();
const CCursoServicio = require("../services/Scurso");
const CursoServicio = new CCursoServicio();

router.get("/List",async function(req, res, next ){
 try{
    const Tcurso = await CursoServicio.TraerTodos('CALL USP_MDL_CURSO_TT').then(curso =>{
      res.status(200).json({
        Curso: curso[0],
        Mensaje:'Cursos Listados'
      })
    });
  }
  catch(err){
    next(err);
  }
});

router.get('/id',async function(req,res,next){
  const {Cod_Curso}=req.body;
  try{
    const TUcurso = await CursoServicio.TraerUno("CALL USP_MDL_CURSO_TU(?,?)",[Cod_Curso,Id_Resultado]).then(curso=>{
      res.status(200).json({
        Curso: curso,
        Mensaje:'Curso Listado'
      });
    });
  }
  catch(err)
  {
    next(err);
  }
});

router.post('/guardar',async function(req,res,next){
  const {Id_Escuela,Id_Resultado,Cod_Curso,NomCurso,Descripcion,Docente,Semestre,Cod_UsuarioReg}=req.body;
 ¡try
  {
    const Gcurso = await CursoServicio.Guardar("CALL USP_MDL_CURSO_G(?,?,?,?,?,?,?,?)",[Id_Escuela,Id_Resultado,Cod_Curso,NomCurso,Descripcion,Docente,Semestre,Cod_UsuarioReg]).then(cursoG =>{
        res.status(201).json({
          Resultado: cursoG,
          message: 'Curso Guardado'
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
   const {Cod_Curso}=req.body;
   const {Id_Resultado}=req.body;
   
  try
  {
    
    const Ecurso  = await CursoServicio.Eliminar('CALL USP_MDL_CURSO_E(?,?)',[Cod_Curso,Id_Resultado]).then(cursoE =>{
      res.status(201).json({
        Resultado: cursoE,
        message: 'Curso eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
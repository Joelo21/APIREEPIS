const express = require("express");
const router = express.Router();
const CAsignaturasServicio = require("../services/Sasignatura");
const AsignaturaServicio = new CAsignaturasServicio();

router.get("/",async function(req, res, next ){
 try 
  {
    const Tasignaturas = await AsignaturaServicio.TraerTodos('CALL USP_MDL_ASIGNACION_TT').then(asignaturas =>
      {
        res.status(200).json({
          Asignaturas:asignaturas[0],
          Mensaje:'Asignaturas listadas'
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
   const {Cod_Asignacion}=req.body;
   const {Id_Resultado}=req.body;

  try
  {
    const TUasignatura = await AsignaturaServicio.TraerUno("CALL USP_MDL_ASIGNACION_TU(?,?)",[Cod_Asignacion,Id_Resultado]).then(asignatura=>{
      res.status(200).json({
        Asignaturas: asignaturas[0],
        Mensaje:'Asignatura Listada'
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
  const {Id_Asignacion,Id_Escuela,Id_Curso,Id_Resultado,Cod_Asignacion,NomAsignacion,TipoAsignacion,Participantes,Presentados,Pendientes,Flag_Alta,Flag_Activo,Fecha_Limite,Cod_UsuarioReg}=req.body;

    try
    {
      const Gasignatura = await AsignaturaServicio.Guardar("CALL USP_MDL_ASIGNACION_G(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[Id_Asignacion,Id_Escuela,Id_Curso,Id_Resultado,Cod_Asignacion,NomAsignacion,TipoAsignacion,Participantes,Presentados,Pendientes,Flag_Alta,Flag_Activo,Fecha_Limite,Cod_UsuarioReg]).then(asignaturaG =>{
          res.status(201).json({
            Asignaturas: asignaturas[0],
            Mensaje: 'Asignatura Guardada'
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
   const {Cod_Asignacion}=req.body;
   const {Id_Resultado}=req.body;

  try
  {
    console.log("1 paso");
    const asds = await AsignaturaServicio.Eliminar('CALL USP_MDL_ASIGNACION_E(?,?)',[Cod_Asignacion,Id_Resultado]).then(aas =>{
      res.status(201).json({
        Asignaturas: asignaturas[0],
        Mensaje:'Asignatura Eliminada'
      });
    })
  }
    catch(err)
    {
      next(err);
    }
});



module.exports = router;
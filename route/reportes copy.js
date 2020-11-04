const express = require("express");
const router = express.Router();
const CReportesServicio = require("../services/Sreportes");
const ReportesServicio = new CReportesServicio();

router.post("/ValidateReporte", async function(req, res, next) {
  const { 
    Cod_Curso
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL USP_VALIDAR_Rubrica(?)",
      [Cod_Curso]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/ReportexActividad", async function(req, res, next) {
  const { 
    Cod_Curso,
    Cod_Unidad,
    Id_Asignacion
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL URP_TRAER_NOTAS_UNIDAD(?,?,?)",
      [Cod_Curso, Cod_Unidad, Id_Asignacion]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

function clasificacion(valor) {
  var clasificacion = "";
  if (valor >= 0.8 && valor <=1) {
    clasificacion = "EXCELENTE"
  }
  if (valor >= 0.6 && valor <0.8) {
    clasificacion = "BUENO"    
  } 
  if (valor >= 0.4 && valor <0.6) {
    clasificacion = "REGULAR"    
  }
  if (valor >= 0.2 && valor <0.4) {
    clasificacion = "MALO"    
  }
  if (valor >= 0 && valor <0.2) {
    clasificacion = "MUY MALO"    
  }
  return clasificacion;
}

router.post("/ReporteCSV", async function(req, res, next) {
  const { 
    Cod_Curso
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL URP_TRAER_NOTAS_CSV(?)",
      [Cod_Curso]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        var appJson = [];
        var appJson2=[];
        var appJson3=[];

        // let temp2Rubrica = this.state.dtRubrica.filter(val =>  val.Cod_AsignacionIndicador !== rowData.Cod_AsignacionIndicador);

        for (let i = 0; i < RActividad[0].length; i++) {
          const element1 = RActividad[0][i]; 
          // if(appJson.length == 0){
            const row = {
              Semestre : "",
              Curso : element1.Curso,
              Docente : element1.Docente,
              Actividad : element1.Actividad,
              CodigoAlumno : element1.CodigoAlumno,
              Resultado : element1.Resultado,
              Indicador : element1.Indicador,
              Valor : element1.Valor,
              Clasificacion : clasificacion(element1.Valor)
            }

            
            appJson.push(row)
            appJson2.push(row)          // }  
          
        }
        for(let y=0; y< appJson.length; y++){
          
            if(appJson[y].CodigoAlumno===appJson2[y].CodigoAlumno)
            {
              //console.log("codigo"+appJson[y].CodigoAlumno);
              if(appJson[y].Resultado===appJson2[y].Resultado && appJson[y].Indicador===appJson2[y].Indicador)
              {
                //console.log(appJson[y].Resultado+"resultado1"+appJson2[y].Resultado +"resultado2")
                if(appJson[y].Valor===appJson2[y].Valor || appJson[y].Valor != appJson2[y].Valor)
                {
                  //console.log(appJson[y].Valor+"valores"+appJson2[y].Valor +"valores")

                  const valornuevo=((appJson[y].Valor+appJson2[y].Valor)/2);
                  //console.log(valornuevo);
                  const head={
                    Semestre : "",
                    Curso : appJson[y].Curso,
                    Docente : appJson[y].Docente,
                    Actividad : appJson[y].Actividad,
                    CodigoAlumno : appJson[y].CodigoAlumno,
                    Resultado : appJson[y].Resultado,
                    Indicador : appJson[y].Indicador,
                    Valor : valornuevo,
                    Clasificacion : clasificacion(valornuevo)
                  }
                  //console.log(head);
                  appJson3.push(head)
                  
                } 
               

              }else{

                const headDife={
                  Semestre : "",
                  Curso : appJson[y].Curso,
                  Docente : appJson[y].Docente,
                  Actividad : appJson[y].Actividad,
                  CodigoAlumno : appJson[y].CodigoAlumno,
                  Resultado : appJson[y].Resultado,
                  Indicador : appJson[y].Indicador,
                  Valor : appJson[y].Valor,
                  Clasificacion : clasificacion(appJson[y].Valor)
                }
                //console.log(headDife);
                appJson3.push(headDife)
              }
            }
          
        }
        

        let cursos =appJson3.filter((valorActual, indiceActual, arreglo) => {
          return arreglo.findIndex(valorDelArreglo => JSON.stringify(valorDelArreglo) === JSON.stringify(valorActual)) === indiceActual
      });
      // console.log(cursos);

        // console.log(appJson3);
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

router.post("/Validar_RelacionIndCri", async function(req, res, next) {
  const { 
    Cod_Curso,
    Cod_Rubrica,
    
  } = req.body;
  try {
    const TReporte = await ReportesServicio.TraerUno(
      "CALL USP_VALIDAR_RelacionIndCri(?,?)",
      [Cod_Curso, Cod_Rubrica,]
    ).then(RActividad => {
      if (RActividad[0].length === 0) {
        res.json({
          Codigo: 0
        });
      } else {
        res.status(200).json({
          RepoActividad: RActividad[0],
          Codigo: 1
        });
      }
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

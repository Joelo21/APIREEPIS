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
        var bul = 1

        // // let temp2Rubrica = this.state.dtRubrica.filter(val =>  val.Cod_AsignacionIndicador !== rowData.Cod_AsignacionIndicador);

        for (let i = 0; i < RActividad[0].length; i++) {
          const element1 = RActividad[0][i]; 
            if(appJson.length == 0){
            const row = {
              Semestre : "",
              Curso : element1.Curso,
              Docente : element1.Docente,
              Actividad : element1.Actividad,
              CodigoAlumno : element1.CodigoAlumno,
              Resultado : element1.Resultado,
              Indicador : element1.Indicador,
              Valor : element1.Valor,
              Veces : bul,
              Clasificacion : clasificacion(element1.Valor)
              }     
            appJson.push(row)
            }      
            // console.log(appJson.length); 
            if (appJson[appJson.length-1].Actividad == element1.Actividad ) {
              if (appJson[appJson.length-1].CodigoAlumno == element1.CodigoAlumno ) {
                if (appJson[appJson.length-1].Resultado == element1.Resultado ) {
                  if (appJson[appJson.length-1].Indicador == element1.Indicador ) {
                    appJson[appJson.length-1].Valor = ((appJson[appJson.length-1].Valor += element1.Valor)/(appJson[appJson.length-1].Veces += 1))
                    appJson[appJson.length-1].Clasificacion = clasificacion(appJson[appJson.length-1].Valor)
                  } else {
                    const row = {
                      Semestre : "",
                      Curso : element1.Curso,
                      Docente : element1.Docente,
                      Actividad : element1.Actividad,
                      CodigoAlumno : element1.CodigoAlumno,
                      Resultado : element1.Resultado,
                      Indicador : element1.Indicador,
                      Valor : element1.Valor,
                      Veces : bul,
                      Clasificacion : clasificacion(element1.Valor)
                      }     
                    appJson.push(row)
                  }  
                } else {
                  const row = {
                    Semestre : "",
                    Curso : element1.Curso,
                    Docente : element1.Docente,
                    Actividad : element1.Actividad,
                    CodigoAlumno : element1.CodigoAlumno,
                    Resultado : element1.Resultado,
                    Indicador : element1.Indicador,
                    Valor : element1.Valor,
                    Veces : bul,
                    Clasificacion : clasificacion(element1.Valor)
                    }     
                  appJson.push(row)
                }  
              } else {
                const row = {
                  Semestre : "",
                  Curso : element1.Curso,
                  Docente : element1.Docente,
                  Actividad : element1.Actividad,
                  CodigoAlumno : element1.CodigoAlumno,
                  Resultado : element1.Resultado,
                  Indicador : element1.Indicador,
                  Valor : element1.Valor,
                  Veces : bul,
                  Clasificacion : clasificacion(element1.Valor)
                  }     
                appJson.push(row)
              }  
            } else {
              const row = {
                Semestre : "",
                Curso : element1.Curso,
                Docente : element1.Docente,
                Actividad : element1.Actividad,
                CodigoAlumno : element1.CodigoAlumno,
                Resultado : element1.Resultado,
                Indicador : element1.Indicador,
                Valor : element1.Valor,
                Veces : bul,
                Clasificacion : clasificacion(element1.Valor)
                }     
              appJson.push(row)
            }
        }
        console.log(appJson);
        var CSV = []

        for (let i = 0; i < appJson.length; i++) {
          const element = appJson[i];

          const row = {
            Semestre : "",
            Curso : element.Curso,
            Docente : element.Docente,
            Actividad : element.Actividad,
            CodigoAlumno : element.CodigoAlumno,
            Resultado : element.Resultado,
            Indicador : element.Indicador,
            Valor : Math.round(element.Valor * 100.0) / 100.0,
            Clasificacion : clasificacion(element.Valor)
            }     
          CSV.push(row)          
        }

        
        res.status(200).json({
          RepoActividad: CSV,
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

var Mysql = require("Mysql");
const {config} = require("../config");
const User = encodeURIComponent(config.dbUser);
const Password = encodeURIComponent(config.dbPassword);
const NombreBaseDatos = config.dbName;
const CadenaConexion = {
  host: `${config.dbHost}`,
  user: `${User}`,
  password: `${Password}`,
  database: `${NombreBaseDatos}`
}
class Mysqlib{
    constructor()
    {
      this._InstanciaSql = new Mysql.createPool(CadenaConexion);
    }
    TraerTodos(pProcedimiento)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) =>
        {
          pool.getConnection(function(err, connection) {          
            // Use the connection
            connection.query(pProcedimiento,(err,resultados)=>
            {
              if(err) rej(err);
                else {
                  res(resultados);
                };
            });  
            connection.release();          
            });
        });
    }

    TraerUno(pProcedimiento,pParam)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) => {
        pool.getConnection(function(err, connection) {
          // Use the connection
          connection.query(pProcedimiento,pParam,(err,resultados)=>
          {
            if(err) rej(err);
              else {
                res(resultados);
              };
          });  
          connection.release();          
          });
        }); 
    } 

     Guardar(pProcedimiento,pParam)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) =>
      {
        pool.getConnection((err, connection) => {
          if (err) {
            rej( err );
          } else {
            connection.query(pProcedimiento,pParam,(err,result) => {
              if ( err ) {
               rej( err )
              } else {
               res( result );
              }
             });
             connection.release(); 
          };     
          });
        }); 
    }

    Eliminar(pProcedimiento,pParam)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) => {
        pool.query(pProcedimiento,pParam,(err, resultados)=>
        {
          if(err) rej(err);
            else{
              res(resultados);
            }
        });
      });
    }
}
module.exports = Mysqlib;
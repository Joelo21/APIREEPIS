// var Mysql = require("mariadb");
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

// const pool = mariadb.createPool({host: process.env.DB_HOST, user: process.env.DB_USER, connectionLimit: 5});
// pool.getConnection()
//     .then(conn => {
    
//       conn.query("SELECT 1 as val")
//         .then(rows => { // rows: [ {val: 1}, meta: ... ]
//           return conn.query("INSERT INTO myTable value (?, ?)", [1, "mariadb"]);
//         })
//         .then(res => { // res: { affectedRows: 1, insertId: 1, warningStatus: 0 }
//           conn.release(); // release to pool
//         })
//         .catch(err => {
//           conn.release(); // release to pool
//         })
        
//     }).catch(err => {
//       //not connected
//     });


class Mysqlib{
    constructor()
    {
      this._InstanciaSql = new Mysql.createPool(CadenaConexion);
    }

    // AccesoDatos()
    // {
    //   if(!this._InstanciaSql.connection){
    //       var Conexion = this._InstanciaSql
    //       return Conexion.connection = new Promise ((resolve, reject)=>
    //       {
    //         Conexion.connect((error, connPool)=>{
    //           if(error){
    //             return reject(error);
    //           } else{
    //             return resolve(connPool);
    //           }
    //         });
    //       });
    //   }
    // }

    // AccesoDatos()
    // {
    //   return new Promise((resolve, reject) =>
    //   {
    //     var Conexion = this._InstanciaSql
    //     Conexion.on('close',function()
    //     {
    //       return null;
    //     })
    //     Conexion.end();
    //     Conexion.connect().then((connPool) =>
    //     {
    //         return resolve(connPool)
    //     })
    //     .catch((err) =>
    //     {
    //         return reject(err)
    //     })
    //   });
    // }

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

    // Guardar(pProcedimiento,pParam)
    // {
    //   var pool=Mysql.createPool(CadenaConexion);
    //   return new Promise((res,rej) =>
    //   {
    //     pool.query(pProcedimiento,pParam,(err,resultados)=>
    //     {
    //       if(err) rej(err);
    //         else {
    //           res(resultados.insertId);
    //         };
    //     });  
    //   });
    // }

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
              // connection.release();
             })
          };
          connection.release(); 
          });
        }); 
      // 
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
        // pool.end();
      });
    }

}

module.exports = Mysqlib;
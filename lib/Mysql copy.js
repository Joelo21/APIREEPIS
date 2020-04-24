var Mysql = require("mysql");
const {config} = require("../config");

const User = encodeURIComponent(config.dbUser);
const Password = encodeURIComponent(config.dbPassword);
const NombreBaseDatos = config.dbName;

const CadenaConexion = {
  host: `${config.dbHost}`,
  user: `${User}`,
  password: `${Password}`,
  database: `${NombreBaseDatos}`,
}

class Mysqlib{
    constructor()
    {
      this._InstanciaSql = new Mysql.createPool(CadenaConexion);
    }

    AccesoDatos()
    {
      return new Promise((resolve, reject) =>
      {
        var Conexion = this._InstanciaSql
        Conexion.on('close',function()
        {
          return null;
        })
        Conexion.end();
        Conexion.connect().then((connPool) =>
        {
            return resolve(connPool)
        })
        .catch((err) =>
        {
            return reject(err)
        })
      });
    }

    TraerTodos(pProcedimiento)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) =>
        {
          pool.query(pProcedimiento,(err,resultados)=> 
          {
          if(err) rej(err);
            else {
              console.log(resultados);
              res(resultados);
            }
          });
        });
    }

    TraerUno(pProcedimiento,pParam)
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

    Guardar(pProcedimiento,pParam)
    {
      var pool=Mysql.createPool(CadenaConexion);
      return new Promise((res,rej) =>
      {
        pool.query(pProcedimiento,pParam,(err,resultados)=>
        {
          if(err) rej(err);
            else {
              res(resultados.insertId);
            }
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
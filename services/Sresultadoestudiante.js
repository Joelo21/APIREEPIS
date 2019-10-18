const Mysqlib = require("../lib/Mysql");

class SResultadoestudiante
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const resultadoIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return resultadoIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const resultadoIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return resultadoIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const resultadoIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return resultadoIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const resultadoIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return resultadoIDE;
    }

}

module.exports=SResultadoestudiante;

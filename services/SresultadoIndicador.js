const Mysqlib = require("../lib/Mysql");

class SResultadoIndicador
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const resultadoIndicadorIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return resultadoIndicadorIDT || []
    }

  async TraerUno(pProcedimiento,pParam)
    {
      const resultadoIndicadorIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return resultadoIndicadorIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const resultadoIndicadorIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return resultadoIndicadorIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const resultadoIndicadorIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return resultadoIndicadorIDE;
    }
}

module.exports=SResultadoIndicador;




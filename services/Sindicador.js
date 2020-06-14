const Mysqlib = require("../lib/Mysql");

class SIndicador
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const indicadorIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return indicadorIDT || []
    }

  async TraerUno(pProcedimiento,pParam)
    {
      const indicadorIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return indicadorIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const indicadorIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return indicadorIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const indicadorIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return indicadorIDE;
    }
}

module.exports=SIndicador;

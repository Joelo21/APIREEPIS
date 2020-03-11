const Mysqlib = require("../lib/Mysql");

class SEscuela
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const objetivoResultadoIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return objetivoResultadoIDT || []
    }

  async TraerUno(pProcedimiento,pParam)
    {
      const objetivoResultadoIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return objetivoResultadoIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const objetivoResultadoIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return objetivoResultadoIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const objetivoResultadoIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return objetivoResultadoIDE;
    }
}

module.exports=SEscuela;




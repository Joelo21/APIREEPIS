const Mysqlib = require("../lib/Mysql");

class SGCriterio
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const gcriterioIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return gcriterioIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const gcriterioIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return gcriterioIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const gcriterioIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return gcriterioIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const gcriterioIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return gcriterioIDE;
    }

}

module.exports=SGCriterio;




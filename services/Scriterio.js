const Mysqlib = require("../lib/Mysql");

class SCriterio
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const criterioIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return criterioIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const criterioIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return criterioIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const criterioIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return criterioIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const criterioIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return criterioIDE;
    }

}

module.exports=SCriterio;




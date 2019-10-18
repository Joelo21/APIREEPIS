const Mysqlib = require("../lib/Mysql");

class SNivel
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const nivelIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return nivelIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const nivelIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return nivelIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const nivelIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return nivelIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const nivelIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return nivelIDE;
    }

}

module.exports=SNivel;

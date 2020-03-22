const Mysqlib = require("../lib/Mysql");

class SGRubrica
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const grubricaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return grubricaIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const grubricaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return grubricaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const grubricaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return grubricaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const grubricaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return grubricaIDE;
    }

}

module.exports=SGRubrica;

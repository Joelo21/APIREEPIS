const Mysqlib = require("../lib/Mysql");

class SRubrica
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const rubricaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return rubricaIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const rubricaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return rubricaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const rubricaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return rubricaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const rubricaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return rubricaIDE;
    }

}

module.exports=SRubrica;

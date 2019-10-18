const Mysqlib = require("../lib/Mysql");

class SPersona
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const personaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return personaIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const personaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return personaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const personaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return personaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const personaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return personaIDE;
    }

}

module.exports=SPersona;

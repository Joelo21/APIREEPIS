const Mysqlib = require("../lib/Mysql");

class SObjetivoeducacional
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const objetivoeduIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return objetivoeduIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const objetivoeduIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return objetivoeduIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const objetivoeduIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return objetivoeduIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const objetivoeduIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return objetivoeduIDE;
    }

}

module.exports=SObjetivoeducacional;

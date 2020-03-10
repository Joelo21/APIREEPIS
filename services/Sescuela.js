const Mysqlib = require("../lib/Mysql");

class SEscuela
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const escuelaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return escuelaIDT || []
    }

  async TraerUno(pProcedimiento,pParam)
    {
      const escuelaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return escuelaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const escuelaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return escuelaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const escuelaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return escuelaIDE;
    }
}

module.exports=SEscuela;




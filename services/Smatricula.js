const Mysqlib = require("../lib/Mysql");

class SMatricula
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const matriculaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return matriculaIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const matriculaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return matriculaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const matriculaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return matriculaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const matriculaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return matriculaIDE;
    }

}

module.exports=SMatricula;




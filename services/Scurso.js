const Mysqlib = require("../lib/Mysql");

class SCurso
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const cursoIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return cursoIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const cursoIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return cursoIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const cursoIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return cursoIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const cursoIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return cursoIDE;
    }

}

module.exports=SCurso;




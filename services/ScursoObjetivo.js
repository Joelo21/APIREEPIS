const Mysqlib = require("../lib/Mysql");

class SEscuela
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const cursoObjetivoIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return cursoObjetivoIDT || []
    }

  async TraerUno(pProcedimiento,pParam)
    {
      const cursoObjetivoIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return cursoObjetivoIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const cursoObjetivoIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return cursoObjetivoIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const cursoObjetivoIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return cursoObjetivoIDE;
    }
}

module.exports=SEscuela;




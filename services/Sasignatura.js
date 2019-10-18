const Mysqlib = require("../lib/Mysql");

class SAsignatura
{
  constructor()
    {
      this.Mysqlib = new Mysqlib();
    }

  async TraerTodos(pProcedimiento)
    {
      const asignaturaIDT = await this.Mysqlib.TraerTodos
      (pProcedimiento)
      return asignaturaIDT || []
    }


  async TraerUno(pProcedimiento,pParam)
    {
      const asignaturaIDTU = await this.Mysqlib.TraerUno(pProcedimiento,pParam);
      return asignaturaIDTU || {};
    }

  async Guardar(pProcedimiento,pParam)
    {
      const asignaturaIDG = await this.Mysqlib.Guardar(pProcedimiento,pParam);
      return asignaturaIDG;
    }

  async Eliminar(pProcedimiento,pParam)
    {
      const asignaturaIDE = await this.Mysqlib.Eliminar(pProcedimiento,pParam);
      return asignaturaIDE;
    }

}

module.exports=SAsignatura;



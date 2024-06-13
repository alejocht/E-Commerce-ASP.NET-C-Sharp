using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaUsuario
    {
        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("");
                datos.EjecutarLectura();

                while(datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.usuario = (string)datos.Lector["Usuario"];
                    aux.password = (string)datos.Lector["Clave"];
                    //aux.
                }

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}

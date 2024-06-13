using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaTipoUsuario
    {
        public List<TipoUsuario> listar()
        {
            List<TipoUsuario> lista = new List<TipoUsuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("");
                datos.EjecutarLectura();

                while(datos.Lector.Read())
                {
                    TipoUsuario aux = new TipoUsuario();
                    aux.id = (int)datos.Lector[""];
                    aux.nombre = (string)datos.Lector[""];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}

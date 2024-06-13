using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaCiudad
    {
        public List<Ciudad> listar()
        {
            List<Ciudad> lista = new List<Ciudad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Ciudades");
                datos.EjecutarLectura();
                while(datos.Lector.Read()) 
                {
                    Ciudad aux = new Ciudad();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    //aux.provincia

                    lista.Add(aux);
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

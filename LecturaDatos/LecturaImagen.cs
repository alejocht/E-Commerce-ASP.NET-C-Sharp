using Dominio.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaImagen
    {
        public List<Imagen> listar()
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Imagen");
                datos.EjecutarLectura();

                while(datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.id = (int)datos.Lector["ID"];
                    aux.imagenUrl = (string)datos.Lector["UrlImagen"];
                    aux.idProducto = (int)datos.Lector["ID_Producto"];
                    aux.tipo = (int)datos.Lector["Tipo_Imagen"];

                    lista.Add(aux);
                }

                return  lista; 
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

using Dominio.Pedidos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaMetodoPago
    {
        public List<MetodoPago> listar()
        {
            List<MetodoPago> lista = new List<MetodoPago>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Metodos_de_pago");
                datos.EjecutarLectura();

                while(datos.Lector.Read())
                {
                    MetodoPago aux = new MetodoPago();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Metodo_de_pago"];

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

        public List<MetodoPago> listar(int id)
        {
            List<MetodoPago> lista = new List<MetodoPago>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Metodos_de_pago where ID = "+ id.ToString());
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    MetodoPago aux = new MetodoPago();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Metodo_de_pago"];

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

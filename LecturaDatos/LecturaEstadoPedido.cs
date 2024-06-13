using Dominio.Pedidos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaEstadoPedido
    {
        public List<EstadoPedido> listar()
        {
            List<EstadoPedido> lista = new List<EstadoPedido>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Estados_Pedido");
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    EstadoPedido aux = new EstadoPedido();
                    aux.id = (int)datos.Lector["ÏD"];
                    aux.nombre = (string)datos.Lector["Descripcion"];

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

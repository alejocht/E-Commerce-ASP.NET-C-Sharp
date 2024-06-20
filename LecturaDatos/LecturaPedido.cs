using Dominio.Pedidos;
using Dominio.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaPedido
    {
        //falta desarrollar la lista de items en el pedido
        //falta calcular el importe de la lista de items
        public List<Pedido> listar()
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select * from Pedidos");
                datos.EjecutarLectura();
                while (datos.Lector.Read()) 
                {
                    Pedido aux = new Pedido();
                    LecturaMetodoPago lecturaMetodoPago = new LecturaMetodoPago();
                    LecturaEstadoPedido lecturaEstadoPedido = new LecturaEstadoPedido();
                    LecturaUsuario lecturaUsuario = new LecturaUsuario();
                    List<Producto> productos = new List<Producto>();
                    
                    aux.id = (int)datos.Lector["ID"];
                    aux.metodoPago = lecturaMetodoPago.listar((int)datos.Lector["ID_MetodoDePago"]);
                    aux.estado = lecturaEstadoPedido.listar((int)datos.Lector["ID_EstadosPedido"]);
                    aux.usuario = lecturaUsuario.listar((int)datos.Lector["ID_Usuario"]);
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
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
        public Pedido listar(int id) 
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select * from Pedidos where ID = @id");
                datos.SetearParametro("@id",id);
                datos.EjecutarLectura();
                Pedido aux = new Pedido();
                LecturaMetodoPago lecturaMetodoPago = new LecturaMetodoPago();
                LecturaEstadoPedido lecturaEstadoPedido = new LecturaEstadoPedido();
                LecturaUsuario lecturaUsuario = new LecturaUsuario();
                while (datos.Lector.Read())
                {
                    aux.id = (int)datos.Lector["ID"];
                    aux.metodoPago = lecturaMetodoPago.listar((int)datos.Lector["ID_MetodoDePago"]);
                    aux.estado = lecturaEstadoPedido.listar((int)datos.Lector["ID_EstadosPedido"]);
                    aux.usuario = lecturaUsuario.listar((int)datos.Lector["ID_Usuario"]);
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                }
                return aux;
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
        public void agregar(Pedido nuevo) 
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

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
        public void  modificar(Pedido nuevo)
        {

        }
        public void eliminarFisica(Pedido nuevo)
        {

        }
    }
}

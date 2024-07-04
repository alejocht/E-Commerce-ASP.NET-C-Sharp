using Dominio.Pedidos;
using Dominio.Productos;
using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class DetallePedidoAdmin : System.Web.UI.Page
    {
        Pedido seleccionado = new Pedido();
        List<ProductosPedido> listaProductos = new List<ProductosPedido>();
        decimal total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"].ToString());

                LecturaPedido lecturaPedido = new LecturaPedido();
                seleccionado = lecturaPedido.listar(id);

                LecturaProductosPedido lecturaProductosPedido = new LecturaProductosPedido();
                listaProductos = lecturaProductosPedido.listar(id);

                total = CalcularCarritoTotal(listaProductos);

                if (!IsPostBack)
                {
                    lblNumeroPedido.Text = "N° PEDIDO: " + id.ToString();

                    lblUsuario.Text = seleccionado.usuario.usuario.ToString();
                    lblMetodoPago.Text = seleccionado.metodoPago.nombre.ToString();
                    lblEstado.Text = seleccionado.estadoPedido.nombre.ToString();
                    lblFecha.Text = seleccionado.fecha.ToString();

                    RepProductosxPedido.DataSource = listaProductos;
                    RepProductosxPedido.DataBind();

                    lblTotal.Text = "Total $ " + total.ToString();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        private decimal CalcularCarritoTotal(List<ProductosPedido> Productos)
        {
            foreach (var ProductosPedido in Productos)
            {
                total += (decimal)ProductosPedido.producto.precio * ProductosPedido.cantidad;
            }
            return total;
        }
    }
}
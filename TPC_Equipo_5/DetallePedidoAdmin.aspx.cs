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
        int id = 0;
        decimal total = 0;
        public int estadoPedido = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                id = int.Parse(Request.QueryString["id"].ToString());

                LecturaPedido lecturaPedido = new LecturaPedido();
                seleccionado = lecturaPedido.listar(id);

                LecturaProductosPedido lecturaProductosPedido = new LecturaProductosPedido();
                listaProductos = lecturaProductosPedido.listar(id);

                estadoPedido = seleccionado.estadoPedido.id;
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

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("pedidosAdmin.aspx", false);
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            LecturaPedido lecturaPedido = new LecturaPedido();
            lecturaPedido.modificarEstado(id, estadoPedido);

            Response.Redirect("DetallePedidoAdmin.aspx?id=" + id.ToString(), false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LecturaPedido lecturaPedido = new LecturaPedido();
            lecturaPedido.bajaLogica(id);

            Response.Redirect("DetallePedidoAdmin.aspx?id=" + id.ToString(), false);
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
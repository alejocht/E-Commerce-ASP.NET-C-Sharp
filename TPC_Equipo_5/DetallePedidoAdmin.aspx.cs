using Dominio.Pedidos;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LecturaPedido lecturaPedido = new LecturaPedido();
                int id = int.Parse(Request.QueryString["id"].ToString());
                seleccionado = lecturaPedido.listar(id);
                if (!IsPostBack)
                {
                    lblNumeroPedido.Text = seleccionado.id.ToString();
                    lblUsuario.Text = seleccionado.usuario.usuario.ToString();
                    lblMetodoPago.Text = seleccionado.metodoPago.nombre.ToString();
                    lblEstado.Text = seleccionado.estadoPedido.nombre.ToString();
                    lblFecha.Text = seleccionado.fecha.ToString();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
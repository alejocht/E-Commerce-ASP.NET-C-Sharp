using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using LecturaDatos;

namespace TPC_Equipo_5
{
    public partial class pedidosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaEstadoPedido lecturaEstadoPedido = new LecturaEstadoPedido();
            dgvPedidos.DataSource = lecturaEstadoPedido.listar();
            dgvPedidos.DataBind();
        }

        protected void dgvPedidos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
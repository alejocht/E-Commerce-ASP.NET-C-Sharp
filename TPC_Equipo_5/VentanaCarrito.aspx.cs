using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class VentanaCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnContinuarComprando_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx",false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("VentanaCompra.aspx",false );
        }
    }
}
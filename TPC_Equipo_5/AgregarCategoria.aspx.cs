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
    public partial class AgregarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("categoriasAdmin.aspx",false);
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            LecturaCategoria lecturaCategoria = new LecturaCategoria();
            Categoria nuevo = new Categoria();
            if (txtCategoria.Text == "") return;
            nuevo.nombre = txtCategoria.Text;
            lecturaCategoria.agregar(nuevo);
            Response.Redirect("categoriasAdmin.aspx", false);
        }
    }
}
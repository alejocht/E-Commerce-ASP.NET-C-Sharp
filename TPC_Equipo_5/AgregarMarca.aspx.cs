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
    public partial class AgregarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("marcasAdmin.aspx", false);
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                LecturaMarca lecturaMarca = new LecturaMarca();
                Marca nuevo = new Marca();
                if (txtNombre.Text == "") return;
                nuevo.nombre = txtNombre.Text;
                lecturaMarca.agregar(nuevo);
                Response.Redirect("marcasAdmin.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
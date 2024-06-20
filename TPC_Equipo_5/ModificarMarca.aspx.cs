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
    public partial class ModificarMarca : System.Web.UI.Page
    {
        Marca seleccionada = new Marca();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LecturaMarca lecturaMarca = new LecturaMarca();
                int id = int.Parse(Request.QueryString["id"].ToString());
                seleccionada = lecturaMarca.listar(id);
                txtNombre.Text = seleccionada.nombre;
            }
        }

        protected void btnCancelarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("marcasAdmin.aspx", false);
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            LecturaMarca lecturaMarca = new LecturaMarca();
            seleccionada.nombre = txtNombre.Text;
            lecturaMarca.modificar(seleccionada);
            Response.Redirect("marcasAdmin.aspx", false);

        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            LecturaMarca lecturaMarca = new LecturaMarca();
            lecturaMarca.eliminarFisica(seleccionada);
            Response.Redirect("marcasAdmin.aspx", false);
        }
    }
}
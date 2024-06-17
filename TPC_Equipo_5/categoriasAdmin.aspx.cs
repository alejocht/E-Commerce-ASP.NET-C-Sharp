using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class categoriasAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaCategoria lecturaCategoria = new LecturaCategoria();
            dgvCategorias.DataSource = lecturaCategoria.listar();
            dgvCategorias.DataBind();
        }

        protected void btnBusquedaCategoria_Click(object sender, EventArgs e)
        {

        }

        protected void ddlOrdenarCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarCategoría_Click(object sender, EventArgs e)
        {

        }
    }
}
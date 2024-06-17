using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class marcasAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaMarca lecturaMarca = new LecturaMarca();
            dgvMarcas.DataSource = lecturaMarca.listar();
            dgvMarcas.DataBind();
        }

        protected void btnBusquedaMarca_Click(object sender, EventArgs e)
        {

        }

        protected void ddlOrdenarMarca_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarMarca_Click(object sender, EventArgs e)
        {

        }
    }
}
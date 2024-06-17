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
    public partial class productosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaProducto lecturaProducto = new LecturaProducto();
            dgvProductos.DataSource = lecturaProducto.listar();
            dgvProductos.DataBind();
        }

        protected void btnBusqueda_Click(object sender, EventArgs e)
        {

        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvProductos.SelectedDataKey.Value.ToString();

            //Nueva ventana o usar javascript para abrir un modal
            //Response.Redirect("detalleAdmin.aspx?id=" + id);
        }
    }
}
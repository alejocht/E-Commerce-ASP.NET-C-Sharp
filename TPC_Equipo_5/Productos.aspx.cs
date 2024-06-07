using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LecturaDatos;
using Dominio;
using Dominio.Productos;

namespace TPC_Equipo_5
{
    public partial class Productos : System.Web.UI.Page
    {
        public List<Producto> listaProductos;
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaProducto lecturaProducto = new LecturaProducto();
            listaProductos = new List<Producto>();
            listaProductos = lecturaProducto.listar();
            RepeaterProducto.DataSource = listaProductos;
            RepeaterProducto.DataBind();
            
            
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleProducto.aspx", false);
        }
    }
}
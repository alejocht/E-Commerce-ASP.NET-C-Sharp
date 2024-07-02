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
    public partial class _default : System.Web.UI.Page
    {
        public List<Producto> listaProductos;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Carga los primeros 3 productos de db
                LecturaProducto lecturaProducto = new LecturaProducto();
                listaProductos = new List<Producto>();
                listaProductos = lecturaProducto.listar(true);
                RepeaterProducto.DataSource = listaProductos.Take(3);
                RepeaterProducto.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        protected void LinkButton_Click(object sender, EventArgs e)
        {
            string ID = ((LinkButton)sender).CommandArgument.ToString();
            Response.Redirect("DetalleProducto.aspx?ID=" + ID, false);
        }
    }
}
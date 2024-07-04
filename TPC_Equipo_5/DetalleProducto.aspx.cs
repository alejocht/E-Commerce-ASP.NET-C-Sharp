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
    public partial class DetalleProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    int ID = int.Parse(Request.QueryString["ID"].ToString());
                    LecturaProducto lecturaProducto = new LecturaProducto();
                    Producto producto = new Producto();
                    producto = lecturaProducto.listar(ID);
                    lblNombre.Text = producto.nombre.ToString();
                    lblDescripcion.Text = producto.descripcion.ToString();
                    lblPrecio.Text = "$" + producto.precio.ToString();
                    txtCantidad.Text = "1";
                    ImagenProducto.ImageUrl = producto.imagenPrincipal;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx", false);
        }

        protected void BtnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                int ID = int.Parse(Request.QueryString["ID"].ToString());
                LecturaProducto lecturaProducto = new LecturaProducto();
                Producto producto = new Producto();
                producto = lecturaProducto.listar(ID);
                List<Producto> listaCarrito;
                listaCarrito = (List<Producto>)Session["listaArticulosEnCarrito"];
                if (listaCarrito == null)
                {
                    listaCarrito = new List<Producto>();
                }
                for (int i = 0; i < int.Parse(txtCantidad.Text); i++)
                {
                    listaCarrito.Add(producto);
                }
                Session["listaArticulosEnCarrito"] = listaCarrito;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
    }
}
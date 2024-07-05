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
        public bool carrusel { get; set; }
        public Producto producto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    int ID = int.Parse(Request.QueryString["ID"].ToString());
                    LecturaProducto lecturaProducto = new LecturaProducto();
                    producto = lecturaProducto.listar(ID);
                    lblNombre.Text = producto.nombre.ToString();
                    if(producto.marca.nombre != null) lblMarca.Text = producto.marca.nombre.ToString();
                    if(producto.categoria.nombre != null) lblCategoria.Text = producto.categoria.nombre.ToString();
                    lblDescripcion.Text = producto.descripcion.ToString();
                    lblPrecio.Text = "$" + producto.precio.ToString();
                    txtCantidad.Text = "1";
                    if(producto.imagenPrincipal != null)ImagenProducto.ImageUrl = producto.imagenPrincipal;
                    if(producto.imagenes.Count > 1) carrusel = true;
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
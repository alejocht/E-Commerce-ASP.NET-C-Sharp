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
    public partial class AgregarProducto : System.Web.UI.Page
    {
        public Producto seleccionado = new Producto();
        public List<Imagen> imagenesForm;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargarddl();
                imagenesForm = new List<Imagen>();
                Session["ImagenesCargadas"] = imagenesForm;
            }
            else
            {
                imagenesForm = (List<Imagen>)Session["ImagenesCargadas"];
            }
        }
        public void cargarddl()
        {
            LecturaCategoria lecturaCategoria = new LecturaCategoria();
            List<Categoria> listaCategoria = new List<Categoria>();
            listaCategoria = lecturaCategoria.listar();

            DDLCategoria.DataSource = listaCategoria;
            DDLCategoria.DataTextField = "Nombre";
            DDLCategoria.DataValueField = "ID";
            DDLCategoria.DataBind();

            LecturaMarca lecturaMarca = new LecturaMarca();
            List<Marca> listaMarca = new List<Marca>();
            listaMarca = lecturaMarca.listar();

            DDLMarca.DataSource = listaMarca;
            DDLMarca.DataTextField = "Nombre";
            DDLMarca.DataValueField = "ID";
            DDLMarca.DataBind();

        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("productosAdmin.aspx", false);
        }
        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            Imagen aux = new Imagen();
            aux.imagenUrl = txtImagenUrl.Text;
            imagenesForm.Add(aux);
            Session["ImagenesCargadas"] = imagenesForm;
            txtImagenUrl.Text = string.Empty;
            imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
        }
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(imgProducto.ImageUrl))
            {
                imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
            }
            else
            {
                imgProducto.ImageUrl = txtImagenUrl.Text;
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            seleccionado.categoria.id = int.Parse(DDLCategoria.SelectedItem.Value);
            seleccionado.marca.id = int.Parse(DDLMarca.SelectedItem.Value);
            seleccionado.descripcion = txtDescripcion.Text;
            seleccionado.precio = decimal.Parse(txtPrecio.Text);
            seleccionado.stock = int.Parse(txtStock.Text);
            seleccionado.nombre = txtNombre.Text;
            seleccionado.imagenes = (List<Imagen>)Session["ImagenesCargadas"];
            LecturaProducto lecturaProducto = new LecturaProducto();
            lecturaProducto.agregar(seleccionado);
            Response.Redirect("productosAdmin.aspx",false);
        }
    }
}
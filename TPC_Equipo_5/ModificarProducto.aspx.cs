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
    public partial class ModificarProducto : System.Web.UI.Page
    {
        public Producto seleccionado = new Producto();
        public List<Imagen> imagenesProducto;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cargarddl();
                if(!IsPostBack)
                {
                    LecturaProducto lecturaProducto = new LecturaProducto();
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    seleccionado = lecturaProducto.listar(id);
                    txtNombre.Text = seleccionado.nombre;
                    txtDescripcion.Text = seleccionado.descripcion;
                    txtPrecio.Text = seleccionado.precio.ToString();
                    txtStock.Text = seleccionado.stock.ToString();
                    //faltarian los items de la ddl
                    buscarIndiceDDLCategoria(seleccionado);
                    buscarIndiceDDLMarca(seleccionado);
                    LecturaImagen lecturaImagen = new LecturaImagen();
                    seleccionado.imagenes = lecturaImagen.listar(seleccionado.id);
                    if(seleccionado.imagenes.Count > 0)
                    {
                        seleccionado.imagenPrincipal = seleccionado.imagenes[0].imagenUrl;
                        imgProducto.ImageUrl = seleccionado.imagenPrincipal;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("productosAdmin.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                seleccionado.categoria.id = int.Parse(DDLCategoria.SelectedItem.Value);
                seleccionado.marca.id = int.Parse(DDLMarca.SelectedItem.Value);
                seleccionado.descripcion = txtDescripcion.Text;
                seleccionado.precio = decimal.Parse(txtPrecio.Text);
                seleccionado.stock = int.Parse(txtStock.Text);
                seleccionado.nombre = txtNombre.Text;
                seleccionado.imagenes = (List<Imagen>)Session["ImagenesCargadas"];
                LecturaProducto lecturaProducto = new LecturaProducto();
                lecturaProducto.modificar(seleccionado);
                Response.Redirect("productosAdmin.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        public void cargarddl()
        {
            try
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
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        public void buscarIndiceDDLCategoria(Producto seleccionado)
        {
            try
            {
                string id = seleccionado.categoria.id.ToString();
                ListItem listItem = new ListItem();
                listItem = DDLCategoria.Items.FindByValue(id);

                if (listItem != null)
                {
                    DDLCategoria.SelectedIndex = DDLCategoria.Items.IndexOf(listItem);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void buscarIndiceDDLMarca(Producto seleccionado)
        {
            try
            {
                string id = seleccionado.marca.id.ToString();
                ListItem listItem = new ListItem();
                listItem = DDLMarca.Items.FindByValue(id);

                if (listItem != null)
                {
                    DDLMarca.SelectedIndex = DDLMarca.Items.IndexOf(listItem);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
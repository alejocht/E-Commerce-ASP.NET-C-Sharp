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
        public bool confirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LecturaProducto lecturaProducto = new LecturaProducto();
                int id = int.Parse(Request.QueryString["id"].ToString());
                seleccionado = lecturaProducto.listar(id);
                if (!IsPostBack)
                {
                    Session["NuevasImagenes"] = new List<Imagen>();
                    Session["ImagenesBorrar"] = new List<Imagen>();
                    cargarddl();

                    ckbActivo.Checked = seleccionado.estado;
                    txtNombre.Text = seleccionado.nombre;
                    txtDescripcion.Text = seleccionado.descripcion;
                    txtPrecio.Text = seleccionado.precio.ToString();
                    txtStock.Text = seleccionado.stock.ToString();


                    buscarIndiceDDLCategoria(seleccionado);
                    buscarIndiceDDLMarca(seleccionado);

                    LecturaImagen lecturaImagen = new LecturaImagen();
                    seleccionado.imagenes = lecturaImagen.listar(seleccionado.id);
                    dgv_ImgProductos.DataSource = seleccionado.imagenes;
                    dgv_ImgProductos.DataBind();

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
                seleccionado.estado = ckbActivo.Checked;
                seleccionado.categoria.id = int.Parse(DDLCategoria.SelectedItem.Value);
                seleccionado.marca.id = int.Parse(DDLMarca.SelectedItem.Value);
                seleccionado.descripcion = txtDescripcion.Text;
                seleccionado.precio = decimal.Parse(txtPrecio.Text);
                seleccionado.stock = int.Parse(txtStock.Text);
                seleccionado.nombre = txtNombre.Text;

                List<Imagen>ImagenesBorrar = new List<Imagen>();
                List<Imagen>ImagenesNueva = new List<Imagen>();
                ImagenesBorrar = (List<Imagen>)Session["ImagenesBorrar"];
                ImagenesNueva = (List<Imagen>)Session["NuevasImagenes"];
                foreach (Imagen imagen in ImagenesBorrar)
                {
                    LecturaImagen lecturaImagen = new LecturaImagen();
                    lecturaImagen.eliminarFisica(imagen);
                }
                foreach (Imagen imagen in ImagenesNueva)
                {
                    LecturaImagen lecturaImagen2 = new LecturaImagen();
                    lecturaImagen2.agregar(imagen);
                }

                LecturaProducto lecturaProducto = new LecturaProducto();
                lecturaProducto.modificar(seleccionado);
                Response.Redirect("productosAdmin.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            Imagen aux = new Imagen();
            List<Imagen> nuevasImagenes = new List<Imagen>();
            List<Imagen> imagenesTemporales = new List<Imagen>();
            aux.imagenUrl = txtImagenUrl.Text;
            aux.idProducto = seleccionado.id;
            aux.tipo = 1;

            nuevasImagenes = (List<Imagen>)Session["NuevasImagenes"];
            nuevasImagenes.Add(aux);
            Session["NuevasImagenes"] = nuevasImagenes;
            
            txtImagenUrl.Text = string.Empty;
            imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
        }
        public void cargarddl()
        {
            try
            {
                LecturaCategoria lecturaCategoria = new LecturaCategoria();
                List<Categoria> listaCategoria = new List<Categoria>();
                listaCategoria = lecturaCategoria.listar(true);

                DDLCategoria.DataSource = listaCategoria;
                DDLCategoria.DataTextField = "Nombre";
                DDLCategoria.DataValueField = "ID";
                DDLCategoria.DataBind();

                LecturaMarca lecturaMarca = new LecturaMarca();
                List<Marca> listaMarca = new List<Marca>();
                listaMarca = lecturaMarca.listar(true);

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
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtImagenUrl.Text))
            {
                imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
            }
            else
            {
                imgProducto.ImageUrl = txtImagenUrl.Text;
            }
        }
        protected void dgv_ImgProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell campo = e.Row.Cells[0];
                string imagenUrl = campo.Text;
                int maximo_caracteres = 50;
                if (imagenUrl.Length > maximo_caracteres)
                {
                    campo.Text = imagenUrl.Substring(0, maximo_caracteres) + "...";
                }
                campo.ToolTip = imagenUrl;
            }
        } //acorta los url para que no se rompa el disenio
        protected void dgv_ImgProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Imagen imagenSeleccionada =  new Imagen();
            List<Imagen> imagenesBorrar = new List<Imagen>();
            int id = int.Parse(dgv_ImgProductos.SelectedDataKey.Value.ToString());
            imagenSeleccionada.id = id;

            imagenesBorrar = (List<Imagen>)Session["ImagenesBorrar"];
            imagenesBorrar.Add(imagenSeleccionada);
            Session["ImagenesBorrar"] = imagenesBorrar;

        }
        protected void BtnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if(chkConfirmarEliminacion.Checked)
                {
                    LecturaProducto lecturaProducto = new LecturaProducto();
                    foreach (var imagen in seleccionado.imagenes)
                    {
                        LecturaImagen lecturaImagen = new LecturaImagen();
                        lecturaImagen.eliminarFisica(imagen);
                    }
                    lecturaProducto.eliminarFisica(seleccionado);
                    Response.Redirect("productosAdmin.aspx", false);
                }          
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmaEliminacion = true;
        }

    }
}
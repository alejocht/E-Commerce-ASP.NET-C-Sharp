using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Dominio.Productos;
using LecturaDatos;

namespace TPC_Equipo_5
{
    public partial class productosAdmin : System.Web.UI.Page
    {
        public List<Producto> listaLecturaProducto;
        string busqueda;
        public bool listaMostrable;
        int seleccionado;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {      
                if (!IsPostBack)
                {
                    cargardatos();
                    cargarddl();
                    dgvProductos.DataSource = listaLecturaProducto;
                    dgvProductos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
                //Puede redireccionar a una pagina de error
            }
        }

        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            busqueda = txtBuscar.Text;
            if (ValidarTextBox(busqueda))
            {
                filtrarProducto(busqueda);
                dgvProductos.DataSource = listaLecturaProducto;
                dgvProductos.DataBind();
            }
            else
            {
                cargardatos();
                dgvProductos.DataSource = listaLecturaProducto;
                dgvProductos.DataBind();
            }
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargardatos();
            List<Producto> listaFiltrada;

            if (ddlOrdenar.SelectedValue == "Precio Mayor")
            {
                listaFiltrada = listaLecturaProducto.OrderByDescending(x => x.precio).ToList();
            }
            else if (ddlOrdenar.SelectedValue == "Precio Menor")
            {
                listaFiltrada = listaLecturaProducto.OrderBy(x => x.precio).ToList();
            }
            else if (ddlOrdenar.SelectedValue == "Stock Mayor")
            {
                listaFiltrada = listaLecturaProducto.OrderByDescending(x => x.stock).ToList();
            }
            else if (ddlOrdenar.SelectedValue == "Stock Menor")
            {
                listaFiltrada = listaLecturaProducto.OrderBy(x => x.stock).ToList();
            }
            else
            {
                listaFiltrada = listaLecturaProducto.OrderBy(x => x.id).ToList();
            }
            listaLecturaProducto = listaFiltrada;
            dgvProductos.DataSource = listaLecturaProducto;
            dgvProductos.DataBind();
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            if (txtImagenUrl.Text == "")
            {
                imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
            }
            else
            {
                imgProducto.ImageUrl = txtImagenUrl.Text;
            }
        }
        protected void btnCerrarProducto_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }

        protected void btnCancelarProducto_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {

                limpiarCampos();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
                //Puede redireccionar a una pagina de error
            }
        }

        public void cargardatos()
        {
            LecturaProducto lecturaProducto = new LecturaProducto();
            listaLecturaProducto = lecturaProducto.listar();
            dgvProductos.DataSource = listaLecturaProducto;
            dgvProductos.DataBind();
        }
        protected bool ValidarTextBox(string busqueda)
        {
            if (string.IsNullOrEmpty(busqueda))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public void validarListaMostrable()
        {
            int cantidadRegistros = listaLecturaProducto.Count();
            listaMostrable = true;
            if (cantidadRegistros < 1)
            {
                listaMostrable = false;
            }
        }

        private void filtrarProducto(string filtro)
        {
            cargardatos();
            List<Producto> listaFiltrada;
            listaFiltrada = listaLecturaProducto.FindAll(x => x.nombre.ToUpper().Contains(filtro.ToUpper()));
            listaLecturaProducto = listaFiltrada;
        }

        public void cargarddl()
        {
            ddlOrdenar.Items.Add("Por defecto");
            ddlOrdenar.Items.Add("Precio Mayor");
            ddlOrdenar.Items.Add("Precio Menor");
            ddlOrdenar.Items.Add("Stock Mayor");
            ddlOrdenar.Items.Add("Stock Menor");

            LecturaCategoria lecturaCategoria = new LecturaCategoria();
            List<Categoria> listaCategoria = new List<Categoria>();
            listaCategoria = lecturaCategoria.listar();

            ddlCategoria.DataSource = listaCategoria;
            ddlCategoria.DataTextField = "nombre";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Sin seleccionar", "0"));

            LecturaMarca lecturaMarca = new LecturaMarca();
            List<Marca> listaMarca = new List<Marca>();
            listaMarca = lecturaMarca.listar();

            ddlMarca.DataSource = listaMarca;
            ddlMarca.DataTextField = "nombre";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("Sin seleccionar", "0"));
        }

        public void limpiarCampos()
        {
            if (txtNombre.Text != "" || txtDescripcion.Text != "" || txtPrecio.Text != "" || txtStock.Text != "" || txtImagenUrl.Text != "" || ddlCategoria.SelectedIndex != 0 || ddlMarca.SelectedIndex != 0)
            {
                txtNombre.Text = "";
                txtDescripcion.Text = "";
                txtPrecio.Text = "";
                txtStock.Text = "";
                txtImagenUrl.Text = "";
                imgProducto.ImageUrl = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
                ddlCategoria.SelectedIndex = 0;
                ddlMarca.SelectedIndex = 0;
            }
        }

        protected void dgvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detalle")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = dgvProductos.Rows[index];

                // Aquí puedes acceder a los valores de la fila seleccionada
                string id = row.Cells[0].Text;
                string nombre = row.Cells[1].Text;
                string precio = row.Cells[2].Text;
                string stock = row.Cells[3].Text;

                // Ahora puedes pasar estos valores a tu modal
                txtDetalleNombre.Text = nombre;
                txtDetallePrecio.Text = precio;
                txtDetalleStock.Text = stock;
                // y otros campos necesarios...

                // Mostrar el modal (si es necesario, puede hacerlo en el frontend con JavaScript)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModalScript", "$('#modalDetalleProducto').modal('show');", true);
            }
        }
    }
}
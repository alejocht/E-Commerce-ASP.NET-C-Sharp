using System;
using System.Collections.Generic;
using System.Linq;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            cargardatos();

            if (!IsPostBack)
            {
                cargarddl();
                dgvProductos.DataSource = listaLecturaProducto;
                dgvProductos.DataBind();
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

        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvProductos.SelectedDataKey.Value.ToString();

            //Nueva ventana o usar javascript para abrir un modal
            //Response.Redirect("detalleAdmin.aspx?id=" + id);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

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
        }
    }
}
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
    public partial class categoriasAdmin : System.Web.UI.Page
    {
        public List<Categoria> listaLecturaCategoria;
        string busqueda;
        public bool listaMostrable;

        protected void Page_Load(object sender, EventArgs e)
        {
            cargardatos();

            if (!IsPostBack)
            {
                cargarddl();
                dgvCategorias.DataSource = listaLecturaCategoria;
                dgvCategorias.DataBind();
            }
        }

        protected void btnBusquedaCategoria_Click(object sender, EventArgs e)
        {
            busqueda = txtBuscarCategoria.Text;
            if (ValidarTextBox(busqueda))
            {
                filtrarCategoria(busqueda);
                dgvCategorias.DataSource = listaLecturaCategoria;
                dgvCategorias.DataBind();
            }
            else
            {
                cargardatos();
                dgvCategorias.DataSource = listaLecturaCategoria;
                dgvCategorias.DataBind();
            }
        }

        protected void ddlOrdenarCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Categoria> listaFiltrada;

            if (ddlOrdenarCategoria.SelectedValue == "Ascendente")
            {
                listaFiltrada = listaLecturaCategoria.OrderBy(x => x.nombre).ToList();
            }
            else if (ddlOrdenarCategoria.SelectedValue == "Descendente")
            {
                listaFiltrada = listaLecturaCategoria.OrderByDescending(x => x.nombre).ToList();
            }
            else
            {
                listaFiltrada = listaLecturaCategoria.OrderBy(x => x.id).ToList();
            }
            listaLecturaCategoria = listaFiltrada;
            dgvCategorias.DataSource = listaLecturaCategoria;
            dgvCategorias.DataBind();
        }

        protected void dgvCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarCategoría_Click(object sender, EventArgs e)
        {
            var id = dgvCategorias.SelectedDataKey.Value.ToString();

            //Nueva ventana o usar javascript para abrir un modal
        }

        public void cargardatos()
        {
            LecturaCategoria lecturaCategoria = new LecturaCategoria();
            listaLecturaCategoria = lecturaCategoria.listar();
            dgvCategorias.DataSource = listaLecturaCategoria;
            dgvCategorias.DataBind();
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
            int cantidadRegistros = listaLecturaCategoria.Count();
            listaMostrable = true;
            if (cantidadRegistros < 1)
            {
                listaMostrable = false;
            }
        }

        private void filtrarCategoria(string filtro)
        {
            List<Categoria> listaFiltrada;
            listaFiltrada = listaLecturaCategoria.FindAll(x => x.nombre.ToUpper().Contains(filtro.ToUpper()));
            listaLecturaCategoria = listaFiltrada;
        }

        public void cargarddl()
        {
            ddlOrdenarCategoria.Items.Add("Por defecto");
            ddlOrdenarCategoria.Items.Add("Ascendente");
            ddlOrdenarCategoria.Items.Add("Descendente");
        }
    }
}
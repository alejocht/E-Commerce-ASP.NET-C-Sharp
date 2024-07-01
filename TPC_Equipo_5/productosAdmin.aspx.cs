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
                cargardatos();
                if (!IsPostBack)
                {
                    cargarddl();
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
            try
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
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
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
                else if (ddlOrdenar.SelectedValue == "Activos")
                {
                    listaFiltrada = filtrarXEstado(true);
                }
                else if (ddlOrdenar.SelectedValue == "Inactivos")
                {
                    listaFiltrada = filtrarXEstado(false);
                }
                else
                {
                    listaFiltrada = listaLecturaProducto.OrderBy(x => x.id).ToList();
                }
                listaLecturaProducto = listaFiltrada;
                dgvProductos.DataSource = listaLecturaProducto;
                dgvProductos.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }  
        }
        protected List<Producto> filtrarXEstado(bool estado)
        {
            try
            {
                List<Producto> listaFiltrada;
                listaFiltrada = listaLecturaProducto.FindAll(x => x.estado == estado);
                return listaFiltrada;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("AgregarProducto.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void cargardatos()
        {
            try
            {
                LecturaProducto lecturaProducto = new LecturaProducto();
                listaLecturaProducto = lecturaProducto.listar();
                dgvProductos.DataSource = listaLecturaProducto;
                dgvProductos.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        protected bool ValidarTextBox(string busqueda)
        {
            try
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
            catch (Exception ex)
            {

                throw ex;
            }     
        }
        public void validarListaMostrable()
        {
            try
            {
                int cantidadRegistros = listaLecturaProducto.Count();
                listaMostrable = true;
                if (cantidadRegistros < 1)
                {
                    listaMostrable = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        private void filtrarProducto(string filtro)
        {
            try
            {
                List<Producto> listaFiltrada;
                listaFiltrada = listaLecturaProducto.FindAll(x => x.nombre.ToUpper().Contains(filtro.ToUpper()));
                listaLecturaProducto = listaFiltrada;
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
                ddlOrdenar.Items.Add("Por defecto");
                ddlOrdenar.Items.Add("Activos");
                ddlOrdenar.Items.Add("Inactivos");
                ddlOrdenar.Items.Add("Precio Mayor");
                ddlOrdenar.Items.Add("Precio Menor");
                ddlOrdenar.Items.Add("Stock Mayor");
                ddlOrdenar.Items.Add("Stock Menor");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = dgvProductos.SelectedDataKey.Value.ToString();
                Response.Redirect("ModificarProducto.aspx?id=" + id, false);
            }
            catch (Exception ex)
            {

                throw ex;
            }        
        }
    }
}
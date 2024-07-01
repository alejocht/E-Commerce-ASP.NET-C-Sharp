using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Dominio.Pedidos;
using Dominio.Productos;
using LecturaDatos;

namespace TPC_Equipo_5
{
    public partial class pedidosAdmin : System.Web.UI.Page
    {
        public List<Pedido> listaLecturaPedido;
        string busqueda;
        string seleccionado;

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
                    dgvPedidos.DataSource = listaLecturaPedido;
                    dgvPedidos.DataBind();
                }
                else
                {
                    cargardatos();
                    dgvPedidos.DataSource = listaLecturaPedido;
                    dgvPedidos.DataBind();
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
                List<Pedido> listaFiltrada;

                if (ddlOrdenar.SelectedValue == "Más recientes")
                {
                    listaFiltrada = listaLecturaPedido.OrderByDescending(x => x.fecha).ToList();
                }
                else if (ddlOrdenar.SelectedValue == "Más antiguos")
                {
                    listaFiltrada = listaLecturaPedido.OrderBy(x => x.fecha).ToList();
                }
                else
                {
                    listaFiltrada = listaLecturaPedido.OrderBy(x => x.id).ToList();
                }
                listaLecturaPedido = listaFiltrada;
                dgvPedidos.DataSource = listaLecturaPedido;
                dgvPedidos.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void dgvPedidos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                seleccionado = dgvPedidos.SelectedDataKey.Value.ToString();
                Response.Redirect("DetallePedidoAdmin.aspx?id=" + seleccionado, false);
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
                LecturaPedido lecturaPedido = new LecturaPedido();
                listaLecturaPedido = lecturaPedido.listar();
                dgvPedidos.DataSource = listaLecturaPedido;
                dgvPedidos.DataBind();
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

        private void filtrarProducto(string filtro)
        {
            try
            {
                List<Pedido> listaFiltrada;
                listaFiltrada = listaLecturaPedido.FindAll(x => x.id.ToString().ToUpper().Contains(filtro.ToUpper()));
                listaLecturaPedido = listaFiltrada;
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
                ddlOrdenar.Items.Add("Más recientes");
                ddlOrdenar.Items.Add("Más antiguos");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
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

        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {

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
        public void cargarddl()
        {
            try
            {
                ddlOrdenar.Items.Add("Por defecto");
                ddlOrdenar.Items.Add("Completados");
                ddlOrdenar.Items.Add("Cancelados");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
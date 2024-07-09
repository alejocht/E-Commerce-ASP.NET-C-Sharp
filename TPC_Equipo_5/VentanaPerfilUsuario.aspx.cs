using Dominio.Pedidos;
using Dominio.Usuarios;
using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class VentanaPerfilUsuario : System.Web.UI.Page
    {
        public List<Pedido> listaLecturaPedido;
        Usuario usuarioSeleccionado = new Usuario();
        DatosUsuario datosSeleccionado = new DatosUsuario();
        int idUsuario = 2; // idUsuario = 2 es un ejemplo, debería ser el id del usuario logueado
        string seleccionado;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cargardatos();
                if (!IsPostBack)
                {
                    LblBienvenidaUsuario.Text = "Bienvenido " + datosSeleccionado.nombre + " " + datosSeleccionado.apellido.ToString();
                    LblNombre.Text = datosSeleccionado.nombre.ToString();
                    LblApellido.Text = datosSeleccionado.apellido.ToString();
                    LblEmail.Text = datosSeleccionado.email.ToString();
                    LblTelefono.Text = datosSeleccionado.telefono.ToString();

                    LblUsuario.Text = usuarioSeleccionado.usuario.ToString();
                    LblPassword.Text = usuarioSeleccionado.password.ToString();

                    LblDireccion.Text = datosSeleccionado.direccion.ToString();
                    LblProvincia.Text = datosSeleccionado.ciudad.provincia.nombre.ToString();
                    LblCiudad.Text = datosSeleccionado.ciudad.nombre.ToString();

                }
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }
        public void cargardatos()
        {
            try
            {
                LecturaPedido lecturaPedido = new LecturaPedido();
                listaLecturaPedido = lecturaPedido.listarxUsuario(idUsuario);
                dgvPedidosUsuario.DataSource = listaLecturaPedido;
                dgvPedidosUsuario.DataBind();

                LecturaUsuario lecturaUsuario = new LecturaUsuario();
                usuarioSeleccionado = lecturaUsuario.listar(idUsuario);
                
                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                datosSeleccionado = lecturaDatosUsuario.listar(idUsuario);
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void dgvPedidosUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                seleccionado = dgvPedidosUsuario.SelectedDataKey.Value.ToString();
                Response.Redirect("DetallePedido.aspx?id=" + seleccionado, false);
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void btnModificarDatosPersonales_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarDatosUsuario_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarDireccion_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx", false);
        }
    }
}
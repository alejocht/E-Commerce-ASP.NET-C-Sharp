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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cargardatos();
                if (!IsPostBack)
                {
                    LblBienvenidaUsuario.Text = "Bienvenido " + datosSeleccionado.nombre + " " + datosSeleccionado.apellido;
                    LblNombre.Text = datosSeleccionado.nombre;
                    LblApellido.Text = datosSeleccionado.apellido;
                    LblEmail.Text = datosSeleccionado.email;
                    LblTelefono.Text = datosSeleccionado.telefono;

                    LblUsuario.Text = usuarioSeleccionado.usuario;
                    LblPassword.Text = usuarioSeleccionado.password;

                    LblDireccion.Text = datosSeleccionado.direccion;
                    LblProvincia.Text = datosSeleccionado.ciudad.provincia.nombre;
                    LblCiudad.Text = datosSeleccionado.ciudad.nombre;

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
    }
}
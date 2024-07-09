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
        //int idUsuario = 2; // idUsuario = 2 es un ejemplo, debería ser el id del usuario logueado
        string seleccionado;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //cargardatos();
                if (!IsPostBack)
                {
                    if ((Usuario)Session["usuario"] != null)
                    {
                        

                        usuarioSeleccionado = (Usuario)Session["usuario"];
                        LblBienvenidaUsuario.Text = "Bienvenido " + usuarioSeleccionado.dato.nombre + " " + usuarioSeleccionado.dato.apellido;
                        LblNombre.Text = usuarioSeleccionado.dato.nombre;
                        LblApellido.Text = usuarioSeleccionado.dato.apellido;
                        LblEmail.Text = usuarioSeleccionado.dato.email;
                        LblTelefono.Text = usuarioSeleccionado.dato.telefono;

                        LblUsuario.Text = usuarioSeleccionado.usuario;
                        LblPassword.Text = usuarioSeleccionado.password;

                        LblDireccion.Text = usuarioSeleccionado.dato.direccion;
                        LblProvincia.Text = usuarioSeleccionado.dato.ciudad.provincia.nombre;
                        LblCiudad.Text = usuarioSeleccionado.dato.ciudad.nombre;

                        LecturaPedido lecturaPedido = new LecturaPedido();
                        listaLecturaPedido = lecturaPedido.listarxUsuario(usuarioSeleccionado.id);
                        dgvPedidosUsuario.DataSource = listaLecturaPedido;
                        dgvPedidosUsuario.DataBind();
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }
        //public void cargardatos()
        //{
        //    try
        //    {
        //        LecturaPedido lecturaPedido = new LecturaPedido();
        //        listaLecturaPedido = lecturaPedido.listarxUsuario(idUsuario);
        //        dgvPedidosUsuario.DataSource = listaLecturaPedido;
        //        dgvPedidosUsuario.DataBind();

        //        LecturaUsuario lecturaUsuario = new LecturaUsuario();
        //        usuarioSeleccionado = lecturaUsuario.listar(idUsuario);
                
        //        LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
        //        datosSeleccionado = lecturaDatosUsuario.listar(idUsuario);
        //    }
        //    catch (Exception ex)
        //    {

        //        Session["error"] = ex.Message;
        //        Response.Redirect("error.aspx", false);
        //    }
        //}

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
            try
            {
                Session.Clear();
                Response.Redirect("default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
                Response.Redirect("error", false);
            }
            
        }
    }
}
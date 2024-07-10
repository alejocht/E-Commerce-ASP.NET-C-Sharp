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
        Usuario listaLecturaUsuario = new Usuario();
        DatosUsuario listaLecturaDatosUsuario = new DatosUsuario();
        LecturaProvincia lecturaProvincia = new LecturaProvincia();
        LecturaCiudad lecturaCiudad = new LecturaCiudad();
        int idUsuario = 0;
        string seleccionado;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ddlCargar();
                if (!IsPostBack)
                {

                    if ((Usuario)Session["usuario"] != null)
                    {
                        idUsuario = ((Usuario)Session["usuario"]).id;
                        cargarDatos();
                        LblBienvenidaUsuario.Text = "Bienvenido " + listaLecturaDatosUsuario.nombre + " " + listaLecturaDatosUsuario.apellido;

                        LecturaPedido lecturaPedido = new LecturaPedido();
                        listaLecturaPedido = lecturaPedido.listarxUsuario(idUsuario);
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

        protected void btnModificarMisDatos_Click(object sender, EventArgs e)
        {
            try
            {
                DatosUsuario datosUsuario = new DatosUsuario();

                datosUsuario.id = ((Usuario)Session["usuario"]).id;
                datosUsuario.nombre = txtNombres.Text;
                datosUsuario.apellido = txtApellidos.Text;
                datosUsuario.email = txtEmail.Text;
                datosUsuario.telefono = txtTelefono.Text;

                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                lecturaDatosUsuario.modificarDatos(datosUsuario);

                Response.Redirect("VentanaPerfilusuario.aspx", false);
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void btnMOdificarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtUsuario.Text == "" || txtPassword.Text == "")
                {
                    throw new Exception("Debe completar los campos de usuario y contraseña");
                }
                Usuario usuario = new Usuario();

                usuario.id = ((Usuario)Session["usuario"]).id;
                usuario.usuario = txtUsuario.Text;
                usuario.password = txtPassword.Text;

                LecturaUsuario lecturaUsuario = new LecturaUsuario();
                lecturaUsuario.modificar(usuario);

                Response.Redirect("VentanaPerfilusuario.aspx", false);
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }

        }

        protected void btnModificarMiDireccion_Click(object sender, EventArgs e)
        {
            try
            {
                DatosUsuario datosUsuario = new DatosUsuario();

                datosUsuario.id = ((Usuario)Session["usuario"]).id;
                datosUsuario.direccion = txtDireccion.Text;
                datosUsuario.ciudad.id = Convert.ToInt32(ddlCiudad.SelectedValue);

                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                lecturaDatosUsuario.modificarDireccion(datosUsuario);

                Response.Redirect("VentanaPerfilusuario.aspx", false);
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
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

        protected void cargarDatos()
        {
            LecturaUsuario lecturaUsuario = new LecturaUsuario();
            listaLecturaUsuario = lecturaUsuario.listar(idUsuario);
            LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
            listaLecturaDatosUsuario = lecturaDatosUsuario.listar(idUsuario);

            txtNombres.Text = LblNombre.Text = listaLecturaDatosUsuario.nombre;
            txtApellidos.Text = LblApellido.Text = listaLecturaDatosUsuario.apellido;
            txtEmail.Text = LblEmail.Text = listaLecturaDatosUsuario.email;
            txtTelefono.Text = LblTelefono.Text = listaLecturaDatosUsuario.telefono;

            txtUsuario.Text = listaLecturaUsuario.usuario;
            txtPassword.Text = listaLecturaUsuario.password;

            txtDireccion.Text = LblDireccion.Text = listaLecturaDatosUsuario.direccion;
            LblProvincia.Text = listaLecturaDatosUsuario.ciudad.provincia.nombre;
            LblCiudad.Text = listaLecturaDatosUsuario.ciudad.nombre;

            ddlProvincia.SelectedValue = listaLecturaDatosUsuario.ciudad.provincia.id.ToString();
            ddlCiudad.SelectedValue = listaLecturaDatosUsuario.ciudad.id.ToString();
        }

        protected void ddlCargar()
        {
            ddlProvincia.Items.Add(new ListItem("Seleccione una provincia", "0"));
            ddlCiudad.Items.Add(new ListItem("Seleccione una ciudad", "0"));

            foreach (Provincia provincia in lecturaProvincia.listar())
            {
                ddlProvincia.Items.Add(new ListItem(provincia.nombre, provincia.id.ToString()));
            }
            foreach (Ciudad ciudad in lecturaCiudad.listar())
            {
                ddlCiudad.Items.Add(new ListItem(ciudad.nombre, ciudad.id.ToString()));
            }
        }
    }
}
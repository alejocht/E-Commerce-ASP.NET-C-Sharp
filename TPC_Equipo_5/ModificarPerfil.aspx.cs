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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturaUsuario lecturaUsuario = new LecturaUsuario();
            int id = int.Parse(Request.QueryString["id"].ToString());
            Usuario usuario = lecturaUsuario.listar(id);
            if(!IsPostBack)
            {
                TxtMail.Text = usuario.dato.email;
                TxtNombre.Text = usuario.dato.nombre;
                TxtApellido.Text = usuario.dato.apellido;
                txtContrasenia.Text = usuario.password;
                TxtRepetirContrasenia.Text = usuario.password;
                ChkAdmin.Checked = usuario.admin;
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("usuariosAdmin.aspx", false);
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {

        }
    }
}
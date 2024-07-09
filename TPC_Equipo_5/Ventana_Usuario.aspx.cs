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
    public partial class Ventana_Usuario : System.Web.UI.Page
    {
           public bool correo_enviado= false;
        protected void Page_Load(object sender, EventArgs e)
        {
            correo_enviado = false;
        }


        protected void Btn_login_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            LecturaUsuario lecturaUsuario = new LecturaUsuario();
            try
            {
                usuario.usuario = TxtUser.Text;
                usuario.password = TxtPass.Text;
                if(lecturaUsuario.loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("VentanaPerfilUsuario.aspx", false);
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("error.aspx", false);
                }
                //intento de arreglar boton
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnOlvidemipass_Click(object sender, EventArgs e)
        {
            ServiceEmail email = new ServiceEmail();
            Usuario user = new Usuario();
            LecturaUsuario datos = new LecturaUsuario();
            user = (Usuario)Session["usuario"];
            datos.recuperarcontraseña(Txt_Email.Text, user);
            correo_enviado = true;
           
        }
    }
}
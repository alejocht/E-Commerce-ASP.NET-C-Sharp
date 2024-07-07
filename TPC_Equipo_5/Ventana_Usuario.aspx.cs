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
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    //TxtUser.Text = "Ingreso correcto";
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("error.aspx", false);
                }
                //Response.Redirect("defaultAdmin.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Usuario> usuarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cargarDatos();
                if (!IsPostBack)
                {
                }
            }
            catch (Exception ex)
            {
                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }      
        }
        protected void cargarDatos()
        {
            LecturaUsuario lecturaUsuario = new LecturaUsuario();
            usuarios = lecturaUsuario.listar();
            dgv_usuarios.DataSource = usuarios;
            dgv_usuarios.DataBind();
        }

        protected void dgv_usuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dgv_usuarios.PageIndex = e.NewPageIndex;
                dgv_usuarios.DataBind();

            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }
    }
}
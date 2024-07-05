using Dominio;
using Dominio.Productos;
using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio.Usuarios;

namespace TPC_Equipo_5
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        List<Provincia> ListaProvincias;
        LecturaProvincia lecturaProvincias;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {


                    lecturaProvincias = new LecturaProvincia();
                    List<Provincia> listaprovincia = lecturaProvincias.listar();
                    LecturaCiudad lecturaciudad = new LecturaCiudad();
                    List<Ciudad> listaciudad = lecturaciudad.listar();


                    DdlProvincias.DataSource = listaprovincia;
                    DdlProvincias.DataValueField = "ID";
                    DdlProvincias.DataTextField = "Nombre";
                    DdlProvincias.DataBind();

                    DdlLocalidad.DataSource = listaciudad;
                    DdlLocalidad.DataTextField = "Nombre";
                    DdlLocalidad.DataValueField = "ID";
                    DdlLocalidad.DataBind();
                }

            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void DdlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                LecturaCiudad lecturaciudad = new LecturaCiudad();
                List<Ciudad> listaciudad = new List<Ciudad>();
                int id = int.Parse(DdlProvincias.SelectedItem.Value);
                listaciudad = lecturaciudad.listarPorProvincia(id);
                DdlLocalidad.DataSource = listaciudad;
                DdlLocalidad.DataTextField = "Nombre";
                DdlLocalidad.DataBind();
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void Rb_Mujer_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Rb_Hombre_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Rb_PnD_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void Btn_CrearCuenta_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {

            }
            else
            {
                try
                {
                    LecturaDatosUsuario lecturadatos = new LecturaDatosUsuario();
                    DatosUsuario datosUsuario = new DatosUsuario();
                    datosUsuario.nombre = Txt_Nombre.Text;
                    datosUsuario.apellido = Txt_Apellido.Text;
                    datosUsuario.telefono = Txt_Telefono.Text;
                    datosUsuario.email = Txt_Email.Text;
                    datosUsuario.direccion = Txt_Direccion.Text;

                    datosUsuario.ciudad.id = int.Parse(DdlLocalidad.SelectedItem.Value);
                    lecturadatos.agregar(datosUsuario);
                    LecturaUsuario lecturaUsuario = new LecturaUsuario();
                    Usuario aux = new Usuario();
                    aux.usuario = Txt_Usuario.Text;
                    aux.password = Txt_Password.Text;
                    lecturaUsuario.agregar(aux, datosUsuario);

                    //actualizo la session de usuario
                    Response.Redirect("Ventana_Usuario.aspx", false);

                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
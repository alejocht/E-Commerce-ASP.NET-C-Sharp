 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Dominio.Productos;
using LecturaDatos;

namespace TPC_Equipo_5
{
    public partial class site : System.Web.UI.MasterPage
    {
        int cantidad;
        string busqueda;
        List<Producto> listaDeCompras;
        public ServiceEmail email;
        public string cantidadItems
        {
            get { return cantidadItems; }
            set { Contador.Text = value; }
        }

        protected bool ValidarTextBox(string busqueda)
        {
            if (string.IsNullOrEmpty(busqueda)) { return false; }
            else { return true; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Ventana_Usuario || Page is _default || Page is Productos || Page is DetalleProducto || Page is VentanaCarrito))
            {
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Response.Redirect("Ventana_Usuario.aspx", false);
                }

            }

            if (Session["listaArticulosEnCarrito"] == null)
            {
                Contador.Text = "";
            }
            else
            {
                listaDeCompras = (List<Producto>)Session["listaArticulosEnCarrito"];
                cantidad = listaDeCompras.Count();
                Contador.Text = cantidad.ToString();
            }
        }

        protected void imgBusqueda_Click(object sender, ImageClickEventArgs e)
        {
            busqueda = txtBusqueda.Text;
            if (ValidarTextBox(busqueda))
            {
                //caso en el que tiene que iniciar la busqueda
                Response.Redirect("Productos.aspx?busqueda=" + busqueda, false);
            }
            else
            {
                //caso en el que tiene que mostrar todo
                Response.Redirect("Productos.aspx", false);
            }
        }

        protected void btnSuscribite_Click(object sender, EventArgs e)
        {
            string nombre;
            string correo;
            nombre = txtNombreSuscribite.Text;
            correo = txtMailSuscribite.Text;

            string asunto = "Suscripcion a OVCloaked";
            string cuerpo = "Usted ha sido registrado en nuestra newslestter. Gracias por suscribirte a OVCloaked, " + nombre + "!";

            if (ValidarTextBox(nombre) && ValidarTextBox(correo))
            {
                email = new ServiceEmail();
                email.armarcorreo(correo, asunto, cuerpo);
                email.enviarEmail();

                lblValidacionSuscribite.Text = " Registrado con exito!";
            }
            else
            {
                lblValidacionSuscribite.Text = " Debe completar todos los campos *";
            }
        }
    }
}
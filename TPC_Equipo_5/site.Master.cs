using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class site : System.Web.UI.MasterPage
    {
        string busqueda;

        protected bool ValidarTextBox(string busqueda)
        {
            if (string.IsNullOrEmpty(busqueda)) { return false; }
            else { return true; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listaArticulosEnCarrito"] == null)
            {
                Contador.Text = "";
            }
            else
            {
                //Pasar contador de carrito a la vista
            }
        }

        protected void imgBusqueda_Click(object sender, ImageClickEventArgs e)
        {
            busqueda = txtBusqueda.Text;
            if (ValidarTextBox(busqueda))
            {
                //caso en el que tiene que iniciar la busqueda
                Response.Redirect("default.aspx?busqueda=" + busqueda, false);
            }
            else
            {
                //caso en el que tiene que mostrar todo
                Response.Redirect("default.aspx", false);
            }
        }
    }
}
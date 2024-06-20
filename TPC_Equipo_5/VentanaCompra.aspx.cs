using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LecturaDatos;
using Dominio;
using Dominio.Usuarios;

namespace TPC_Equipo_5
{
    public partial class VentanaCompra : System.Web.UI.Page
    {
       
        Provincia provincia;
        public int cambiopag = 1;
        List<Provincia> ListaProvincias;
        LecturaProvincia lecturaProvincias;
        public bool Trasferencia = false;
        public bool Mercadopago=false;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    
                    
                    lecturaProvincias = new LecturaProvincia();
                    List<Provincia> listaprovincia = lecturaProvincias.listar();
                    LecturaCiudad lecturaciudad = new LecturaCiudad();
                    List<Ciudad> listaciudad = lecturaciudad.listar();
                    

                    DdlProvincias.DataSource = listaprovincia;
                    DdlProvincias.DataValueField = "ID";
                    DdlProvincias.DataTextField= "Nombre";
                    DdlProvincias.DataBind();

                    DdlLocalidad.DataSource = listaciudad;
                    DdlLocalidad.DataTextField = "Nombre";
                    DdlLocalidad.DataBind();

                }

                if (Session["Trasferencia"] != null)
                {
                    Trasferencia = (bool)Session["Trasferencia"];
                }else { Session["Trasferencia"]= Trasferencia; }
                
                
                    
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

        }

        protected void DdlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            LecturaCiudad lecturaciudad = new LecturaCiudad();
            List<Ciudad> listaciudad = new List<Ciudad>();
            int id = int.Parse(DdlProvincias.SelectedItem.Value);
            listaciudad=lecturaciudad.listar(id);
            DdlLocalidad.DataSource = listaciudad;
            DdlLocalidad.DataTextField = "Nombre";
            DdlLocalidad.DataBind();
        }
        
        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            if (cambiopag < 3)
            {
                cambiopag++;
            }
                Session.Add("Cambiopag", cambiopag);
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            if (cambiopag > 1) 
            { 
                cambiopag--;
            }
                
            Session.Add("Cambiopag", cambiopag);
        }

        protected void btnTrasferencia_Click(object sender, EventArgs e)
        {
            if (Trasferencia == false){

                Trasferencia = true;
            }else Trasferencia=false;
            Session.Add("Trasferencia", Trasferencia);
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }     
        protected void Mp_CheckedChanged(object sender, EventArgs e)
        {
            if (Mercadopago == false)
            {
                Mercadopago = true;
                Trasferencia = false;
            }
            else { Mercadopago = false; }
        }

        protected void Tansf_CheckedChanged(object sender, EventArgs e)
        {
            if (Trasferencia == false)
            {
                Trasferencia = true;
                Mercadopago =false;
            }
            else { Trasferencia = false; }
        }
    }
}
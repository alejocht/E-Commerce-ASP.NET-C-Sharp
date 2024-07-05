﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LecturaDatos;
using Dominio;
using Dominio.Usuarios;
using Dominio.Productos;
using System.Web.Routing;
using System.Runtime.InteropServices.WindowsRuntime;

namespace TPC_Equipo_5
{
    public partial class VentanaCompra : System.Web.UI.Page
    {
        public List<Producto> listaLecturaProductos;
        public Producto produ;
        
            
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (listaLecturaProductos == null)
                    {
                        if (Session["listaArticulosEnCarrito"] != null)
                        {
                            listaLecturaProductos = (List<Producto>)Session["listaArticulosEnCarrito"];
                        }
                        else
                        {
                            listaLecturaProductos = new List<Producto>();
                        }

                    }
                    if (Session["ArticulosEnCarrito"] != null)
                    {
                        produ = (Producto)Session["ArticulosEnCarrito"];
                        listaLecturaProductos.Add(produ);
                        Session.Add("listaArticulosEnCarrito", listaLecturaProductos);

                        Session["ArticulosEnCarrito"] = null;
                    }
                    repCarrito.DataSource = listaLecturaProductos;
                    repCarrito.DataBind();

                    decimal SubtotalCarrito = CalcularTotal(listaLecturaProductos);
                    lblSubTotal.Text = "Subtotal: $" + SubtotalCarrito.ToString("F2");

                    lblEnvio.Text = "Envío: $" + 5000.ToString("0.00"); ;
                    lblTotalCompra.Text = "Total: $" + (SubtotalCarrito + 5000).ToString("0.00");


                }

            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }

        }
        private decimal CalcularTotal(List<Producto> productos)
        {
               decimal total = 0;

                foreach (var producto in productos)
                {
                    total += (decimal)producto.precio;
                }

                return total; ;           
        }
        
       




        protected void btnconfirmar_Click(object sender, EventArgs e)
        {




        }



        protected void BtnSubir_Click(object sender, EventArgs e)
        {
            //Terminar 
            if (FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(FileUpload1.FileName);

                int tam = FileUpload1.PostedFile.ContentLength;
                Response.Write(ext + ", " + tam);
                if (ext == ".png" && tam <= 1048576)
                {
                    FileUpload1.SaveAs(Server.MapPath("D:\\COSAS MARIANO\\UNI\\UNI\\Prog 3\\TPC\\TPC_Equipo_5\\BD\\Comprobantes" + FileUpload1.FileName));
                    Response.Write("Se subio el archivo");
                }
            }
            else
            {
                Response.Write("Selleciona un archivo a subir");
            }
        }
    }
}


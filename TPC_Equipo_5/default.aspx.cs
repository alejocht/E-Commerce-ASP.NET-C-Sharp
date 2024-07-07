using Dominio.Productos;
using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class _default : System.Web.UI.Page
    {
        public List<Producto> listaProductos;
        public List<Imagen> listaImagenes;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Carga los primeros 3 productos de db
                LecturaProducto lecturaProducto = new LecturaProducto();
                listaProductos = new List<Producto>();
                listaProductos = lecturaProducto.listar(true);
                RepeaterProducto.DataSource = listaProductos.Take(3);
                RepeaterProducto.DataBind();

                LecturaImagen lecturaImagen = new LecturaImagen();
                listaImagenes = new List<Imagen>();
                listaImagenes = lecturaImagen.listarPublicidad();
                cargarCarrusel();
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }

        }
        protected void LinkButton_Click(object sender, EventArgs e)
        {
            try
            {

                string ID = ((LinkButton)sender).CommandArgument.ToString();
                Response.Redirect("DetalleProducto.aspx?ID=" + ID, false);
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }

        protected void cargarCarrusel()
        {
            try
            {
                StringBuilder indicadorHtml = new StringBuilder();
                StringBuilder slideHtml = new StringBuilder();

                for (int index = 0; index < listaImagenes.Count; index++)
                {
                    string isActiveClass = index == 0 ? "active" : "";

                    // Generar HTML del botón indicador
                    indicadorHtml.Append($@"
                    <button type=""button"" data-bs-target=""#carouselPublicitario"" data-bs-slide-to=""{index}"" class=""{isActiveClass}"" aria-current=""{isActiveClass}"" aria-label=""Diapositiva {index + 1}"">
                    </button>");

                    // Generar HTML del elemento de diapositiva
                    slideHtml.Append($@"
                    <div class=""carousel-item {isActiveClass}"">
                        <img src=""{listaImagenes[index].imagenUrl}"" class=""d-block w-100"" alt=""{listaImagenes[index].id}"">
                    </div>");
                }

                indicadorLiteral.Text = indicadorHtml.ToString();
                itemLiteral.Text = slideHtml.ToString();
            }
            catch (Exception ex)
            {

                Session["error"] = ex.Message;
                Response.Redirect("error.aspx", false);
            }
        }
    }
}
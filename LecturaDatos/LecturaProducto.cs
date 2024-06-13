using Dominio.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaProducto
    {
        public List<Producto> listar() //return listaProductos
        {
            List<Producto> listaProductos = new List<Producto>();
            AccesoDatos datosProductos = new AccesoDatos();
            //AccesoDatos datosImagenes = new AccesoDatos();
            try
            {
                datosProductos.SetearConsulta("SELECT P.ID as ProductoID, P.Nombre as ProductoNombre, P.Descripcion as ProductoDescripcion, P.Stock as ProductoStock, P.Precio as ProductoPrecio, M.ID as MarcaID, M.nombre as MarcaNombre, C.ID as CategoriaID, C.nombre as CategoriaNombre FROM Productos P INNER JOIN Marcas M on P.ID_Marca = M.ID INNER JOIN Categorias C on P.ID_Categoria = C.ID");
                datosProductos.EjecutarLectura();
                while(datosProductos.Lector.Read())
                {
                    Producto aux = new Producto();
                    aux.marca = new Marca();
                    aux.categoria = new Categoria();
                    aux.imagenes = new List<Imagen>();
                    LecturaImagen lecturaImagen = new LecturaImagen();

                    aux.id = (int)datosProductos.Lector["ProductoID"];
                    aux.nombre = (string)datosProductos.Lector["ProductoNombre"];
                    //aux.codigo = (string)datosProductos.Lector[""];
                    aux.descripcion = (string)datosProductos.Lector["ProductoDescripcion"];
                    aux.stock = (int)datosProductos.Lector["ProductoStock"];
                    aux.precio = (decimal)datosProductos.Lector["ProductoPrecio"];

                    if (!Convert.IsDBNull(datosProductos.Lector["MarcaID"]))
                        aux.marca.id = (int)datosProductos.Lector["MarcaID"];
                    if (!Convert.IsDBNull(datosProductos.Lector["MarcaNombre"]))
                        aux.marca.nombre = (string)datosProductos.Lector["MarcaNombre"];

                    if (!Convert.IsDBNull(datosProductos.Lector["CategoriaID"]))
                        aux.categoria.id = (int)datosProductos.Lector["CategoriaID"];
                    if (!Convert.IsDBNull(datosProductos.Lector["CategoriaNombre"]))
                        aux.categoria.nombre = (string)datosProductos.Lector["CategoriaNombre"];

                    aux.imagenes = lecturaImagen.listar(aux.id);
                    // ACA HAY UN PROBLEMA
                    //datosImagenes.SetearConsulta("SELECT Imagen.ID as ImagenID, Imagen.ID_Producto as ImagenProducto, Imagen.Tipo_Imagen as ImagenTipo, Imagen.UrlImagen as ImagenURL FROM Imagen WHERE Imagen.ID_Producto =" + aux.id.ToString() );
                    //datosImagenes.EjecutarLectura();
                    //while (datosImagenes.Lector.Read())
                    //{
                    //    Imagen auximg = new Imagen();
                    //    auximg.id = (int)datosImagenes.Lector[""];
                    //    auximg.idProducto = (int)datosImagenes.Lector[""];
                    //    auximg.imagenUrl = (string)datosImagenes.Lector[""];

                    //    aux.imagenes.Add(auximg);

                    //}
                    // ACA HAY UN PROBLEMA

                    listaProductos.Add(aux);
                }

                return listaProductos;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                //datosImagenes.CerrarConexion();
                datosProductos.CerrarConexion();
            }
        }
    }

}

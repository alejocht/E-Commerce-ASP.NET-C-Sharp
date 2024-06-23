using Dominio.Productos;
using System;
using System.Collections;
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
                    aux.descripcion = (string)datosProductos.Lector["ProductoDescripcion"];
                    aux.stock = (int)datosProductos.Lector["ProductoStock"];
                    aux.precio = (decimal)datosProductos.Lector["ProductoPrecio"];

                    //Carga de Marca y categoria
                    if (!Convert.IsDBNull(datosProductos.Lector["MarcaID"]))
                        aux.marca.id = (int)datosProductos.Lector["MarcaID"];
                    if (!Convert.IsDBNull(datosProductos.Lector["MarcaNombre"]))
                        aux.marca.nombre = (string)datosProductos.Lector["MarcaNombre"];

                    if (!Convert.IsDBNull(datosProductos.Lector["CategoriaID"]))
                        aux.categoria.id = (int)datosProductos.Lector["CategoriaID"];
                    if (!Convert.IsDBNull(datosProductos.Lector["CategoriaNombre"]))
                        aux.categoria.nombre = (string)datosProductos.Lector["CategoriaNombre"];

                    //Carga de Imagenes + imagenprincipal (la que sale en la tarjeta)
                    aux.imagenes = lecturaImagen.listar(aux.id);

                    if (aux.imagenes.Count != 0)
                    {
                        Random random = new Random();
                        int cantidadImagenes = aux.imagenes.Count;
                        int numeroAleatorio = random.Next(0, cantidadImagenes);

                        aux.imagenPrincipal = aux.imagenes[numeroAleatorio].imagenUrl;
                    }

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
                datosProductos.CerrarConexion();
            }
        }
        public Producto listar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select * from Productos where ID = @id");
                datos.SetearParametro("@id", id);
                datos.EjecutarLectura();
                Producto aux = new Producto();
                while(datos.Lector.Read())
                {
                    LecturaImagen lecturaImagen = new LecturaImagen();
                    LecturaCategoria lecturaCategoria = new LecturaCategoria();
                    LecturaMarca lecturaMarca = new LecturaMarca();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];
                    aux.stock = (int)datos.Lector["Stock"];
                    aux.precio = (decimal)datos.Lector["Precio"];
                    aux.marca = lecturaMarca.listar(id);
                    aux.categoria = lecturaCategoria.listar(id);
                    aux.imagenes = lecturaImagen.listar(id);
                    if(aux.imagenes.Count > 0)
                    {
                        aux.imagenPrincipal = aux.imagenes[0].imagenUrl;
                    }
                    else
                    {
                        aux.imagenPrincipal = "";
                    }


                }
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

            }
        }
        public void agregar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("insert into Productos (ID_Categoria, ID_Marca,Nombre, Descripcion, Precio,Stock)\r\nvalues (@IDCategoria,@IDMarca,@Nombre,@Descripcion, @Precio, @Stock)");
                datos.SetearParametro("@IDCategoria", nuevo.categoria.id);
                datos.SetearParametro("@IDMarca", nuevo.marca.id);
                datos.SetearParametro("@Nombre", nuevo.nombre);
                datos.SetearParametro("@Descripcion", nuevo.descripcion);
                datos.SetearParametro("@Precio", nuevo.precio);
                datos.SetearParametro("@Stock", nuevo.stock);
                datos.ejecutarAccion();
                //Para encontrar el ID del producto que recien creamos
                List<Producto> lista = new List<Producto>();
                LecturaProducto lecturaProducto = new LecturaProducto();
                Producto aux = new Producto();
                lista = lecturaProducto.listar();
                aux = lista.Last();
                //Para darle el IDProducto a las imagenes que contenga la lista
                foreach (Imagen img in nuevo.imagenes) 
                {
                    img.idProducto = aux.id;
                }
                //Cargar las imagenes
                LecturaImagen lecturaImagen = new LecturaImagen();
                lecturaImagen.agregarLista(nuevo.imagenes);

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        } //agrega un nuevo producto a db pasandolo el objeto por parametro
        public void modificar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("update Productos set ID_Categoria = @IDCategoria  ID_Marca = @IDMarca , Nombre = @Nombre , Descripcion = @Descripcion, Precio = @Precio , Stock = @Stock  where ID = @ID)");
                datos.SetearParametro("@IDCategoria", nuevo.categoria.id);
                datos.SetearParametro("@IDMarca", nuevo.marca.id);
                datos.SetearParametro("@Nombre", nuevo.nombre);
                datos.SetearParametro("@Descripcion", nuevo.descripcion);
                datos.SetearParametro("@Precio", nuevo.precio);
                datos.SetearParametro("@Stock", nuevo.stock);
                datos.SetearParametro("@ID", nuevo.id);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        } //modifica un producto en db pasandole el objeto por parametro
        public void eliminarFisica(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("delete from Productos where ID = @ID)");
                datos.SetearParametro("@ID", nuevo.id);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }//elimina el producto en db pasandole el objeto por parametro
        //agregar baja logica
    }

}

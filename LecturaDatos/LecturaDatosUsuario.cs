using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaDatosUsuario
    {
        public List<DatosUsuario> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                List<DatosUsuario> lista = new List<DatosUsuario>();
                datos.SetearConsulta("select * from Datos_Personales");
                datos.EjecutarLectura();
                while(datos.Lector.Read())
                {
                    DatosUsuario aux = new DatosUsuario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Nombres"];
                    aux.apellido = (string)datos.Lector["Apellidos"];
                    aux.email = (string)datos.Lector["Email"];
                    aux.telefono = (int)datos.Lector["Telefono"];
                    aux.direccion = (string)datos.Lector["Direccion"];
                    aux.ciudad.id = (int)(datos.Lector["IDCiudad"]);

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public DatosUsuario listar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                DatosUsuario aux = new DatosUsuario();
                datos.SetearConsulta("select * from Datos_Personales where ID = @id");
                datos.SetearParametro("@id", id);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                { 
                    LecturaCiudad lecturaCiudad = new LecturaCiudad();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Nombres"];
                    aux.apellido = (string)datos.Lector["Apellidos"];
                    aux.email = (string)datos.Lector["Email"];
                    aux.telefono = (int)datos.Lector["Telefono"];
                    aux.direccion = (string)datos.Lector["Direccion"];
                    aux.ciudad = lecturaCiudad.listar((int)datos.Lector["IDCiudad"]);
                }

                return aux;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void agregar(DatosUsuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into Datos_Personales(Nombres,Apellidos,Email,Telefono,Direccion,IDCiudad) values (@nombre, @apellido, @email, @telefono, @direccion, @idciudad)");
                datos.SetearParametro("@nombre", nuevo.nombre);
                datos.SetearParametro("@apellido", nuevo.apellido);
                datos.SetearParametro("@email", nuevo.email);
                datos.SetearParametro("@telefono", nuevo.telefono);
                datos.SetearParametro("@direccion", nuevo.direccion);
                datos.SetearParametro("@idciudad", nuevo.ciudad.id);
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
        }
        public void modificar(DatosUsuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into Datos_Personales(Nombres,Apellidos,Email,Telefono,Direccion,IDCiudad) values (@nombre,@apellido,@email,@telefono,@direccion,@idciudad)");
                datos.SetearParametro("@nombre", nuevo.nombre);
                datos.SetearParametro("@apellido", nuevo.apellido);
                datos.SetearParametro("@email", nuevo.email);
                datos.SetearParametro("@telefono", nuevo.telefono);
                datos.SetearParametro("@direccion", nuevo.direccion);
                datos.SetearParametro("@idciudad", nuevo.ciudad.id);
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
        }
        public void eliminarFisica(DatosUsuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("delete Datos_Personales where ID = @id");
                datos.SetearParametro("@id", nuevo.id);
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
        }
    }
}

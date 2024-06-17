using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaUsuario
    {
        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Usuarios");
                datos.EjecutarLectura();

                while(datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.usuario = (string)datos.Lector["Usuario"];
                    aux.password = (string)datos.Lector["Clave"];
                    aux.admin = (bool)datos.Lector["Administrar"];
                    aux.dato.id = (int)datos.Lector["IDDatos_Personales"];
                }

                return lista;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into Usuarios (Usuario,Clave,Administrar,IDDatos_Personales) values (@usuario, @clave, @admin, @iddatospersonales)");
                datos.SetearParametro("@usuario", nuevo.usuario);
                datos.SetearParametro("@clave", nuevo.password);
                datos.SetearParametro("@admin", nuevo.admin);
                datos.SetearParametro("@iddatospersonales",nuevo.dato.id);
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
        public void modificar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update Usuarios set Usuario = @usuario, Clave = @clave, Administrar = @admin, IDDatos_Personales = @iddatospersonales where ID = @id");
                datos.SetearParametro("@usuario", nuevo.usuario);
                datos.SetearParametro("@clave", nuevo.password);
                datos.SetearParametro("@admin", nuevo.admin);
                datos.SetearParametro("@iddatospersonales", nuevo.dato.id);
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
        public void borrarFisica(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("delete Usuarios where ID = @id");
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

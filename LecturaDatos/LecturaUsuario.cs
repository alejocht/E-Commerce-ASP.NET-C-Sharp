using Dominio.Productos;
using Dominio.Usuarios;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
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
                    LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.usuario = (string)datos.Lector["Usuario"];
                    aux.password = (string)datos.Lector["Clave"];
                    aux.admin = (bool)datos.Lector["Administrar"];
                    aux.dato.id = (int)datos.Lector["IDDatos_Personales"];
                    aux.dato = lecturaDatosUsuario.listar(aux.dato.id);
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
        public Usuario listar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select * from Usuarios where ID = @id");
                datos.SetearParametro("@id", id);
                datos.EjecutarLectura();
                Usuario aux = new Usuario();
                while (datos.Lector.Read())
                {
                    LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.usuario = (string)datos.Lector["Usuario"];
                    aux.password = (string)(datos.Lector["Clave"]);
                    aux.admin = (bool)(datos.Lector["Administrar"]);
                    aux.dato.id = (int)datos.Lector["IDDatos_Personales"];
                    aux.dato = lecturaDatosUsuario.listar(aux.dato.id);
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
        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //agregar datos personales y enlazarlos a usuario
                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                lecturaDatosUsuario.agregar(nuevo.dato);
                List<DatosUsuario> lista = new List<DatosUsuario>();
                lista = lecturaDatosUsuario.listar();
                DatosUsuario aux = lista.Last();
                int idDatosPersonales = aux.id;
                //agregar ususario
                datos.SetearConsulta("insert into Usuarios (Usuario,Clave,Administrar,IDDatos_Personales) values (@usuario, @clave, @admin, @iddatospersonales)");
                datos.SetearParametro("@usuario", nuevo.usuario);
                datos.SetearParametro("@clave", nuevo.password);
                datos.SetearParametro("@admin", nuevo.admin);
                datos.SetearParametro("@iddatospersonales",idDatosPersonales);
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
                datos.SetearConsulta("update Usuarios set Usuario = @usuario, Clave = @clave, Administrar = @admin where ID = @id");
                datos.SetearParametro("@usuario", nuevo.usuario);
                datos.SetearParametro("@clave", nuevo.password);
                datos.SetearParametro("@admin", nuevo.admin);
                datos.SetearParametro("@id", nuevo.id);
                datos.ejecutarAccion();
                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                lecturaDatosUsuario.modificar(nuevo.dato);
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
        public void agregar(Usuario nuevo, DatosUsuario datospersonales)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //agregar datos personales y enlazarlos a usuario
                LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                lecturaDatosUsuario.agregar(datospersonales);
                List<DatosUsuario> lista = new List<DatosUsuario>();
                lista = lecturaDatosUsuario.listar();
                DatosUsuario aux = lista.Last();
                int idDatosPersonales = aux.id;
                //agregar ususario
                datos.SetearConsulta("insert into Usuarios (Usuario,Clave,Administrar,IDDatos_Personales) values (@usuario, @clave, @admin, @iddatospersonales)");
                datos.SetearParametro("@usuario", nuevo.usuario);
                datos.SetearParametro("@clave", nuevo.password);               
                datos.SetearParametro("@admin", nuevo.admin);
                datos.SetearParametro("@iddatospersonales", idDatosPersonales);
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
        public bool loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select Usuarios.ID, Administrar, Datos_Personales.ID as IDDatos  from Usuarios inner join Datos_Personales on Datos_Personales.ID = Usuarios.IDDatos_Personales where Usuario = @user and Clave = @pass");
                datos.SetearParametro("@user", usuario.usuario);
                datos.SetearParametro("@pass", usuario.password);
                datos.EjecutarLectura();
                while(datos.Lector.Read())
                {
                    usuario.id = (int)datos.Lector["ID"];
                    usuario.admin = (bool)datos.Lector["Administrar"];
                    usuario.dato.id = (int)datos.Lector["IDDatos"];
                    LecturaDatosUsuario lecturaDatosUsuario = new LecturaDatosUsuario();
                    usuario.dato = lecturaDatosUsuario.listar(usuario.dato.id);
                    return true;
                }
                return false;
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

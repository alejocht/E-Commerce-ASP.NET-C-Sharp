using Dominio.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaCiudad
    {
        public List<Ciudad> listar()
        {
            List<Ciudad> lista = new List<Ciudad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select * from Ciudades");
                datos.EjecutarLectura();
                while(datos.Lector.Read()) 
                {
                    LecturaProvincia lecturaProvincia = new LecturaProvincia();
                    Ciudad aux = new Ciudad();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    Provincia provincia = lecturaProvincia.listar(aux.id)[0];
                    aux.provincia = provincia;
                    
                    lista.Add(aux);
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
        public void agregar(Ciudad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into Ciudades (Nombre,IDProvincia) values (@nombre, @idprovincia)");
                datos.SetearParametro("@nombre", nuevo.nombre);
                datos.SetearParametro("@idprovincia", nuevo.provincia.id);
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
        public void modificar(Ciudad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update Ciudades set Nombre = @nombre , IDProvincia = @idprovincia where ID = @id");
                datos.SetearParametro("@nombre", nuevo.nombre);
                datos.SetearParametro("@idprovincia", nuevo.provincia.id);
                datos.SetearParametro("id",nuevo.id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion() ;
            }
        }
        public void eliminarFisica(Ciudad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("delete Ciudades where ID = @id");
                datos.SetearParametro("id", nuevo.id);
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

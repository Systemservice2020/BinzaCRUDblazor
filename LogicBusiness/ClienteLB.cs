using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Data;
using Entity_Business;

namespace LogicBusiness
{
    public class ClienteLB
    {
        public DataTable leerCliente(ClienteEB cli, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[1];
                paran[0] = new Parametros("@Nombre",cli.Nombre);
                DataTable dt = dataBD.obtenerDT("LeerCliente", paran,conex);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool nuevoCliente(ClienteEB cli, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[4];
                paran[0] = new Parametros("@Nombre", cli.Nombre);
                paran[1] = new Parametros("@Domicilio", cli.Domicilio);
                paran[2] = new Parametros("@CodigoPostal",cli.CodigoPostal);
                paran[3] = new Parametros("@Poblacion", cli.Poblacion);
                bool resul = dataBD.ejecutarQuery("CrearClientes", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool editarCliente(ClienteEB cli, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[5];
                paran[0] = new Parametros("@Nombre", cli.Nombre);
                paran[1] = new Parametros("@Domicilio", cli.Domicilio);
                paran[2] = new Parametros("@CodigoPostal", cli.CodigoPostal);
                paran[3] = new Parametros("@Poblacion", cli.Poblacion);
                paran[4] = new Parametros("@Id", cli.Id);
                bool resul = dataBD.ejecutarQuery("ActualizarClientes", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool eliminarCliente(ClienteEB cli, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[1];
                paran[0] = new Parametros("@Id", cli.Id);
                bool resul = dataBD.ejecutarQuery("EliminarClientes", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

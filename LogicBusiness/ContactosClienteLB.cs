using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entity_Business;
using DataAccess;

namespace LogicBusiness
{
    public class ContactosClienteLB
    {
        public DataTable leerContacto(ContactosClienteEB cc, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[1];
                paran[0] = new Parametros("@Telefono", cc.Telefono);
                DataTable dt = dataBD.obtenerDT("LeerContactosCliente", paran, conex);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool nuevoContacto(ContactosClienteEB cc, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[4];
                paran[0] = new Parametros("@ClienteId", cc.ClienId);
                paran[1] = new Parametros("@Nombre", cc.Nombre);
                paran[2] = new Parametros("@Telefono", cc.Telefono);
                paran[3] = new Parametros("@Email", cc.Email);
                bool resul = dataBD.ejecutarQuery("CrearContactos", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool editarContacto(ContactosClienteEB cc, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[5];
                paran[0] = new Parametros("@Id", cc.Id);
                paran[1] = new Parametros("@ClienteId", cc.ClienId);
                paran[2] = new Parametros("@Nombre", cc.Nombre);
                paran[3] = new Parametros("@Telefono", cc.Telefono);
                paran[4] = new Parametros("@Email", cc.Email);
                bool resul = dataBD.ejecutarQuery("ActualizarContactos", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool eliminarContacto(ContactosClienteEB cc, string conex)
        {
            try
            {
                ConexionBD dataBD = new ConexionBD();
                Parametros[] paran = new Parametros[1];
                paran[0] = new Parametros("@Id", cc.Id);
                bool resul = dataBD.ejecutarQuery("EliminarContactos", paran, conex);
                return resul;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

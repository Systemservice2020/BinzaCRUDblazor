using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entity_Business;
using System.Data.SqlClient;

namespace DataAccess
{
    public class ConexionBD
    {
        public DataTable obtenerDT(string stored, Parametros[] parametro, string connect)
        {
            return obtenerDTP(stored, parametro, connect);
        }
        public bool ejecutarQuery(string stored, Parametros[] parametro, string connect)
        {
            return ejecutarQueryP(stored, parametro, connect);
        }
        private static DataTable obtenerDTP(string stored, Parametros[] parametro, string connect)
        {
            using (SqlConnection connection = new SqlConnection(connect))
            {
                try
                {
                    SqlDataAdapter dap = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    DataTable dt = new DataTable();
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = stored;
                    if (parametro.Length>0)
                    {
                        for (int i = 0; i < parametro.Length-1; i++)
                        {
                            if (parametro[i].Valor.ToString() != "")
                            {
                                cmd.Parameters.AddWithValue(parametro[i].Nombre, parametro[i].Valor);
                            }
                        }
                    }
                    dap.SelectCommand = cmd;
                    dap.Fill(dt);
                    return dt;
                }
                catch (SqlException ex)
                {

                    throw ex;
                }
                finally
                {
                    connection.Close(); 
                }
            }
        }
        private static bool ejecutarQueryP(string stored, Parametros[] parametro, string connect)
        {
            bool resul = false;
            using (SqlConnection connection = new SqlConnection(connect))
            {
                try
                {
                    SqlDataAdapter dap = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    DataTable dt = new DataTable();
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = stored;
                    if (parametro.Length > 0)
                    {
                        for (int i = 0; i < parametro.Length; i++)
                        {
                            if (parametro[i].Valor.ToString() != "")
                            {
                                cmd.Parameters.AddWithValue(parametro[i].Nombre, parametro[i].Valor);
                            }
                        }
                    }
                    dap.SelectCommand = cmd;
                    dap.Fill(dt);
                    resul = true;
                    return resul;
                }
                catch (SqlException ex)
                {

                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }

        }
    }
}

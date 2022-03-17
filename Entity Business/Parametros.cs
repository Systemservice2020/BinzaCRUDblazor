using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Business
{
    [Serializable]
    public class Parametros
    {
        private string _nombre;
        private object _valor;
        private ParameterDirection _direccion;

        public Parametros()
        {
            _nombre = "";
            _valor = null;
            _direccion = ParameterDirection.Input;
        }
        public Parametros(string Nombre, object Valor, ParameterDirection Direccion)
        {
            _nombre = Nombre;
            _valor = Valor;
            _direccion = Direccion;
        }
        public Parametros(string Nombre, object Valor)
        {
            _nombre = Nombre;
            _valor = Valor;
            _direccion = ParameterDirection.Input;
        }
        public string Nombre { get => _nombre; set => _nombre = value; }
        public object Valor { get => _valor; set => _valor = value; }
        public ParameterDirection Direccion { get => _direccion; set => _direccion = value; }
    }
}

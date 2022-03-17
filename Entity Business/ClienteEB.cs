using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Business
{
    public class ClienteEB
    {
        private int id;
        private string nombre;
        private string domicilio;
        private string codigoPostal;
        private string poblacion;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Domicilio { get => domicilio; set => domicilio = value; }
        public string CodigoPostal { get => codigoPostal; set => codigoPostal = value; }
        public string Poblacion { get => poblacion; set => poblacion = value; }
    }
}

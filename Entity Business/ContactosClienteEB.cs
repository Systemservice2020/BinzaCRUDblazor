using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Business
{
    public class ContactosClienteEB
    {
        private int id;
        private int clienId;
        private string nombre;
        private string telefono;
        private string email;
        public int Id { get => id; set => id = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Email { get => email; set => email = value; }
        public int ClienId { get => clienId; set => clienId = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}

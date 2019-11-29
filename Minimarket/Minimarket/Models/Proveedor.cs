using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Minimarket.Models
{
    public class Proveedor
    {
        public int Codigo { get; set; }
        public string RUC { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
    }
}
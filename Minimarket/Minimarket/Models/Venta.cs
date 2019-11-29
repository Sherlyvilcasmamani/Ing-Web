using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Minimarket.Models
{
    public class Venta
    {
        public int Codigo { get; set; }
        public Cliente CodigoCliente { get; set; }
        public DateTime FechaVenta { get; set; }
        public double Total { get; set; }

    }
}
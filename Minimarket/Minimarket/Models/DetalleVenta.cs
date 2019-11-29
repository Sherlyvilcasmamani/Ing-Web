using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Minimarket.Models
{
    public class DetalleVenta
    {
        public Venta CodigoVenta { get; set; }
        public Producto CodigoProducto { get; set; }
        public double PrecioUnidad { get; set; }
        public int Cantidad { get; set; }
        public decimal Descuento { get; set; }

    }
}
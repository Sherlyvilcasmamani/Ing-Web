//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Minimarket
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblVenta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblVenta()
        {
            this.tblDetalleVenta = new HashSet<tblDetalleVenta>();
        }
    
        public int Codigo { get; set; }
        public Nullable<int> CodigoCliente { get; set; }
        public Nullable<System.DateTime> FechaVenta { get; set; }
        public Nullable<decimal> Total { get; set; }
    
        public virtual tblCliente tblCliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblDetalleVenta> tblDetalleVenta { get; set; }
    }
}

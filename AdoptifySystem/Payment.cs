//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdoptifySystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Payment()
        {
            this.Adoptions = new HashSet<Adoption>();
            this.Customer_Event = new HashSet<Customer_Event>();
        }
    
        public int Payment_ID { get; set; }
        public string Payment_Description { get; set; }
        public Nullable<decimal> Amount_Paid { get; set; }
        public Nullable<System.DateTime> Payment_Date { get; set; }
        public Nullable<int> Payment_Type_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Adoption> Adoptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Customer_Event> Customer_Event { get; set; }
        public virtual Payment_Type Payment_Type { get; set; }
    }
}

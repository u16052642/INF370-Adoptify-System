//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdoptifySystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kennel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kennel()
        {
            this.Animal_Kennel_History = new HashSet<Animal_Kennel_History>();
            this.Emp_Kennel = new HashSet<Emp_Kennel>();
        }
    
        public int Kennel_ID { get; set; }
        public string Kennel_Name { get; set; }
        public Nullable<int> Kennel_Number { get; set; }
        public Nullable<int> Kennel_Capacity { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Animal_Kennel_History> Animal_Kennel_History { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emp_Kennel> Emp_Kennel { get; set; }
    }
}

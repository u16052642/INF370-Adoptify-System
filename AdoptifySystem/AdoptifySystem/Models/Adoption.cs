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
    
    public partial class Adoption
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Adoption()
        {
            this.HomeChecks = new HashSet<HomeCheck>();
        }
    
        public int Adoption_ID { get; set; }
        public Nullable<System.DateTime> Adoption_Date { get; set; }
        public string Adoption_Form { get; set; }
        public Nullable<int> Payment_ID { get; set; }
        public Nullable<int> Adopter_ID { get; set; }
        public Nullable<int> Adopt_Status_ID { get; set; }
        public Nullable<int> Animal_ID { get; set; }
        public Nullable<System.DateTime> Collection_Date { get; set; }
    
        public virtual Adopter Adopter { get; set; }
        public virtual Animal Animal { get; set; }
        public virtual Payment Payment { get; set; }
        public virtual Adoption_Status Adoption_Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HomeCheck> HomeChecks { get; set; }
    }
}

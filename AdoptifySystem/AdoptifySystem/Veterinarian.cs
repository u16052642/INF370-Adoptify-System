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
    using System.ComponentModel.DataAnnotations;

    public partial class Veterinarian
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Veterinarian()
        {
            this.Vet_Appointment = new HashSet<Vet_Appointment>();
        }
    
        public int Vet_ID { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        public string Vet_Name { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        public string Vet_Emial { get; set; }
        public string Vet_Tel { get; set; }
        public string Vet_Address { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Vet_Appointment> Vet_Appointment { get; set; }
    }
}

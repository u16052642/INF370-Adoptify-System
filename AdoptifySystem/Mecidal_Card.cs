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
    
    public partial class Mecidal_Card
    {
        public int Id { get; set; }
        public int Animal_ID { get; set; }
        public int Vet_Appointment_ID { get; set; }
        public string Diagnosis_Details { get; set; }
        public Nullable<System.DateTime> Arrival_from_Vet { get; set; }
        public Nullable<System.DateTime> Next_Appointment_Date_ { get; set; }
        public string MedicalCard { get; set; }
        public Nullable<bool> Animal_Treatment { get; set; }
    
        public virtual Animal Animal { get; set; }
        public virtual Vet_Appointment Vet_Appointment { get; set; }
    }
}
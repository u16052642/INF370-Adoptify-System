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
    
    public partial class Animal_Treatment
    {
        public int Treat_ID { get; set; }
        public Nullable<System.DateTime> Treat_StartDate { get; set; }
        public Nullable<System.DateTime> Treat_EndDate { get; set; }
        public Nullable<int> Treat_Quantity { get; set; }
        public string Treat_Regularity { get; set; }
        public string Treat_Name { get; set; }
        public Nullable<decimal> Treat_cost { get; set; }
        public Nullable<int> Capture_Medical_Card_ID { get; set; }
    
        public virtual Capture_Medical_Card Capture_Medical_Card { get; set; }
    }
}

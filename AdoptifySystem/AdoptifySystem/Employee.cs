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
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.Emp_Kennel = new HashSet<Emp_Kennel>();
            this.TimeSheets = new HashSet<TimeSheet>();
            this.User_ = new HashSet<User_>();
        }
    
        public int Emp_ID { get; set; }
        public string Emp_Name { get; set; }
        public string Emp_Surname { get; set; }
        public string Emp_ContactNumber { get; set; }
        public string Emp_IDNumber { get; set; }
        public string Emp_Email { get; set; }
        public string Emp_Contract { get; set; }
        public Nullable<System.DateTime> Emp_Date_Employed { get; set; }
        public Nullable<int> Title_ID { get; set; }
        public Nullable<int> Emp_Type_ID { get; set; }
        public Nullable<int> Employee_Status_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emp_Kennel> Emp_Kennel { get; set; }
        public virtual Title Title { get; set; }
        public virtual Employee_Type Employee_Type { get; set; }
        public virtual Employee_Status Employee_Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeSheet> TimeSheets { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User_> User_ { get; set; }
    }
}
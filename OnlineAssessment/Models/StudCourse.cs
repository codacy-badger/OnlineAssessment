//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineAssessment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudCourse
    {
        public string CourseID { get; set; }
        public string StudID { get; set; }
        public string Sem { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual Student Student { get; set; }
    }
}
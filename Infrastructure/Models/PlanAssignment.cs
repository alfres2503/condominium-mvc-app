//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    [MetadataType(typeof(PlanAssignmentMetadata))]
    public partial class PlanAssignment
    {
        public int IDAssignment { get; set; }
        public int IDPlan { get; set; }
        public int IDResidence { get; set; }
        public System.DateTime AssignmentDate { get; set; }
        public bool PayedStatus { get; set; }
        public decimal Amount { get; set; }
        public string Description => $"{AssignmentDate.ToString("MMMM")} {AssignmentDate.Year} - ${Amount.ToString("0.00")}";

        public virtual PaymentPlan PaymentPlan { get; set; }
        public virtual Residence Residence { get; set; }
    }
}

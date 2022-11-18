using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PropertyRentalManagementWebSite.Models
{
    public partial class Appointment
    {
        [Key]
        public int AppointmentId { get; set; }
        [BindProperty, DataType(DataType.Date)]
        public DateTime Date { get; set; }
        public TimeSpan TimeStart { get; set; }
        public TimeSpan TimeEnd { get; set; }
        public string? Information { get; set; }
        public string ReceiverEmail { get; set; }
        public string SenderEmail { get; set; }
    }
}

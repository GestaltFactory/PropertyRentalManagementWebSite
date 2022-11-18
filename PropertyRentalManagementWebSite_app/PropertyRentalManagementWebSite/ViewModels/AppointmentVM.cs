using Microsoft.AspNetCore.Builder.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class AppointmentVM
    {
        public List<Appointment> Appointments { get; set; }
        public Appointment Appointment { get; set; }       
        public Account Account { get; set; }
        public List<Account> Accounts { get; set; }
    }
}

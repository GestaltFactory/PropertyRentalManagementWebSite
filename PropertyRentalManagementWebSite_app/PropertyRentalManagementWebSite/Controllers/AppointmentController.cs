using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;
using PropertyRentalManagementWebSite.Repository;
using PropertyRentalManagementWebSite.ViewModels;
using System.Net.Mail;
using System.Security.Claims;

namespace PropertyRentalManagementWebSite.Controllers
{
    public class AppointmentController : Controller
    {
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IAppointmentRepository _appointmentRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AppointmentController(PropertyRentalManagement_DBContext context, IAppointmentRepository appointmentRepositor, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _appointmentRepository = appointmentRepositor;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> Index()
        {
            var userAccounts = await  _appointmentRepository.GetAllUserAccount();
            var userAppointments = await _appointmentRepository.GetAllUserAppointments();
            var appointmentVM = new AppointmentVM()
            {
                Accounts = userAccounts,
                Appointments = userAppointments
            };

            List<string> users = new List<string>();
            foreach (var fname in appointmentVM.Accounts)
            {
                users.Add(fname.FirstName + " " + fname.LastName + " - " + fname.Email);
            }

            ViewBag.Users = users;

            return View(appointmentVM);
        }

        public IActionResult Check(string button)
        {         
            if (!string.IsNullOrEmpty(button))
            {
                TempData["ButtonValue"] = "Your appointment is the " + string.Format("{0} of this month.", button);
            }
            else
            {
                TempData["ButtonValue"] = "";
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> MakeAppointment(AppointmentVM appointmentVM)
        {
            var curUserId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var user = await _appointmentRepository.GetUserByEmail(curUserId);

            if (user == null)
            {
                return View("Error");
            }

            // need to find how to return the view using temodata and the other fields...
            var appointment = new Appointment()
            {
                Date = appointmentVM.Appointment.Date,
                TimeStart = appointmentVM.Appointment.TimeStart,
                TimeEnd = appointmentVM.Appointment.TimeEnd,
                Information = appointmentVM.Appointment.Information,
                SenderEmail = user.Email,
                ReceiverEmail = appointmentVM.Account.Email,
            };

            _appointmentRepository.Add(appointment);
            return RedirectToAction("Index");
        }
    }
}





using Microsoft.EntityFrameworkCore;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Repository
{
    public class AppointmentRepository : IAppointmentRepository
    {
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AppointmentRepository(PropertyRentalManagement_DBContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<List<Account>> GetAllUserAccount()
        {
            var userAccounts = _context.Accounts;
            return await userAccounts.ToListAsync();
        }

        public async Task<List<Appointment>> GetAllUserAppointments()
        {
           var userAppointments = _context.Appointments;
            return await userAppointments.ToListAsync();
        }

        public async Task<Account> GetUserById(string id)
        {
            return await _context.Users.FindAsync(id);
        }

        public async Task<Account> GetUserByEmail(string email)
        {
            return await _context.Users.FindAsync(email);
        }

        public bool Add(Appointment appointment)
        {
            _context.Add(appointment);
            return Save();
        }

        public bool Save()
        {
            int saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }
    }
}

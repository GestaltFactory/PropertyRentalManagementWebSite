using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Interfaces
{
    public interface IAppointmentRepository
    {
        Task<List<Account>> GetAllUserAccount();
        Task<List<Appointment>> GetAllUserAppointments();
        Task<Account> GetUserById(string id);
        Task<Account> GetUserByEmail(string email);
        bool Add(Appointment appointment);
        bool Save();
    }
}

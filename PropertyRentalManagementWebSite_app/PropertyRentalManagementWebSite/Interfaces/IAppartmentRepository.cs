using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Interfaces
{
    public interface IAppartmentRepository
    {
        Task<IEnumerable<Appartment>> GetAll();
        Task<IEnumerable<Appartment>> GetAllPerBuildingIdAsync(int id);
        Task<IEnumerable<Appartment>> GetAllFreeUnitsAsync();
        Task<IEnumerable<Appartment>> GetAllFreeUnitsPerBuildingIdAsync(int id);
        Task<Appartment> GetByIdAsync(int id);
        Task<Appartment> GetByIdAsyncNoTracking(int id);
        Task<IEnumerable<Appartment>> GetAvailability(string rentedStatus);
        bool Add(Appartment appartment);
        bool Update(Appartment appartment);
        bool Delete(Appartment appartment);
        bool Save();
    }
}

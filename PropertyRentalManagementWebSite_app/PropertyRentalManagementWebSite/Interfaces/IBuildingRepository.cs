using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Interfaces
{
    public interface IBuildingRepository
    {
        Task<IEnumerable<Building>> GetAll();
        Task<Building> GetByIdAsync(int id);
        Task<Building> GetByIdAsyncNoTracking(int id);
        Task<IEnumerable<Building>> GetBuildingByCity(string city);
        bool Add(Building building);
        bool Update(Building building);
        bool Delete(Building building);
        bool Save();
    }
}

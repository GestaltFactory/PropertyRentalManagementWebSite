using Microsoft.EntityFrameworkCore;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Repository
{
    public class BuildingRepository : IBuildingRepository
    {
        private readonly PropertyRentalManagement_DBContext _context;

        public BuildingRepository(PropertyRentalManagement_DBContext context)
        {
            _context = context;
        }
        
        public bool Add(Building building)
        {
            _context.Add(building);
            return Save();
        }

        public bool Delete(Building building)
        {
            _context.Remove(building);
            return Save();
        }

        public async Task<IEnumerable<Building>> GetAll()
        {
            return await _context.Buildings.Include(a => a.Address).ToListAsync();
        }

        public async Task<Building> GetByIdAsync(int id)
        {
            return await _context.Buildings.Include(a => a.Address).Where(b => b.BuildingId == id).FirstOrDefaultAsync();
        }

        public async Task<Building> GetByIdAsyncNoTracking(int id)
        {
            return await _context.Buildings.Include(a => a.Address).Where(b => b.BuildingId == id).AsNoTracking().FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<Building>> GetBuildingByCity(string city)
        {
            return await _context.Buildings.Include(a => a.Address).Where(c => c.Address.City.Contains(city)).ToListAsync();
        }

        public bool Save()
        {
            int saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }

        public bool Update(Building building)
        {
            _context.Update(building);
            return Save();
        }
    }
}

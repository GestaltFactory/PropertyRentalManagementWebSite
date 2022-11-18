using Microsoft.EntityFrameworkCore;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Repository
{
    public class AppartmentRepository : IAppartmentRepository
    {
        private readonly PropertyRentalManagement_DBContext _context;

        public AppartmentRepository(PropertyRentalManagement_DBContext context)
        {
            _context = context;
        }

        public bool Add(Appartment appartment)
        {
            _context.Add(appartment);
            return Save();
        }

        public bool Delete(Appartment appartment)
        {
            _context.Remove(appartment);
            return Save();
        }

        public async Task<IEnumerable<Appartment>> GetAll()
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).ToListAsync();
        }

        public async Task<IEnumerable<Appartment>> GetAllPerBuildingIdAsync(int id)
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).Where(b => b.BuildingId == id).ToListAsync();
        }

        public async Task<IEnumerable<Appartment>> GetAllFreeUnitsAsync()
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).Where(b => b.RentedStatus == "Available").ToListAsync();
        }

        public async Task<IEnumerable<Appartment>> GetAllFreeUnitsPerBuildingIdAsync(int id)
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).Where(b => b.BuildingId == id && b.RentedStatus == "Available").ToListAsync();
        }

        public async Task<Appartment> GetByIdAsync(int id)
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).FirstOrDefaultAsync();
        }

        public async Task<Appartment> GetByIdAsyncNoTracking(int id)
        {
            return await _context.Appartments.Include(b => b.Building).ThenInclude(a => a.Address).AsNoTracking().FirstOrDefaultAsync(i => i.AppartmentNumber == id);
        }

        public async Task<IEnumerable<Appartment>> GetAvailability(string rentedStatus)
        {
            return await _context.Appartments.Where(a => a.RentedStatus == rentedStatus).ToListAsync();
        }

        public bool Save()
        {
            int saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }

        public bool Update(Appartment appartment)
        {
            _context.Update(appartment);
            return Save();
        }
    }
}

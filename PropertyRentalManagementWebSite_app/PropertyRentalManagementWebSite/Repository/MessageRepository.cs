using Microsoft.EntityFrameworkCore;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Repository
{
    public class MessageRepository : IMessageRepository
    {
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public MessageRepository(PropertyRentalManagement_DBContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        public bool Add(Message message)
        {
            _context.Add(message);
            return Save();
        }

        public async Task<List<Message>> GetAllMessages()
        {
            var userMessages = _context.Messages;
            return await userMessages.ToListAsync();
        }

        public async Task<List<Account>> GetAllUserAccount()
        {
            var userAccounts = _context.Accounts;
            return await userAccounts.ToListAsync();
        }

        public async Task<Account> GetUserByEmail(string email)
        {
            return await _context.Users.FindAsync(email);
        }

        public bool Save()
        {
            int saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }
    }
}

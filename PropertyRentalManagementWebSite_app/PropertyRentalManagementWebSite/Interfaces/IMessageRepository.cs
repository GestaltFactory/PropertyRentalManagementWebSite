using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Interfaces
{
    public interface IMessageRepository
    {
        Task<List<Account>> GetAllUserAccount();
        Task<Account> GetUserByEmail(string email);
        Task<List<Message>> GetAllMessages();
        bool Add(Message message);
        bool Save();
    }
}

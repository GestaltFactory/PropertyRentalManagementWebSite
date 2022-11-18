using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class ComposeMessageVM
    {
        public string DestinationEmail { get; set; } = null!;
        public string SenderEmail { get; set; } = null!;
        public string SubjectTitle { get; set; } = null!;
        public string MessageContent { get; set; } = null!;
        public List<Account> Accounts { get; set; }
        public List<Message> Messages { get; set; }
    }
}

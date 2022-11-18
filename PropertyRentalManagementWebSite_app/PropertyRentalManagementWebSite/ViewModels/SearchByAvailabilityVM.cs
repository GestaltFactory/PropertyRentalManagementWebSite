using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class SearchByAvailabilityVM
    {
        public string RentedStatus { get; set; }
        public IEnumerable<Appartment> Appartment { get; set; }
    }
}

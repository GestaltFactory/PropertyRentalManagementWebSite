using PropertyRentalManagementWebSite.Models;
using System.ComponentModel.DataAnnotations.Schema;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class SearchByCityVM
    {
        public string City { get; set; }
        public IEnumerable<Building> Buildings { get; set; }
    }
}

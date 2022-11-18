using PropertyRentalManagementWebSite.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class CreateBuildingVM
    {
        [Display(Name = "Building Name")]
        [Required(ErrorMessage = "Building Name is required")]
        public string BuildingName { get; set; }
        [Display(Name = "Building Description")]
        [Required(ErrorMessage = "Building Description is required")]
        public string BuildingDescription { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        [Display(Name = "Total number of units available")]
        [Required(ErrorMessage = "This field is required")]
        public int TotalNumberOfUnits { get; set; }
        public int NumberOfUnitAvailable { get; set; }
        [Display(Name = "Parking included")]
        [Required(ErrorMessage = "Parking  is required")]
        public string ParkingIncluded { get; set; } = null!;
        [Display(Name = "Laundry Service included")]
        [Required(ErrorMessage = "Laundry Service  is required")]
        public string LaundryServiceIncluded { get; set; } = null!;
        [Display(Name = "Select a picture...")]
        [Required(ErrorMessage = "A picture  is required")]
        public IFormFile PictureUrl { get; set; }
    }
}

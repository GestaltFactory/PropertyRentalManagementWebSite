using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.ViewModels
{
    public class EditBuildingVM
    {
        public int BuildingId { get; set; }
        public string BuildingName { get; set; }
        public string BuildingDescription { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        public int TotalNumberOfUnits { get; set; }
        public int NumberOfUnitAvailable { get; set; }
        public string ParkingIncluded { get; set; } = null!;
        public string LaundryServiceIncluded { get; set; } = null!;
        public IFormFile PictureUrl { get; set; }
        public string? URL { get; set; }
    }
}

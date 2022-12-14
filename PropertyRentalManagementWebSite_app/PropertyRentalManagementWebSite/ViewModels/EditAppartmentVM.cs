namespace PropertyRentalManagementWebSite.ViewModels
{
    public class EditAppartmentVM
    {
        public int AppartmentNumber { get; set; }
        public int BuildingId { get; set; }
        public int NumberOfPieces { get; set; }
        public double PricePerMonth { get; set; }
        public string RentedStatus { get; set; } = "Available";
        public DateTime? RentalStartDate { get; set; } = DateTime.Now;
        public DateTime? RentalEndDate { get; set; } = DateTime.Now;
        public IFormFile PictureUrl { get; set; }
        public string? URL { get; set; }
    }
}

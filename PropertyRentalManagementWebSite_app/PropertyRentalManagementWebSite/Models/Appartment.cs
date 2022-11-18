using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace PropertyRentalManagementWebSite.Models
{
    public class Appartment
    {
        [Key]
        public int AppartmentNumber { get; set; }
        public int BuildingId { get; set; }
        public int NumberOfPieces { get; set; }
        public double PricePerMonth { get; set; }
        public string RentedStatus { get; set; } = null!;
        public DateTime? RentalStartDate { get; set; } = DateTime.Now;
        public DateTime? RentalEndDate { get; set; } = DateTime.Now;
        public string? PictureUrl { get; set; }
        public Building Building { get; set; } = null!;
    }
}

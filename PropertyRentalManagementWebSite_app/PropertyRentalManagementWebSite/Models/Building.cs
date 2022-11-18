using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PropertyRentalManagementWebSite.Models
{
    public partial class Building
    {
        public Building()
        {
            Appartments = new HashSet<Appartment>();
        }

        [Key]
        public int BuildingId { get; set; }
        [ForeignKey("Address")]
        public int? AddressId { get; set; }
        public Address? Address { get; set; }
        public string BuildingName { get; set; }
        public string BuildingDescription { get; set; }
        public int TotalNumberOfUnits { get; set; }
        public int NumberOfUnitAvailable { get; set; }
        public string ParkingIncluded { get; set; } = null!;
        public string LaundryServiceIncluded { get; set; } = null!;
        public string? PictureUrl { get; set; }
        public virtual ICollection<Appartment> Appartments { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace PropertyRentalManagementWebSite.Models
{
    public partial class Address
    {
        public Address()
        {
            Buildings = new HashSet<Building>();
        }

        public int AddressId { get; set; }
        public int StreetNumber { get; set; }
        public string StreetName { get; set; } = null!;
        public int? AppartmentNumber { get; set; }
        public string City { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string PostalCode { get; set; } = null!;

        public virtual ICollection<Building> Buildings { get; set; }
    }
}

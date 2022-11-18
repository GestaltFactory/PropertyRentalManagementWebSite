using System.ComponentModel.DataAnnotations;

namespace PropertyRentalManagementWebSite.Data.Enum
{
    public enum RentedStatus
    {
        [Display(Name = "Available")]
        Available,
        [Display(Name = "Unavailable")]
        Unavailable
    }
}

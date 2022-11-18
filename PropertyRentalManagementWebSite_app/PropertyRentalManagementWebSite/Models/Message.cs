using System;
using System.Collections.Generic;

namespace PropertyRentalManagementWebSite.Models
{
    public partial class Message
    {
        public int MessageId { get; set; }
        public string DestinationEmail { get; set; } = null!;
        public string SenderEmail { get; set; } = null!;
        public string SubjectTitle { get; set; } = null!;
        public string MessageContent { get; set; } = null!;
    }
}

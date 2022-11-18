using Microsoft.AspNetCore.Mvc;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;
using PropertyRentalManagementWebSite.Repository;
using PropertyRentalManagementWebSite.ViewModels;
using System.Security.Claims;

namespace PropertyRentalManagementWebSite.Controllers
{
    public class MessageController : Controller
    {
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IMessageRepository _messageRepository;
        private readonly ICloudPhotoService _cloudPhotoService;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public MessageController(PropertyRentalManagement_DBContext context, IMessageRepository messageRepository, ICloudPhotoService cloudPhotoService, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _messageRepository = messageRepository;
            _cloudPhotoService = cloudPhotoService;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> Index()
        {
            var userAccounts = await _messageRepository.GetAllUserAccount();
            var userMessages = await _messageRepository.GetAllMessages();
            var composeMessageVM = new ComposeMessageVM()
            {
                Accounts = userAccounts,
                Messages = userMessages 
            };
           
            return View(composeMessageVM);
        }

        [HttpPost]
        public async Task<IActionResult> SendMessage(ComposeMessageVM commVM)
        {
            var curUserId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var user = await _messageRepository.GetUserByEmail(curUserId);

            if (user == null)
            {
                return View("Error");
            }

            var message = new Message()
            {
                DestinationEmail = commVM.DestinationEmail,
                SubjectTitle = commVM.SubjectTitle,
                SenderEmail = user.Email,
                MessageContent = commVM.MessageContent,
            };

            _messageRepository.Add(message);
            return RedirectToAction("Index");
        }


    }
}

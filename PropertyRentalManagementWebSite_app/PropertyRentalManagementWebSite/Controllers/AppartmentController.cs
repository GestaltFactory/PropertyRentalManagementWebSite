using Microsoft.AspNetCore.Mvc;
using PropertyRentalManagementWebSite.Data.Enum;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;
using PropertyRentalManagementWebSite.Repository;
using PropertyRentalManagementWebSite.ViewModels;
using System.Security.Claims;

namespace PropertyRentalManagementWebSite.Controllers
{
    public class AppartmentController : Controller
    {
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IAppartmentRepository _appartmentRepository;
        private readonly ICloudPhotoService _cloudPhotoService;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AppartmentController(PropertyRentalManagement_DBContext context, IAppartmentRepository appartmentRepository, ICloudPhotoService cloudPhotoService, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _appartmentRepository = appartmentRepository;
            _cloudPhotoService = cloudPhotoService;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Appartment> appartments = await _appartmentRepository.GetAll();
            foreach (var item in appartments)
            {
                if (item.RentedStatus == "0")
                {
                    item.RentedStatus = "Available";
                }
                else
                {
                    item.RentedStatus = "Unavailable";
                }
            }
            return View(appartments);
        }

        public async Task<IActionResult> Detail(int id)
        {
            Appartment appartment = await _appartmentRepository.GetByIdAsync(id);
            if (appartment.RentedStatus == "0")
            {
                appartment.RentedStatus = "Available";
            }
            else
            {
                appartment.RentedStatus = "Unavailable";
            }
            return View(appartment);
        }

        public async Task<IActionResult> SearchByAvailability()
        {
            IEnumerable<Appartment> appartment = await _appartmentRepository.GetAll();

            SearchByAvailabilityVM search = new SearchByAvailabilityVM()
            {
                Appartment = appartment
            };

            return View(search);
        }

        [HttpPost]
        public async Task<IActionResult> Check(string button)
        {
           // because of a migration error, my enum that were passed correctly as strings before became numbers and this search seems to have broken because of that. It was working before the migration...
            
            
            if (!string.IsNullOrEmpty(button))
            {
                TempData["ButtonValue"] = string.Format("{0}", button);
            }
            else
            {
                TempData["ButtonValue"] = "";
            }

            IEnumerable<Appartment> searchAvailability = await _appartmentRepository.GetAvailability(TempData["ButtonValue"].ToString());

            SearchByAvailabilityVM search = new SearchByAvailabilityVM()
            {
                Appartment = searchAvailability
            };

            return View("SearchByAvailability", search);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateAppartmentVM createAppartmentVM)
        {
            if (ModelState.IsValid)
            {
                var result = await _cloudPhotoService.AddPhotoAsync(createAppartmentVM.PictureUrl);

                var appartment = new Appartment
                {
                    AppartmentNumber = createAppartmentVM.AppartmentNumber,
                    BuildingId = createAppartmentVM.BuildingId,
                    PictureUrl = result.Url.ToString(),
                    NumberOfPieces = createAppartmentVM.NumberOfPieces,
                    PricePerMonth = createAppartmentVM.PricePerMonth,
                    RentedStatus = RentedStatus.Available.ToString(),
                    RentalStartDate = null,
                    RentalEndDate = null
                };

                _appartmentRepository.Add(appartment);
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "Photo upload failed");
            }

            return View(createAppartmentVM);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var appartment = await _appartmentRepository.GetByIdAsync(id);
            if (appartment == null)
            {
                return View("Error");
            }

            var editAppartmentVM = new EditAppartmentVM
            {
                AppartmentNumber = appartment.AppartmentNumber,
                BuildingId = appartment.BuildingId,
                URL = appartment.PictureUrl,
                NumberOfPieces = appartment.NumberOfPieces,
                PricePerMonth = appartment.PricePerMonth,
                RentedStatus = appartment.RentedStatus,
                RentalStartDate = appartment.RentalStartDate,
                RentalEndDate = appartment.RentalEndDate
            };

            return View(editAppartmentVM);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, EditAppartmentVM editAppartmentVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Failed to edit building");
                return View("Edit", editAppartmentVM);
            }

            var editAppartment = await _appartmentRepository.GetByIdAsyncNoTracking(id);
            if (editAppartment != null)
            {
                try
                {
                    await _cloudPhotoService.DeletePhotoAsync(editAppartment.PictureUrl);
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Could not delete photo");
                    return View(editAppartmentVM);
                }


                var photoResult = await _cloudPhotoService.AddPhotoAsync(editAppartmentVM.PictureUrl);
                Appartment appartment = new Appartment
                {
                    AppartmentNumber = editAppartmentVM.AppartmentNumber,
                    BuildingId = editAppartmentVM.BuildingId,
                    PictureUrl = photoResult.Url.ToString(),
                    NumberOfPieces = editAppartmentVM.NumberOfPieces,
                    PricePerMonth = editAppartmentVM.PricePerMonth,
                    RentedStatus = editAppartmentVM.RentedStatus,
                    RentalStartDate = editAppartmentVM.RentalStartDate,
                    RentalEndDate = editAppartmentVM.RentalEndDate
                };

                _appartmentRepository.Update(appartment);
                return RedirectToAction("Index");
            }
            else
            {
                return View(editAppartmentVM);
            }
        }

        public async Task<IActionResult> Delete(int id)
        {
            var appartment = await _appartmentRepository.GetByIdAsync(id);
            if (appartment == null)
            {
                return View("Error");
            }

            return View(appartment);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteAppartment(int id)
        {
            var appartment = await _appartmentRepository.GetByIdAsyncNoTracking(id);
            if (appartment == null)
            {
                return View("Error");
            }

            if (appartment.RentedStatus == RentedStatus.Unavailable.ToString())
            {
                ModelState.AddModelError("", "You cannot delete an appartment presently rented");
                return View("Error");
            }
            else
            {
                _appartmentRepository.Delete(appartment);
                return RedirectToAction("Index");
            }
        }       
    }
}

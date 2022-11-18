using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PropertyRentalManagementWebSite.Data;
using PropertyRentalManagementWebSite.Interfaces;
using PropertyRentalManagementWebSite.Models;
using PropertyRentalManagementWebSite.ViewModels;
using System.Security.Claims;

namespace PropertyRentalManagementWebSite.Controllers
{
    public class BuildingController : Controller
    {
        private readonly IBuildingRepository _buildingRepository;
        private readonly ICloudPhotoService _cloudPhotoService;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public BuildingController(IBuildingRepository buildingRepository, ICloudPhotoService cloudPhotoService, IHttpContextAccessor httpContextAccessor)
        {
            _buildingRepository = buildingRepository;
            _cloudPhotoService = cloudPhotoService;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Building> buildings = await _buildingRepository.GetAll();
            foreach (var item in buildings)
            {
                if (item.ParkingIncluded == "0")
                {
                    item.ParkingIncluded = "Yes";
                }
                else
                {
                    item.ParkingIncluded = "No";
                }

                if (item.LaundryServiceIncluded == "0")
                {
                    item.LaundryServiceIncluded = "Yes";
                }
                else
                {
                    item.LaundryServiceIncluded = "No";
                }
            }
            return View(buildings);
        }

        public async Task<IActionResult> Detail(int id)
        {
            Building building = await _buildingRepository.GetByIdAsync(id);
            if (building.ParkingIncluded == "0")
            {
                building.ParkingIncluded = "Yes";
            }
            else
            {
                building.ParkingIncluded = "No";
            }

            if (building.LaundryServiceIncluded == "0")
            {
                building.LaundryServiceIncluded = "Yes";
            }
            else
            {
                building.LaundryServiceIncluded = "No";
            }

            return View(building);
        }

        public async Task<IActionResult> SearchByCity()
        {
            IEnumerable<Building> buildings = await _buildingRepository.GetAll();

            SearchByCityVM search = new SearchByCityVM()
            {
                Buildings = buildings
            };

            return View(search);
        }

        [HttpPost]
        public async Task<IActionResult> Check(string button)
        {
            if (!string.IsNullOrEmpty(button))
            {
                TempData["ButtonValue"] = string.Format("{0}", button);
            }
            else
            {
                TempData["ButtonValue"] = "";
            }

            IEnumerable<Building> searchCity = await _buildingRepository.GetBuildingByCity(TempData["ButtonValue"].ToString());

            SearchByCityVM search = new SearchByCityVM()
            {
                Buildings = searchCity
            };

            return View("SearchByCity", search);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateBuildingVM createBuildingVM)
        {
            if (ModelState.IsValid)
            {
                var result = await _cloudPhotoService.AddPhotoAsync(createBuildingVM.PictureUrl);
                var building = new Building
                {
                    BuildingName = createBuildingVM.BuildingName,
                    BuildingDescription = createBuildingVM.BuildingDescription,
                    PictureUrl = result.Url.ToString(),
                    TotalNumberOfUnits = createBuildingVM.TotalNumberOfUnits,
                    NumberOfUnitAvailable = createBuildingVM.TotalNumberOfUnits,
                    ParkingIncluded = createBuildingVM.ParkingIncluded,
                    LaundryServiceIncluded = createBuildingVM.LaundryServiceIncluded,

                    Address = new Address
                    {
                        StreetNumber = createBuildingVM.Address.StreetNumber,
                        StreetName = createBuildingVM.Address.StreetName,
                        City = createBuildingVM.Address.City,
                        Province = createBuildingVM.Address.Province,
                        PostalCode = createBuildingVM.Address.PostalCode,
                    }
                };

                _buildingRepository.Add(building);
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "Photo upload failed");
            }

            return View(createBuildingVM);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var building = await _buildingRepository.GetByIdAsync(id);
            if (building == null)
            {
                return View("Error");
            }

            var editBuildingVM = new EditBuildingVM
            {
                BuildingName = building.BuildingName,
                BuildingDescription = building.BuildingDescription,
                URL = building.PictureUrl,
                TotalNumberOfUnits = building.TotalNumberOfUnits,
                NumberOfUnitAvailable = building.NumberOfUnitAvailable,
                ParkingIncluded = building.ParkingIncluded,
                LaundryServiceIncluded = building.LaundryServiceIncluded,
                Address = new Address
                {
                    StreetNumber = building.Address.StreetNumber,
                    StreetName = building.Address.StreetName,
                    City = building.Address.City,
                    Province = building.Address.Province,
                    PostalCode = building.Address.PostalCode,
                }
            };

            return View(editBuildingVM);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, EditBuildingVM editBuildingVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Failed to edit building");
                return View("Edit", editBuildingVM);
            }

            var editBuilding = await _buildingRepository.GetByIdAsyncNoTracking(id);
            if (editBuilding != null)
            {
                try
                {
                    await _cloudPhotoService.DeletePhotoAsync(editBuilding.PictureUrl);
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Could not delete photo");
                    return View(editBuildingVM);
                }


                var photoResult = await _cloudPhotoService.AddPhotoAsync(editBuildingVM.PictureUrl);
                Building building = new Building
                {
                    BuildingId = id,
                    BuildingName = editBuildingVM.BuildingName,
                    BuildingDescription = editBuildingVM.BuildingDescription,
                    PictureUrl = photoResult.Url.ToString(),
                    TotalNumberOfUnits = editBuildingVM.TotalNumberOfUnits,
                    NumberOfUnitAvailable = editBuildingVM.NumberOfUnitAvailable,
                    ParkingIncluded = editBuildingVM.ParkingIncluded,
                    LaundryServiceIncluded = editBuildingVM.LaundryServiceIncluded,
                    Address = editBuildingVM.Address
                };

                _buildingRepository.Update(building);
                return RedirectToAction("Index");
            }
            else
            {
                return View(editBuildingVM);
            }
        }

        public async Task<IActionResult> Delete(int id)
        {
            var building = await _buildingRepository.GetByIdAsync(id);
            if (building == null)
            {
                return View("Error");
            }

            return View(building);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteBuilding(int id)
        {
            var building = await _buildingRepository.GetByIdAsyncNoTracking(id);
            if (building == null)
            {
                return View("Error");
            }

            if (building.NumberOfUnitAvailable != building.TotalNumberOfUnits)
            {
                ModelState.AddModelError("", "You cannot delete a building with rented units!");
                return View("Error");
            }
            else
            {
                _buildingRepository.Delete(building);
                return RedirectToAction("Index");
            }
        }
    }
}

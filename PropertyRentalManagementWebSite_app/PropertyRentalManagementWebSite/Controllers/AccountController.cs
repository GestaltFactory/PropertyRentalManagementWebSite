using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PropertyRentalManagementWebSite.Data;
using PropertyRentalManagementWebSite.Models;
using PropertyRentalManagementWebSite.ViewModels;
using System.Security.Claims;

namespace PropertyRentalManagementWebSite.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<Account> _userManager;
        private readonly SignInManager<Account> _signInManager;
        private readonly PropertyRentalManagement_DBContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AccountController(UserManager<Account> userManager, SignInManager<Account> signInManager, PropertyRentalManagement_DBContext context, IHttpContextAccessor httpContextAccessor)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _context = context;
            _httpContextAccessor = httpContextAccessor; 
        }

        public IActionResult Login()
        {
            var response = new LoginVM();
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid)
            {
                return View(loginVM);
            }

            Account? user = await _userManager.FindByEmailAsync(loginVM.Email);
            if (user != null)
            {
                // execute only if user is found - check password
                bool passwordCheck = await _userManager.CheckPasswordAsync(user, loginVM.Password);
                if (passwordCheck)
                {
                    // if password is correct - sign in
                    var result = await _signInManager.PasswordSignInAsync(user, loginVM.Password, false, false);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }

                // if password is incorrect
                TempData["Error"] = "Wrong credentials. Please, try again";
                return View(loginVM);
            }

            // user is incorrect
            TempData["Error"] = "Wrong credentials. Please, try again";
            return View(loginVM);
        }

        public IActionResult Register()
        {
            var response = new RegisterVM();
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            if (!ModelState.IsValid)
            {
                return View(registerVM);
            }

            Account? tenant = await _userManager.FindByEmailAsync(registerVM.Email);
            if (tenant != null)
            {
                TempData["Error"] = "This email address is already in use";
                return View(registerVM);
            }

            Account newAccountTenant = new Account()
            {
                Email = registerVM.Email,
                UserName = registerVM.FirstName + registerVM.LastName,
                FirstName = registerVM.FirstName,
                LastName = registerVM.LastName,
                Age = registerVM.Age,
                AccountRole = UserRoles.Tenant,
            };

            IdentityResult? newUserTenantResponse = await _userManager.CreateAsync(newAccountTenant, registerVM.Password);
            if (newUserTenantResponse.Succeeded)
            {
                 await _userManager.AddToRoleAsync(newAccountTenant, UserRoles.Tenant);
            }

            return RedirectToAction("Index", "Home");
        }

        public IActionResult AdminRegister()
        {
            var response = new AdminRegisterVM();
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> AdminRegister(AdminRegisterVM adminRegisterVM)
        {
            if (!ModelState.IsValid)
            {
                return View(adminRegisterVM);
            }

            Account? user = await _userManager.FindByEmailAsync(adminRegisterVM.Email);
            if (user != null)
            {
                TempData["Error"] = "This email address is already in use";
                return View(adminRegisterVM);
            }

            Account newAccount = new Account()
            {
                Email = adminRegisterVM.Email,
                UserName = adminRegisterVM.FirstName + adminRegisterVM.LastName,
                FirstName = adminRegisterVM.FirstName,
                LastName = adminRegisterVM.LastName,
                Age = adminRegisterVM.Age,
                AccountRole = UserRoles.Manager,
                Address = new Address
                {
                    StreetNumber = adminRegisterVM.Address.StreetNumber,
                    StreetName = adminRegisterVM.Address.StreetName,
                    City = adminRegisterVM.Address.City,
                    Province = adminRegisterVM.Address.Province,
                    PostalCode = adminRegisterVM.Address.PostalCode,
                }
            };

            IdentityResult? newUserResponse = await _userManager.CreateAsync(newAccount, adminRegisterVM.Password);
            if (newUserResponse.Succeeded)
            {
                await _userManager.AddToRoleAsync(newAccount, UserRoles.Manager);
            }

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
    }
}

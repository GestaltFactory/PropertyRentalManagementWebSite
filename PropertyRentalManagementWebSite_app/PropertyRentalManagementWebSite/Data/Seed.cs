using Microsoft.AspNetCore.Identity;
using PropertyRentalManagementWebSite.Models;

namespace PropertyRentalManagementWebSite.Data
{
    public class Seed
    {
        public static async Task SeedUsersAndRolesAsync(IApplicationBuilder applicationBuilder)
        {
            using (var serviceScope = applicationBuilder.ApplicationServices.CreateScope())
            {
                //Roles
                var roleManager = serviceScope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();

                if (!await roleManager.RoleExistsAsync(UserRoles.Owner))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Owner));
                if (!await roleManager.RoleExistsAsync(UserRoles.Manager))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Manager));
                if (!await roleManager.RoleExistsAsync(UserRoles.Tenant))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Tenant));

                //owner
                var appUser = serviceScope.ServiceProvider.GetRequiredService<UserManager<Account>>();
                string ownerUserEmail = "testForOwner@gmail.com";

                var ownerUser = await appUser.FindByEmailAsync(ownerUserEmail);
                if (ownerUser == null)
                {
                    var newOwnerUser = new Account()
                    {
                        UserName = "ygervais",
                        Email = ownerUserEmail,
                        EmailConfirmed = true,
                        Address = new Address()
                        {
                            StreetNumber = 265,
                            StreetName = "Brebeuf",
                            City = "Longueuil",
                            Province = "QC",
                            PostalCode = "J4J 3P9"
                        }
                    };
                    await appUser.CreateAsync(newOwnerUser, "Test@1234?");
                    await appUser.AddToRoleAsync(newOwnerUser, UserRoles.Owner);
                }

                // tenant
                string tenantUserEmail = "user@test.com";

                var tenantUser = await appUser.FindByEmailAsync(tenantUserEmail);
                if (tenantUser == null)
                {
                    var newTenantUser = new Account()
                    {
                        UserName = "rstone",
                        Email = tenantUserEmail,
                        EmailConfirmed = true,
                        Address = new Address()
                        {
                            StreetNumber = 260,
                            StreetName = "Chambly",
                            City = "Longueuil",
                            Province = "QC",
                            PostalCode = "J4J 3P9"
                        }
                    };
                    await appUser.CreateAsync(newTenantUser, "Test@1234?");
                    await appUser.AddToRoleAsync(newTenantUser, UserRoles.Tenant);
                }
            }
        }
    }
}

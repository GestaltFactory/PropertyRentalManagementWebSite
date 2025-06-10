# PropertyRentalManagementWebSite
A web-based platform to manage buildings, apartments, tenants, appointments, and communication between users. Built with ASP.NET Core MVC and Entity Framework, the app supports multi-role authentication (owner, manager, tenant) and includes features like appointment scheduling, image uploads, and role-based access control.

What It Does

This application allows property owners and managers to:
    Add and manage buildings and apartments
    Schedule and view appointments with tenants
    Upload and manage apartment images using Cloudinary
    Send and receive messages between users
    Assign roles and restrict access based on user type (owner, manager, tenant)

Tenants can:
    View available apartments
    Book appointments to visit or discuss rentals
    View appointment history and messages

The app is intended as a multi-user property management portal with clear separation of responsibilities and secure authentication workflows.

Technologies Used
    ASP.NET Core MVC
    Entity Framework Core (with SQL Server)
    ASP.NET Identity (role-based authentication)
    Cloudinary (image hosting)
    Bootstrap (for layout and responsive UI)

Project Setup and Usage
Prerequisites
    .NET 6 SDK or later
    SQL Server LocalDB (comes with Visual Studio)
    Visual Studio 2022+ (recommended) or any IDE that supports ASP.NET Core

How to Run the Project
    Clone the repository
        git clone https://github.com/your-username/PropertyRentalManagementWebSite.git
        cd PropertyRentalManagementWebSite
    Update the database connection
        In appsettings.json, confirm that the connection string uses LocalDB:
        "ConnectionStrings": {
          "ConnectDb": "Server=(localdb)\\mssqllocaldb;Database=PropertyRental_DB;Trusted_Connection=True;"
        }
    Apply migrations and create the database
        dotnet ef database update --project .\PropertyRentalManagementWebSite.csproj

Seeded User Accounts
    The app automatically seeds two default accounts on first run:
Owner account
    Email: testForOwner@gmail.com
    Password: Test@1234?
Tenant account
    Email: user@test.com
    Password: Test@1234?
You can log in using either of these accounts to explore the app.

Features
    Role-based authentication: Owner, Manager, and Tenant
    Account registration and login
    Apartment and building management
    Appointment scheduling
    Cloud-based image upload (Cloudinary)
    Session and cookie authentication with ASP.NET Identity

Additional Notes
    To allow new user registration, make sure the registration controller assigns roles automatically or adjusts access logic.
    Cloudinary image upload will fail unless configured with valid credentials or replaced with a mock/local image storage service.
    The project includes clean separation of concerns: models, repositories, services, and view models are all organized into folders.

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/01.PNG" width="45%"> 
</p>

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/02.PNG" width="45%"> 
</p>

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/03.PNG" width="45%"> 
</p>

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/04.PNG" width="45%"> 
</p>

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/05.PNG" width="45%"> 
</p>

<p align="center"> 
    <img src="https://github.com/GestaltFactory/PropertyRentalManagementWebSite/blob/main/06.PNG" width="45%"> 
</p>

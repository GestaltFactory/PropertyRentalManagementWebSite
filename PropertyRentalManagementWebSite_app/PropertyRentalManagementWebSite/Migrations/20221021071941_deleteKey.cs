using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PropertyRentalManagementWebSite.Migrations
{
    public partial class deleteKey : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Appartments",
                table: "Appartments");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Appartments",
                table: "Appartments",
                columns: new[] { "AppartmentNumber"});
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Appartments",
                table: "Appartments");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Appartments",
                table: "Appartments",
                column: "AppartmentNumber");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zeta.Inpark.Tenants.Migrations
{
    public partial class ChangesToServiceAndFeature : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Service",
                newName: "ServiceId");

            migrationBuilder.AddColumn<string>(
                name: "FeatureId",
                table: "Feature",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FeatureId",
                table: "Feature");

            migrationBuilder.RenameColumn(
                name: "ServiceId",
                table: "Service",
                newName: "Name");
        }
    }
}

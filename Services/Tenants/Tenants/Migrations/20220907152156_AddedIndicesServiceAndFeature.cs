using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zeta.Inpark.Tenants.Migrations
{
    public partial class AddedIndicesServiceAndFeature : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Service_Id_TenantId",
                table: "Service",
                columns: new[] { "Id", "TenantId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Feature_Id_ServiceId",
                table: "Feature",
                columns: new[] { "Id", "ServiceId" },
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Service_Id_TenantId",
                table: "Service");

            migrationBuilder.DropIndex(
                name: "IX_Feature_Id_ServiceId",
                table: "Feature");
        }
    }
}

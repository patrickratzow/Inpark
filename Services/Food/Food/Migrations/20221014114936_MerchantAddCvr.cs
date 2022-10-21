using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zeta.Inpark.Food.Migrations
{
    public partial class MerchantAddCvr : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Merchants",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(255)",
                oldMaxLength: 255);

            migrationBuilder.AddColumn<string>(
                name: "CvrNumber",
                table: "Merchants",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Merchants_CvrNumber",
                table: "Merchants",
                column: "CvrNumber",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Merchants_CvrNumber",
                table: "Merchants");

            migrationBuilder.DropColumn(
                name: "CvrNumber",
                table: "Merchants");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Merchants",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");
        }
    }
}

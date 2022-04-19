using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class AddDaysToOpeningHours : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Day",
                table: "OpeningHours",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_OpeningHours_TimeRange_Start_TimeRange_End",
                table: "OpeningHours",
                columns: new[] { "TimeRange_Start", "TimeRange_End" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_OpeningHours_TimeRange_Start_TimeRange_End",
                table: "OpeningHours");

            migrationBuilder.DropColumn(
                name: "Day",
                table: "OpeningHours");
        }
    }
}

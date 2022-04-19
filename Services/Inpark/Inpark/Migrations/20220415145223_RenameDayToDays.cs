using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class RenameDayToDays : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Day",
                table: "OpeningHours",
                newName: "Days");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Days",
                table: "OpeningHours",
                newName: "Day");
        }
    }
}

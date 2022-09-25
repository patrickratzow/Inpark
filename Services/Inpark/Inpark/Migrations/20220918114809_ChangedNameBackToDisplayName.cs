using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class ChangedNameBackToDisplayName : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name_Name",
                table: "Animals",
                newName: "Name_DisplayName");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name_DisplayName",
                table: "Animals",
                newName: "Name_Name");
        }
    }
}

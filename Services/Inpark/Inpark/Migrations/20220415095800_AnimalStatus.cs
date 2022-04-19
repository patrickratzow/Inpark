using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class AnimalStatus : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "Animals",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Animals");
        }
    }
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class CreateOpeningHours : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "OpeningHours",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TimeRange_Start = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    TimeRange_End = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    Open = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    UpdatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OpeningHours", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "OpeningHours");
        }
    }
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class AddParkEvent : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ParkEvents",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Image_PreviewUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Image_FullscreenUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TimeRange_Start = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TimeRange_End = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    UpdatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ParkEvents", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ParkEvents_TimeRange_Start_TimeRange_End",
                table: "ParkEvents",
                columns: new[] { "TimeRange_Start", "TimeRange_End" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ParkEvents");
        }
    }
}

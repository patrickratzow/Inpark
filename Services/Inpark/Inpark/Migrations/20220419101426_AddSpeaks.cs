using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class AddSpeaks : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Speaks",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    CreatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    UpdatedAt = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Speaks", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SpeakTime",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Day = table.Column<int>(type: "int", nullable: false),
                    TimeRange_Start = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    TimeRange_End = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    SpeakId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SpeakTime", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SpeakTime_Speaks_SpeakId",
                        column: x => x.SpeakId,
                        principalTable: "Speaks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SpeakTime_SpeakId",
                table: "SpeakTime",
                column: "SpeakId");

            migrationBuilder.CreateIndex(
                name: "IX_SpeakTime_TimeRange_Start_TimeRange_End",
                table: "SpeakTime",
                columns: new[] { "TimeRange_Start", "TimeRange_End" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SpeakTime");

            migrationBuilder.DropTable(
                name: "Speaks");
        }
    }
}

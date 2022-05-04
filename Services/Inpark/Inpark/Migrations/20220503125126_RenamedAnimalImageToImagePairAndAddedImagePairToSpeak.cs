using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class RenamedAnimalImageToImagePairAndAddedImagePairToSpeak : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Image_PreviewUrl",
                table: "Animals",
                newName: "ImagePair_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "Image_FullscreenUrl",
                table: "Animals",
                newName: "ImagePair_FullscreenUrl");

            migrationBuilder.AddColumn<string>(
                name: "ImagePair_FullscreenUrl",
                table: "Speaks",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "ImagePair_PreviewUrl",
                table: "Speaks",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ImagePair_FullscreenUrl",
                table: "Speaks");

            migrationBuilder.DropColumn(
                name: "ImagePair_PreviewUrl",
                table: "Speaks");

            migrationBuilder.RenameColumn(
                name: "ImagePair_PreviewUrl",
                table: "Animals",
                newName: "Image_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "ImagePair_FullscreenUrl",
                table: "Animals",
                newName: "Image_FullscreenUrl");
        }
    }
}

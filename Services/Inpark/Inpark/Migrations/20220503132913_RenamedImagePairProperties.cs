using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zoo.Inpark.Migrations
{
    public partial class RenamedImagePairProperties : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ImagePair_PreviewUrl",
                table: "Speaks",
                newName: "Image_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "ImagePair_FullscreenUrl",
                table: "Speaks",
                newName: "Image_FullscreenUrl");

            migrationBuilder.RenameColumn(
                name: "ImagePair_PreviewUrl",
                table: "Animals",
                newName: "Image_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "ImagePair_FullscreenUrl",
                table: "Animals",
                newName: "Image_FullscreenUrl");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Image_PreviewUrl",
                table: "Speaks",
                newName: "ImagePair_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "Image_FullscreenUrl",
                table: "Speaks",
                newName: "ImagePair_FullscreenUrl");

            migrationBuilder.RenameColumn(
                name: "Image_PreviewUrl",
                table: "Animals",
                newName: "ImagePair_PreviewUrl");

            migrationBuilder.RenameColumn(
                name: "Image_FullscreenUrl",
                table: "Animals",
                newName: "ImagePair_FullscreenUrl");
        }
    }
}

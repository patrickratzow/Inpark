using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zeta.Inpark.Auth.Migrations
{
    public partial class AddTenantIdToPermission : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AdminPermission_Permissions_PermissionsId",
                table: "AdminPermission");

            migrationBuilder.DropForeignKey(
                name: "FK_PermissionRole_Permissions_PermissionsId",
                table: "PermissionRole");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Permissions",
                table: "Permissions");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PermissionRole",
                table: "PermissionRole");

            migrationBuilder.DropIndex(
                name: "IX_PermissionRole_RolesId",
                table: "PermissionRole");

            migrationBuilder.DropPrimaryKey(
                name: "PK_AdminPermission",
                table: "AdminPermission");

            migrationBuilder.DropIndex(
                name: "IX_AdminPermission_PermissionsId",
                table: "AdminPermission");

            migrationBuilder.AddColumn<Guid>(
                name: "TenantId",
                table: "Permissions",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "PermissionsTenantId",
                table: "PermissionRole",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "PermissionsTenantId",
                table: "AdminPermission",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddPrimaryKey(
                name: "PK_Permissions",
                table: "Permissions",
                columns: new[] { "TenantId", "Id" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_PermissionRole",
                table: "PermissionRole",
                columns: new[] { "RolesId", "PermissionsTenantId", "PermissionsId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_AdminPermission",
                table: "AdminPermission",
                columns: new[] { "AdminsId", "PermissionsTenantId", "PermissionsId" });

            migrationBuilder.CreateIndex(
                name: "IX_PermissionRole_PermissionsTenantId_PermissionsId",
                table: "PermissionRole",
                columns: new[] { "PermissionsTenantId", "PermissionsId" });

            migrationBuilder.CreateIndex(
                name: "IX_AdminPermission_PermissionsTenantId_PermissionsId",
                table: "AdminPermission",
                columns: new[] { "PermissionsTenantId", "PermissionsId" });

            migrationBuilder.AddForeignKey(
                name: "FK_AdminPermission_Permissions_PermissionsTenantId_PermissionsId",
                table: "AdminPermission",
                columns: new[] { "PermissionsTenantId", "PermissionsId" },
                principalTable: "Permissions",
                principalColumns: new[] { "TenantId", "Id" },
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionRole_Permissions_PermissionsTenantId_PermissionsId",
                table: "PermissionRole",
                columns: new[] { "PermissionsTenantId", "PermissionsId" },
                principalTable: "Permissions",
                principalColumns: new[] { "TenantId", "Id" },
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AdminPermission_Permissions_PermissionsTenantId_PermissionsId",
                table: "AdminPermission");

            migrationBuilder.DropForeignKey(
                name: "FK_PermissionRole_Permissions_PermissionsTenantId_PermissionsId",
                table: "PermissionRole");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Permissions",
                table: "Permissions");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PermissionRole",
                table: "PermissionRole");

            migrationBuilder.DropIndex(
                name: "IX_PermissionRole_PermissionsTenantId_PermissionsId",
                table: "PermissionRole");

            migrationBuilder.DropPrimaryKey(
                name: "PK_AdminPermission",
                table: "AdminPermission");

            migrationBuilder.DropIndex(
                name: "IX_AdminPermission_PermissionsTenantId_PermissionsId",
                table: "AdminPermission");

            migrationBuilder.DropColumn(
                name: "TenantId",
                table: "Permissions");

            migrationBuilder.DropColumn(
                name: "PermissionsTenantId",
                table: "PermissionRole");

            migrationBuilder.DropColumn(
                name: "PermissionsTenantId",
                table: "AdminPermission");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Permissions",
                table: "Permissions",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PermissionRole",
                table: "PermissionRole",
                columns: new[] { "PermissionsId", "RolesId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_AdminPermission",
                table: "AdminPermission",
                columns: new[] { "AdminsId", "PermissionsId" });

            migrationBuilder.CreateIndex(
                name: "IX_PermissionRole_RolesId",
                table: "PermissionRole",
                column: "RolesId");

            migrationBuilder.CreateIndex(
                name: "IX_AdminPermission_PermissionsId",
                table: "AdminPermission",
                column: "PermissionsId");

            migrationBuilder.AddForeignKey(
                name: "FK_AdminPermission_Permissions_PermissionsId",
                table: "AdminPermission",
                column: "PermissionsId",
                principalTable: "Permissions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionRole_Permissions_PermissionsId",
                table: "PermissionRole",
                column: "PermissionsId",
                principalTable: "Permissions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}

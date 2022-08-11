﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Zeta.Inpark.Auth;

#nullable disable

namespace Zeta.Inpark.Auth.Migrations
{
    [DbContext(typeof(AuthDbContext))]
    [Migration("20220810184743_AdminsCanHaveDirectPermissions")]
    partial class AdminsCanHaveDirectPermissions
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("AdminPermission", b =>
                {
                    b.Property<Guid>("AdminsId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("PermissionsId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("AdminsId", "PermissionsId");

                    b.HasIndex("PermissionsId");

                    b.ToTable("AdminPermission");
                });

            modelBuilder.Entity("PermissionRole", b =>
                {
                    b.Property<string>("PermissionsId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<Guid>("RolesId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("PermissionsId", "RolesId");

                    b.HasIndex("RolesId");

                    b.ToTable("PermissionRole");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Admin", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<DateTime>("LastSeen")
                        .HasColumnType("datetime2");

                    b.Property<Guid?>("TenantId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id");

                    b.HasIndex("TenantId");

                    b.ToTable("Admins");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Permission", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id");

                    b.ToTable("Permissions");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.RefreshToken", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("AdminId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<DateTime>("ExpiresAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id");

                    b.HasIndex("AdminId");

                    b.ToTable("RefreshToken");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Role", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("AdminId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<Guid>("TenantId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id");

                    b.HasIndex("AdminId");

                    b.HasIndex("TenantId", "Name")
                        .IsUnique();

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Tenant", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id");

                    b.ToTable("Tenants");
                });

            modelBuilder.Entity("AdminPermission", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Admin", null)
                        .WithMany()
                        .HasForeignKey("AdminsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Zeta.Inpark.Auth.Entities.Permission", null)
                        .WithMany()
                        .HasForeignKey("PermissionsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("PermissionRole", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Permission", null)
                        .WithMany()
                        .HasForeignKey("PermissionsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Zeta.Inpark.Auth.Entities.Role", null)
                        .WithMany()
                        .HasForeignKey("RolesId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Admin", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Tenant", null)
                        .WithMany("Admins")
                        .HasForeignKey("TenantId");

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.EmailAddress", "EmailAddress", b1 =>
                        {
                            b1.Property<Guid>("AdminId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Value")
                                .IsRequired()
                                .HasColumnType("nvarchar(max)")
                                .HasColumnName("Email");

                            b1.HasKey("AdminId");

                            b1.ToTable("Admins");

                            b1.WithOwner()
                                .HasForeignKey("AdminId");
                        });

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.Password", "Password", b1 =>
                        {
                            b1.Property<Guid>("AdminId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Hash")
                                .IsRequired()
                                .HasColumnType("nvarchar(max)")
                                .HasColumnName("Password_Hash");

                            b1.Property<string>("Salt")
                                .IsRequired()
                                .HasColumnType("nvarchar(max)")
                                .HasColumnName("Password_Salt");

                            b1.HasKey("AdminId");

                            b1.ToTable("Admins");

                            b1.WithOwner()
                                .HasForeignKey("AdminId");
                        });

                    b.Navigation("EmailAddress")
                        .IsRequired();

                    b.Navigation("Password")
                        .IsRequired();
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.RefreshToken", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Admin", null)
                        .WithMany("RefreshTokens")
                        .HasForeignKey("AdminId");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Role", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Admin", null)
                        .WithMany("Roles")
                        .HasForeignKey("AdminId");

                    b.HasOne("Zeta.Inpark.Auth.Entities.Tenant", "Tenant")
                        .WithMany("Roles")
                        .HasForeignKey("TenantId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.Color", "Color", b1 =>
                        {
                            b1.Property<Guid>("RoleId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Value")
                                .IsRequired()
                                .HasColumnType("nvarchar(max)")
                                .HasColumnName("Color");

                            b1.HasKey("RoleId");

                            b1.ToTable("Roles");

                            b1.WithOwner()
                                .HasForeignKey("RoleId");
                        });

                    b.Navigation("Color")
                        .IsRequired();

                    b.Navigation("Tenant");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Admin", b =>
                {
                    b.Navigation("RefreshTokens");

                    b.Navigation("Roles");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Tenant", b =>
                {
                    b.Navigation("Admins");

                    b.Navigation("Roles");
                });
#pragma warning restore 612, 618
        }
    }
}

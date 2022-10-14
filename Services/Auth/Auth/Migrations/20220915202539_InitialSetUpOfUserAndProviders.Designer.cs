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
    [Migration("20220915202539_InitialSetUpOfUserAndProviders")]
    partial class InitialSetUpOfUserAndProviders
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

                    b.Property<Guid>("PermissionsTenantId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("PermissionsId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("AdminsId", "PermissionsTenantId", "PermissionsId");

                    b.HasIndex("PermissionsTenantId", "PermissionsId");

                    b.ToTable("AdminPermission");
                });

            modelBuilder.Entity("PermissionRole", b =>
                {
                    b.Property<Guid>("RolesId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("PermissionsTenantId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("PermissionsId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("RolesId", "PermissionsTenantId", "PermissionsId");

                    b.HasIndex("PermissionsTenantId", "PermissionsId");

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
                    b.Property<Guid>("TenantId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("TenantId", "Id");

                    b.ToTable("Permissions");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Provider", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<Guid>("UserId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.HasKey("Id", "UserId");

                    b.HasIndex("UserId")
                        .IsUnique();

                    b.ToTable("Provider");
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

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("CreatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("DisplayName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTimeOffset>("UpdatedAt")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.AppleProvider", b =>
                {
                    b.HasBaseType("Zeta.Inpark.Auth.Entities.Provider");

                    b.Property<string>("DisplayName")
                        .HasMaxLength(255)
                        .HasColumnType("nvarchar(255)");

                    b.Property<string>("PhoneNumber")
                        .HasMaxLength(16)
                        .HasColumnType("nvarchar(16)");

                    b.Property<string>("PhotoUrl")
                        .HasMaxLength(512)
                        .HasColumnType("nvarchar(512)");

                    b.ToTable("AppleProviders", (string)null);
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.FacebookProvider", b =>
                {
                    b.HasBaseType("Zeta.Inpark.Auth.Entities.Provider");

                    b.Property<string>("DisplayName")
                        .HasMaxLength(255)
                        .HasColumnType("nvarchar(255)");

                    b.Property<string>("PhoneNumber")
                        .HasMaxLength(16)
                        .HasColumnType("nvarchar(16)");

                    b.Property<string>("PhotoUrl")
                        .HasMaxLength(512)
                        .HasColumnType("nvarchar(512)");

                    b.ToTable("FacebookProviders", (string)null);
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.GoogleProvider", b =>
                {
                    b.HasBaseType("Zeta.Inpark.Auth.Entities.Provider");

                    b.Property<string>("DisplayName")
                        .HasMaxLength(255)
                        .HasColumnType("nvarchar(255)");

                    b.Property<string>("PhoneNumber")
                        .HasMaxLength(16)
                        .HasColumnType("nvarchar(16)");

                    b.Property<string>("PhotoUrl")
                        .HasMaxLength(512)
                        .HasColumnType("nvarchar(512)");

                    b.ToTable("GoogleProviders", (string)null);
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
                        .HasForeignKey("PermissionsTenantId", "PermissionsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("PermissionRole", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Role", null)
                        .WithMany()
                        .HasForeignKey("RolesId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Zeta.Inpark.Auth.Entities.Permission", null)
                        .WithMany()
                        .HasForeignKey("PermissionsTenantId", "PermissionsId")
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

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.Provider", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.User", null)
                        .WithOne("Provider")
                        .HasForeignKey("Zeta.Inpark.Auth.Entities.Provider", "UserId")
                        .OnDelete(DeleteBehavior.Cascade)
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

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.AppleProvider", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Provider", null)
                        .WithOne()
                        .HasForeignKey("Zeta.Inpark.Auth.Entities.AppleProvider", "Id", "UserId")
                        .OnDelete(DeleteBehavior.ClientCascade)
                        .IsRequired();

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.EmailAddress", "Email", b1 =>
                        {
                            b1.Property<string>("AppleProviderId")
                                .HasColumnType("nvarchar(450)");

                            b1.Property<Guid>("AppleProviderUserId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Value")
                                .IsRequired()
                                .HasMaxLength(512)
                                .HasColumnType("nvarchar(512)");

                            b1.HasKey("AppleProviderId", "AppleProviderUserId");

                            b1.ToTable("AppleProviders");

                            b1.WithOwner()
                                .HasForeignKey("AppleProviderId", "AppleProviderUserId");
                        });

                    b.Navigation("Email");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.FacebookProvider", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Provider", null)
                        .WithOne()
                        .HasForeignKey("Zeta.Inpark.Auth.Entities.FacebookProvider", "Id", "UserId")
                        .OnDelete(DeleteBehavior.ClientCascade)
                        .IsRequired();

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.EmailAddress", "Email", b1 =>
                        {
                            b1.Property<string>("FacebookProviderId")
                                .HasColumnType("nvarchar(450)");

                            b1.Property<Guid>("FacebookProviderUserId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Value")
                                .IsRequired()
                                .HasMaxLength(512)
                                .HasColumnType("nvarchar(512)");

                            b1.HasKey("FacebookProviderId", "FacebookProviderUserId");

                            b1.ToTable("FacebookProviders");

                            b1.WithOwner()
                                .HasForeignKey("FacebookProviderId", "FacebookProviderUserId");
                        });

                    b.Navigation("Email");
                });

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.GoogleProvider", b =>
                {
                    b.HasOne("Zeta.Inpark.Auth.Entities.Provider", null)
                        .WithOne()
                        .HasForeignKey("Zeta.Inpark.Auth.Entities.GoogleProvider", "Id", "UserId")
                        .OnDelete(DeleteBehavior.ClientCascade)
                        .IsRequired();

                    b.OwnsOne("Zeta.Inpark.Auth.ValueObjects.EmailAddress", "Email", b1 =>
                        {
                            b1.Property<string>("GoogleProviderId")
                                .HasColumnType("nvarchar(450)");

                            b1.Property<Guid>("GoogleProviderUserId")
                                .HasColumnType("uniqueidentifier");

                            b1.Property<string>("Value")
                                .IsRequired()
                                .HasMaxLength(512)
                                .HasColumnType("nvarchar(512)");

                            b1.HasKey("GoogleProviderId", "GoogleProviderUserId");

                            b1.ToTable("GoogleProviders");

                            b1.WithOwner()
                                .HasForeignKey("GoogleProviderId", "GoogleProviderUserId");
                        });

                    b.Navigation("Email");
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

            modelBuilder.Entity("Zeta.Inpark.Auth.Entities.User", b =>
                {
                    b.Navigation("Provider")
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace PropertyRentalManagementWebSite.Models
{
    public partial class PropertyRentalManagement_DBContext : IdentityDbContext<Account>
    {
        public PropertyRentalManagement_DBContext()
        {
        }

        public PropertyRentalManagement_DBContext(DbContextOptions<PropertyRentalManagement_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<Address> Addresses { get; set; } = null!;
        public virtual DbSet<Appartment> Appartments { get; set; } = null!;
        public virtual DbSet<Appointment> Appointments { get; set; } = null!;
        public virtual DbSet<Building> Buildings { get; set; } = null!;
        public virtual DbSet<Message> Messages { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Account>(entity =>
            {

            });

            modelBuilder.Entity<Address>(entity =>
            {
                entity.Property(e => e.StreetName).HasMaxLength(100);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.PostalCode).HasMaxLength(20);

                entity.Property(e => e.Province).HasMaxLength(50);
            });

            modelBuilder.Entity<Appartment>(entity =>
            {
                entity.HasKey(e => new { e.AppartmentNumber, e.BuildingId });

                entity.Property(e => e.PictureUrl).HasMaxLength(100);

                entity.Property(e => e.RentalEndDate).HasColumnType("date");

                entity.Property(e => e.RentalStartDate).HasColumnType("date");

                entity.Property(e => e.RentedStatus).HasMaxLength(20);

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.Appartments)
                    .HasForeignKey(d => d.BuildingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Appartments_Buildings");
            });

            modelBuilder.Entity<Appointment>(entity =>
            {
    //            entity.Property(e => e.AppointmentId).ValueGeneratedNever();

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.Information).HasMaxLength(200);
            });

            modelBuilder.Entity<Building>(entity =>
            {
                entity.Property(e => e.LaundryServiceIncluded).HasMaxLength(20);

                entity.Property(e => e.ParkingIncluded).HasMaxLength(20);

                entity.Property(e => e.PictureUrl).HasMaxLength(100);

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.Buildings)
                    .HasForeignKey(d => d.AddressId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Buildings_Addresses");
            });

            modelBuilder.Entity<Message>(entity =>
            {
                entity.Property(e => e.DestinationEmail).HasMaxLength(100);

                entity.Property(e => e.MessageContent).HasMaxLength(200);

                entity.Property(e => e.SenderEmail).HasMaxLength(100);

                entity.Property(e => e.SubjectTitle).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

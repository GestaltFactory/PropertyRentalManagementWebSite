USE [master]
GO
/****** Object:  Database [PropertyRentalManagementWebProject_DB]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE DATABASE [PropertyRentalManagementWebProject_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyRentalManagementWebProject_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\PropertyRentalManagementWebProject_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyRentalManagementWebProject_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\PropertyRentalManagementWebProject_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyRentalManagementWebProject_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET QUERY_STORE = OFF
GO
USE [PropertyRentalManagementWebProject_DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[StreetNumber] [int] NOT NULL,
	[StreetName] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[AppartmentNumber] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appartments]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appartments](
	[AppartmentId] [int] IDENTITY(1,1) NOT NULL,
	[AppartmentNumber] [int] NOT NULL,
	[BuildingId] [int] NOT NULL,
	[NumberOfPieces] [int] NOT NULL,
	[PricePerMonth] [float] NOT NULL,
	[RentedStatus] [nvarchar](20) NOT NULL,
	[RentalStartDate] [date] NULL,
	[RentalEndDate] [date] NULL,
	[PictureUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Appartments] PRIMARY KEY CLUSTERED 
(
	[AppartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[TimeEnd] [time](7) NOT NULL,
	[Information] [nvarchar](200) NULL,
	[ReceiverEmail] [nvarchar](50) NOT NULL,
	[SenderEmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[AddressId] [int] NULL,
	[AccountRole] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NULL,
	[ParkingIncluded] [nvarchar](20) NOT NULL,
	[LaundryServiceIncluded] [nvarchar](20) NOT NULL,
	[PictureUrl] [nvarchar](100) NULL,
	[BuildingDescription] [nvarchar](max) NOT NULL,
	[BuildingName] [nvarchar](max) NOT NULL,
	[NumberOfUnitAvailable] [int] NOT NULL,
	[TotalNumberOfUnits] [int] NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2022-10-24 11:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[DestinationEmail] [nvarchar](100) NOT NULL,
	[SenderEmail] [nvarchar](100) NOT NULL,
	[SubjectTitle] [nvarchar](50) NOT NULL,
	[MessageContent] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221018204843_Identity', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221018212703_AccountChanges', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221018215142_AddressChanges', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221018222311_AddressChanges_2', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221019052908_Account_Identity', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221019055906_Account_Identity_2', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221019232223_Building_correction', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021020658_AppartmentCorrection', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021071941_deleteKey', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021072414_deleteKey2', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021072526_deleteKey3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021073001_deleteKey4', N'6.0.10')
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (21, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (22, 25, N'brebeuf', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (23, 666, N'Hell', N'Longueuil', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (24, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (25, 25, N'brebeuf', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (26, 666, N'Hell', N'Longueuil', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (27, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (28, 666, N'Hell', N'Longueuil', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (29, 25, N'brebeuf', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (30, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (31, 6, N'book', N'Montreal', N'qc', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (32, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (33, 666, N'Hell', N'Longueuil', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (34, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (35, 45, N'lalou', N'Montreal', N'QC', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (36, 6, N'book', N'Montreal', N'qc', N'j4j3p9', NULL)
INSERT [dbo].[Addresses] ([AddressId], [StreetNumber], [StreetName], [City], [Province], [PostalCode], [AppartmentNumber]) VALUES (37, 666, N'Hell', N'Longueuil', N'QC', N'j4j3p9', NULL)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Appartments] ON 

INSERT [dbo].[Appartments] ([AppartmentId], [AppartmentNumber], [BuildingId], [NumberOfPieces], [PricePerMonth], [RentedStatus], [RentalStartDate], [RentalEndDate], [PictureUrl]) VALUES (1, 1, 25, 2, 2000, N'0', CAST(N'2022-10-06' AS Date), CAST(N'2022-10-24' AS Date), N'http://res.cloudinary.com/dqxg9fbs9/image/upload/v1666669004/mxnprmg6oljh4oxomc8k.jpg')
SET IDENTITY_INSERT [dbo].[Appartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentId], [Date], [TimeStart], [TimeEnd], [Information], [ReceiverEmail], [SenderEmail]) VALUES (1, CAST(N'2022-02-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), N'First meeting', N'sara@hotmail.com', N'luke@gmail.com')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'42b1b04e-e8b2-467c-a414-d95868cc452f', N'owner', N'OWNER', N'fc17393a-726d-4f0a-bb6f-bfba249981d9')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'86afe489-a371-41b6-b64c-827d261f516d', N'tenant', N'TENANT', N'3ec68c68-4d58-4d0b-a10d-263587df3c8e')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9da31f0d-9b24-4654-b7d7-740e58c08776', N'manager', N'MANAGER', N'98955276-3f14-44c2-8c37-21a760bf23d3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd7c2a16b-39ff-4544-8984-875e4b263d14', N'42b1b04e-e8b2-467c-a414-d95868cc452f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31aac40e-7e04-4ef3-865f-9ac5b31af4ac', N'86afe489-a371-41b6-b64c-827d261f516d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3dc09832-d9a2-40bb-b56e-52e159d3c2a1', N'86afe489-a371-41b6-b64c-827d261f516d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'55cc8c59-6275-4670-ac12-ac2e96af7f4b', N'86afe489-a371-41b6-b64c-827d261f516d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5d89785c-e156-46f5-85fb-ca8b1e0faed3', N'9da31f0d-9b24-4654-b7d7-740e58c08776')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId], [AccountRole], [Age], [FirstName], [LastName]) VALUES (N'31aac40e-7e04-4ef3-865f-9ac5b31af4ac', N'luke@gmail.com', N'lukeSpacewalker', N'LUKESPACEWALKER', N'LUKE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEP8Gc8KnCfmFo3JbPS+LPvfiDb19cxwc0EmtlASzdmJWzydNGma/TzvksDk2wVBpDQ==', N'GT5DJOUCJS7EX5YS6S73SDHDTJIN4TAH', N'c0a5bbe3-89b8-4277-ad95-de581203bce6', NULL, 0, 0, NULL, 1, 0, NULL, N'tenant', 36, N'luke', N'Spacewalker')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId], [AccountRole], [Age], [FirstName], [LastName]) VALUES (N'3dc09832-d9a2-40bb-b56e-52e159d3c2a1', N'sara@hotmail.com', N'SarahBlake', N'SARAHBLAKE', N'SARA@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA/LomBOjeU6725XQfsJ8fIa8507HDhJsnAl9AYisryX91ybINoIevicHgylUi3EsA==', N'SLRYVXKTXEV27XOXJMVPJERRPTLPE4RA', N'ebb01fda-af7c-47bc-94ff-b405a2264d1e', NULL, 0, 0, NULL, 1, 0, NULL, N'tenant', 24, N'Sarah', N'Blake')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId], [AccountRole], [Age], [FirstName], [LastName]) VALUES (N'55cc8c59-6275-4670-ac12-ac2e96af7f4b', N'saoul@gmail.com', N'SaoulBlake', N'SAOULBLAKE', N'SAOUL@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIEncbV4fmu4GmyUKUOxK1FcHn6uYWNgwku7pv4LNcd2FoBqEKiPz83LbPXmrDvOug==', N'YKFGHLLSE6YIZQFBE6BJUSJ7YIX6VB3D', N'a27945a9-8a45-47f8-acd3-ef7f62ba5eba', NULL, 0, 0, NULL, 1, 0, NULL, N'tenant', 25, N'Saoul', N'Blake')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId], [AccountRole], [Age], [FirstName], [LastName]) VALUES (N'5d89785c-e156-46f5-85fb-ca8b1e0faed3', N'kstone@hotmail.com', N'KaiserStone', N'KAISERSTONE', N'KSTONE@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJt7Ug37a+qw0Yh8bhnps9wk4H3zxs7idTUa0/SBXOlg1AN8NokZ8mHWl5DUxh5Alg==', N'7Y5HYFZW4LDHJ4DAYM6RJ6RE626LPOSU', N'e8fe4976-eb85-4301-924f-a224a3815a99', NULL, 0, 0, NULL, 1, 0, 37, N'manager', 19, N'Kaiser', N'Stone')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [AddressId], [AccountRole], [Age], [FirstName], [LastName]) VALUES (N'd7c2a16b-39ff-4544-8984-875e4b263d14', N'ygervais@hotmail.com', N'YannickGervais', N'YANNICKGERVAIS', N'YGERVAIS@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMk0zCCSbkYz2CUAT+w/omOQvcp1egOmmMidoFkdrIRmJDE10l/F6UrWlJE6AaO8vw==', N'LBPHTLU5QL73HZIPYKERYIYDDI4W22MB', N'5a0a2d4e-35fc-4697-b4eb-1cce613908f9', NULL, 0, 0, NULL, 1, 0, NULL, N'owner', 42, N'Yannick', N'Gervais')
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([BuildingId], [AddressId], [ParkingIncluded], [LaundryServiceIncluded], [PictureUrl], [BuildingDescription], [BuildingName], [NumberOfUnitAvailable], [TotalNumberOfUnits]) VALUES (25, 33, N'0', N'0', N'http://res.cloudinary.com/dqxg9fbs9/image/upload/v1666654156/ovau06n7xaisdwshz8gn.webp', N'a test building', N'test4', 4, 4)
INSERT [dbo].[Buildings] ([BuildingId], [AddressId], [ParkingIncluded], [LaundryServiceIncluded], [PictureUrl], [BuildingDescription], [BuildingName], [NumberOfUnitAvailable], [TotalNumberOfUnits]) VALUES (26, 35, N'0', N'0', N'http://res.cloudinary.com/dqxg9fbs9/image/upload/v1666657175/lbudqhtebvkzumeevcyn.jpg', N'A place for old people', N'test', 5, 5)
INSERT [dbo].[Buildings] ([BuildingId], [AddressId], [ParkingIncluded], [LaundryServiceIncluded], [PictureUrl], [BuildingDescription], [BuildingName], [NumberOfUnitAvailable], [TotalNumberOfUnits]) VALUES (27, 36, N'0', N'0', N'http://res.cloudinary.com/dqxg9fbs9/image/upload/v1666657199/ohwrfzxqkbnlfykcdvnv.jpg', N'erwe', N'Senior ', 6, 6)
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (1, N'sara@hotmail.com', N'sara@hotmail.com', N'jfjj', N'dhdh')
INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (2, N'luke@gmail.com', N'luke@gmail.com', N'rent', N'sdhbfasbnjkfslknfd')
INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (3, N'sara@hotmail.com', N'luke@gmail.com', N'sdasd', N'afdsvcsmdbjkbvj')
INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (4, N'sara@hotmail.com', N'michael@hotmail.com', N'sfsf', N'hello')
INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (6, N'sara@hotmail.com', N'sara@hotmail.com', N'test', N'sgfjfszfzbnv
drdg
sdgsgd')
INSERT [dbo].[Messages] ([MessageId], [DestinationEmail], [SenderEmail], [SubjectTitle], [MessageContent]) VALUES (8, N'sara@hotmail.com', N'sara@hotmail.com', N'test2', N'sfjkashfa asfasdnklana sdfsakdnklsad asfnaksnflakfn dsfkjf;alf safmnklamf;a dfml;sakf;lakd;salflkdsafj;a asfmdflkssfjlak.')
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_AddressId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_AddressId] ON [dbo].[AspNetUsers]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buildings_AddressId]    Script Date: 2022-10-24 11:52:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Buildings_AddressId] ON [dbo].[Buildings]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUse__Addre__5441852A]  DEFAULT ((0)) FOR [AddressId]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUse__Accou__5629CD9C]  DEFAULT (N'') FOR [AccountRole]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUsers__Age__571DF1D5]  DEFAULT ((0)) FOR [Age]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUse__First__5812160E]  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF__AspNetUse__LastN__59063A47]  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Buildings] ADD  CONSTRAINT [DF__Buildings__Build__5BE2A6F2]  DEFAULT (N'') FOR [BuildingDescription]
GO
ALTER TABLE [dbo].[Buildings] ADD  CONSTRAINT [DF__Buildings__Build__5CD6CB2B]  DEFAULT (N'') FOR [BuildingName]
GO
ALTER TABLE [dbo].[Buildings] ADD  CONSTRAINT [DF__Buildings__Numbe__5DCAEF64]  DEFAULT ((0)) FOR [NumberOfUnitAvailable]
GO
ALTER TABLE [dbo].[Buildings] ADD  CONSTRAINT [DF__Buildings__Total__5EBF139D]  DEFAULT ((0)) FOR [TotalNumberOfUnits]
GO
ALTER TABLE [dbo].[Appartments]  WITH CHECK ADD  CONSTRAINT [FK_Appartments_Buildings] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
GO
ALTER TABLE [dbo].[Appartments] CHECK CONSTRAINT [FK_Appartments_Buildings]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Addresses_AddressId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_Addresses]
GO
USE [master]
GO
ALTER DATABASE [PropertyRentalManagementWebProject_DB] SET  READ_WRITE 
GO

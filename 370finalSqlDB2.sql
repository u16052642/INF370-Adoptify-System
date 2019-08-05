USE [master]
GO
/****** Object:  Database [Wollies_Shelter]    Script Date: 2019/08/03 23:29:23 ******/
CREATE DATABASE Wollies_Shelter
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wollies_Shelter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.YUKIHIRA\MSSQL\DATA\Wollies_Shelter.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wollies_Shelter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.YUKIHIRA\MSSQL\DATA\Wollies_Shelter_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wollies_Shelter] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wollies_Shelter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wollies_Shelter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Wollies_Shelter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wollies_Shelter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wollies_Shelter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wollies_Shelter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wollies_Shelter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET RECOVERY FULL 
GO
ALTER DATABASE [Wollies_Shelter] SET  MULTI_USER 
GO
ALTER DATABASE [Wollies_Shelter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wollies_Shelter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wollies_Shelter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wollies_Shelter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Wollies_Shelter', N'ON'
GO
USE [Wollies_Shelter]
GO
/****** Object:  Table [dbo].[Adopter]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adopter](
	[Adopter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adopter_Name] [nvarchar](200) NULL,
	[Adopter_Surname] [nvarchar](200) NULL,
	[Adopter_Email] [nvarchar](200) NULL,
	[Title_ID] [int] NULL,
	[Adopter_Address] [nvarchar](200) NULL,
	[Adopter_PostalAddress] [nvarchar](200) NULL,
	[Adopter_HomeNumber] [nvarchar](200) NULL,
	[Adopter_WorkNumber] [nvarchar](200) NULL,
	[Adopter_CellNumber] [nvarchar](200) NULL,
	[Adopter_CarRegistartion_Number] [nvarchar](200) NULL,
	[Adopter_Employer] [nvarchar](200) NULL,
	[Adopter_Status_ID] [int] NULL,
	[Amount_of_Family_Memebers] [int] NULL,
	[No_of_Children] [int] NULL,
	[Age_of_Children] [int] NULL,
	[Property_Securely_Closed] [bit] NULL,
	[Properyty_Include_Pool] [bit] NULL,
	[Pool_Secured] [bit] NULL,
	[Animal_Shelter_Available] [bit] NULL,
	[Sick_Animal] [bit] NULL,
	[Sick_Animal_Diagnosis] [nvarchar](354) NULL,
	[Animal_Sleep_Location] [nvarchar](354) NULL,
	[Given_Animal_Away] [bit] NULL,
	[HomeCheck_Suburb] [nvarchar](354) NULL,
	[Type_of_House] [nvarchar](354) NULL,
	[Adopted_Before] [bit] NULL,
	[Complex_or_Flat] [bit] NULL,
	[Animal_Allowed] [bit] NULL,
	[Animal_Captivity] [nvarchar](354) NULL,
	[Animal_Vaccines_Updated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Adopter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adopter_Contract]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adopter_Contract](
	[Contract_ID] [int] IDENTITY(1,1) NOT NULL,
	[Electronic_Contract] [varchar](max) NULL,
	[Adopter_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Contract_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Adopter_Relative]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adopter_Relative](
	[Relative_ID] [int] IDENTITY(1,1) NOT NULL,
	[Relative_Name] [nvarchar](200) NULL,
	[Relative_Surname] [nvarchar](200) NULL,
	[Relative_Email] [nvarchar](200) NULL,
	[Relative_Address] [nvarchar](200) NULL,
	[Relative_PostalAddress] [nvarchar](200) NULL,
	[Relative_Home_Tel] [nvarchar](200) NULL,
	[Relative_Work_Tel] [nvarchar](200) NULL,
	[Relative_Cell] [nvarchar](200) NULL,
	[Relationship] [nvarchar](200) NULL,
	[Adopter_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Relative_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adopter_Status]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adopter_Status](
	[Adopter_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adopter_Status_Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Adopter_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adoption]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adoption](
	[Adoption_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adoption_Date] [datetime] NULL,
	[Adoption_Form] [varchar](max) NULL,
	[Payment_ID] [int] NULL,
	[Adopter_ID] [int] NULL,
	[Adopt_Status_ID] [int] NULL,
	[Animal_ID] [int] NULL,
	[Collection_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Adoption_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Adoption_Status]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adoption_Status](
	[Adopt_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Adopt_Status_Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Adopt_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Animal]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Animal](
	[Animal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Image] [varchar](max) NULL,
	[Animal_Name] [varchar](150) NULL,
	[Animal_Description] [varchar](200) NULL,
	[Animal_Gender] [varchar](50) NULL,
	[Animal_Age] [int] NULL,
	[Animal_Sterilization] [bit] NULL,
	[Animal_Castration] [bit] NULL,
	[Animal_Size] [varchar](10) NULL,
	[Animal_Entry_Date] [datetime] NULL,
	[Animal_Coat] [varchar](100) NULL,
	[Animal_Status_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Animal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Animal_Breed]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Breed](
	[Animal_Breed_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Breed_Name] [nvarchar](200) NULL,
	[Animal_Breed_Description] [nvarchar](200) NULL,
	[Animal_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Animal_Breed_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Animal_Kennel_History]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Kennel_History](
	[Animal_Kennel_History_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_ID] [int] NULL,
	[Kennel_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Animal_Kennel_History_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Animal_Status]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Status](
	[Animal_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Status_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Animal_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Animal_Treatment]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Animal_Treatment](
	[Treat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Treat_StartDate] [date] NULL,
	[Treat_EndDate] [date] NULL,
	[Treat_Quantity] [int] NULL,
	[Treat_Regularity] [varchar](50) NULL,
	[Treat_Name] [varchar](150) NULL,
	[Treat_cost] [decimal](18, 0) NULL,
	[Capture_Medical_Card_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Treat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Animal_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Type](
	[Animal_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Type_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Animal_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audit_Log]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Audit_Log](
	[Auditlog_ID] [int] IDENTITY(1,1) NOT NULL,
	[Auditlog_DateTime] [datetime] NULL,
	[Transaction_Type] [varchar](1) NULL,
	[Critical_Date] [varchar](1) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Auditlog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Capture_Medical_Card]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capture_Medical_Card](
	[Capture_Medical_Card_ID] [int] IDENTITY(1,1) NOT NULL,
	[Diagnosis_Details] [nvarchar](254) NULL,
	[Capture_Medical_Card_Date] [datetime] NULL,
	[Capture_Medical_Card_NextAppointment_Date] [datetime] NULL,
	[Vet_Appoint_Line_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Capture_Medical_Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CrossBreed]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrossBreed](
	[CrossBreed_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_ID] [int] NULL,
	[Animal_Breed_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CrossBreed_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Event]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_Event](
	[Customer_Event_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Event_Name] [varchar](150) NULL,
	[Customer_Event_Surname] [varchar](150) NULL,
	[Customer_Event_Email] [nvarchar](254) NULL,
	[Number_of_tickects] [int] NULL,
	[TicketFee_Date] [datetime] NULL,
	[TicketFee_Total] [decimal](15, 0) NULL,
	[Event_ID] [int] NULL,
	[Payment_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[Donation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donation_Date] [datetime] NULL,
	[Donor_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Donation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donation_Line]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation_Line](
	[Donation_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donation_Quantity] [decimal](15, 0) NULL,
	[Stock_ID] [int] NULL,
	[Donation_ID] [int] NULL,
	[Donation_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Donation_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donation_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation_Type](
	[Donation_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donation_Type_Name] [nvarchar](600) NULL,
	[Donation_Type_Description] [nvarchar](600) NULL,
PRIMARY KEY CLUSTERED 
(
	[Donation_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donor]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Donor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donor_Name] [nvarchar](200) NULL,
	[Donor_Surname] [nvarchar](200) NULL,
	[Donor_Email] [nvarchar](200) NULL,
	[Title_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Donor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emp_Kennel]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_Kennel](
	[Emp_Kennel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [int] NULL,
	[Kennel_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_Kennel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Name] [nvarchar](150) NULL,
	[Emp_Surname] [varchar](150) NULL,
	[Emp_ContactNumber] [nvarchar](12) NULL,
	[Emp_IDNumber] [nvarchar](150) NULL,
	[Emp_Email] [nvarchar](254) NULL,
	[Emp_Contract] [nvarchar](254) NULL,
	[Emp_Date_Employed] [date] NULL,
	[Title_ID] [int] NULL,
	[Emp_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee_Status]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Status](
	[Employee_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Status_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Type](
	[Emp_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Type_Name] [nvarchar](50) NULL,
	[Emp_Type_Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event_](
	[Event_ID] [int] IDENTITY(1,1) NOT NULL,
	[Event_Name] [varchar](150) NULL,
	[Event_StartTime] [datetime] NULL,
	[Event_EndTime] [datetime] NULL,
	[Event_Guest_Number] [int] NULL,
	[Event_Ticket_Price] [decimal](12, 0) NULL,
	[Event_Location] [varchar](200) NULL,
	[Event_Description] [varchar](200) NULL,
	[Event_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Event_Schedule]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Schedule](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Start] [datetime] NOT NULL,
	[EventEnd] [datetime] NULL,
	[ThemeColour] [nchar](10) NULL,
	[IsFullDay] [bit] NULL,
 CONSTRAINT [PK_Event_Schedule] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Type](
	[Event_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Event_Type_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Event_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Foster_Care]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foster_Care](
	[Foster_Care_ID] [int] IDENTITY(1,1) NOT NULL,
	[Foster_Care_Period] [varchar](200) NULL,
	[Foster_Start_Date] [date] NULL,
	[Foster_Parent_ID] [int] NULL,
	[Animal_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Foster_Care_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Foster_Care_Parent]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foster_Care_Parent](
	[Foster_Parent_ID] [int] IDENTITY(1,1) NOT NULL,
	[Foster_Parent_Name] [varchar](200) NULL,
	[Foster_Parent_Surname] [varchar](200) NULL,
	[Foster_Parent_Address] [varchar](200) NULL,
	[Foster_Parent_CellNumber] [varchar](200) NULL,
	[Foster_Parent_WorkNumber] [varchar](200) NULL,
	[Foster_Parent_Email] [varchar](200) NULL,
	[Foster_Parent_IDNumber] [int] NULL,
	[Foster_Parent_Last_Modified] [datetime] NULL,
	[Num_In_Household] [int] NULL,
	[Type_Of_Housing] [varchar](200) NULL,
	[Ownership_Housing] [varchar](200) NULL,
	[Hours_Left_Alone] [int] NULL,
	[Adopter_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Foster_Parent_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HomeCheck]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeCheck](
	[HomeCheck_ID] [int] IDENTITY(1,1) NOT NULL,
	[HomeCheck_Datetime] [datetime] NULL,
	[Adoption_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeCheck_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kennel]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kennel](
	[Kennel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Kennel_Name] [nvarchar](200) NULL,
	[Kennel_Number] [int] NULL,
	[Kennel_Capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Kennel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Microchip]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Microchip](
	[Microchip_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Microchip_Code] [nvarchar](50) NULL,
	[Date_of_Implant] [date] NULL,
	[Implanters_PIN_Number] [nvarchar](10) NULL,
	[Owner_Name] [varchar](200) NULL,
	[Owner_Address] [varchar](200) NULL,
	[Animal_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Microchip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Packaging_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packaging_Type](
	[Packaging_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Packaging_Type_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Packaging_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Description] [nvarchar](200) NULL,
	[Amount_Paid] [decimal](15, 0) NULL,
	[Payment_Date] [datetime] NULL,
	[Payment_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[Payment_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Type_Name] [nvarchar](100) NULL,
	[Payment_Type_Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role_]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock_Name] [nvarchar](200) NULL,
	[Stock_Quantity] [int] NULL,
	[Stock_Description] [nvarchar](200) NULL,
	[Stock_Type_ID] [int] NULL,
	[Packaging_Type_ID] [int] NULL,
	[Unit_Type_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Type](
	[Stock_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock_Type_Name] [nvarchar](100) NULL,
	[Stock_Type_Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stock_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheet_ID] [int] IDENTITY(1,1) NOT NULL,
	[Check_in] [datetime] NULL,
	[Check_out] [datetime] NULL,
	[Emp_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeSheet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Title]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[Title_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title_Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Type](
	[Unit_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Type_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unit_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](150) NULL,
	[Emp_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRole_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Role_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vet_Appointment]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet_Appointment](
	[Vet_Appointment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vet_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vet_Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vet_Appointment_Line]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet_Appointment_Line](
	[Vet_Appoint_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vet_Appoint_Line_Status] [int] NULL,
	[Animal_ID] [int] NULL,
	[Vet_Appointment_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vet_Appoint_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Veterinarian]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veterinarian](
	[Vet_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vet_Name] [nvarchar](150) NULL,
	[Vet_Emial] [nvarchar](254) NULL,
	[Vet_Tel] [nvarchar](15) NULL,
	[Vet_Address] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[Vol_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vol_Name] [nvarchar](200) NULL,
	[Vol_Surname] [nvarchar](100) NULL,
	[Vol_Email] [nvarchar](254) NULL,
	[Vol_ContactNumber] [nvarchar](15) NULL,
	[Vol_Address] [nvarchar](250) NULL,
	[Vol_Emergency_ContactName] [nvarchar](150) NULL,
	[Vol_Emergency_ContactNumber] [nvarchar](15) NULL,
	[Title_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vol_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Volunteer_Hours]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer_Hours](
	[Vol_Hours_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vol_workDate] [date] NULL,
	[Vol_Start_Time] [datetime] NULL,
	[Vol_End_Time] [datetime] NULL,
	[Vol_ID] [int] NULL,
	[Vol_WorkType_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vol_Hours_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Volunteer_Work_Type]    Script Date: 2019/08/03 23:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer_Work_Type](
	[Vol_WorkType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vol_WorkType_Name] [nvarchar](100) NULL,
	[Vol_WorkType_Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vol_WorkType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Adopter]  WITH CHECK ADD  CONSTRAINT [fkado] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Title] ([Title_ID])
GO
ALTER TABLE [dbo].[Adopter] CHECK CONSTRAINT [fkado]
GO
ALTER TABLE [dbo].[Adopter]  WITH CHECK ADD  CONSTRAINT [fkado1] FOREIGN KEY([Adopter_Status_ID])
REFERENCES [dbo].[Adopter_Status] ([Adopter_Status_ID])
GO
ALTER TABLE [dbo].[Adopter] CHECK CONSTRAINT [fkado1]
GO
ALTER TABLE [dbo].[Adopter_Contract]  WITH CHECK ADD  CONSTRAINT [fkadoc] FOREIGN KEY([Adopter_ID])
REFERENCES [dbo].[Adopter] ([Adopter_ID])
GO
ALTER TABLE [dbo].[Adopter_Contract] CHECK CONSTRAINT [fkadoc]
GO
ALTER TABLE [dbo].[Adopter_Relative]  WITH CHECK ADD  CONSTRAINT [fkador] FOREIGN KEY([Adopter_ID])
REFERENCES [dbo].[Adopter] ([Adopter_ID])
GO
ALTER TABLE [dbo].[Adopter_Relative] CHECK CONSTRAINT [fkador]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [fkadopt] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [fkadopt]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [fkadopt1] FOREIGN KEY([Payment_ID])
REFERENCES [dbo].[Payment] ([Payment_ID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [fkadopt1]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [fkadopt2] FOREIGN KEY([Adopt_Status_ID])
REFERENCES [dbo].[Adoption_Status] ([Adopt_Status_ID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [fkadopt2]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [fkadopt3] FOREIGN KEY([Adopter_ID])
REFERENCES [dbo].[Adopter] ([Adopter_ID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [fkadopt3]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fkani] FOREIGN KEY([Animal_Status_ID])
REFERENCES [dbo].[Animal_Status] ([Animal_Status_ID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fkani]
GO
ALTER TABLE [dbo].[Animal_Breed]  WITH CHECK ADD  CONSTRAINT [fkanibreed] FOREIGN KEY([Animal_Type_ID])
REFERENCES [dbo].[Animal_Type] ([Animal_Type_ID])
GO
ALTER TABLE [dbo].[Animal_Breed] CHECK CONSTRAINT [fkanibreed]
GO
ALTER TABLE [dbo].[Animal_Kennel_History]  WITH CHECK ADD  CONSTRAINT [fkanikh] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[Animal_Kennel_History] CHECK CONSTRAINT [fkanikh]
GO
ALTER TABLE [dbo].[Animal_Kennel_History]  WITH CHECK ADD  CONSTRAINT [fkanikh1] FOREIGN KEY([Kennel_ID])
REFERENCES [dbo].[Kennel] ([Kennel_ID])
GO
ALTER TABLE [dbo].[Animal_Kennel_History] CHECK CONSTRAINT [fkanikh1]
GO
ALTER TABLE [dbo].[Animal_Treatment]  WITH CHECK ADD  CONSTRAINT [fkanitreat] FOREIGN KEY([Capture_Medical_Card_ID])
REFERENCES [dbo].[Capture_Medical_Card] ([Capture_Medical_Card_ID])
GO
ALTER TABLE [dbo].[Animal_Treatment] CHECK CONSTRAINT [fkanitreat]
GO
ALTER TABLE [dbo].[Audit_Log]  WITH CHECK ADD  CONSTRAINT [fkaudlog] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_] ([UserID])
GO
ALTER TABLE [dbo].[Audit_Log] CHECK CONSTRAINT [fkaudlog]
GO
ALTER TABLE [dbo].[Capture_Medical_Card]  WITH CHECK ADD  CONSTRAINT [fkcapmed] FOREIGN KEY([Vet_Appoint_Line_ID])
REFERENCES [dbo].[Vet_Appointment_Line] ([Vet_Appoint_Line_ID])
GO
ALTER TABLE [dbo].[Capture_Medical_Card] CHECK CONSTRAINT [fkcapmed]
GO
ALTER TABLE [dbo].[CrossBreed]  WITH CHECK ADD  CONSTRAINT [fkcrb] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[CrossBreed] CHECK CONSTRAINT [fkcrb]
GO
ALTER TABLE [dbo].[CrossBreed]  WITH CHECK ADD  CONSTRAINT [fkcrb1] FOREIGN KEY([Animal_Breed_ID])
REFERENCES [dbo].[Animal_Breed] ([Animal_Breed_ID])
GO
ALTER TABLE [dbo].[CrossBreed] CHECK CONSTRAINT [fkcrb1]
GO
ALTER TABLE [dbo].[Customer_Event]  WITH CHECK ADD  CONSTRAINT [fkcevnt] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event_] ([Event_ID])
GO
ALTER TABLE [dbo].[Customer_Event] CHECK CONSTRAINT [fkcevnt]
GO
ALTER TABLE [dbo].[Customer_Event]  WITH CHECK ADD  CONSTRAINT [fkcevnt1] FOREIGN KEY([Payment_ID])
REFERENCES [dbo].[Payment] ([Payment_ID])
GO
ALTER TABLE [dbo].[Customer_Event] CHECK CONSTRAINT [fkcevnt1]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [fkdon] FOREIGN KEY([Donor_ID])
REFERENCES [dbo].[Donor] ([Donor_ID])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [fkdon]
GO
ALTER TABLE [dbo].[Donation_Line]  WITH CHECK ADD  CONSTRAINT [fkdonl] FOREIGN KEY([Stock_ID])
REFERENCES [dbo].[Stock] ([Stock_ID])
GO
ALTER TABLE [dbo].[Donation_Line] CHECK CONSTRAINT [fkdonl]
GO
ALTER TABLE [dbo].[Donation_Line]  WITH CHECK ADD  CONSTRAINT [fkdonl1] FOREIGN KEY([Donation_ID])
REFERENCES [dbo].[Donation] ([Donation_ID])
GO
ALTER TABLE [dbo].[Donation_Line] CHECK CONSTRAINT [fkdonl1]
GO
ALTER TABLE [dbo].[Donation_Line]  WITH CHECK ADD  CONSTRAINT [fkdonl2] FOREIGN KEY([Donation_Type_ID])
REFERENCES [dbo].[Donation_Type] ([Donation_Type_ID])
GO
ALTER TABLE [dbo].[Donation_Line] CHECK CONSTRAINT [fkdonl2]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [fkdonor] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Title] ([Title_ID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [fkdonor]
GO
ALTER TABLE [dbo].[Emp_Kennel]  WITH CHECK ADD  CONSTRAINT [fkempk] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Emp_Kennel] CHECK CONSTRAINT [fkempk]
GO
ALTER TABLE [dbo].[Emp_Kennel]  WITH CHECK ADD  CONSTRAINT [fkempk1] FOREIGN KEY([Kennel_ID])
REFERENCES [dbo].[Kennel] ([Kennel_ID])
GO
ALTER TABLE [dbo].[Emp_Kennel] CHECK CONSTRAINT [fkempk1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fkemp] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Title] ([Title_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fkemp]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fkemp1] FOREIGN KEY([Emp_Type_ID])
REFERENCES [dbo].[Employee_Type] ([Emp_Type_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fkemp1]
GO
ALTER TABLE [dbo].[Event_]  WITH CHECK ADD  CONSTRAINT [fkevnt] FOREIGN KEY([Event_Type_ID])
REFERENCES [dbo].[Event_Type] ([Event_Type_ID])
GO
ALTER TABLE [dbo].[Event_] CHECK CONSTRAINT [fkevnt]
GO
ALTER TABLE [dbo].[Foster_Care]  WITH CHECK ADD  CONSTRAINT [fkfosc] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[Foster_Care] CHECK CONSTRAINT [fkfosc]
GO
ALTER TABLE [dbo].[Foster_Care]  WITH CHECK ADD  CONSTRAINT [fkfosc1] FOREIGN KEY([Foster_Parent_ID])
REFERENCES [dbo].[Foster_Care_Parent] ([Foster_Parent_ID])
GO
ALTER TABLE [dbo].[Foster_Care] CHECK CONSTRAINT [fkfosc1]
GO
ALTER TABLE [dbo].[Foster_Care_Parent]  WITH CHECK ADD  CONSTRAINT [fkfos] FOREIGN KEY([Adopter_ID])
REFERENCES [dbo].[Adopter] ([Adopter_ID])
GO
ALTER TABLE [dbo].[Foster_Care_Parent] CHECK CONSTRAINT [fkfos]
GO
ALTER TABLE [dbo].[HomeCheck]  WITH CHECK ADD  CONSTRAINT [fkhoch] FOREIGN KEY([Adoption_ID])
REFERENCES [dbo].[Adoption] ([Adoption_ID])
GO
ALTER TABLE [dbo].[HomeCheck] CHECK CONSTRAINT [fkhoch]
GO
ALTER TABLE [dbo].[Microchip]  WITH CHECK ADD  CONSTRAINT [fkmicro] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[Microchip] CHECK CONSTRAINT [fkmicro]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fkpay] FOREIGN KEY([Payment_Type_ID])
REFERENCES [dbo].[Payment_Type] ([Payment_Type_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fkpay]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [fkstock] FOREIGN KEY([Stock_Type_ID])
REFERENCES [dbo].[Stock_Type] ([Stock_Type_ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [fkstock]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [fkstock1] FOREIGN KEY([Packaging_Type_ID])
REFERENCES [dbo].[Packaging_Type] ([Packaging_Type_ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [fkstock1]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [fkstock2] FOREIGN KEY([Unit_Type_ID])
REFERENCES [dbo].[Unit_Type] ([Unit_Type_ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [fkstock2]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [fktime] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [fktime]
GO
ALTER TABLE [dbo].[User_]  WITH CHECK ADD  CONSTRAINT [fkuser] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[User_] CHECK CONSTRAINT [fkuser]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [fkuserol] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [fkuserol]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [fkuserol1] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role_] ([Role_ID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [fkuserol1]
GO
ALTER TABLE [dbo].[Vet_Appointment]  WITH CHECK ADD  CONSTRAINT [fkvetap] FOREIGN KEY([Vet_ID])
REFERENCES [dbo].[Veterinarian] ([Vet_ID])
GO
ALTER TABLE [dbo].[Vet_Appointment] CHECK CONSTRAINT [fkvetap]
GO
ALTER TABLE [dbo].[Vet_Appointment_Line]  WITH CHECK ADD  CONSTRAINT [fkvetapl] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[Vet_Appointment_Line] CHECK CONSTRAINT [fkvetapl]
GO
ALTER TABLE [dbo].[Vet_Appointment_Line]  WITH CHECK ADD  CONSTRAINT [fkvetapl1] FOREIGN KEY([Vet_Appointment_ID])
REFERENCES [dbo].[Vet_Appointment] ([Vet_Appointment_ID])
GO
ALTER TABLE [dbo].[Vet_Appointment_Line] CHECK CONSTRAINT [fkvetapl1]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [fkvol] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Title] ([Title_ID])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [fkvol]
GO
ALTER TABLE [dbo].[Volunteer_Hours]  WITH CHECK ADD  CONSTRAINT [fkvolhrs] FOREIGN KEY([Vol_ID])
REFERENCES [dbo].[Volunteer] ([Vol_ID])
GO
ALTER TABLE [dbo].[Volunteer_Hours] CHECK CONSTRAINT [fkvolhrs]
GO
ALTER TABLE [dbo].[Volunteer_Hours]  WITH CHECK ADD  CONSTRAINT [fkvolhrs1] FOREIGN KEY([Vol_WorkType_ID])
REFERENCES [dbo].[Volunteer_Work_Type] ([Vol_WorkType_ID])
GO
ALTER TABLE [dbo].[Volunteer_Hours] CHECK CONSTRAINT [fkvolhrs1]
GO
USE [master]
GO
ALTER DATABASE [Wollies_Shelter] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [NeverlandDB]    Script Date: 11/03/2023 07:50:45 p. m. ******/
CREATE DATABASE [NeverlandDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NeverlandDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NeverlandDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NeverlandDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NeverlandDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NeverlandDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NeverlandDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NeverlandDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NeverlandDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NeverlandDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NeverlandDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NeverlandDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NeverlandDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NeverlandDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NeverlandDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NeverlandDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NeverlandDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NeverlandDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NeverlandDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NeverlandDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NeverlandDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NeverlandDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NeverlandDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NeverlandDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NeverlandDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NeverlandDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NeverlandDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NeverlandDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NeverlandDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NeverlandDB] SET RECOVERY FULL 
GO
ALTER DATABASE [NeverlandDB] SET  MULTI_USER 
GO
ALTER DATABASE [NeverlandDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NeverlandDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NeverlandDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NeverlandDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NeverlandDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NeverlandDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NeverlandDB', N'ON'
GO
ALTER DATABASE [NeverlandDB] SET QUERY_STORE = OFF
GO
USE [NeverlandDB]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[IDArea] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartSchedule] [int] NOT NULL,
	[FinishSchedule] [int] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[IDArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidence]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidence](
	[IDIncidence] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [bigint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](280) NOT NULL,
	[Finished] [bit] NOT NULL,
 CONSTRAINT [PK_Incidence] PRIMARY KEY CLUSTERED 
(
	[IDIncidence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[IDNews] [int] NOT NULL,
	[IDCategory] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Archive] [varbinary](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IDNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[IDCategory] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NewsCategory] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentItem]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentItem](
	[IDItem] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_PaymentItem] PRIMARY KEY CLUSTERED 
(
	[IDItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentPlan]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentPlan](
	[IDPlan] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](280) NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK_PaymentPlan] PRIMARY KEY CLUSTERED 
(
	[IDPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanAssignment]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanAssignment](
	[IDAssignment] [int] IDENTITY(1,1) NOT NULL,
	[IDPlan] [int] NOT NULL,
	[IDResidence] [int] NOT NULL,
	[AssignmentDate] [date] NOT NULL,
	[PayedStatus] [bit] NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_PlanAssignment] PRIMARY KEY CLUSTERED 
(
	[IDAssignment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanItem]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanItem](
	[IDPlan] [int] NOT NULL,
	[IDItem] [int] NOT NULL,
 CONSTRAINT [PK_PlanItem] PRIMARY KEY CLUSTERED 
(
	[IDPlan] ASC,
	[IDItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[IDReservation] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [bigint] NOT NULL,
	[IDArea] [int] NOT NULL,
	[Start] [datetime] NOT NULL,
	[Finish] [datetime] NOT NULL,
	[Approved] [bit] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[IDReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residence]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residence](
	[IDResidence] [int] NOT NULL,
	[IDUser] [bigint] NOT NULL,
	[Habitants] [int] NOT NULL,
	[StartYear] [int] NOT NULL,
	[InConstruction] [bit] NOT NULL,
 CONSTRAINT [PK_Residence] PRIMARY KEY CLUSTERED 
(
	[IDResidence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [bigint] NOT NULL,
	[IDRole] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/03/2023 07:50:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[IDRole] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Area] ([IDArea], [Name], [StartSchedule], [FinishSchedule]) VALUES (1, N'Pool', 7, 20)
INSERT [dbo].[Area] ([IDArea], [Name], [StartSchedule], [FinishSchedule]) VALUES (2, N'Amphitheater', 17, 23)
INSERT [dbo].[Area] ([IDArea], [Name], [StartSchedule], [FinishSchedule]) VALUES (3, N'Events Room', 12, 22)
GO
SET IDENTITY_INSERT [dbo].[Incidence] ON 

INSERT [dbo].[Incidence] ([IDIncidence], [IDUser], [Title], [Description], [Finished]) VALUES (1, 118710756, N'WI-FI is not working', N'I was at the food area trying to do my remote work, and the Wifi was not working at all, I has not since the last 3 days.', 0)
INSERT [dbo].[Incidence] ([IDIncidence], [IDUser], [Title], [Description], [Finished]) VALUES (2, 205880120, N'Neighbours do too much noise', N'Me and my family can not get sleep because of the neighbors, they play music 24/7.', 0)
INSERT [dbo].[Incidence] ([IDIncidence], [IDUser], [Title], [Description], [Finished]) VALUES (3, 502270987, N'Bad Smells', N'I was trying to use the pool and something smells like a dead animal near by.', 1)
INSERT [dbo].[Incidence] ([IDIncidence], [IDUser], [Title], [Description], [Finished]) VALUES (4, 306870224, N'Only jazz music at food area', N':p', 0)
SET IDENTITY_INSERT [dbo].[Incidence] OFF
GO
INSERT [dbo].[News] ([IDNews], [IDCategory], [Description], [Archive]) VALUES (3, 3, N'Underage residents can`t use the bar', NULL)
GO
INSERT [dbo].[NewsCategory] ([IDCategory], [Description]) VALUES (1, N'News')
INSERT [dbo].[NewsCategory] ([IDCategory], [Description]) VALUES (2, N'Reminders')
INSERT [dbo].[NewsCategory] ([IDCategory], [Description]) VALUES (3, N'Rules')
GO
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (1, N'Cleaning', 20.0000)
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (2, N'Security', 30.0000)
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (3, N'Right to Areas', 10.0000)
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (4, N'Food', 40.0000)
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (5, N'Gardening', 15.0000)
INSERT [dbo].[PaymentItem] ([IDItem], [Description], [Price]) VALUES (6, N'Priority', 50.0000)
GO
INSERT [dbo].[PaymentPlan] ([IDPlan], [Name], [Description], [Total]) VALUES (1, N'Basic', N'Includes Security, Cleaning and Right to Areas', 90.0000)
INSERT [dbo].[PaymentPlan] ([IDPlan], [Name], [Description], [Total]) VALUES (2, N'Deluxe', N'Includes Basic, plus Food', 110.0000)
INSERT [dbo].[PaymentPlan] ([IDPlan], [Name], [Description], [Total]) VALUES (3, N'Premium', N'Includes Deluxe plus Gardening and Priority', 180.0000)
GO
SET IDENTITY_INSERT [dbo].[PlanAssignment] ON 

INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (1, 1, 1, CAST(N'2021-12-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (2, 1, 1, CAST(N'2022-01-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (3, 1, 1, CAST(N'2022-02-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (4, 1, 1, CAST(N'2022-03-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (5, 1, 1, CAST(N'2022-04-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (6, 1, 1, CAST(N'2022-05-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (7, 1, 1, CAST(N'2022-06-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (8, 1, 1, CAST(N'2022-07-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (9, 1, 1, CAST(N'2022-08-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (10, 1, 1, CAST(N'2022-09-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (11, 1, 1, CAST(N'2022-10-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (12, 1, 1, CAST(N'2022-11-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (13, 1, 1, CAST(N'2022-12-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (14, 1, 1, CAST(N'2023-01-15' AS Date), 1, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (15, 1, 1, CAST(N'2023-02-15' AS Date), 0, 80.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (16, 2, 2, CAST(N'2023-07-17' AS Date), 0, 110.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (17, 3, 3, CAST(N'2024-01-01' AS Date), 0, 180.0000)
INSERT [dbo].[PlanAssignment] ([IDAssignment], [IDPlan], [IDResidence], [AssignmentDate], [PayedStatus], [Amount]) VALUES (18, 3, 1, CAST(N'2023-02-24' AS Date), 0, 180.0000)
SET IDENTITY_INSERT [dbo].[PlanAssignment] OFF
GO
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (1, 1)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (1, 2)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (1, 3)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (1, 4)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (2, 1)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (2, 2)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (2, 3)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (2, 4)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 1)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 2)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 3)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 4)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 5)
INSERT [dbo].[PlanItem] ([IDPlan], [IDItem]) VALUES (3, 6)
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([IDReservation], [IDUser], [IDArea], [Start], [Finish], [Approved]) VALUES (1, 502270987, 1, CAST(N'2023-02-09T11:22:33.233' AS DateTime), CAST(N'2023-09-02T15:30:00.000' AS DateTime), 0)
INSERT [dbo].[Reservation] ([IDReservation], [IDUser], [IDArea], [Start], [Finish], [Approved]) VALUES (5, 205880120, 3, CAST(N'2023-02-14T15:30:00.000' AS DateTime), CAST(N'2023-02-14T18:00:00.000' AS DateTime), 0)
INSERT [dbo].[Reservation] ([IDReservation], [IDUser], [IDArea], [Start], [Finish], [Approved]) VALUES (6, 502270987, 2, CAST(N'2023-07-19T18:30:00.000' AS DateTime), CAST(N'2023-07-19T21:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
INSERT [dbo].[Residence] ([IDResidence], [IDUser], [Habitants], [StartYear], [InConstruction]) VALUES (1, 502270987, 4, 2021, 0)
INSERT [dbo].[Residence] ([IDResidence], [IDUser], [Habitants], [StartYear], [InConstruction]) VALUES (2, 205880120, 4, 2023, 0)
INSERT [dbo].[Residence] ([IDResidence], [IDUser], [Habitants], [StartYear], [InConstruction]) VALUES (3, 118710756, 5, 2024, 1)
GO
INSERT [dbo].[User] ([IDUser], [IDRole], [FirstName], [LastName], [Email], [Password], [Active]) VALUES (118710756, 1, N'Alfredo', N'Suárez', N'lusuarezag@est.utn.ac.cr', N'123', 1)
INSERT [dbo].[User] ([IDUser], [IDRole], [FirstName], [LastName], [Email], [Password], [Active]) VALUES (205880120, 2, N'Catalina', N'Aguilar', N'caguilar@capris.com', N'123', 0)
INSERT [dbo].[User] ([IDUser], [IDRole], [FirstName], [LastName], [Email], [Password], [Active]) VALUES (208190342, 1, N'Yoryina', N'Blanco', N'yblanco@est.utn.ac.cr', N'123', 1)
INSERT [dbo].[User] ([IDUser], [IDRole], [FirstName], [LastName], [Email], [Password], [Active]) VALUES (306870224, 2, N'Luis', N'Pérez', N'jperez@capris.com', N'123', 0)
INSERT [dbo].[User] ([IDUser], [IDRole], [FirstName], [LastName], [Email], [Password], [Active]) VALUES (502270987, 2, N'Juan', N'Blanco', N'jblanco@finca.cr', N'㌴ㄲ', 1)
GO
INSERT [dbo].[UserRole] ([IDRole], [Description]) VALUES (1, N'Administrator')
INSERT [dbo].[UserRole] ([IDRole], [Description]) VALUES (2, N'Resident')
GO
ALTER TABLE [dbo].[Incidence]  WITH CHECK ADD  CONSTRAINT [FK_Incidence_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Incidence] CHECK CONSTRAINT [FK_Incidence_User]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsCategory] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[NewsCategory] ([IDCategory])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_NewsCategory]
GO
ALTER TABLE [dbo].[PlanAssignment]  WITH CHECK ADD  CONSTRAINT [FK_PlanAssignment_PaymentPlan] FOREIGN KEY([IDPlan])
REFERENCES [dbo].[PaymentPlan] ([IDPlan])
GO
ALTER TABLE [dbo].[PlanAssignment] CHECK CONSTRAINT [FK_PlanAssignment_PaymentPlan]
GO
ALTER TABLE [dbo].[PlanAssignment]  WITH CHECK ADD  CONSTRAINT [FK_PlanAssignment_Residence] FOREIGN KEY([IDResidence])
REFERENCES [dbo].[Residence] ([IDResidence])
GO
ALTER TABLE [dbo].[PlanAssignment] CHECK CONSTRAINT [FK_PlanAssignment_Residence]
GO
ALTER TABLE [dbo].[PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_PlanItem_PaymentItem] FOREIGN KEY([IDItem])
REFERENCES [dbo].[PaymentItem] ([IDItem])
GO
ALTER TABLE [dbo].[PlanItem] CHECK CONSTRAINT [FK_PlanItem_PaymentItem]
GO
ALTER TABLE [dbo].[PlanItem]  WITH CHECK ADD  CONSTRAINT [FK_PlanItem_PaymentPlan] FOREIGN KEY([IDPlan])
REFERENCES [dbo].[PaymentPlan] ([IDPlan])
GO
ALTER TABLE [dbo].[PlanItem] CHECK CONSTRAINT [FK_PlanItem_PaymentPlan]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Area] FOREIGN KEY([IDArea])
REFERENCES [dbo].[Area] ([IDArea])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Area]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_User]
GO
ALTER TABLE [dbo].[Residence]  WITH CHECK ADD  CONSTRAINT [FK_Residence_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Residence] CHECK CONSTRAINT [FK_Residence_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([IDRole])
REFERENCES [dbo].[UserRole] ([IDRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
USE [master]
GO
ALTER DATABASE [NeverlandDB] SET  READ_WRITE 
GO

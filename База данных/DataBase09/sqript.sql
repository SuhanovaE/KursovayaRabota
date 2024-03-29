USE [master]
GO
/****** Object:  Database [JewelryShop]    Script Date: 09.03.2023 19:34:30 ******/
CREATE DATABASE [JewelryShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JewelryShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JewelryShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JewelryShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JewelryShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JewelryShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JewelryShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JewelryShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JewelryShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JewelryShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JewelryShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JewelryShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JewelryShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JewelryShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JewelryShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JewelryShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JewelryShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JewelryShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JewelryShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JewelryShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JewelryShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JewelryShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JewelryShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JewelryShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JewelryShop] SET  MULTI_USER 
GO
ALTER DATABASE [JewelryShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JewelryShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JewelryShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JewelryShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JewelryShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JewelryShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JewelryShop] SET QUERY_STORE = OFF
GO
USE [JewelryShop]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_clients] [int] IDENTITY(1,1) NOT NULL,
	[lastname] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id_clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id_discount] [int] IDENTITY(1,1) NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id_discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jewel]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jewel](
	[id_jewel] [int] IDENTITY(1,1) NOT NULL,
	[weight] [float] NULL,
	[material] [nvarchar](50) NULL,
	[fk_type] [int] NULL,
	[stones] [nvarchar](50) NULL,
 CONSTRAINT [PK_Jewel] PRIMARY KEY CLUSTERED 
(
	[id_jewel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[date_adoption] [date] NULL,
	[date_issue] [date] NULL,
	[fk_clients] [int] NULL,
	[fk_jewel] [int] NULL,
	[fk_service] [int] NULL,
	[price] [int] NULL,
	[fk_discount] [int] NULL,
	[jewelPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id_service] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 09.03.2023 19:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id_type] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (1, N'Нефедова', N'Елена', N'Дмитриевна', N'89478456345')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (2, N'Никитин', N'Фёдор', N'Тимофеевич', N'89003567876')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (3, N'Борисов', N'Кирилл', N'Ильич', N'89234765898')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (4, N'Данилова', N'София', N'Кирилловна', N'89278569834')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (5, N'Федотова', N'Амина', N'Леонидовна', N'89265873999')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (6, N'Журавлёва', N'Алиса', N'Олеговна', N'89478447860')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (7, N'Сергеева', N'Светлана', N'Богдановна', N'89308793758')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (8, N'Лапина', N'Мария', N'Михаловна', N'89479874623')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (9, N'Боброва', N'Виктория', N'Михайловна', N'89375878934')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (10, N'Золотова', N'Александра', N'Матвеевна', N'89278573499')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (11, N'Николаев', N'Кирилл', N'Александрович', N'89387848926')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (12, N'Антонова', N'София', N'Дмитриевна', N'89002679879')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (13, N'Борисова', N'Виктория', N'Матвеевна', N'89337865768')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (14, N'Мальцева', N'Екатерина', N'Семёновна', N'89378876567')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (15, N'Кузнецов', N'Михаил', N'Андреевич', N'89378564588')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (16, N'Руднев', N'Глеб', N'Давидович', N'89478763646')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (17, N'Баранов', N'Лев', N'Артурович', N'89375654788')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (18, N'Федосеева', N'Дарья', N'Львовна', N'89377659898')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (19, N'Беляев', N'Андрей', N'Семёнович', N'89376781122')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (20, N'Балашов', N'Артём', N'Никитич', N'89378598756')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (21, N'Кочетова', N'Варвара', N'Ивановна', N'89479802748')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (22, N'Николаев', N'Андрей', N'Михайлович', N'89378889866')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (23, N'Королёв', N'Михаил', N'Романович', N'89478654543')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (24, N'Шилова', N'Ксения', N'Констатиновна', N'89487233435')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (25, N'Петров', N'Макар', N'Даниилович', N'89376598675')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (26, N'Александрова', N'Виктория', N'Ивановна', N'89472465476')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (27, N'Романов', N'Иван', N'Александрович', N'89472836567')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (28, N'Чернова', N'Ева', N'Викторовна', N'89378756544')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (29, N'Леонова', N'Мария', N'Владиславовна', N'89467657876')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (30, N'Николаева', N'Анастасия', N'Георгиевна', N'89398567234')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id_discount], [discount]) VALUES (1, 5)
INSERT [dbo].[Discount] ([id_discount], [discount]) VALUES (2, 10)
INSERT [dbo].[Discount] ([id_discount], [discount]) VALUES (3, 15)
INSERT [dbo].[Discount] ([id_discount], [discount]) VALUES (4, 20)
INSERT [dbo].[Discount] ([id_discount], [discount]) VALUES (5, 25)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Jewel] ON 

INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (1, 5.4, N'Белое золото 585', 1, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (2, 0.75, N'Красное золото 585', 2, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (3, 1.04, N'Красное золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (4, 14.4, N'Красное золото 585', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (5, 2.15, N'Красное золото 585', 5, N'Жемчуг')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (6, 1.29, N'Белое золото 585', 6, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (8, 6.56, N'Белое золото 585', 1, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (9, 1.45, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (10, 2.03, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (11, 0.85, N'Красное золото 585', 2, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (12, 2.2, N'Красное золото 585', 6, N'Изумруд')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (13, 6.54, N'Золочёное серебро 925', 5, N'Раухтопаз')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (14, 6.46, N'Красное золото 585', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (15, 1.66, N'Белое золото 585', 2, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (16, 3.97, N'Красное золото 585', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (17, 1.68, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (18, 4.81, N'Родированное серебро 925', 5, N'Корунд')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (19, 1.83, N'Белое золото 585', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (20, 3.37, N'Красное золото 585', 1, N'Топаз')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (21, 0.97, N'Красное золото 585', 6, N'Жемчуг')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (22, 2.03, N'Белое золото 585', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (23, 2.25, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (24, 1.56, N'Белое золото 585', 2, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (25, 5.91, N'Родированное серебро 925', 1, N'Фианит')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (26, 8.7, N'Родированное серебро 925', 5, N'Жемчуг')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (27, 4.23, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (28, 1.15, N'Красное золото 585', 6, N'Топаз')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (29, 2.86, N'Белое золото 585', 3, N'Бриллиант')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (30, 1.44, N'Родированное серебро 925', 4, N'Отсутствует')
INSERT [dbo].[Jewel] ([id_jewel], [weight], [material], [fk_type], [stones]) VALUES (31, 2.28, N'Белое золото 585', 2, N'Бриллиант')
SET IDENTITY_INSERT [dbo].[Jewel] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (1, CAST(N'2022-09-10' AS Date), CAST(N'2022-09-19' AS Date), 1, 1, 5, 2500, 2, N'\Images\note1.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (2, CAST(N'2022-09-10' AS Date), CAST(N'2022-09-15' AS Date), 2, 2, 6, 5000, 5, N'\Images\note2.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (3, CAST(N'2022-09-11' AS Date), CAST(N'2022-09-21' AS Date), 3, 3, 5, 2000, 2, N'\Images\note3.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (4, CAST(N'2022-09-13' AS Date), CAST(N'2022-09-25' AS Date), 4, 4, 8, 500, NULL, N'\Images\note4.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (5, CAST(N'2022-09-13' AS Date), CAST(N'2022-09-21' AS Date), 5, 5, 5, 2500, 2, N'\Images\note5.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (6, CAST(N'2022-09-13' AS Date), CAST(N'2022-09-18' AS Date), 6, 6, 6, 4500, 4, N'\Images\note6.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (7, CAST(N'2022-09-14' AS Date), CAST(N'2022-09-26' AS Date), 7, 8, 7, 800, NULL, N'\Images\note8.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (8, CAST(N'2022-09-16' AS Date), CAST(N'2022-09-23' AS Date), 8, 9, 3, 500, NULL, N'\Images\note9.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (9, CAST(N'2022-09-16' AS Date), CAST(N'2022-09-25' AS Date), 9, 10, 4, 800, NULL, N'\Images\note10.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (10, CAST(N'2022-09-17' AS Date), CAST(N'2022-09-22' AS Date), 10, 11, 5, 1200, 1, N'\Images\note11.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (11, CAST(N'2022-09-17' AS Date), CAST(N'2022-09-30' AS Date), 11, 12, 6, 3100, 3, N'\Images\note12.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (12, CAST(N'2022-09-18' AS Date), CAST(N'2022-09-29' AS Date), 12, 13, 2, 400, NULL, N'\Images\note13.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (13, CAST(N'2022-09-18' AS Date), CAST(N'2022-09-25' AS Date), 13, 14, 3, 600, NULL, N'\Images\note14.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (14, CAST(N'2022-09-18' AS Date), CAST(N'2022-09-30' AS Date), 14, 15, 6, 4600, 4, N'\Images\note15.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (15, CAST(N'2022-09-19' AS Date), CAST(N'2022-10-01' AS Date), 15, 16, 7, 1100, 1, N'\Images\note16.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (16, CAST(N'2022-09-19' AS Date), CAST(N'2022-10-02' AS Date), 16, 17, 4, 2300, 2, N'\Images\note17.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (17, CAST(N'2022-09-20' AS Date), CAST(N'2022-10-01' AS Date), 17, 18, 3, 600, NULL, N'\Images\note18.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (18, CAST(N'2022-09-20' AS Date), CAST(N'2022-10-01' AS Date), 18, 19, 2, 450, NULL, N'\Images\note19.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (19, CAST(N'2022-09-20' AS Date), CAST(N'2022-10-02' AS Date), 19, 20, 4, 950, NULL, N'\Images\note20.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (20, CAST(N'2022-09-20' AS Date), CAST(N'2022-10-03' AS Date), 20, 21, 5, 1700, 1, N'\Images\note21.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (21, CAST(N'2022-09-21' AS Date), CAST(N'2022-09-28' AS Date), 21, 22, 6, 3900, 3, N'\Images\note22.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (22, CAST(N'2022-09-25' AS Date), CAST(N'2022-10-05' AS Date), 22, 23, 5, 1800, 2, N'\Images\note23.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (23, CAST(N'2022-09-25' AS Date), CAST(N'2022-10-03' AS Date), 23, 24, 1, 600, NULL, N'\Images\note24.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (24, CAST(N'2022-09-25' AS Date), CAST(N'2022-10-06' AS Date), 24, 25, 8, 1050, 1, N'\Images\note25.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (25, CAST(N'2022-09-25' AS Date), CAST(N'2022-10-07' AS Date), 25, 26, 8, 1550, 1, N'\Images\note26.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (26, CAST(N'2022-09-25' AS Date), CAST(N'2022-10-05' AS Date), 26, 27, 4, 300, NULL, N'\Images\note27.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (27, CAST(N'2022-09-26' AS Date), CAST(N'2022-10-10' AS Date), 27, 28, 4, 800, NULL, N'\Images\note28.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (28, CAST(N'2022-09-26' AS Date), CAST(N'2022-10-10' AS Date), 28, 29, 8, 1600, 1, N'\Images\note29.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (29, CAST(N'2022-09-27' AS Date), CAST(N'2022-10-12' AS Date), 29, 30, 6, 4150, 4, N'\Images\note30.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (30, CAST(N'2022-09-27' AS Date), CAST(N'2022-10-12' AS Date), 30, 31, 5, 1450, 1, N'\Images\note31.jpg')
INSERT [dbo].[Order] ([id_order], [date_adoption], [date_issue], [fk_clients], [fk_jewel], [fk_service], [price], [fk_discount], [jewelPhoto]) VALUES (33, CAST(N'2022-11-12' AS Date), CAST(N'2022-12-12' AS Date), 1, 1, 1, 1111, 1, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id_service], [name]) VALUES (1, N'Изменение размера кольца')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (2, N'Полировка украшений')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (3, N'Ремонт замков')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (4, N'Пайка')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (5, N'Вставка выпадающих камней')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (6, N'Гравировка')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (7, N'Удлинение цепочки или браслета')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (8, N'Устранение деформации геометрии')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id_type], [type]) VALUES (1, N'Браслет')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (2, N'Кольцо')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (3, N'Серьги')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (4, N'Цепочка')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (5, N'Брошь')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (6, N'Кулон')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Jewel]  WITH CHECK ADD  CONSTRAINT [FK_Jewel_Type] FOREIGN KEY([fk_type])
REFERENCES [dbo].[Type] ([id_type])
GO
ALTER TABLE [dbo].[Jewel] CHECK CONSTRAINT [FK_Jewel_Type]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Clients] FOREIGN KEY([fk_clients])
REFERENCES [dbo].[Clients] ([id_clients])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Clients]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Discount] FOREIGN KEY([fk_discount])
REFERENCES [dbo].[Discount] ([id_discount])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Discount]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Jewel] FOREIGN KEY([fk_jewel])
REFERENCES [dbo].[Jewel] ([id_jewel])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Jewel]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service] FOREIGN KEY([fk_service])
REFERENCES [dbo].[Service] ([id_service])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service]
GO
USE [master]
GO
ALTER DATABASE [JewelryShop] SET  READ_WRITE 
GO

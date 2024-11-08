USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 08.11.2024 16:15:37 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[Id] [int] NOT NULL,
	[IdIndex] [int] NULL,
	[IdCity] [int] NULL,
	[IdStreet] [int] NULL,
	[IdPickPoint] [int] NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Index]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Index](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Index] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[IdOrderStatus] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[IdPickPoint] [int] NULL,
	[Code] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK__Order__C3905BAFE1DB7CF0] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
	[Number] [nvarchar](100) NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[Id] [int] NOT NULL,
	[Number] [nvarchar](50) NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](60) NULL,
	[IdProductName] [int] NULL,
	[IdProductCategory] [int] NULL,
	[ProductImage] [image] NULL,
	[Img] [nvarchar](max) NULL,
	[ProductCost] [decimal](19, 4) NULL,
	[ProductSale] [int] NULL,
	[ProductMaxSale] [int] NULL,
	[ProductQuantityInStock] [int] NULL,
	[IdProduser] [int] NULL,
	[IdSupplier] [int] NULL,
	[ProductStatus] [nvarchar](20) NULL,
	[ProductDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD59B7CEE30] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produser]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produser](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Produser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.11.2024 16:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__User__1788CCAC58699E50] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (1, 13, 1, 1, 15)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (2, 23, 1, 2, 18)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (3, 20, 1, 3, 13)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (4, 9, 1, 4, 15)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (5, 16, 1, 5, 20)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (6, 7, 1, 6, 19)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (7, 31, 1, 6, 9)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (8, 15, 1, 6, 1)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (9, 18, 1, 7, 12)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (10, 33, 1, 7, 7)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (11, 32, 1, 8, NULL)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (12, 25, 1, 9, 22)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (13, 14, 1, 9, 20)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (14, 4, 1, 10, 12)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (15, 26, 1, 11, 24)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (16, 17, 1, 12, 14)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (17, 30, 1, 13, 5)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (18, 19, 1, 14, 8)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (19, 35, 1, 15, 8)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (20, 2, 1, 16, 23)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (21, 29, 1, 17, 21)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (22, 1, 1, 18, 4)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (23, 27, 1, 19, 16)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (24, 21, 1, 20, 3)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (25, 11, 1, 21, 21)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (26, 10, 1, 22, 6)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (27, 36, 1, 23, 11)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (28, 22, 1, 24, 21)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (29, 24, 1, 25, 14)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (30, 6, 1, 26, 19)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (31, 28, 1, 27, 4)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (32, 5, 1, 28, 1)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (33, 8, 1, 28, 2)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (34, 12, 1, 30, 24)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (35, 3, 1, 31, 17)
INSERT [dbo].[Adress] ([Id], [IdIndex], [IdCity], [IdStreet], [IdPickPoint]) VALUES (36, 34, 1, 31, 10)
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([id], [Name]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([id], [Name]) VALUES (3, N'Товары для собак')
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Нефтеюганск')
GO
INSERT [dbo].[Index] ([Id], [Name]) VALUES (1, N'125061')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (2, N'125703')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (3, N'125837')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (4, N'190949')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (5, N'344288')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (6, N'394060')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (7, N'394242')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (8, N'394782')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (9, N'400562')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (10, N'410172')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (11, N'410542')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (12, N'410661')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (13, N'420151')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (14, N'426030')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (15, N'443890')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (16, N'450375')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (17, N'450558')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (18, N'450983')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (19, N'454311')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (20, N'603002')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (21, N'603036')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (22, N'603379')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (23, N'603721')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (24, N'614164')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (25, N'614510')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (26, N'614611')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (27, N'614753')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (28, N'620839')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (29, N'625283')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (30, N'625560')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (31, N'625590')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (32, N'625683')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (33, N'630201')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (34, N'630370')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (35, N'660007')
INSERT [dbo].[Index] ([Id], [Name]) VALUES (36, N'660540')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (1, 2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 11, 601, 9)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (2, 2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 9, 602, NULL)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (3, 1, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 9, 603, NULL)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (4, 1, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 10, 604, 7)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (5, 1, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 11, 605, NULL)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (6, 1, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 13, 606, NULL)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (7, 2, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 16, 607, 1)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (8, 2, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 15, 608, 8)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (9, 2, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 15, 609, NULL)
INSERT [dbo].[Order] ([OrderID], [IdOrderStatus], [OrderDate], [OrderDeliveryDate], [IdPickPoint], [Code], [IdUser]) VALUES (10, 1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 16, 610, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (1, 1, N'А112Т4,', 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (2, 2, N'F432F4,', 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (3, 3, N'E532Q5,', 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (4, 4, N'G345E4,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (5, 5, N'R356F4,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (6, 6, N'H436R4,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (7, 7, N'H342F5,', 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (8, 8, N'K436T5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (9, 9, N'V527T5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (10, 10, N'M356R4,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (11, 1, N'G453T5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (12, 2, N'Y324F4,', 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (13, 3, N'T432F4,', 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (14, 4, N'E345R4,', 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (15, 5, N'E431R5,', 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (16, 6, N'D643B5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (17, 7, N'Q245F5,', 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (18, 8, N'V527T5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (19, 9, N'K452T5,', 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [Number], [Count]) VALUES (20, 10, N'W548O7,', 1)
GO
INSERT [dbo].[OrderStatus] ([Id], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([Id], [Status]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (1, N'1')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (2, N'3')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (3, N'4')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (4, N'8')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (5, N'12')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (6, N'13')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (7, N'17')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (8, N'19')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (9, N'20')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (10, N'24')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (11, N'25')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (12, N'26')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (13, N'28')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (14, N'30')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (15, N'32')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (16, N'35')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (17, N'40')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (18, N'41')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (19, N'43')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (20, N'44')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (21, N'46')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (22, N'47')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (23, N'49')
INSERT [dbo].[PickPoint] ([Id], [Number]) VALUES (24, N'50')
GO
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (1, N'А112Т4', 3, 2, NULL, N'А112Т4.png', CAST(123.0000 AS Decimal(19, 4)), 3, 30, 6, 4, 1, N'шт.', N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (2, N'G453T5', 8, 1, NULL, N'G453T5.jpg', CAST(149.0000 AS Decimal(19, 4)), 2, 15, 7, 12, 2, N'шт.', N'Щетка-варежка True Touch для вычесывания шерсти, синий')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (3, N'F432F4', 7, 2, NULL, N'F432F4.jpg', CAST(1200.0000 AS Decimal(19, 4)), 3, 10, 15, 8, 2, N'шт.', N'Сухой корм для кошек Pro Plan с чувствительным пищеварением')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (4, N'Y324F4', 3, 3, NULL, N'Y324F4.jpg', CAST(86.0000 AS Decimal(19, 4)), 4, 5, 17, 9, 1, N'шт.', N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (5, N'E532Q5', 3, 3, NULL, N'E532Q5.jpg', CAST(166.0000 AS Decimal(19, 4)), 5, 15, 18, 9, 1, N'шт.', N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (6, N'T432F4', 7, 3, NULL, N'T432F4.jpg', CAST(1700.0000 AS Decimal(19, 4)), 2, 25, 5, 2, 2, N'шт.', N'Сухой корм для собак Chappi говядина по-домашнему, с овощами')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (7, N'G345E4', 6, 3, NULL, N'G345E4.jpg', CAST(300.0000 AS Decimal(19, 4)), 3, 5, 19, 6, 2, N'шт.', N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (8, N'E345R4', 1, 2, NULL, N'E345R4.jpg', CAST(199.0000 AS Decimal(19, 4)), 5, 5, 7, 5, 2, N'шт.', N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (9, N'R356F4', 5, 3, NULL, N'R356F4.jpg', CAST(234.0000 AS Decimal(19, 4)), 3, 10, 17, 7, 1, N'шт.', N'Миска Nobby с рисунком Dog для собак 130 мл красный')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (10, N'E431R5', 3, 3, NULL, N'E431R5.png', CAST(170.0000 AS Decimal(19, 4)), 5, 5, 5, 10, 2, N'шт.', N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (11, N'D563F4', 1, 3, NULL, N'', CAST(600.0000 AS Decimal(19, 4)), 5, 10, 5, 10, 1, N'шт.', N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (12, N'H436R4', 1, 3, NULL, N'', CAST(300.0000 AS Decimal(19, 4)), 2, 15, 15, 10, 1, N'шт.', N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (13, N'D643B5', 7, 2, NULL, N'', CAST(4100.0000 AS Decimal(19, 4)), 4, 30, 9, 1, 1, N'шт.', N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (14, N'H432F4', 5, 1, NULL, N'', CAST(385.0000 AS Decimal(19, 4)), 2, 10, 17, 10, 2, N'шт.', N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (15, N'S245R4', 7, 2, NULL, N'', CAST(280.0000 AS Decimal(19, 4)), 3, 15, 8, 1, 2, N'шт.', N'Сухой корм для кошек CAT CHOW')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (16, N'V352R4', 7, 3, NULL, N'', CAST(1700.0000 AS Decimal(19, 4)), 4, 25, 9, 2, 1, N'шт.', N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (17, N'H342F5', 1, 3, NULL, N'', CAST(510.0000 AS Decimal(19, 4)), 2, 5, 17, 10, 2, N'шт.', N'Игрушка для собак Triol Енот 41 см 12141063 серый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (18, N'Q245F5', 1, 3, NULL, N'', CAST(510.0000 AS Decimal(19, 4)), 2, 5, 17, 10, 2, N'шт.', N'Игрушка для собак Triol Бобер 41 см 12141063 серый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (19, N'G542F5', 7, 3, NULL, N'', CAST(2190.0000 AS Decimal(19, 4)), 4, 30, 7, 8, 1, N'шт.', N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (20, N'H542R6', 3, 3, NULL, N'', CAST(177.0000 AS Decimal(19, 4)), 3, 15, 15, 10, 2, N'шт.', N'Лакомство для собак Triol Мясные полоски из кролика, 70 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (21, N'K436T5', 6, 3, NULL, N'', CAST(100.0000 AS Decimal(19, 4)), 4, 5, 21, 10, 2, N'шт.', N'Мячик для собак Triol с косточками 12101096 желтый/зеленый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (22, N'V527T5', 1, 3, NULL, N'', CAST(640.0000 AS Decimal(19, 4)), 5, 5, 4, 10, 1, N'шт.', N'Игрушка для собак Triol Ящерица 39 см коричневый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (23, N'K452T5', 4, 3, NULL, N'', CAST(800.0000 AS Decimal(19, 4)), 2, 25, 17, 13, 2, N'шт.', N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (24, N'E466T6', 2, 3, NULL, N'', CAST(3500.0000 AS Decimal(19, 4)), 5, 30, 3, 10, 2, N'шт.', N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (25, N'B427R5', 5, 1, NULL, N'', CAST(400.0000 AS Decimal(19, 4)), 4, 15, 5, 10, 2, N'шт.', N'Миска для животных Triol "Стрекоза", 450 мл')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (26, N'H643W2', 5, 1, NULL, N'', CAST(292.0000 AS Decimal(19, 4)), 3, 25, 13, 10, 1, N'шт.', N'Миска Triol CB02/30231002 100 мл бежевый/голубой')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (27, N'D356R4', 6, 3, NULL, N'', CAST(600.0000 AS Decimal(19, 4)), 2, 15, 16, 11, 1, N'шт.', N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (28, N'E434U6', 3, 3, NULL, N'', CAST(140.0000 AS Decimal(19, 4)), 3, 20, 19, 9, 2, N'шт.', N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (29, N'M356R4', 3, 3, NULL, N'', CAST(50.0000 AS Decimal(19, 4)), 4, 5, 6, 9, 2, N'шт.', N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdProductName], [IdProductCategory], [ProductImage], [Img], [ProductCost], [ProductSale], [ProductMaxSale], [ProductQuantityInStock], [IdProduser], [IdSupplier], [ProductStatus], [ProductDescription]) VALUES (30, N'W548O7', 7, 3, NULL, N'', CAST(600.0000 AS Decimal(19, 4)), 5, 15, 15, 3, 1, N'шт.', N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг')
GO
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (8, N'Щетка-варежка')
GO
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[Produser] ([Id], [Name]) VALUES (13, N'ZooM')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Street] ([Id], [Name]) VALUES (1, N'Вишневая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (2, N'Гоголя')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (3, N'Дзержинского')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (4, N'Зеленая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (5, N'Клубная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (6, N'Коммунистическая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (7, N'Комсомольская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (8, N'8 Марта')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (9, N'Маяковского')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (10, N'Мичурина')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (11, N'Молодежная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (12, N'Набережная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (13, N'Некрасова')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (14, N'Новая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (15, N'Октябрьская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (16, N'Партизанская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (17, N'Победы')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (18, N'Подгорная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (19, N'Полевая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (20, N'Садовая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (21, N'Светлая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (22, N'Северная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (23, N'Солнечная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (24, N'Спортивная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (25, N'Степная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (26, N'Фрунзе')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (27, N'Цветочная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (28, N'Чехова')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (30, N'Школьная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (31, N'Шоссейная')
GO
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'ZooMir')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[User] ([UserID], [IdRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 1, N'Яковлева
', N'Ярослава
', N'Даниэльевна
', N'deummecillummu-4992@mail.ru', N'uzWC67
')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_City] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_City]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Index] FOREIGN KEY([IdIndex])
REFERENCES [dbo].[Index] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Index]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_PickPoint] FOREIGN KEY([IdPickPoint])
REFERENCES [dbo].[PickPoint] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_PickPoint]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Street] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Street]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([IdOrderStatus])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickPoint] FOREIGN KEY([IdPickPoint])
REFERENCES [dbo].[PickPoint] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IdProductCategory])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([IdProductName])
REFERENCES [dbo].[ProductName] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Produser] FOREIGN KEY([IdProduser])
REFERENCES [dbo].[Produser] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Produser]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO

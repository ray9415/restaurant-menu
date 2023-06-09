USE [master]
GO
/****** Object:  Database [restaurantDB]    Script Date: 2023/6/25 下午 11:48:06 ******/
CREATE DATABASE [restaurantDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restaurantDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\restaurantDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restaurantDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\restaurantDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restaurantDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restaurantDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restaurantDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restaurantDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restaurantDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restaurantDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [restaurantDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restaurantDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restaurantDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restaurantDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restaurantDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restaurantDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restaurantDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restaurantDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restaurantDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restaurantDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [restaurantDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restaurantDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restaurantDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restaurantDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restaurantDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restaurantDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [restaurantDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restaurantDB] SET RECOVERY FULL 
GO
ALTER DATABASE [restaurantDB] SET  MULTI_USER 
GO
ALTER DATABASE [restaurantDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restaurantDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restaurantDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restaurantDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restaurantDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [restaurantDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'restaurantDB', N'ON'
GO
ALTER DATABASE [restaurantDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [restaurantDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [restaurantDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2023/6/25 下午 11:48:06 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/6/25 下午 11:48:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2023/6/25 下午 11:48:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/6/25 下午 11:48:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Table] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNo] [nvarchar](max) NOT NULL,
	[statement] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/6/25 下午 11:48:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[IMG] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230607001127_initial', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620135347_add migration', N'6.0.18')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Type], [Password]) VALUES (1, N'ray', N'manager', N'p@$$w0rd')
INSERT [dbo].[Employees] ([Id], [Name], [Type], [Password]) VALUES (2, N'jack', N'waiter', N'password')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (2, N'番茄義大利麵', N'主食', N'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aperiam ea laboriosam in expedita error, praesentium beatae illum eum ipsa. Dolorum, fugit nesciunt natus eum facilis maxime placeat eos enim. Error a molestias ab rem impedit nesciunt dolor alias suscipit dicta minima eaque pariatur reprehenderit consequatur voluptatum reiciendis aliquam recusandae, distinctio deleniti iusto assumenda ducimus nihil! ', 120, N'spaghetti-tomato.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (3, N'培根義大利麵', N'主食', N'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aperiam ea laboriosam in expedita error, praesentium beatae illum eum ipsa. Dolorum, fugit nesciunt natus eum facilis maxime placeat eos enim. Error a molestias ab rem impedit nesciunt dolor alias suscipit dicta minima eaque pariatur reprehenderit consequatur voluptatum reiciendis aliquam recusandae, distinctio deleniti iusto assumenda ducimus nihil! ', 120, N'spaghetti-carbonara.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (26, N'聖代', N'副食', N'test', 80, N'sorbetti.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (27, N'烏龍麵', N'主食', N'test', 80, N'udon.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 2023/6/25 下午 11:48:07 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductId]    Script Date: 2023/6/25 下午 11:48:07 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductId] ON [dbo].[OrderDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [restaurantDB] SET  READ_WRITE 
GO

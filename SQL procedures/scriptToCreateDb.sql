USE [master]
GO
/****** Object:  Database [ds2]    Script Date: 23.05.2021 20:13:11 ******/
CREATE DATABASE [ds2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ds2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DS2MSSQL\MSSQL\DATA\ds2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ds2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DS2MSSQL\MSSQL\DATA\ds2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ds2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ds2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ds2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ds2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ds2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ds2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ds2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ds2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ds2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ds2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ds2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ds2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ds2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ds2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ds2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ds2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ds2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ds2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ds2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ds2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ds2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ds2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ds2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ds2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ds2] SET RECOVERY FULL 
GO
ALTER DATABASE [ds2] SET  MULTI_USER 
GO
ALTER DATABASE [ds2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ds2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ds2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ds2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ds2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ds2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ds2', N'ON'
GO
ALTER DATABASE [ds2] SET QUERY_STORE = OFF
GO
USE [ds2]
GO
/****** Object:  User [david2]    Script Date: 23.05.2021 20:13:11 ******/
CREATE USER [david2] FOR LOGIN [david2] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [david2]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [char](30) NOT NULL,
	[vat] [char](30) NOT NULL,
	[city] [char](30) NOT NULL,
	[street] [char](30) NOT NULL,
	[postal] [char](30) NOT NULL,
	[phone] [char](15) NOT NULL,
	[email] [char](30) NOT NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [companies_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [char](30) NOT NULL,
	[surname] [char](30) NOT NULL,
	[city] [char](30) NOT NULL,
	[street] [char](30) NOT NULL,
	[postal] [char](30) NOT NULL,
	[email] [char](30) NOT NULL,
	[phone] [char](15) NULL,
	[locality_id] [int] NOT NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [employees_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoices_bought]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoices_bought](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[invoice_code] [char](30) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [int] NOT NULL,
	[companies_id] [int] NOT NULL,
	[stb_type_id] [int] NOT NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [invoices_bought_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoices_sold]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoices_sold](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[invoice_code] [char](30) NOT NULL,
	[companies_id] [int] NOT NULL,
	[stb_type_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [int] NOT NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [invoices_sold_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locality]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locality](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[label] [char](15) NOT NULL,
	[city] [char](30) NOT NULL,
	[street] [char](30) NOT NULL,
	[postal] [char](30) NOT NULL,
	[phone_office] [char](15) NOT NULL,
	[employees_count] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [locality_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[serial_number] [int] NOT NULL,
	[stb_type_id] [int] NOT NULL,
	[invoices_sold_id] [int] NULL,
	[invoices_bought_id] [int] NOT NULL,
	[employees_id] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [products_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reclamations]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamations](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[serial_number] [int] NOT NULL,
	[approved] [bit] NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[description] [char](150) NOT NULL,
	[products_id] [int] NOT NULL,
	[companies_id] [int] NOT NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [reclamations_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stb_type]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stb_type](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[name] [char](50) NULL,
	[ram] [int] NULL,
	[wifi_module] [char](50) NULL,
	[cpu_cores] [int] NULL,
	[cpu_frequency] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [stb_type_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (1, N'Marlon2305                    ', N'1234                          ', N'Brno                          ', N'na kopci                      ', N'73401                         ', N'+420541244     ', N'test2305                      ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (2, N'momo                          ', N'jojo                          ', N'lolo                          ', N'koko                          ', N'popo                          ', N'soso           ', N'momo                          ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (3, N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho           ', N'hoho                          ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (4, N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho                          ', N'hoho           ', N'hoho                          ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (5, N'Marlon                        ', N'1234                          ', N'Brno                          ', N'na kopci                      ', N'73401                         ', N'+420541244     ', N'test                          ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (6, N'Marlon                        ', N'1234                          ', N'Brno                          ', N'na kopci                      ', N'73401                         ', N'+420541244     ', N'test                          ', 1)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (7, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', N'DUMMY                         ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (8, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', N'DUMMY                         ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (9, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', N'DUMMY                         ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (10, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', N'DUMMY                         ', 0)
INSERT [dbo].[companies] ([id], [name], [vat], [city], [street], [postal], [phone], [email], [is_deleted]) VALUES (11, N'DUMMYtest                     ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', N'DUMMY                         ', 1)
SET IDENTITY_INSERT [dbo].[companies] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (1, N'pokus                         ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la             ', 1, 1)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (12, N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la             ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (15, N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la                            ', N'la             ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (17, N'da                            ', N'da                            ', N'da                            ', N'da                            ', N'da                            ', N'da                            ', N'da             ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (18, N'David                         ', N'Fojcik                        ', N'Karvina                       ', N'Na kopci 2058                 ', N'73401                         ', N'dave.fojtas@gmail.com         ', N'737014101      ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (19, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (20, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (21, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (22, N'David                         ', N'omg                           ', N'dada                          ', N'dada                          ', N'dada                          ', N'dasdsa                        ', N'dasdas         ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (23, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (24, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (25, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (26, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (27, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (28, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (29, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (30, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (31, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (32, N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (33, N'DUMMY                         ', N'DUMMY1                        ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 1)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (34, N'DUMMY                         ', N'DUMMYtest                     ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (35, N'DUMMY                         ', N'DUMMYtest                     ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
INSERT [dbo].[employees] ([id], [name], [surname], [city], [street], [postal], [email], [phone], [locality_id], [is_deleted]) VALUES (36, N'DUMMY                         ', N'DUMMYtest                     ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 1, 0)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[invoices_bought] ON 

INSERT [dbo].[invoices_bought] ([id], [invoice_code], [amount], [price], [companies_id], [stb_type_id], [is_deleted]) VALUES (1, N'246456598                     ', 1, 2000, 1, 1, 1)
INSERT [dbo].[invoices_bought] ([id], [invoice_code], [amount], [price], [companies_id], [stb_type_id], [is_deleted]) VALUES (2, N'1353                          ', 1, 1500, 1, 1, 1)
INSERT [dbo].[invoices_bought] ([id], [invoice_code], [amount], [price], [companies_id], [stb_type_id], [is_deleted]) VALUES (3, N'1353                          ', 1, 1500, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[invoices_bought] OFF
GO
SET IDENTITY_INSERT [dbo].[invoices_sold] ON 

INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (1, N'121489745                     ', 1, 1, 1, 2000, 1)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (2, N'1353                          ', 1, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (3, N'1354                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (4, N'1355                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (5, N'1356                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (6, N'1357                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (7, N'1358                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (8, N'1359                          ', 2, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (9, N'1360                          ', 4, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (10, N'1361                          ', 4, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (11, N'1362                          ', 4, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (12, N'1363                          ', 4, 1, 1, 1500, 0)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (13, N'1364                          ', 4, 1, 2, 1500, 1)
INSERT [dbo].[invoices_sold] ([id], [invoice_code], [companies_id], [stb_type_id], [amount], [price], [is_deleted]) VALUES (14, N'1364                          ', 4, 1, 1, 1500, 0)
SET IDENTITY_INSERT [dbo].[invoices_sold] OFF
GO
SET IDENTITY_INSERT [dbo].[locality] ON 

INSERT [dbo].[locality] ([id], [label], [city], [street], [postal], [phone_office], [employees_count], [is_deleted]) VALUES (1, N'Ostrava        ', N'Ostrava                       ', N'Kurdejovicka 14               ', N'74141                         ', N'797954123      ', 23, 0)
INSERT [dbo].[locality] ([id], [label], [city], [street], [postal], [phone_office], [employees_count], [is_deleted]) VALUES (2, N'DUMMYtest      ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY                         ', N'DUMMY          ', 0, 0)
SET IDENTITY_INSERT [dbo].[locality] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [serial_number], [stb_type_id], [invoices_sold_id], [invoices_bought_id], [employees_id], [is_deleted]) VALUES (1, 123456, 1, 1, 1, 36, 0)
INSERT [dbo].[products] ([id], [serial_number], [stb_type_id], [invoices_sold_id], [invoices_bought_id], [employees_id], [is_deleted]) VALUES (2, 123456, 1, 1, 1, NULL, 1)
INSERT [dbo].[products] ([id], [serial_number], [stb_type_id], [invoices_sold_id], [invoices_bought_id], [employees_id], [is_deleted]) VALUES (3, 5651, 1, 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[reclamations] ON 

INSERT [dbo].[reclamations] ([id], [serial_number], [approved], [start_date], [end_date], [description], [products_id], [companies_id], [is_deleted]) VALUES (1, 111112305, 0, CAST(N'2020-12-01' AS Date), CAST(N'2021-01-01' AS Date), N'hdmi malfunctions                                                                                                                                     ', 1, 1, 0)
INSERT [dbo].[reclamations] ([id], [serial_number], [approved], [start_date], [end_date], [description], [products_id], [companies_id], [is_deleted]) VALUES (2, 200200215, 1, CAST(N'2021-07-20' AS Date), CAST(N'2021-09-01' AS Date), N'overheating                                                                                                                                           ', 2, 2, 0)
INSERT [dbo].[reclamations] ([id], [serial_number], [approved], [start_date], [end_date], [description], [products_id], [companies_id], [is_deleted]) VALUES (3, 200200215, 0, CAST(N'2021-07-20' AS Date), CAST(N'2021-09-01' AS Date), N'overheating                                                                                                                                           ', 2, 2, 0)
INSERT [dbo].[reclamations] ([id], [serial_number], [approved], [start_date], [end_date], [description], [products_id], [companies_id], [is_deleted]) VALUES (4, 200200215, 0, CAST(N'2021-07-20' AS Date), CAST(N'2021-09-01' AS Date), N'overheating                                                                                                                                           ', 2, 2, 1)
INSERT [dbo].[reclamations] ([id], [serial_number], [approved], [start_date], [end_date], [description], [products_id], [companies_id], [is_deleted]) VALUES (5, 200200215, 0, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-23' AS Date), N'overheating                                                                                                                                           ', 2, 2, 0)
SET IDENTITY_INSERT [dbo].[reclamations] OFF
GO
SET IDENTITY_INSERT [dbo].[stb_type] ON 

INSERT [dbo].[stb_type] ([id], [name], [ram], [wifi_module], [cpu_cores], [cpu_frequency], [is_deleted]) VALUES (1, N'Arris 1113                                        ', 8, N'Atheros                                           ', 4, 3, 0)
INSERT [dbo].[stb_type] ([id], [name], [ram], [wifi_module], [cpu_cores], [cpu_frequency], [is_deleted]) VALUES (2, N'Arris 4302                                        ', 2, N'Arduino                                           ', 2, 2, 0)
INSERT [dbo].[stb_type] ([id], [name], [ram], [wifi_module], [cpu_cores], [cpu_frequency], [is_deleted]) VALUES (3, N'Android TV                                        ', 2, N'nRF24L01                                          ', 2, 2, 0)
INSERT [dbo].[stb_type] ([id], [name], [ram], [wifi_module], [cpu_cores], [cpu_frequency], [is_deleted]) VALUES (4, N'AOSP box                                          ', 1, N'Arduino                                           ', 2, 1, 0)
SET IDENTITY_INSERT [dbo].[stb_type] OFF
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [employees_locality_FK] FOREIGN KEY([locality_id])
REFERENCES [dbo].[locality] ([id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [employees_locality_FK]
GO
ALTER TABLE [dbo].[invoices_bought]  WITH CHECK ADD  CONSTRAINT [invoices_bought_companies_FK] FOREIGN KEY([companies_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[invoices_bought] CHECK CONSTRAINT [invoices_bought_companies_FK]
GO
ALTER TABLE [dbo].[invoices_bought]  WITH CHECK ADD  CONSTRAINT [invoices_bought_stb_type_FK] FOREIGN KEY([stb_type_id])
REFERENCES [dbo].[stb_type] ([id])
GO
ALTER TABLE [dbo].[invoices_bought] CHECK CONSTRAINT [invoices_bought_stb_type_FK]
GO
ALTER TABLE [dbo].[invoices_sold]  WITH CHECK ADD  CONSTRAINT [invoices_sold_companies_FK] FOREIGN KEY([companies_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[invoices_sold] CHECK CONSTRAINT [invoices_sold_companies_FK]
GO
ALTER TABLE [dbo].[invoices_sold]  WITH CHECK ADD  CONSTRAINT [invoices_sold_stb_type_FK] FOREIGN KEY([stb_type_id])
REFERENCES [dbo].[stb_type] ([id])
GO
ALTER TABLE [dbo].[invoices_sold] CHECK CONSTRAINT [invoices_sold_stb_type_FK]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [products_employees_FK] FOREIGN KEY([employees_id])
REFERENCES [dbo].[employees] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [products_employees_FK]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [products_invoices_bought_FK] FOREIGN KEY([invoices_bought_id])
REFERENCES [dbo].[invoices_bought] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [products_invoices_bought_FK]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [products_invoices_sold_FK] FOREIGN KEY([invoices_sold_id])
REFERENCES [dbo].[invoices_sold] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [products_invoices_sold_FK]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [products_stb_type_FK] FOREIGN KEY([stb_type_id])
REFERENCES [dbo].[stb_type] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [products_stb_type_FK]
GO
ALTER TABLE [dbo].[reclamations]  WITH CHECK ADD  CONSTRAINT [reclamations_companies_FK] FOREIGN KEY([companies_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[reclamations] CHECK CONSTRAINT [reclamations_companies_FK]
GO
ALTER TABLE [dbo].[reclamations]  WITH CHECK ADD  CONSTRAINT [reclamations_products_FK] FOREIGN KEY([products_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[reclamations] CHECK CONSTRAINT [reclamations_products_FK]
GO
/****** Object:  StoredProcedure [dbo].[create_employee]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_employee]
    @v_name char(30),
	@v_surname char(30),
	@v_city char(30),
	@v_street char(30),
	@v_postal char(30),
	@v_email char(30),
	@v_phone char(15),
	@v_locality_id int,
	@v_product_id int
AS  
	BEGIN TRANSACTION
		BEGIN TRY
			INSERT INTO ds2.dbo.employees(name, surname, city, street, postal, email, phone, locality_id, is_deleted) VALUES(@v_name, @v_surname, @v_city, @v_street, @v_postal, @v_email, @v_phone, @v_locality_id, 0); 
			UPDATE ds2.dbo.locality SET employees_count = employees_count + 1 WHERE id = @v_locality_id;
			DECLARE @v_employee_new_id int;
			SET @v_employee_new_id = (SELECT TOP 1 id FROM ds2.dbo.employees ORDER BY id DESC);
			UPDATE ds2.dbo.products SET employees_id = @v_employee_new_id WHERE id = @v_product_id;
			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH
GO
/****** Object:  StoredProcedure [dbo].[create_locality]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_locality]
    @v_label char(15),
	@v_city char(30),
	@v_street char(30),
	@v_postal char(30),
	@v_phone_office char(15)
AS  
	BEGIN TRANSACTION
		BEGIN TRY
			INSERT INTO ds2.dbo.locality (label, city, street, postal, phone_office, employees_count, is_deleted) VALUES(@v_label, @v_city, @v_street, @v_postal, @v_phone_office, 0, 0);
			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH
GO
/****** Object:  StoredProcedure [dbo].[delete_employee]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_employee]
	@v_id int
AS
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @device int;
			SET @device = (SELECT COUNT(*) FROM ds2.dbo.products WHERE employees_id = @v_id);
			IF(@device = 0)
				BEGIN
					UPDATE ds2.dbo.employees SET is_deleted = 1 WHERE id = @v_id;
					UPDATE ds2.dbo.locality SET employees_count = employees_count - 1 WHERE id = (SELECT locality_id FROM ds2.dbo.employees WHERE id = @v_id);
				END
			ELSE
				BEGIN
					UPDATE ds2.dbo.products SET employees_id = NULL WHERE employees_id = @v_id;
					UPDATE ds2.dbo.employees SET is_deleted = 1 WHERE id = @v_id;
					UPDATE ds2.dbo.locality SET employees_count = employees_count - 1 WHERE id = (SELECT locality_id FROM ds2.dbo.employees WHERE id = @v_id);
				END
			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[list_invoices_sold]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[list_invoices_sold]
(@v_company_id int)
AS
BEGIN 
	SELECT invoices_sold.id, invoices_sold.invoices_code, invoices_sold.stb_type_id, invoices_sold.amount, invoices_sold.price, companies.name, companies.vat, companies.city, companies.email 
	FROM ds2.dbo.invoices_sold 
	JOIN ds2.dbo.companies ON ds2.dbo.companies.id = invoices_sold.companies_id
	WHERE ds2.dbo.invoices_sold.companies_id = @v_company_id;
END
GO
/****** Object:  StoredProcedure [dbo].[owned_devices]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[owned_devices]
(@v_employee_id int)
AS
BEGIN 
	SELECT * FROM ds2.dbo.products
	JOIN ds2.dbo.employees ON employees.id = products.employees_id
	JOIN ds2.dbo.locality ON employees.locality_id = locality.id
	WHERE products.employees_id = @v_employee_id;
END
GO
/****** Object:  StoredProcedure [dbo].[update_employee]    Script Date: 23.05.2021 20:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_employee]
	@v_id int,
    @v_name char(30),
	@v_surname char(30),
	@v_city char(30),
	@v_street char(30),
	@v_postal char(30),
	@v_email char(30),
	@v_phone char(30),
	@v_locality_id int
AS  
	BEGIN TRANSACTION
		BEGIN TRY
			declare @v_employee_old_locality int;
			SELECT locality_id = @v_employee_old_locality FROM ds2.dbo.employees WHERE id = @v_id;
			UPDATE ds2.dbo.employees SET name = @v_name, surname = @v_surname, city = @v_city, street = @v_street, postal = @v_postal, email = @v_email, phone = @v_phone, locality_id = @v_locality_id, is_deleted = 0 WHERE id = @v_id; 
			IF(@v_employee_old_locality != @v_locality_id)
				BEGIN
					UPDATE ds2.dbo.locality SET employees_count = employees_count + 1 WHERE id = @v_locality_id;
					UPDATE ds2.dbo.locality SET employees_count = employees_count - 1 WHERE id = @v_employee_old_locality;
				END
			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH
GO
USE [master]
GO
ALTER DATABASE [ds2] SET  READ_WRITE 
GO

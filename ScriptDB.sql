USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 18/05/2024 09:42:42 a. m. ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Demo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Demo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Demo] SET QUERY_STORE = OFF
GO
USE [Demo]
GO
/****** Object:  User [user2]    Script Date: 18/05/2024 09:42:42 a. m. ******/
CREATE USER [user2] FOR LOGIN [user2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [diplomado]    Script Date: 18/05/2024 09:42:42 a. m. ******/
CREATE USER [diplomado] FOR LOGIN [diplomado] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [diplomado]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [diplomado]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/05/2024 09:42:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteNombre] [nvarchar](250) NOT NULL,
	[ClienteTelefono] [nvarchar](150) NOT NULL,
	[ClienteDireccion] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (1, N'Juan Pérez', N'555-1234', N'Calle Falsa 123')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (2, N'María García', N'555-5678', N'Avenida Siempre Viva 742')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (3, N'Carlos López', N'555-8765', N'Boulevard de los Sueños 456')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (4, N'Ana Hernández', N'555-4321', N'Calle del Arco Iris 789')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (5, N'Luis Martínez', N'555-6789', N'Camino Real 101')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (6, N'Sofía Gómez', N'555-9876', N'Plaza Central 202')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (7, N'Miguel Torres', N'555-3456', N'Avenida del Sol 303')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (8, N'Laura Ramírez', N'555-6543', N'Calle Luna 404')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (9, N'Jorge Sánchez', N'555-7890', N'Paseo de la Reforma 505')
INSERT [dbo].[Clientes] ([ClienteId], [ClienteNombre], [ClienteTelefono], [ClienteDireccion]) VALUES (10, N'Lucía Fernández', N'555-0987', N'Calle Estrella 606')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO

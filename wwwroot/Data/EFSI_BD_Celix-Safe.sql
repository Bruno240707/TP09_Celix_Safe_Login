USE [master]
GO
/****** Object:  Database [EFSI_database]    Script Date: 19/11/2024 08:14:25 ******/
CREATE DATABASE [EFSI_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFSI_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EFSI_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EFSI_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EFSI_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EFSI_database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFSI_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFSI_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFSI_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFSI_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFSI_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFSI_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFSI_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EFSI_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFSI_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFSI_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFSI_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFSI_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFSI_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFSI_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFSI_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFSI_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EFSI_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFSI_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFSI_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFSI_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFSI_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFSI_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFSI_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFSI_database] SET RECOVERY FULL 
GO
ALTER DATABASE [EFSI_database] SET  MULTI_USER 
GO
ALTER DATABASE [EFSI_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFSI_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFSI_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFSI_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EFSI_database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EFSI_database', N'ON'
GO
ALTER DATABASE [EFSI_database] SET QUERY_STORE = OFF
GO
USE [EFSI_database]
GO
/****** Object:  User [alumno]    Script Date: 19/11/2024 08:14:25 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id_CategoriaRecetas] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id_CategoriaRecetas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria_Productos]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Productos](
	[Id_Categoria_Productos] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria_Productos] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Categoria_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria_Productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Compras]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Compras](
	[Id_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Precio_Compra] [int] NOT NULL,
	[Cantidad_Productos_Comprados] [int] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Fecha_Compra] [date] NOT NULL,
 CONSTRAINT [PK_Detalles_Compras] PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion_usuario]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion_usuario](
	[Id_Direccion_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [varchar](150) NOT NULL,
	[Provincia] [varchar](150) NOT NULL,
	[Calle] [varchar](150) NOT NULL,
	[Numero_de_cuadra] [int] NOT NULL,
	[Codigo_Postal] [int] NOT NULL,
	[Numero_de_edificion] [int] NULL,
 CONSTRAINT [PK_Direccion_usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Direccion_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_producto] [varchar](150) NOT NULL,
	[Precio_producto] [int] NOT NULL,
	[Id_Categoria_Productos] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Calificacion_Producto] [int] NOT NULL,
	[Contenido_Receta] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[Id_Receta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Receta] [varchar](150) NOT NULL,
	[Contenido_de_Receta] [varchar](500) NOT NULL,
	[Calificacion_Receta] [int] NOT NULL,
	[id_CategoriaRecetas] [int] NOT NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[Id_Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurantes]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurantes](
	[Id_Restaurant] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Restaurant] [varchar](150) NOT NULL,
	[Id_Ubicacion_Restaurant] [int] NOT NULL,
	[Calificacion_Restaurant] [int] NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[Id_Restaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion_Restaurant]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion_Restaurant](
	[Id_Ubicacion_Restaurant] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [varchar](150) NULL,
	[Provincia] [varchar](150) NULL,
	[Calle] [varchar](200) NULL,
	[Numero_de_Cuadra] [int] NULL,
 CONSTRAINT [PK_Ubicacion_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id_Ubicacion_Restaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/11/2024 08:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[apellido] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[contraseña] [varchar](150) NOT NULL,
	[nombre] [varchar](500) NOT NULL,
	[descripcionUsuario] [varchar](500) NULL,
	[direccionUsuario] [varchar](500) NULL,
	[nombrePerro] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [username], [apellido], [email], [contraseña], [nombre], [descripcionUsuario], [direccionUsuario], [nombrePerro]) VALUES (1, N'Hamburguesero850', N'Cordero', N'urielpro850@gmail.com', N'Cordero850!', N'Uriel', NULL, NULL, N'Ekes')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Detalles_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Compras_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalles_Compras] CHECK CONSTRAINT [FK_Detalles_Compras_Productos]
GO
ALTER TABLE [dbo].[Detalles_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Compras_Usuarios] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalles_Compras] CHECK CONSTRAINT [FK_Detalles_Compras_Usuarios]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoria_Productos] FOREIGN KEY([Id_Categoria_Productos])
REFERENCES [dbo].[Categoria_Productos] ([Id_Categoria_Productos])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categoria_Productos]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Categoria] FOREIGN KEY([id_CategoriaRecetas])
REFERENCES [dbo].[Categoria] ([Id_CategoriaRecetas])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Categoria]
GO
ALTER TABLE [dbo].[Restaurantes]  WITH CHECK ADD  CONSTRAINT [FK_Restaurantes_Ubicacion_Restaurant] FOREIGN KEY([Id_Ubicacion_Restaurant])
REFERENCES [dbo].[Ubicacion_Restaurant] ([Id_Ubicacion_Restaurant])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Restaurantes] CHECK CONSTRAINT [FK_Restaurantes_Ubicacion_Restaurant]
GO
USE [master]
GO
ALTER DATABASE [EFSI_database] SET  READ_WRITE 
GO

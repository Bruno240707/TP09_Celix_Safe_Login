USE [master]
GO
/****** Object:  Database [EFSI_database]    Script Date: 9/5/2025 12:09:03 ******/
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
/****** Object:  User [alumno]    Script Date: 9/5/2025 12:09:03 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria_Productos]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Productos](
	[idCategoriaProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoriaProducto] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Categoria_Productos] PRIMARY KEY CLUSTERED 
(
	[idCategoriaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria_Recetas]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Recetas](
	[idCategoriaReceta] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoriaReceta] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoriaReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[idComentario] [int] IDENTITY(1,1) NOT NULL,
	[texto] [varchar](200) NULL,
	[idPost] [int] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Compras]    Script Date: 9/5/2025 12:09:03 ******/
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
/****** Object:  Table [dbo].[Direccion_usuario]    Script Date: 9/5/2025 12:09:03 ******/
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
/****** Object:  Table [dbo].[Establecimientos]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimientos](
	[idEstablecimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstablecimiento] [varchar](150) NOT NULL,
	[idUbicacionEstablecimiento] [int] NOT NULL,
	[calificacionEstablecimiento] [int] NOT NULL,
	[descripcionEstablecimiento] [varchar](150) NOT NULL,
	[fotoEstablecimiento] [text] NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[idEstablecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[idPost] [int] IDENTITY(1,1) NOT NULL,
	[tituloPost] [varchar](50) NULL,
	[contenidoPost] [varchar](100) NULL,
 CONSTRAINT [PK_Foro] PRIMARY KEY CLUSTERED 
(
	[idPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProducto] [varchar](150) NOT NULL,
	[precioProducto] [int] NOT NULL,
	[idCategoriaProducto] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[calificacionProducto] [int] NOT NULL,
	[fotoProducto] [text] NOT NULL,
	[descripcionProducto] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[idReceta] [int] IDENTITY(1,1) NOT NULL,
	[nombreReceta] [varchar](150) NOT NULL,
	[contenidoReceta] [varchar](500) NOT NULL,
	[calificacionReceta] [int] NOT NULL,
	[idCategoriaReceta] [int] NOT NULL,
	[fotoReceta] [text] NOT NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[idReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion_Establecimiento]    Script Date: 9/5/2025 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion_Establecimiento](
	[idUbicacionRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](150) NULL,
	[provincia] [varchar](150) NULL,
	[calle] [varchar](200) NULL,
	[numeroDeCuadra] [int] NULL,
 CONSTRAINT [PK_Ubicacion_Restaurant] PRIMARY KEY CLUSTERED 
(
	[idUbicacionRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/5/2025 12:09:03 ******/
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
SET IDENTITY_INSERT [dbo].[Categoria_Productos] ON 

INSERT [dbo].[Categoria_Productos] ([idCategoriaProducto], [nombreCategoriaProducto]) VALUES (1, N'Galletitas')
INSERT [dbo].[Categoria_Productos] ([idCategoriaProducto], [nombreCategoriaProducto]) VALUES (2, N'Fruta')
SET IDENTITY_INSERT [dbo].[Categoria_Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria_Recetas] ON 

INSERT [dbo].[Categoria_Recetas] ([idCategoriaReceta], [nombreCategoriaReceta]) VALUES (1, N'Carnivoro')
INSERT [dbo].[Categoria_Recetas] ([idCategoriaReceta], [nombreCategoriaReceta]) VALUES (2, N'Nose')
SET IDENTITY_INSERT [dbo].[Categoria_Recetas] OFF
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([idComentario], [texto], [idPost]) VALUES (1, N'sadasdas', 1)
INSERT [dbo].[Comentario] ([idComentario], [texto], [idPost]) VALUES (2, N'dsadsa', 1)
INSERT [dbo].[Comentario] ([idComentario], [texto], [idPost]) VALUES (3, N'jnajajajjaajjaajjajajajaja', 1)
INSERT [dbo].[Comentario] ([idComentario], [texto], [idPost]) VALUES (4, N'grsahgfsjhtfa', 2)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Establecimientos] ON 

INSERT [dbo].[Establecimientos] ([idEstablecimiento], [nombreEstablecimiento], [idUbicacionEstablecimiento], [calificacionEstablecimiento], [descripcionEstablecimiento], [fotoEstablecimiento]) VALUES (1, N'Celix safe', 1, 10, N'mejor lugar para comer', N'data:image/jpeg;base64,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')
INSERT [dbo].[Establecimientos] ([idEstablecimiento], [nombreEstablecimiento], [idUbicacionEstablecimiento], [calificacionEstablecimiento], [descripcionEstablecimiento], [fotoEstablecimiento]) VALUES (2, N'Marapopo', 1, 2, N'peor lugar para comer', N'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/91/63/7a/20190220-213806-largejpg.jpg?w=1200&h=-1&s=1')
INSERT [dbo].[Establecimientos] ([idEstablecimiento], [nombreEstablecimiento], [idUbicacionEstablecimiento], [calificacionEstablecimiento], [descripcionEstablecimiento], [fotoEstablecimiento]) VALUES (3, N'panaderia', 1, 2, N'muy mala me vino roto el pan', N'https://th.bing.com/th/id/R.86cabe9a03797c3528b8fbfb9175fad4?rik=0371ttUAMKtTbA&riu=http%3a%2f%2fwww.notiactual.com%2fwp-content%2fuploads%2f2017%2f02%2fmaxresdefault-1.jpg&ehk=SG3sbqZgy4X58Ecdk%2ff80noH0erQImEo%2fRdp7Tc%2foTg%3d&risl=&pid=ImgRaw&r=0')
SET IDENTITY_INSERT [dbo].[Establecimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Foro] ON 

INSERT [dbo].[Foro] ([idPost], [tituloPost], [contenidoPost]) VALUES (1, N'sadsadasdas', N'dsadsadsa')
INSERT [dbo].[Foro] ([idPost], [tituloPost], [contenidoPost]) VALUES (2, N'mantequilla de3 mani', N'muy pegajosa pero sabrosa')
SET IDENTITY_INSERT [dbo].[Foro] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([idProducto], [nombreProducto], [precioProducto], [idCategoriaProducto], [stock], [calificacionProducto], [fotoProducto], [descripcionProducto]) VALUES (1, N'Oreos', 100, 1, 1000, 8, N'data:image/jpeg;base64,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yN7/AB0+S33C9goWbNERB6K8wNGcX5Gv1816WCeVzNW6H3A/eg2oH6+AXD8xcYDHuazU5jt91q1jOL4js6vc1v5LUYfhZebPnragaOfiGJkPgDWj3FyxnhOKk9qWT/xOX7l3+D4O1vZbBmEaOykfM28nyneSX+o/81lbyZJ9bN8JX/mvpfSCnphSh8xdyMSbLnk+biXfevbeTHjZ7x7ivpfTCnphMyjbD5jNyU93tPefeV7PKU/18/8AUcvpfTCdMJlOHy6bkmR9Z5JXUbbme51HzFrIeUJz/wB+f+q/819M6QUiMJkw+YDkeS83Uks7nObPv816/uVL9bL/ADlfTsgTKmUbYfMDyVL9bL/MVB5Mm+tk/mX1DKmQKd0myHy7+5k31snzXoclzfWyfzL6fkCZAm6TZD5l/cuX62X+dywv5Jk+sl/qP/NfU8gUdMJuNsPlX93sTH7Mjz6POf715/bMRF7TAR3q/uP5r6q6AHsqOJ4Sx24CjJtclwbijJDlOhI2Oi7HCYcEfCv/AFZ+a5ziPLQ9pmhGxC17xjB4RNLXoQPtGvYKMLZbjmVtYloy0Ok2j/Fqfu2W14YNAuZweElJBkc91d3uc7711fD46CC6imkQSvEkdr2pCCg7AArPDhw1WFCAAiIglERAREQEREBERAREQEREBERAREQFClQghzbWF2FaeyzogrjCt8lmYyl6RAREQFIUFEEqEUoIRSiAiIgIiICIhQEUIglFCIJRQiCUUIglFCIJUIpQQilEEIpRBCKUQQUQogKVClAREQEREBERAQohQQiIgIiICIiAiIgIiIClQpQEREBERAREQQUQogKVClAREQEREBERAQohQQiIgIiICIiAiIgIiIClQpQEREBERAREQQUREBSiICIiAiIgIiICFEQQiIgIiICIiAiIgIiIClEQEREBERAREQf/2Q==', NULL)
INSERT [dbo].[Productos] ([idProducto], [nombreProducto], [precioProducto], [idCategoriaProducto], [stock], [calificacionProducto], [fotoProducto], [descripcionProducto]) VALUES (2, N'Banana', 200, 2, 1500, 6, N'https://www.lanacion.com.ar/resizer/v2/las-bananas-son-sumamente-beneficiosas-para-el-6SDTJUKLFRENRKWJBDP5S6Y5LI.jpg?auth=f0a76d73b04980da2caa3c030ea406e3f75ef6924f9597c87a22cd6fe2f0cb08&width=420&height=280&quality=70&smart=true', N'Excelente fruta')
INSERT [dbo].[Productos] ([idProducto], [nombreProducto], [precioProducto], [idCategoriaProducto], [stock], [calificacionProducto], [fotoProducto], [descripcionProducto]) VALUES (3, N'adsadsa', 0, 1, 100, 5, N'daddadasdsadsa', N'dasdasdasdasdasdasdasdas')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Recetas] ON 

INSERT [dbo].[Recetas] ([idReceta], [nombreReceta], [contenidoReceta], [calificacionReceta], [idCategoriaReceta], [fotoReceta]) VALUES (1, N'Empanada', N'carne, bla bla bla', 10, 1, N'https://media.istockphoto.com/id/1158987157/es/foto/un-primer-plano-de-empanadas-argentinas-con-salsas-y-vino-sobre-un-fondo-r%C3%BAstico-oscuro-de.jpg?s=612x612&w=0&k=20&c=Vf5S4_AadhWrp26ilHSIuFIGHbDOjZrYZWkwzBn72MY=')
INSERT [dbo].[Recetas] ([idReceta], [nombreReceta], [contenidoReceta], [calificacionReceta], [idCategoriaReceta], [fotoReceta]) VALUES (2, N'Budin de pera', N'pera, bla bla', 8, 2, N'https://www.exquisita.com.ar/wp-content/uploads/2014/11/Budin-de-Peras-y-Almendras-.jpg.webp')
INSERT [dbo].[Recetas] ([idReceta], [nombreReceta], [contenidoReceta], [calificacionReceta], [idCategoriaReceta], [fotoReceta]) VALUES (3, N'plato loco', N'berenjena, pastafrola y salame', 4, 2, N'https://th.bing.com/th/id/R.86cabe9a03797c3528b8fbfb9175fad4?rik=0371ttUAMKtTbA&riu=http%3a%2f%2fwww.notiactual.com%2fwp-content%2fuploads%2f2017%2f02%2fmaxresdefault-1.jpg&ehk=SG3sbqZgy4X58Ecdk%2ff80noH0erQImEo%2fRdp7Tc%2foTg%3d&risl=&pid=ImgRaw&r=0')
SET IDENTITY_INSERT [dbo].[Recetas] OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion_Establecimiento] ON 

INSERT [dbo].[Ubicacion_Establecimiento] ([idUbicacionRestaurante], [pais], [provincia], [calle], [numeroDeCuadra]) VALUES (1, N'Argentina', N'CABA', N'Av Gaona', 4981)
SET IDENTITY_INSERT [dbo].[Ubicacion_Establecimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [username], [apellido], [email], [contraseña], [nombre], [descripcionUsuario], [direccionUsuario], [nombrePerro]) VALUES (1, N'Hamburguesero850', N'Cordero', N'urielpro850@gmail.com', N'Cordero850!', N'Uriel', NULL, NULL, N'Ekes')
INSERT [dbo].[Usuarios] ([idUsuario], [username], [apellido], [email], [contraseña], [nombre], [descripcionUsuario], [direccionUsuario], [nombrePerro]) VALUES (2, N'asasa', N'Mara', N'brunonahuelmarasi@gmail.com', N'Marasi1!', N'asasa', NULL, NULL, N'Pixel')
INSERT [dbo].[Usuarios] ([idUsuario], [username], [apellido], [email], [contraseña], [nombre], [descripcionUsuario], [direccionUsuario], [nombrePerro]) VALUES (3, N'Fran', N'Marapode', N'fmarapode@gmail.com', N'Fran1107*', N'Fran', NULL, NULL, N'Luna')
INSERT [dbo].[Usuarios] ([idUsuario], [username], [apellido], [email], [contraseña], [nombre], [descripcionUsuario], [direccionUsuario], [nombrePerro]) VALUES (4, N'Marapode', N'Marap', N'marapode@gmail.com', N'Marap123!', N'Marapode', NULL, NULL, N'Salva')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Foro] FOREIGN KEY([idPost])
REFERENCES [dbo].[Foro] ([idPost])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Foro]
GO
ALTER TABLE [dbo].[Detalles_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Compras_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([idProducto])
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
ALTER TABLE [dbo].[Establecimientos]  WITH CHECK ADD  CONSTRAINT [FK_Restaurantes_Ubicacion_Restaurant] FOREIGN KEY([idUbicacionEstablecimiento])
REFERENCES [dbo].[Ubicacion_Establecimiento] ([idUbicacionRestaurante])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Establecimientos] CHECK CONSTRAINT [FK_Restaurantes_Ubicacion_Restaurant]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoria_Productos] FOREIGN KEY([idCategoriaProducto])
REFERENCES [dbo].[Categoria_Productos] ([idCategoriaProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categoria_Productos]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Categoria] FOREIGN KEY([idCategoriaReceta])
REFERENCES [dbo].[Categoria_Recetas] ([idCategoriaReceta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Categoria]
GO
USE [master]
GO
ALTER DATABASE [EFSI_database] SET  READ_WRITE 
GO

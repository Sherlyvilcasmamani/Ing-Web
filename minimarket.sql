USE [master]
GO
/****** Object:  Database [Minimarket]    Script Date: 29/11/2019 01:32:06 PM ******/
CREATE DATABASE [Minimarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Minimarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Minimarket.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Minimarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Minimarket_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Minimarket] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Minimarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Minimarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Minimarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Minimarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Minimarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Minimarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [Minimarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Minimarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Minimarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Minimarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Minimarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Minimarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Minimarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Minimarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Minimarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Minimarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Minimarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Minimarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Minimarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Minimarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Minimarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Minimarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Minimarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Minimarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Minimarket] SET  MULTI_USER 
GO
ALTER DATABASE [Minimarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Minimarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Minimarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Minimarket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Minimarket] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Minimarket]
GO
/****** Object:  Table [dbo].[tblCarrito]    Script Date: 29/11/2019 01:32:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCarrito](
	[CodigoVenta] [int] NULL,
	[CodigoProducto] [int] NULL,
	[PrecioUnidad] [decimal](18, 2) NULL,
	[Cantidad] [int] NULL,
	[Descuento] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategoria]    Script Date: 29/11/2019 01:32:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategoria](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tblCategorias] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCliente](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDetalleVenta]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleVenta](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoVenta] [int] NULL,
	[CodigoProducto] [int] NULL,
	[PrecioUnidad] [decimal](18, 2) NULL,
	[Cantidad] [int] NULL,
	[Descuento] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblDetalleVenta] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducto](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [text] NULL,
	[CodigoProveedor] [int] NULL,
	[CodigoCategoria] [int] NULL,
	[Precio] [decimal](18, 2) NULL,
	[Stock] [int] NULL,
	[Imagen] [varchar](100) NULL,
 CONSTRAINT [PK_tblProductos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProveedor](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](20) NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Telefono] [varchar](30) NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_tblProveedores] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](25) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTempVenta]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTempVenta](
	[Codigo] [int] NULL,
	[CodigoCliente] [int] NULL,
	[FechaVenta] [datetime] NULL,
	[Total] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[Codigo] [int] NOT NULL,
	[NombreUsuario] [varchar](30) NULL,
	[Contrasena] [varchar](40) NULL,
	[CodigoRol] [int] NULL,
	[Estado] [varchar](20) NULL,
 CONSTRAINT [PK_tblUsuarios] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVenta](
	[Codigo] [int] NOT NULL,
	[CodigoCliente] [int] NULL,
	[FechaVenta] [datetime] NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblVenta] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategoria] ([Codigo], [Nombre], [Descripcion]) VALUES (100, N'Lacteos', N'Leche,yogurt,queso')
INSERT [dbo].[tblCategoria] ([Codigo], [Nombre], [Descripcion]) VALUES (101, N'Bebidas', N'Gaseosas,cervezas')
INSERT [dbo].[tblCategoria] ([Codigo], [Nombre], [Descripcion]) VALUES (102, N'Dulces', N'Dulces')
INSERT [dbo].[tblCategoria] ([Codigo], [Nombre], [Descripcion]) VALUES (103, N'Frutas/Verduras', N'Frutas, verduras')
INSERT [dbo].[tblCategoria] ([Codigo], [Nombre], [Descripcion]) VALUES (104, N'Carnes', N'Pollo,res,cerdo, pescado')
INSERT [dbo].[tblCliente] ([Codigo], [Nombre], [Direccion], [Ciudad], [Email], [Telefono]) VALUES (44423456, N'Sherly', N'Psj. Agustin', N'Huancayo', N'Sherly@gmail.com', N'967452293')
INSERT [dbo].[tblCliente] ([Codigo], [Nombre], [Direccion], [Ciudad], [Email], [Telefono]) VALUES (55441122, N'Aysela', N'Psj. santa rosa', N'Huancayo', N'Aysela@gmail.com', N'955441122')
INSERT [dbo].[tblCliente] ([Codigo], [Nombre], [Direccion], [Ciudad], [Email], [Telefono]) VALUES (55667883, N'Leslie', N'Psj. Fernando', N'Huancayo', N'leslie@gmail.com', N'946572816')
INSERT [dbo].[tblCliente] ([Codigo], [Nombre], [Direccion], [Ciudad], [Email], [Telefono]) VALUES (77889944, N'Ida', N'San Carlos', N'Huancayo', N'Ida@gmail.com', N'987654321')
INSERT [dbo].[tblCliente] ([Codigo], [Nombre], [Direccion], [Ciudad], [Email], [Telefono]) VALUES (87326965, N'Luis', N'Psj. Juan', N'Huancayo', N'Luis@gmail.com', N'932773265')
SET IDENTITY_INSERT [dbo].[tblProducto] ON 

INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (1, N'Cerveza Pilsen', N'Pilsen Callao 1 unid', 5, 101, CAST(4.50 AS Decimal(18, 2)), 100, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (2, N'Chocman', N'Pack 6 unidades', 4, 102, CAST(2.50 AS Decimal(18, 2)), 100, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (3, N'Sprite 500 ml', N'Pack 15 unidades', 2, 101, CAST(15.00 AS Decimal(18, 2)), 50, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (4, N'Princesa', N'Caja chocolate', 4, 102, CAST(12.00 AS Decimal(18, 2)), 40, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (5, N'Guarana 500ml', N'Pack 15 unidades', 5, 101, CAST(13.00 AS Decimal(18, 2)), 20, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (6, N'Fanta', N'500ml', 2, 101, CAST(1.50 AS Decimal(18, 2)), 200, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (7, N'Res', N'Pack de 1kilo', 9, 104, CAST(10.00 AS Decimal(18, 2)), 200, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (8, N'Pollo', N'Pack de 1kilo', 9, 104, CAST(15.00 AS Decimal(18, 2)), 200, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (9, N'Manzana', N'Pack de 1k', 8, 103, CAST(5.00 AS Decimal(18, 2)), 30, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (10, N'Naranja', N'Pack de 1k', 8, 103, CAST(4.00 AS Decimal(18, 2)), 30, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (30, N'Huevo', N'Pack de 15 unidades', 7, 100, CAST(7.00 AS Decimal(18, 2)), 200, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (31, N'Leche', N'Leche 20 unidades', 6, 100, CAST(3.20 AS Decimal(18, 2)), 30, N'./img/prod1.jpg')
INSERT [dbo].[tblProducto] ([Codigo], [Nombre], [Descripcion], [CodigoProveedor], [CodigoCategoria], [Precio], [Stock], [Imagen]) VALUES (32, N'Matequilla', N'Pack 18 unidades', 6, 100, CAST(7.00 AS Decimal(18, 2)), 65, N'./img/prod1.jpg')
SET IDENTITY_INSERT [dbo].[tblProducto] OFF
SET IDENTITY_INSERT [dbo].[tblProveedor] ON 

INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (1, N'123456789', N'Alicorp', N'Jr. San Agustin', N'Huancayo', N'946372213', N'alicorp@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (2, N'987654321', N'Lindley', N'Av. San Fernando', N'Huancayo', N'946271412', N'Lindley@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (3, N'147852369', N'Molitalia', N'El Callao', N'Lima', N'923647645', N'molitalia@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (4, N'877552014', N'Costa', N'Santa Clara', N'Lima', N'921748653', N'costa@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (5, N'144455654', N'Backus', N'San Carlos', N'Huancayo', N'932655273', N'backus@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (6, N'393898554', N'Gloria', N'Santa Monica', N'Lima', N'934656756', N'gloria@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (7, N'934772436', N'La calera', N'Metropolitana', N'Lima', N'932625241', N'lacalera@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (8, N'129813905', N'Fruta S.A.C', N'Jr. Ica', N'Huancayo', N'928746546', N'fruta@gmail.com')
INSERT [dbo].[tblProveedor] ([Codigo], [RUC], [Nombre], [Direccion], [Ciudad], [Telefono], [Correo]) VALUES (9, N'219792568', N'San Fernando', N'Jr. cajamarca', N'Huancayo', N'9327645r21', N'sanfernando@gmail.com')
SET IDENTITY_INSERT [dbo].[tblProveedor] OFF
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD  CONSTRAINT [fk_det_prod] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[tblProducto] ([Codigo])
GO
ALTER TABLE [dbo].[tblDetalleVenta] CHECK CONSTRAINT [fk_det_prod]
GO
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD  CONSTRAINT [fk_venta_det] FOREIGN KEY([CodigoVenta])
REFERENCES [dbo].[tblVenta] ([Codigo])
GO
ALTER TABLE [dbo].[tblDetalleVenta] CHECK CONSTRAINT [fk_venta_det]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [fk_prod_cat] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[tblCategoria] ([Codigo])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [fk_prod_cat]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [fl_prod_prov] FOREIGN KEY([CodigoProveedor])
REFERENCES [dbo].[tblProveedor] ([Codigo])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [fl_prod_prov]
GO
ALTER TABLE [dbo].[tblVenta]  WITH CHECK ADD  CONSTRAINT [fk_ven_cli] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tblCliente] ([Codigo])
GO
ALTER TABLE [dbo].[tblVenta] CHECK CONSTRAINT [fk_ven_cli]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_datos]    Script Date: 29/11/2019 01:32:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_datos]
as
select Codigo, Nombre, Descripcion, CodigoProveedor, CodigoCategoria, Precio, Stock, Imagen
from tblProducto
GO
USE [master]
GO
ALTER DATABASE [Minimarket] SET  READ_WRITE 
GO

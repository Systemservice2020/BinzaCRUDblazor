USE [master]
GO
/****** Object:  Database [BinsaDB]    Script Date: 17/03/2022 14:14:15 ******/
CREATE DATABASE [BinsaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BinsaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BinsaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BinsaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BinsaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BinsaDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BinsaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BinsaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BinsaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BinsaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BinsaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BinsaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BinsaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BinsaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BinsaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BinsaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BinsaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BinsaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BinsaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BinsaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BinsaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BinsaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BinsaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BinsaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BinsaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BinsaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BinsaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BinsaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BinsaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BinsaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BinsaDB] SET  MULTI_USER 
GO
ALTER DATABASE [BinsaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BinsaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BinsaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BinsaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BinsaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BinsaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BinsaDB', N'ON'
GO
ALTER DATABASE [BinsaDB] SET QUERY_STORE = OFF
GO
USE [BinsaDB]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[Domicilio] [nvarchar](40) NULL,
	[CodigoPostal] [nvarchar](5) NULL,
	[Poblacion] [nvarchar](40) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactosCliente]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactosCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Telefono] [nvarchar](40) NULL,
	[Email] [nvarchar](40) NULL,
	[Nombre] [nvarchar](40) NULL,
 CONSTRAINT [PK_ContactosCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactosCliente]  WITH CHECK ADD  CONSTRAINT [FK_ContactosCliente_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[ContactosCliente] CHECK CONSTRAINT [FK_ContactosCliente_Clientes]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClientes]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarClientes]
@Id int,
@Nombre [NVARCHAR](40),
@Domicilio   [NVARCHAR](40),
@CodigoPostal[NVARCHAR](5),
@Poblacion   [NVARCHAR](40)
as
update 
Clientes 
set Nombre=@Nombre,Domicilio=@Domicilio,CodigoPostal=@CodigoPostal,Poblacion=@Poblacion
where Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContactos]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarContactos]
@Id int,
@ClienteId int,
@Nombre   [NVARCHAR](40),
@Telefono   [NVARCHAR](40),
@Email[NVARCHAR](40)
as
update ContactosCliente 
set ClienteId=@ClienteId,Nombre=@Nombre,Telefono=@Telefono,Email=@Email
where Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[CrearClientes]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CrearClientes]
@Nombre [NVARCHAR](40),
@Domicilio   [NVARCHAR](40),
@CodigoPostal[NVARCHAR](5),
@Poblacion   [NVARCHAR](40)
as
insert into Clientes values (@Nombre,@Domicilio,@CodigoPostal,@Poblacion);
GO
/****** Object:  StoredProcedure [dbo].[CrearContactos]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CrearContactos]
@ClienteId int,
@Nombre [NVARCHAR](40),
@Telefono   [NVARCHAR](40),
@Email[NVARCHAR](40)

as
insert into [dbo].[ContactosCliente](ClienteId,Nombre,Telefono,Email)values (@ClienteId,@Nombre,@Telefono,@Email);
GO
/****** Object:  StoredProcedure [dbo].[EliminarClientes]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EliminarClientes]
@Id int
as
delete from Clientes where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarContactos]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EliminarContactos]
@Id int
as
delete from ContactosCliente where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[LeerCliente]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LeerCliente]
@Nombre nvarchar(40) = null
as
Select * from Clientes
where Nombre like '%'+ISNULL(@Nombre,Nombre)+'%'
GO
/****** Object:  StoredProcedure [dbo].[LeerContactosCliente]    Script Date: 17/03/2022 14:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LeerContactosCliente]
@Nombre nvarchar(40) = null
as
Select a.Id, a.ClienteId,a.Nombre, a.Telefono, a.Email
from ContactosCliente a
where Nombre like '%'+ISNULL(@Nombre,Nombre)+'%'
GO
USE [master]
GO
ALTER DATABASE [BinsaDB] SET  READ_WRITE 
GO

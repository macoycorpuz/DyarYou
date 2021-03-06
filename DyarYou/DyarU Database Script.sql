USE [master]
GO
/****** Object:  Database [DyarU Database]    Script Date: 25/06/2017 4:33:28 PM ******/
CREATE DATABASE [DyarU Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DyarU Database', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DyarU Database.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DyarU Database_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DyarU Database_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DyarU Database] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DyarU Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DyarU Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DyarU Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DyarU Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DyarU Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DyarU Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [DyarU Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DyarU Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DyarU Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DyarU Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DyarU Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DyarU Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DyarU Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DyarU Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DyarU Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DyarU Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DyarU Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DyarU Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DyarU Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DyarU Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DyarU Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DyarU Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DyarU Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DyarU Database] SET RECOVERY FULL 
GO
ALTER DATABASE [DyarU Database] SET  MULTI_USER 
GO
ALTER DATABASE [DyarU Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DyarU Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DyarU Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DyarU Database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DyarU Database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DyarU Database', N'ON'
GO
USE [DyarU Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Role] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[Article_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Body] [varchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Is_Approved] [bit] NULL,
	[Is_Rejected] [bit] NULL,
	[Account_ID] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Article_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NOT NULL,
	[Is_Anonymous] [bit] NULL,
	[Article_ID] [int] NOT NULL,
	[Account_ID] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Feedback_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[Tag_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tag_Name] [varchar](50) NOT NULL,
	[Article_ID] [int] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Tag_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [First_Name], [Last_Name], [Role]) VALUES (1, N'a', N'a', N'Gabriel ', N'Abel', 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [First_Name], [Last_Name], [Role]) VALUES (2, N'b', N'b', N'Marcuz', N'Corpuz', 0)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [First_Name], [Last_Name], [Role]) VALUES (3, N'c', N'c', N'Christian', N'Floresta', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (1, N'Technology', N'Article1 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.', CAST(N'2017-06-24 02:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (10, N'Entertainment', N'Article2 Title', N'Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 03:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (11, N'Sports', N'Article3 Title', N'Nulla at vehicula odio. Duis in lectus neque. Cras auctor nibh ut elit suscipit facilisis feugiat nec ante. Aenean quam massa, volutpat non feugiat ut, feugiat quis diam. Aliquam erat volutpat. Cras dui mi, ultricies vitae consequat sed, hendrerit et ligula. Praesent tristique tellus eget nisl sodales tempor. Morbi sed vestibulum tortor. Donec suscipit eros ante. Mauris feugiat, ex id auctor malesuada, lectus erat efficitur quam, sit amet luctus nisi nunc sed purus. Maecenas euismod volutpat sapien vitae fermentum.', CAST(N'2017-06-24 04:30:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (13, N'Bussiness', N'Article4 Title', N'Fusce pulvinar faucibus neque eget luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce arcu massa, dignissim suscipit blandit sed, imperdiet sed libero. Suspendisse viverra, libero ut dapibus sagittis, mauris risus rhoncus urna, eget porttitor neque felis et tellus. Donec turpis metus, ornare sit amet justo id, tincidunt porttitor nisi. Nam in finibus lorem. Pellentesque sed egestas nibh. Vivamus eget vulputate risus. Aenean finibus mauris quis urna imperdiet, sit amet congue neque dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vulputate scelerisque diam at ornare. Suspendisse nec nunc ac augue suscipit efficitur. Morbi sit amet dui a velit venenatis iaculis sit amet lacinia felis. Fusce vehicula dui nec augue pulvinar, quis tincidunt arcu feugiat.', CAST(N'2017-06-24 05:30:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (15, N'Technology', N'Article5 Title', N'Etiam ut risus lobortis, porttitor ex vel, pretium purus. Pellentesque sit amet est elit. Vivamus ac ligula ex. Maecenas eget ultrices dui, ac tempus elit. Proin dapibus pellentesque eros aliquet suscipit. Ut imperdiet sem vitae nibh consectetur blandit. Nunc dapibus aliquet magna sed venenatis. Aenean pellentesque pharetra libero, nec volutpat urna mollis at. Aliquam erat nisl, fringilla quis sagittis vitae, ultrices ac magna. Nulla purus sem, placerat varius velit non, imperdiet rhoncus leo. Praesent eget purus a mauris cursus blandit. Donec at volutpat arcu.', CAST(N'2017-06-24 06:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (16, N'Entertainment', N'Article6 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 07:30:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (17, N'Technology', N'Article7 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.

Nulla at vehicula odio. Duis in lectus neque. Cras auctor nibh ut elit suscipit facilisis feugiat nec ante. Aenean quam massa, volutpat non feugiat ut, feugiat quis diam. Aliquam erat volutpat. Cras dui mi, ultricies vitae consequat sed, hendrerit et ligula. Praesent tristique tellus eget nisl sodales tempor. Morbi sed vestibulum tortor. Donec suscipit eros ante. Mauris feugiat, ex id auctor malesuada, lectus erat efficitur quam, sit amet luctus nisi nunc sed purus. Maecenas euismod volutpat sapien vitae fermentum.', CAST(N'2017-06-24 08:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (18, N'Technology', N'Article8 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.

Nulla at vehicula odio. Duis in lectus neque. Cras auctor nibh ut elit suscipit facilisis feugiat nec ante. Aenean quam massa, volutpat non feugiat ut, feugiat quis diam. Aliquam erat volutpat. Cras dui mi, ultricies vitae consequat sed, hendrerit et ligula. Praesent tristique tellus eget nisl sodales tempor. Morbi sed vestibulum tortor. Donec suscipit eros ante. Mauris feugiat, ex id auctor malesuada, lectus erat efficitur quam, sit amet luctus nisi nunc sed purus. Maecenas euismod volutpat sapien vitae fermentum.

Fusce pulvinar faucibus neque eget luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce arcu massa, dignissim suscipit blandit sed, imperdiet sed libero. Suspendisse viverra, libero ut dapibus sagittis, mauris risus rhoncus urna, eget porttitor neque felis et tellus. Donec turpis metus, ornare sit amet justo id, tincidunt porttitor nisi. Nam in finibus lorem. Pellentesque sed egestas nibh. Vivamus eget vulputate risus. Aenean finibus mauris quis urna imperdiet, sit amet congue neque dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vulputate scelerisque diam at ornare. Suspendisse nec nunc ac augue suscipit efficitur. Morbi sit amet dui a velit venenatis iaculis sit amet lacinia felis. Fusce vehicula dui nec augue pulvinar, quis tincidunt arcu feugiat.', CAST(N'2017-06-24 09:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (24, N'Entertainment', N'Article9 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.

Nulla at vehicula odio. Duis in lectus neque. Cras auctor nibh ut elit suscipit facilisis feugiat nec ante. Aenean quam massa, volutpat non feugiat ut, feugiat quis diam. Aliquam erat volutpat. Cras dui mi, ultricies vitae consequat sed, hendrerit et ligula. Praesent tristique tellus eget nisl sodales tempor. Morbi sed vestibulum tortor. Donec suscipit eros ante. Mauris feugiat, ex id auctor malesuada, lectus erat efficitur quam, sit amet luctus nisi nunc sed purus. Maecenas euismod volutpat sapien vitae fermentum.

Fusce pulvinar faucibus neque eget luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce arcu massa, dignissim suscipit blandit sed, imperdiet sed libero. Suspendisse viverra, libero ut dapibus sagittis, mauris risus rhoncus urna, eget porttitor neque felis et tellus. Donec turpis metus, ornare sit amet justo id, tincidunt porttitor nisi. Nam in finibus lorem. Pellentesque sed egestas nibh. Vivamus eget vulputate risus. Aenean finibus mauris quis urna imperdiet, sit amet congue neque dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vulputate scelerisque diam at ornare. Suspendisse nec nunc ac augue suscipit efficitur. Morbi sit amet dui a velit venenatis iaculis sit amet lacinia felis. Fusce vehicula dui nec augue pulvinar, quis tincidunt arcu feugiat.

Etiam ut risus lobortis, porttitor ex vel, pretium purus. Pellentesque sit amet est elit. Vivamus ac ligula ex. Maecenas eget ultrices dui, ac tempus elit. Proin dapibus pellentesque eros aliquet suscipit. Ut imperdiet sem vitae nibh consectetur blandit. Nunc dapibus aliquet magna sed venenatis. Aenean pellentesque pharetra libero, nec volutpat urna mollis at. Aliquam erat nisl, fringilla quis sagittis vitae, ultrices ac magna. Nulla purus sem, placerat varius velit non, imperdiet rhoncus leo. Praesent eget purus a mauris cursus blandit. Donec at volutpat arcu.', CAST(N'2017-06-24 10:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (25, N'Entertainment', N'Article10 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 11:30:00.000' AS DateTime), 1, 0, 2)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (26, N'Sports', N'Article11 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 12:30:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (27, N'Bussiness', N'Article12 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 13:30:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[Article] ([Article_ID], [Category], [Title], [Body], [Date], [Is_Approved], [Is_Rejected], [Account_ID]) VALUES (28, N'Bussiness', N'Article13 Title', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam porttitor neque et elementum. Quisque malesuada sagittis aliquam. Aenean quis gravida augue. Phasellus mollis semper dolor, eu molestie quam. Cras congue sed sapien sit amet suscipit. Sed a justo id lacus porta condimentum vitae non dolor. Etiam accumsan libero eu gravida tempor. Proin iaculis felis vel aliquet sagittis. Pellentesque sit amet consectetur metus. Maecenas iaculis ultrices ante et condimentum. In gravida, leo finibus consectetur venenatis, sem arcu maximus nisi, ac tempor odio nibh vel arcu.

Curabitur maximus massa facilisis risus vulputate, eget sollicitudin libero efficitur. Nulla mi ante, fermentum nec lacus non, vestibulum bibendum urna. Integer euismod tincidunt eros, ut cursus metus aliquam eu. Morbi aliquam accumsan fringilla. Pellentesque vitae sagittis libero, nec cursus sapien. Praesent ac facilisis dolor, sed efficitur enim. Vivamus ultricies justo ac felis ultricies, id pharetra felis elementum. Duis sem nibh, congue nec nisi ut, tempor tempus est. Aenean porta laoreet odio vel ullamcorper. Proin tincidunt finibus tortor quis porta. Cras volutpat lacus quis erat sagittis, viverra pretium ex dapibus. Mauris fermentum faucibus diam id elementum. Ut sed pretium orci, at maximus velit. Cras ut tincidunt odio, non auctor quam.', CAST(N'2017-06-24 14:30:00.000' AS DateTime), 1, 0, 3)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (1, N'Tech', 1)
INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (2, N'Science', 1)
INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (3, N'Drama', 10)
INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (4, N'Action', 11)
INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (5, N'Money', 13)
INSERT [dbo].[Tag] ([Tag_ID], [Tag_Name], [Article_ID]) VALUES (6, N'Tech', 15)
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Account_Username]    Script Date: 25/06/2017 4:33:28 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ_Account_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Article] FOREIGN KEY([Article_ID])
REFERENCES [dbo].[Article] ([Article_ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Article]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Article] FOREIGN KEY([Article_ID])
REFERENCES [dbo].[Article] ([Article_ID])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_Article]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAccount]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Adds an account
-- Param: Username - Password - First name - Last Name - Role
-- Returns: Error Message
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_AddAccount]
	@Username		VARCHAR(50),
	@Password		VARCHAR(50),
	@FirstName		VARCHAR(50),
	@LastName		VARCHAR(50),
	@Role			BIT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO Account
			(
				Username,
				Password,
				First_Name,
				Last_Name,
				Role
			)
			VALUES
			(
				@Username,
				@Password,
				@FirstName,
				@LastName,
				@Role
			)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS 'Error'
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddAnArticle]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Adds an article
-- Param: Category - Title - Body - Date - Isapproved
--		  Isrejected - Username
-- Returns: Error message
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_AddAnArticle]
	@Category		VARCHAR(20),
	@Title			VARCHAR(50),
	@Body			VARCHAR(MAX),
	@Date			DATETIME,
	@Username		VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO Article
			(
				Category,
				Title,
				Body,
				Date,
				Account_ID
			)
			VALUES
			(
				@Category,
				@Title,
				@Body,
				@Date,
				(SELECT AC.Account_ID FROM Account AS AC WHERE AC.Username = @Username)
			)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS 'Error'
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddTag]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Adds a tag
-- Param: Title - Tag
-- Returns: Error Message
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_AddTag]
	@Title		VARCHAR(50),
	@Tag		VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO Tag
			(
				Article_ID,
				Tag_Name
			)
			VALUES
			(
				(SELECT AR.Article_ID FROM Article AS AR WHERE AR.Title = @Title),
				@Tag
			)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS 'Error'
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccount_Name]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets account name
-- Param: Username
-- Returns: Firstname - Lastname
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetAccount_Name]
	@Username		VARCHAR(50)
AS
BEGIN
	SELECT AC.First_Name,AC.Last_Name
	FROM Account AS AC
	WHERE AC.Username = @Username
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccount_Role]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets account role
-- Param: Username
-- Returns: Role
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetAccount_Role]
	@Username		VARCHAR(50)
AS
BEGIN
	SELECT AC.Role
	FROM Account AS AC
	WHERE AC.Username = @Username
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccount_Validity]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Checks account validity
-- Param: Username - Password
-- Returns: ID
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetAccount_Validity]
	@Username		VARCHAR(50),
	@Password		VARCHAR(50)
AS
BEGIN
	SELECT AC.Account_ID
	FROM Account AS AC
	WHERE AC.Username = @Username
	  AND AC.Password = @Password
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Get articles
-- Param: 
-- Returns: Title - Body - Firstname,Lastname - Isapproved
--          Isrejected - Date
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle]
AS
BEGIN
	SELECT AR.Category, AR.Title, AR.Date, AC.First_Name + ' ' + AC.Last_Name AS 'Name', AR.Is_Approved, AR.Is_Rejected
	FROM Article AS AR
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	ORDER BY AR.Date DESC 
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle_Category]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets an article by category
-- Param: Category
-- Returns: Title - Body - Firstname,Lastname
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle_Category]
	@Category		VARCHAR(20)
AS
BEGIN
	SELECT AR.Title,SUBSTRING(AR.Body,1,200) AS 'Body', AC.First_Name + ' ' + AC.Last_Name AS 'Name'
	FROM Article AS AR
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	WHERE AR.Category = @Category
	  AND Is_Approved = 1
	ORDER BY AR.Date DESC 
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle_Category_FP]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets an article by category for front page
-- Param: Category
-- Returns: Title - Body - Firstname,Lastname (top 4)
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle_Category_FP]
	@Category		VARCHAR(20)
AS
BEGIN
    SELECT TOP 2 AR.Title, SUBSTRING(AR.Body,1,200) AS 'Body', AC.First_Name + ' ' + AC.Last_Name AS 'Name'
	FROM Article AS AR
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	WHERE AR.Category = @Category
	  AND Is_Approved = 1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle_Tag]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets articles by tag
-- Param: Tag
-- Returns: Title - Body - Firstname/Lastname
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle_Tag]
	@Tag		VARCHAR(50)
AS
BEGIN
	SELECT AR.Title, SUBSTRING(AR.Body,1,200) As 'Body', AC.First_Name + ' ' + AC.Last_Name AS 'Name'
	FROM Article AS AR
		INNER JOIN Tag AS T
		ON T.Article_ID =AR.Article_ID
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	WHERE T.Tag_Name = @Tag
	  AND AR.Is_Approved = 1
	ORDER BY AR.Date DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle_Title]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets an article by title
-- Param: Title
-- Returns: Category - Title - Body - Firstname,Lastname
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle_Title]
	@Title		VARCHAR(50)
AS
BEGIN
	SELECT AR.Category, AR.Title,AR.Body, AC.First_Name + ' ' + AC.Last_Name AS 'Name'
	FROM Article AS AR
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	WHERE AR.Title = @Title
	  AND Is_Approved = 1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetArticle_Username]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets an article by username
-- Param: Username
-- Returns: Title - Body - Firstname,Lastname - Status
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetArticle_Username]
	@Username		VARCHAR(20)
AS
BEGIN
	SELECT AR.Title,SUBSTRING(AR.Body,1,200) AS 'Body', AC.First_Name + ' ' + AC.Last_Name AS 'Name', AR.Is_Approved, AR.Is_Rejected
	FROM Article AS AR
		INNER JOIN Account AS AC
		ON AC.Account_ID = AR.Account_ID
	WHERE AC.Username = @Username
	ORDER BY AR.Date DESC 
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTag]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Gets tag of articles
-- Param: Title
-- Returns: Tags
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_GetTag]
	@Title		VARCHAR(50)
AS
BEGIN
	SELECT T.Tag_Name
	FROM Tag AS T
		INNER JOIN Article AS AR
		ON AR.Article_ID = T.Article_ID
	WHERE AR.Title = @Title
END

GO
/****** Object:  StoredProcedure [dbo].[sp_RemoveArticle]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Removes an article
-- Param: Title
-- Returns: Error message
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_RemoveArticle]
	@Title			VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM Article
			WHERE Title = @Title
			  AND Is_Rejected = 1
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS 'Error'
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateArticle_Status]    Script Date: 25/06/2017 4:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Description:	Updates an article status
-- Param: Title - Isapproved - Isrejected
-- Returns: Error message
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_UpdateArticle_Status]
	@Title			VARCHAR(50),
	@Isapproved     BIT,
	@Isrejected		BIT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			UPDATE Article 
				SET Is_Approved = @Isapproved,
					Is_Rejected = @Isrejected
			WHERE Title = @Title
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS 'Error'
	END CATCH
END

GO
USE [master]
GO
ALTER DATABASE [DyarU Database] SET  READ_WRITE 
GO

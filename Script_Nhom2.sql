USE [master]
GO
/****** Object:  Database [FilmViet]    Script Date: 06/12/2023 10:51:11 pm ******/
CREATE DATABASE [FilmViet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmViet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\FilmViet.mdf' , SIZE = 1024000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FilmViet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\FilmViet_log.ldf' , SIZE = 1024000KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FilmViet] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmViet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilmViet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilmViet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilmViet] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilmViet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilmViet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilmViet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilmViet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilmViet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilmViet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilmViet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilmViet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FilmViet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilmViet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilmViet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilmViet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilmViet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilmViet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FilmViet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilmViet] SET RECOVERY FULL 
GO
ALTER DATABASE [FilmViet] SET  MULTI_USER 
GO
ALTER DATABASE [FilmViet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilmViet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilmViet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilmViet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FilmViet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FilmViet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FilmViet', N'ON'
GO
ALTER DATABASE [FilmViet] SET QUERY_STORE = OFF
GO
USE [FilmViet]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[comment] [nvarchar](max) NOT NULL,
	[commentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewedDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likedDate] [datetime] NULL,
 CONSTRAINT [PK__history__3213E83F0FBDE858] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vnp_TxnRef] [nchar](8) NOT NULL,
	[videoId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[vnp_OrderInfo] [nchar](30) NOT NULL,
	[vnp_ResponseCode] [nchar](2) NOT NULL,
	[vnp_TransactionNo] [nchar](8) NOT NULL,
	[vnp_Amount] [int] NULL,
	[vnp_BankCode] [nchar](20) NOT NULL,
	[vnp_PayDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hoadon_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[rating] [int] NOT NULL,
	[ratingDate] [datetime] NOT NULL,
 CONSTRAINT [PK__rating__3213E83FBF03A521] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[email] [varchar](200) NOT NULL,
	[shareDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[phone] [char](11) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[token] [nchar](20) NULL,
 CONSTRAINT [PK__user__3213E83F7ADEAF30] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[href] [varchar](50) NOT NULL,
	[poster] [varchar](max) NOT NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[daodien] [nvarchar](max) NOT NULL,
	[dienvien] [nvarchar](max) NOT NULL,
	[theloai] [nvarchar](max) NOT NULL,
	[mota] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[addDate] [datetime] NOT NULL,
 CONSTRAINT [PK__video__3213E83F51084390] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (1, 6, 11, N'Phim hay lắm mọi người ơi ♥', CAST(N'2023-12-06T21:26:30.300' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (2, 5, 11, N'Phim hay lắm, nên xem nheee', CAST(N'2023-12-06T21:28:07.537' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (3, 5, 6, N'Cute qua', CAST(N'2023-12-06T21:28:51.823' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (4, 4, 8, N'Phim rất hay!!!', CAST(N'2023-12-06T21:29:56.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (1, 4, 11, CAST(N'2023-12-06T21:14:32.677' AS DateTime), 1, CAST(N'2023-12-06T21:26:27.183' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (2, 5, 11, CAST(N'2023-12-06T21:14:55.027' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (3, 6, 1, CAST(N'2023-12-06T21:22:04.127' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (4, 6, 11, CAST(N'2023-12-06T21:25:35.173' AS DateTime), 1, CAST(N'2023-12-06T21:25:42.573' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (5, 5, 6, CAST(N'2023-12-06T21:28:40.650' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (6, 4, 7, CAST(N'2023-12-06T21:28:47.160' AS DateTime), 1, CAST(N'2023-12-06T21:28:49.067' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (7, 4, 10, CAST(N'2023-12-06T21:29:05.047' AS DateTime), 1, CAST(N'2023-12-06T21:29:06.967' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (8, 4, 8, CAST(N'2023-12-06T21:29:17.683' AS DateTime), 1, CAST(N'2023-12-06T21:30:16.730' AS DateTime))
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (9, 4, 9, CAST(N'2023-12-06T21:31:41.280' AS DateTime), 0, NULL)
INSERT [dbo].[History] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (10, 8, 16, CAST(N'2023-12-06T22:00:44.863' AS DateTime), 1, CAST(N'2023-12-06T22:00:52.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Hoadon] ON 

INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (1, N'49601223', 11, 5, N'Thanh toan don hang:49601223  ', N'00', N'14223655', 2000000, N'NCB                 ', CAST(N'2023-12-06T21:16:59.777' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (2, N'58386182', 11, 4, N'Thanh toan don hang:58386182  ', N'00', N'14223659', 2000000, N'NCB                 ', CAST(N'2023-12-06T21:17:52.303' AS DateTime))
INSERT [dbo].[Hoadon] ([id], [vnp_TxnRef], [videoId], [userId], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_Amount], [vnp_BankCode], [vnp_PayDate]) VALUES (3, N'07596501', 1, 6, N'Thanh toan don hang:07596501  ', N'00', N'14223675', 2000000, N'NCB                 ', CAST(N'2023-12-06T21:23:22.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[Hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[Share] ON 

INSERT [dbo].[Share] ([id], [userId], [videoId], [email], [shareDate]) VALUES (1, 6, 11, N'21133105@student.hcmute.edu.vn', CAST(N'2023-12-06T21:26:02.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[Share] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (1, N'admin', N'admin', N'0961491604 ', N'Nguyễn Tấn Khang', 1, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (2, N'admin1', N'admin1', N'0919191919 ', N'Khang', 1, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (3, N'admin2', N'admin2', N'0111111111 ', N'Vy', 1, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (4, N'21133014@student.hcmute.edu.vn', N'lP6arj', N'0863745766 ', N'Danh Phan', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (5, N'luongtuongvy2003@gmail.com', N'6vsB1j', N'0773387881 ', N'Vy ne', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (6, N'ntk29072003@gmail.com', N'6zfLc8', N'0961491604 ', N'Khang Nguyen', 0, 1, NULL)
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (7, N'21133105@student.hcmute.edu.vn', N'111111', N'0987654321 ', N'Kaan Toof proooo', 0, 1, N'xf6et1XH9W9n        ')
INSERT [dbo].[User] ([id], [email], [password], [phone], [fullname], [isAdmin], [isActive], [token]) VALUES (8, N'doanhongdu1012@gmail.com', N'0985474748du', N'0985474748 ', N'Đoàn Hồng Du', 0, 1, N'mfczHZ0XXwnt        ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (1, N'Lối sống của Hitori Bocchi - Tập 01', N'GOTj2Ji1MYE', N'https://img.youtube.com/vi/GOTj2Ji1MYE/maxresdefault.jpg', 12, 1, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T20:59:46.713' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (2, N'Lối sống của Hitori Bocchi - Tập 02', N'M5WMQB-FgA4', N'https://img.youtube.com/vi/M5WMQB-FgA4/maxresdefault.jpg', 11, 1, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T21:01:49.437' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (3, N'Lối sống của Hitori Bocchi - Tập 03', N'ECks1mI1fkY', N'https://img.youtube.com/vi/ECks1mI1fkY/maxresdefault.jpg', 6, 1, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T21:02:17.580' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (4, N'Lối sống của Hitori Bocchi - Tập 04', N'x7ezGAwSfTA', N'https://img.youtube.com/vi/x7ezGAwSfTA/maxresdefault.jpg', 9, 2, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T21:03:15.790' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (5, N'Lối sống của Hitori Bocchi - Tập 05', N'pBhWHEG8nxw', N'https://img.youtube.com/vi/pBhWHEG8nxw/maxresdefault.jpg', 4, 0, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T21:03:40.840' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (6, N'Lối sống của Hitori Bocchi - Tập 06', N'uqnaaAK-5Vw', N'https://img.youtube.com/vi/uqnaaAK-5Vw/maxresdefault.jpg', 15, 1, N'Jukki Hanada;  Kii Tanaka; Ryuuichi Takada; Hidekazu Tanaka', N'Chisaki Morishita; Minami Tanaka; Akari Kitō; Yūko Kurose; Kana Ichinose; Konomi Kohara', N'Anime', N'ひとりぼっちの○○生活', N'Hitori Bocchi là cô gái bị mắc hội chứng sợ xã hội, làm cho việc giao tiếp rất khó khăn với cô. Khi vào trung học, Kai Yawara, người bạn duy nhất của Bocchi nói rằng họ sẽ cắt đứt mối quan hệ này cho đến khi cô làm bạn được với tất cả mọi người trong lớp mình. Vậy nên, Bocchi phải hoàn thành nhiệm vụ này trước khi ra trường.', 20000, 1, CAST(N'2023-12-06T21:04:15.257' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (7, N'Shikimori-san của tôi không chỉ dễ thương - Tập 01 [Việt sub]', N'jjd_anr5KwU', N'https://img.youtube.com/vi/jjd_anr5KwU/maxresdefault.jpg', 8, 2, N'Muse', N'afdf, dgfvd', N'Anime', N'Kawaii dake ja Nai Shikimori-san Shikimori''s Not Just a Cutie', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời!
Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.
​', 20000, 1, CAST(N'2023-12-06T21:09:35.050' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (8, N'Shikimori-san của tôi không chỉ dễ thương - Tập 02 [Việt sub]', N'4MS6DEzmil8', N'https://img.youtube.com/vi/4MS6DEzmil8/maxresdefault.jpg', 8, 1, N'Muse', N'abc, fcdwd', N'Anime', N'Kawaii dake ja Nai Shikimori-san Shikimori''s Not Just a Cutie', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời!
Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 20000, 1, CAST(N'2023-12-06T21:10:45.390' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (9, N'Shikimori-san của tôi không chỉ dễ thương - Tập 03 [Việt sub]', N'VJvIyTaPV0c', N'https://img.youtube.com/vi/VJvIyTaPV0c/maxresdefault.jpg', 16, 1, N'Muse', N'abcuab, sdvu', N'Anime', N'Kawaii dake ja Nai Shikimori-san Shikimori''s Not Just a Cutie', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời!
Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 20000, 1, CAST(N'2023-12-06T21:11:44.250' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (10, N'Shikimori-san của tôi không chỉ dễ thương - Tập 04 [Việt sub]', N'CP0nXvaoaRY', N'https://img.youtube.com/vi/CP0nXvaoaRY/maxresdefault.jpg', 13, 3, N'Muse', N'cadsv, vges', N'Anime', N'Kawaii dake ja Nai Shikimori-san Shikimori''s Not Just a Cutie', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời!
Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 20000, 1, CAST(N'2023-12-06T21:12:30.977' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (11, N'Shikimori-san của tôi không chỉ dễ thương - Tập 05 [Việt sub]', N'yuawQtBI8XY', N'https://img.youtube.com/vi/yuawQtBI8XY/maxresdefault.jpg', 7, 3, N'Muse', N'vdsv, serg', N'Anime', N'Kawaii dake ja Nai Shikimori-san Shikimori''s Not Just a Cutie', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời!
Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 20000, 0, CAST(N'2023-12-06T21:13:14.017' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (12, N'2 Ngày 1 Đêm Mùa 2 | Tập 38', N'tBOQecZij-w', N'https://img.youtube.com/vi/tBOQecZij-w/maxresdefault.jpg', 18, 0, N'Mai Thắm', N'Trường Giang; Kiều Minh Tuấn; Ngô Kiến Huy; Lê Dương Bảo Lâm; Cris Phan; HIEUTHUHAI', N'Giải trí, Hài kịch', N'⛺ Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng cùng nhau tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả.  ', N'2 Ngày 1 Đêm Mùa 2 | Tập 38: Trường Giang đóng vai kẻ phản diện, HIEUTHUHAI bị đưa vào tròng

Tuần này dàn cast và khách mời sẽ trải qua những thử thách cuối cùng tại Bình Định, khép lại một hành trình đầy thú vị và nhiều tiếng cười. Chờ xem những màn tấu hài siêu lầy lội của biệt đội 2 Ngày 1 Đêm nhé!

Xem TRỌN BỘ 2 Ngày 1 Đêm Mùa 2 👉   

 • 🎉2 NGÀY 1 ĐÊM MÙA 2 🎉 | Nhân đôi BẤT ...  

🎧 Nghe Theme song 2 Ngày 1 Đêm  👉 https://VieNETWORK.bfan.link/2N1D

💞Sở hữu các sản phẩm Merchandise 2 Ngày 1 Đêm tại https://vieshop.vn/

#2Ngay1Dem #2Ngày1Đêm #Mùa2 #2Ngày1ĐêmMùa2 #2Ngay1DemMua2 #Tập38 #DongTayPromotion #BRay #BigDaddy
#TrườngGiang #KiềuMinhTuấn #LêDươngBảoLâm #NgôKiếnHuy #CrisPhan #HIEUTHUHAI 

⛺ Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng cùng nhau tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả.  

⏰Đón xem 2 NGÀY 1 ĐÊM - MÙA 2 vào lúc:
📺 20H30 Chủ Nhật hàng tuần trên kênh truyền hình HTV7, siêu ứng dụng giải trí VieON
▶️ 20H40 trên kênh ​⁠@dongtaypromotionofficial và kênh ​⁠​⁠@2NGAY1DEM 

©️ 2 Ngày 1 Đêm Việt Nam thuộc sở hữu của Dong Tay Promotion và được bảo vệ bản quyền bởi VieNETWORK

📣 Subscribe kênh ĐÔNG TÂY PROMOTION OFFICIAL để không bỏ lỡ các chương trình SIÊU HẤP DẪN: https://bit.ly/SubDTP
📣 Subscribe kênh DONG TAY ENTERTAINMENT để xem các VIDEO HOT từ các show đỉnh nhất: https://bit.ly/SubDTE
Xem thêm tại: https://click.vieon.vn/wSBG/yttvshow 

Tải app VieON tại: https://click.vieon.vn/wSBG/ytapp

⏩ Bí mật HẬU TRƯỜNG: https://bit.ly/HAUTRUONGDTP 
⏩ SHOW HAY mỗi ngày: https://bit.ly/showhotDTP ', 0, 1, CAST(N'2023-12-06T21:38:31.710' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (13, N'2 Ngày 1 Đêm Mùa 2 | Tập 39', N'lhznO_xsbfU', N'https://img.youtube.com/vi/lhznO_xsbfU/maxresdefault.jpg', 15, 1, N'Mai Thắm', N'Trường Giang; Kiều Minh Tuấn; Ngô Kiến Huy; Lê Dương Bảo Lâm; Cris Phan; HIEUTHUHAI', N'Giải trí, Hài kịch', N'⛺ Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng cùng nhau tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả.  ', N'2 Ngày 1 Đêm - Mùa 2 | Tập 39: Ngô Kiến Huy - Ngọc Phước bị gài bẫy, Kiều Minh Tuấn trả đũa bất thành

2 Ngày 1 Đêm tiếp tục hành trình mới tại Phú Yên - là vùng đất nổi tiếng với vẻ đẹp hoang sơ và hùng vĩ. Dàn khách mời cực "hùng hậu" trong chặng này hứa hẹn sẽ mang đến những màn tranh đấu hết mình và cực kỳ gay cấn.

Xem TRỌN BỘ 2 Ngày 1 Đêm Mùa 2 ➡️   

 • 🌈 2 NGÀY 1 ĐÊM VIỆT NAM - MÙA 2 | Phi...  

🎧 Nghe Theme song 2 Ngày 1 Đêm  👉 https://VieNETWORK.bfan.link/2N1D

💕Sở hữu các sản phẩm Merchandise 2 Ngày 1 Đêm tại https://vieshop.vn/

#2Ngay1Dem #2Ngày1Đêm #Mùa2 #2Ngày1ĐêmMùa2 #2Ngay1DemMua2 #Tập39 #DongTayPromotion #TrườngGiang #KiềuMinhTuấn #LêDươngBảoLâm #NgôKiếnHuy #CrisPhan #HIEUTHUHAI #LâmVỹDạ #Puka #NamThư #MinhTú #NgọcPhước #KhaLy

🏕 Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng vào tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả. 

⏰Đón xem 2 NGÀY 1 ĐÊM - MÙA 2 vào lúc:
📺 20H30 Chủ Nhật hàng tuần trên kênh truyền hình HTV7, siêu ứng dụng giải trí VieON
▶️ 20H40 trên kênh  @dongtaypromotionofficial  và  @2NGAY1DEM      
  
📣 Subscribe kênh 2 NGÀY 1 ĐÊM VIETNAM để xem các tập SỚM NHẤT và MỚI NHẤT: https://bit.ly/2N1DVietnam

©️ 2 Ngày 1 Đêm Việt Nam thuộc sở hữu của Dong Tay Promotion và được bảo vệ bản quyền bởi VieNETWORK

Tải app VieON tại: https://click.vieon.vn/wSBG/ytapp', 0, 1, CAST(N'2023-12-06T21:39:02.713' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (14, N'2 Ngày 1 Đêm Mùa 2 | Tập 40', N'99jkGbsgp3o', N'https://img.youtube.com/vi/99jkGbsgp3o/maxresdefault.jpg', 22, 2, N'Mai Thắm', N'Trường Giang; Kiều Minh Tuấn; Ngô Kiến Huy; Lê Dương Bảo Lâm; Cris Phan; HIEUTHUHAI', N'Giải trí, Hài kịch', N'⛺ Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng cùng nhau tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả.  ', N'2 Ngày 1 Đêm - Mùa 2 |Tập 40: Cris Phan bộc lộ tài năng diễn xuất, Ngô Kiến Huy "combat" với Dương Lâm

Tuần này, Ngô Kiến Huy và Ngọc Phước sẽ được đoàn tụ với anh em sau ngày dài bơ phờ vì bị "đày" ra đảo bắt nhum. Cùng xem những thử thách cười banh nóc trong tập tối nay nhé.

Xem TRỌN BỘ 2 Ngày 1 Đêm Mùa 2 ➡️   

 • 🌈 2 NGÀY 1 ĐÊM VIỆT NAM - MÙA 2 | Phi...  

🎧 Nghe Theme song 2 Ngày 1 Đêm  👉 https://VieNETWORK.bfan.link/2N1D

💕Sở hữu các sản phẩm Merchandise 2 Ngày 1 Đêm tại https://vieshop.vn/

#2Ngay1Dem #2Ngày1Đêm #Mùa2 #2Ngày1ĐêmMùa2 #2Ngay1DemMua2 #Tập40 #DongTayPromotion #TrườngGiang #KiềuMinhTuấn #LêDươngBảoLâm #NgôKiếnHuy #CrisPhan #HIEUTHUHAI #LâmVỹDạ #Puka #NamThư #MinhTú #NgọcPhước #KhaLy

🏕 Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng vào tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả. 

⏰Đón xem 2 NGÀY 1 ĐÊM - MÙA 2 vào lúc:
📺 20H30 Chủ Nhật hàng tuần trên kênh truyền hình HTV7, siêu ứng dụng giải trí VieON
▶️ 20H40 trên kênh  @dongtaypromotionofficial  và  @2NGAY1DEM        
  
📣 Subscribe kênh 2 NGÀY 1 ĐÊM VIETNAM để xem các tập SỚM NHẤT và MỚI NHẤT: https://bit.ly/2N1DVietnam

©️ 2 Ngày 1 Đêm Việt Nam thuộc sở hữu của Dong Tay Promotion và được bảo vệ bản quyền bởi VieNETWORK

Tải app VieON tại: https://click.vieon.vn/wSBG/ytapp', 0, 1, CAST(N'2023-12-06T21:39:35.330' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (15, N'2 Ngày 1 Đêm Mùa 2 | Tập 41', N'XHihpeX3glU', N'https://img.youtube.com/vi/XHihpeX3glU/maxresdefault.jpg', 30, 1, N'Mai Thắm', N'Trường Giang; Kiều Minh Tuấn; Ngô Kiến Huy; Lê Dương Bảo Lâm; Cris Phan; HIEUTHUHAI', N'Giải trí, Hài kịch', N'⛺ Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng cùng nhau tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả.  ', N'2 Ngày 1 Đêm - Mùa 2 | Tập 41: HIEUTHUHAI nổi đóa với Dương Lâm, PuKa thừa cơ đính chính tin đồn

Dàn cast cùng 6 khách mời đã trải qua những thử thách thú vị tại Phú Yên. Với chủ đề "Tình bạn bất diệt", hành trình này chắc chắn sẽ để lại những khoảnh khắc đáng nhớ chỉ có tại 2 Ngày 1 Đêm.

Xem TRỌN BỘ 2 Ngày 1 Đêm Mùa 2 ➡️   

 • 🌈 2 NGÀY 1 ĐÊM VIỆT NAM - MÙA 2 | Phi...  

🎧 Nghe Theme song 2 Ngày 1 Đêm  👉 https://VieNETWORK.bfan.link/2N1D

💕Sở hữu các sản phẩm Merchandise 2 Ngày 1 Đêm tại https://vieshop.vn/

#2Ngay1Dem #2Ngày1Đêm #Mùa2 #2Ngày1ĐêmMùa2 #2Ngay1DemMua2 #Tập41 #DongTayPromotion #TrườngGiang #KiềuMinhTuấn #LêDươngBảoLâm #NgôKiếnHuy #CrisPhan #HIEUTHUHAI #LâmVỹDạ #Puka #NamThư #MinhTú #NgọcPhước #KhaLy

🏕 Chuyến đi 2 Ngày 1 Đêm bắt đầu từ cuộc gặp gỡ của những người đàn ông từ những hoàn cảnh, những cá tính khác nhau nhưng để hết tất cả sau lưng vào tham gia một cuộc hành trình khám phá mọi miền đất nước và khám phá bản thân. Trở lại với phiên bản Mùa 2 với 3 tính chất được thăng hạng 2X (Bất Ngờ - Khổ Đau - Tiếng cười) hứa hẹn những tình huống dở khóc dở cười đến khán giả. 

⏰Đón xem 2 NGÀY 1 ĐÊM - MÙA 2 vào lúc:
📺 20H30 Chủ Nhật hàng tuần trên kênh truyền hình HTV7, siêu ứng dụng giải trí VieON
▶️ 20H40 trên kênh  @dongtaypromotionofficial và  @2NGAY1DEM        
  
📣 Subscribe kênh 2 NGÀY 1 ĐÊM VIETNAM để xem các tập SỚM NHẤT và MỚI NHẤT: https://bit.ly/2N1DVietnam

©️ 2 Ngày 1 Đêm Việt Nam thuộc sở hữu của Dong Tay Promotion và được bảo vệ bản quyền bởi VieNETWORK

Tải app VieON tại: https://click.vieon.vn/wSBG/ytapp', 0, 1, CAST(N'2023-12-06T21:40:05.460' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (16, N'4 Năm 2 Chàng 1 Tình Yêu', N'rUpCouj0dNU', N'https://static2.vieon.vn/vieplay-image/thumbnail_big_v4/2022/01/13/gm127r7k_1920x1080-4nam2chang1tinhyeu_1267_712.jpg', 26, 0, N'Luk Vân', N'Midu, Harry Lu, Anh Tú', N'Phim chiếu rạp', N'4 năm, 2 chàng, 1 tình yêu là một bộ phim tình cảm - hài hước Việt Nam, được công chiếu vào cuối năm 2016. Đây là phim điện ảnh đầu tay của nữ đạo diễn trẻ Luk Vân. Phim có sự tham gia của các diễn viên chính Midu, Harry Lu, và Anh Tú.', N'Nữ sinh Quỳnh đang trên đường đi học thì thấy ba chàng trai đánh nhau giữa đường. Quỳnh đã can ngăn họ và đánh một chàng trai bị thương ở bàn tay. Cô không biết ba chàng trai này chính là bạn mới sẽ học cùng lớp với cô.

Tuấn - chàng trai bị Quỳnh đánh - liên tục trêu chọc Quỳnh để trả đũa cho việc cô làm anh bị thương. Lúc này ở trong trường, có một người rất yêu Quỳnh đó là Thành, cậu học sinh nhỏ tuổi hơn cô.

Tuấn vẫn cứ tiếp tục chọc ghẹo Quỳnh. Tuấn lái xe hơi đến đòi chở Quỳnh về nhà, cô từ chối nhưng anh vẫn bắt cô lên xe. Nói là chở về nhà, nhưng thực ra Tuấn chở Quỳnh ra đến tận bãi biển, sau đó bị công an giao thông phạt xe. Cả hai đành đi xe đò về lại thành phố. Thời gian này Tuấn đã nói lời tỏ tình với Quỳnh.

Mẹ của Tuấn bắt Tuấn chuẩn bị theo bà về Mỹ, mặc dù anh ra sức phản đối. Ở hội trại mùa thu, Tuấn đã lên sân khấu hát một ca khúc tặng cho Quỳnh. Tuấn còn tặng Quỳnh một cái điện thoại, rồi anh táo bạo hôn lên môi cô. Điều này khiến Thành buồn khi anh ở gần đó chứng kiến cuộc tỏ tình. Bất ngờ có một bọn giang hồ truy đuổi Tuấn. Bọn giang hồ này là thuộc hạ của ông Lâm - đối thủ của mẹ Tuấn. Ông Lâm muốn bắt Tuấn để ép mẹ anh từ bỏ chức chủ tịch hội đồng quản trị. Tuấn đang cố bỏ chạy thì bị xe tông, sau đó được đưa đi cấp cứu, và anh được cho là đã chết. Tuấn ra đi đúng lúc Quỳnh chấp nhận tình cảm của anh.

Bốn năm sau, Thành trở thành diễn viên nổi tiếng, còn Quỳnh làm quản lý và cũng là bạn gái của Thành. Họ vẫn đang làm việc chung với những người bạn học năm xưa. Anh chàng Việt kiều tên Ken từ Mỹ về Việt Nam nhận chức giám đốc của công ty giải trí. Quỳnh và cả nhóm đều ngạc nhiên khi thấy Ken giống y hệt Tuấn.

Thành vô tình thấy Ken khóc và nói xin lỗi Quỳnh, từ đó anh phát hiện ra Ken chính là Tuấn. Trong buổi liên hoan của công ty, Thành nói với Tuấn rằng họ đã rất khó khăn để trở về cuộc sống bình thường và hỏi Tuấn rằng "anh quay lại để làm khổ Quỳnh nữa à?". Tuấn vẫn còn sống sau vụ tai nạn năm xưa, suốt bốn năm qua anh thay đổi thân phận chỉ để tìm ra bằng chứng tố cáo những tội ác của ông Lâm. Ngôi mộ của Tuấn là do các bạn trong lớp dựng lên để tưởng nhớ anh, không một ai biết tin tức của anh sau khi anh bị tai nạn.

Khi Tuấn sắp bay về Mỹ, Thành liền chở Quỳnh ra sân bay. Thành kêu Quỳnh hãy giữ Tuấn lại, anh chấp nhận cho cô trở lại với Tuấn. Cuối phim, Tuấn và Quỳnh làm đám cưới.', 45000, 1, CAST(N'2023-12-06T21:55:50.750' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (17, N'Người Mặt Trời', N'5yreWvGqbyg', N'https://img.youtube.com/vi/5yreWvGqbyg/maxresdefault.jpg', 14, 1, N'Timothy Linh Bui', N'Chi Pu, Thuận Nguyễn, Trần Ngọc Vàng, Trịnh Thảo', N'Phim chiếu rạp', N'400 năm qua, loài Ma Cà Rồng đã bí mật sống giữa loài người trong hòa bình, nhưng hiểm họa bỗng ập đến khi một cô gái loài người phát hiện được thân phận của hai anh em Ma Cà Rồng. Người anh khát máu quyết săn lùng cô để bảo vệ bí mật giống loài, trong khi người còn lại chạy đua với thời gian để bảo vệ cô bằng mọi giá.', N'"Người mặt trời" xoay quanh hai anh em ma cà rồng Marco (Thuận Nguyễn) và Nhật (Trần Ngọc Vàng). Sau bốn thế kỷ sống ẩn dật, họ bị lộ danh tính vì Hạ - một nữ sinh cấp ba (Trịnh Thảo). Người anh muốn tiêu diệt Hạ để bảo vệ giống loài, còn người em quyết định chống lại anh để bảo vệ cô. Chi Pu đảm nhận vai phản diện, đóng vai trò thủ lĩnh - người sắp xếp trật tự, luật lệ của thế giới ngầm.', 45000, 1, CAST(N'2023-12-06T21:57:57.670' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (18, N'Người Vợ Cuối Cùng', N'ygvNCEbMusE', N'https://img.youtube.com/vi/ygvNCEbMusE/maxresdefault.jpg', 5, 1, N'Victor Vũ', N'NSƯT Quang Thắng, NSƯT Kim Oanh, Đinh Ngọc Diệp, Nguyễn Anh Dũng, Quốc Huy', N'Phim chiếu rạp', N'Người Vợ cuối cùng chứa đựng đủ mọi cung bậc cảm xúc: lắng đọng với mối tình thanh mai trúc mã tuyệt đẹp của Linh và Nhân, phẫn nộ với mâu thuẫn về chuyện sinh con nối dõi tông đường của ba người vợ quan, và rồi choáng ngợp với hồi kết ly kỳ nhuốm màu đen tối.  Kết hợp với bối cảnh cổ trang được đầu tư và chăm chút kĩ lưỡng, đạo diễn Victor Vũ đưa người xem đến với làng quê Việt Nam xưa để cùng trải nghiệm đời sống của người xưa cũng như hiểu được nỗi khổ của thân phận phụ nữ thời kỳ phong kiến. ', N'Phim được lấy cảm hứng từ tiểu thuyết Hồ oán hận (tác giả Hồng Thái), thay đổi nhiều tình tiết quan trọng. Mào đầu với lời tâm sự của nhân vật chính - Linh (Kaity Nguyễn), đạo diễn hé lộ thân phận thiếu nữ nhà nghèo, bị gả cho quan tri huyện (Quang Thắng). Về làm vợ lẽ nhà giàu, Linh sống trong tủi nhục khi bị vợ cả (Kim Oanh) chì chiết, đối xử như người ở. Cô bị ép đẻ con trai song chỉ sinh được một con gái.

Sau bảy năm sống cam chịu, Linh tình cờ gặp lại Nhân (Thuận Nguyễn) - mối tình đầu một thuở - giữa phiên chợ. Cảm xúc trỗi dậy, đôi nhân vật cuốn vào nhau trong cuộc tình vụng trộm, kéo theo chuỗi bi kịch.

Phim đi sâu vào đời sống dân làng thời phong kiến, thể hiện rõ sự dụng công của đạo diễn trong khâu thiết kế mỹ thuật. Nét văn hóa xưa được cài cắm trong cảnh đầu tiên khi Linh xuất giá về nhà chồng. Nhà dân nghèo được dựng lên bằng tre nứa, lợp mái lá, đối lập với biệt phủ xa hoa, kín cổng cao tưởng của quan tri huyện. Những phụ nữ mặc áo tứ thân, đội nón quai thao dự hội hè, xem múa rối nước. Cảnh phiên chợ giữa làng, người dân buôn thúng bán bưng được tái hiện tốt với không khí tấp nập, giàu sức sống.

Trang phục có lúc trở thành phương thức đạo diễn ví von cho thân phận, tính cách của nhân vật. Mợ Cả mặc áo dài hoa văn cầu kỳ, gam màu nóng, thể hiện quyền lực của nhân vật trong gia đình lẫn tính xảo quyệt, cay độc. Linh chủ yếu diện đồ màu nhạt, ít họa tiết, ngụ ý con người cam chịu, xuất thân thấp kém.', 45000, 1, CAST(N'2023-12-06T22:00:40.103' AS DateTime))
INSERT [dbo].[Video] ([id], [title], [href], [poster], [views], [shares], [daodien], [dienvien], [theloai], [mota], [description], [price], [isActive], [addDate]) VALUES (19, N'Đất Rừng Phương Nam', N'hktzirCnJmQ', N'https://img.youtube.com/vi/hktzirCnJmQ/maxresdefault.jpg', 9, 2, N'Nguyễn Quang Dũng', N'Huỳnh Hạo Khang; Bùi Lý Bảo Ngọc; Đỗ Kỳ; Phong Tuấn; Trần Tiến Luật; Băng Di; Trấn Thành; Hứa Vĩ Văn; Tuyền Mập; Mai Tài Phến; Huỳnh Đông; Bích Ngọc; Công Ninh; Hồng Ánh', N'Phim chiếu rạp', N'Đất rừng phương Nam (tựa tiếng Anh: Song of the South) là một bộ phim điện ảnh Việt Nam thuộc thể loại sử thi – tâm lý – chính kịch ra mắt vào năm 2023, được dựa trên cuốn tiểu thuyết cùng tên của nhà văn Đoàn Giỏi và bộ phim truyền hình Đất phương Nam vào năm 1997.', N'Sau khi trốn thoát khỏi cuộc đối đầu tại lễ diễn tuồng, An và nhóm của mình bắt đầu hành trình phiêu du trên sông. Trong chuyến đi, họ gặp gỡ Út Trong, một phụ nữ hát ca về vùng đất Nam Bộ. Trong khi đang thưởng thức bản hò của Út Trong, một con cá sấu xuất hiện đe dọa nhóm. May mắn, Võ Tòng, một thành viên của tổ chức Nghĩa quân Lục tỉnh và người đã từng bị bắt giữ, xuất hiện kịp thời giải cứu họ.

Sự xuất hiện của Võ Tòng mang theo tin tức quan trọng: cha của An đã trốn thoát thành công trong cuộc bao vây đột xuất của binh lính Pháp. Tin này mang lại hi vọng và khích lệ tinh thần cho An và nhóm. Họ quyết định tiếp tục hành trình của mình, vượt qua những thử thách và nguy hiểm.

Trong khi đang trên đường, An và nhóm phải đối mặt với nhiều chông gai. Họ phải tránh né những cuộc truy cứu của quân Pháp và đối mặt với những kẻ địch khác trong hành trình. Tình cảm giữa An và Xinh, con gái của ông Tiều, càng phát triển và làm cho cuộc hành trình thêm phần phức tạp.

Trong khi đó, An cũng phải đối mặt với nhiều thách thức cá nhân và tìm kiếm ý nghĩa cuộc sống của mình trong bối cảnh cuộc chiến tranh đang diễn ra. An học hỏi từ những trải nghiệm, từ những người xung quanh, và từ những thay đổi trong xã hội để trở thành một người trưởng thành và tự do.

Hành trình của An và nhóm tiếp tục với nhiều khám phá, hi sinh, và những phút giây kịch tính, đồng thời mô tả rõ hình ảnh về cuộc sống và những thách thức trong giai đoạn lịch sử nước Việt Nam đầy biến động.', 45000, 1, CAST(N'2023-12-06T22:05:14.077' AS DateTime))
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__video__7FF10F055E7CC556]    Script Date: 06/12/2023 10:51:12 pm ******/
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [UQ__video__7FF10F055E7CC556] UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__history__viewedD__300424B4]  DEFAULT (getdate()) FOR [viewedDate]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__history__isLiked__30F848ED]  DEFAULT ((0)) FOR [isLiked]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__user__isAdmin__24927208]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__user__isActive__25869641]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__views__29572725]  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__shares__2A4B4B5E]  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__video__isActive__2B3F6F97]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__userId__7F2BE32F] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__comment__userId__7F2BE32F]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__videoId__00200768] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__comment__videoId__00200768]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__history__userId__2E1BDC42] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__history__userId__2E1BDC42]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__history__videoId__2F10007B] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__history__videoId__2F10007B]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_User]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Video] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Video]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK__rating__userId__73BA3083] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK__rating__userId__73BA3083]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK__rating__videoId__74AE54BC] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK__rating__videoId__74AE54BC]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK__share__userId__33D4B598] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK__share__userId__33D4B598]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK__share__videoId__34C8D9D1] FOREIGN KEY([videoId])
REFERENCES [dbo].[Video] ([id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK__share__videoId__34C8D9D1]
GO
/****** Object:  StoredProcedure [dbo].[SP_PaymentVnpay]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PaymentVnpay](@videoHref varchar(50))
AS BEGIN
SELECT u.id, u.email, u.password, u.phone, u.isAdmin, u.isActive, u.token , vnp_TxnRef, v.title, u.fullname, vnp_BankCode, SUM(vnp_Amount), vnp_ResponseCode FROM Hoadon h
JOIN dbo.[user] u ON u.id = h.userId 
JOIN dbo.video v ON v.id = h.videoId
WHERE v.href = @videoHref
GROUP BY u.id, u.email, u.password, u.phone, u.isAdmin, u.isActive, u.token , vnp_TxnRef, v.title, u.fullname, vnp_BankCode, vnp_ResponseCode
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectUsersLikedVideoByVideoHref]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectUsersLikedVideoByVideoHref](@videoHref varchar(50))
AS BEGIN 
	SELECT u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, h.likedDate, u.token
	FROM dbo.video v JOIN dbo.history h ON v.id = h.videoId
					JOIN dbo.[user] u ON u.id = h.userId
	WHERE v.href = @videoHref AND u.isActive = 1 AND v.isActive = 1 AND h.isLiked = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserShareVideoByHref]    Script Date: 06/12/2023 10:51:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UserShareVideoByHref](@videoHref varchar(50))
AS BEGIN 
	SELECT v.title, v.href, u.fullname, u.email AS 'Gui', s.email AS 'Nhan', s.shareDate, u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, u.token FROM dbo.share s 
	JOIN dbo.[user] u ON u.id = s.userId 
	JOIN dbo.video v ON v.id = s.videoId
	WHERE v.href = @videoHref
	GROUP BY v.title, v.href, u.fullname, u.email, s.email, s.shareDate, u.id, u.email, u.password, u.phone, u.fullname, u.isAdmin, u.isActive, u.token
	ORDER BY s.shareDate DESC
END
GO
USE [master]
GO
ALTER DATABASE [FilmViet] SET  READ_WRITE 
GO

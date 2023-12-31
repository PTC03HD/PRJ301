USE [master]
GO
/****** Object:  Database [PRJ301_SE1756_Fa23_PROJECT]    Script Date: 01/11/2023 11:26:00 SA ******/
CREATE DATABASE [PRJ301_SE1756_Fa23_PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1756_Fa23_PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_SE1756_Fa23_PROJECT', N'ON'
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET QUERY_STORE = OFF
GO
USE [PRJ301_SE1756_Fa23_PROJECT]
GO
/****** Object:  Table [dbo].[bill_detail_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail_HE172007](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_HE172007](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
	[condition] [bit] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_HE172007](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color_HE172007](
	[product_id] [bigint] NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_HE172007](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [int] NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [text] NULL,
	[discount] [int] NULL,
	[hot] [bit] NULL,
	[createBy] [int] NULL,
	[createDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_HE172007]    Script Date: 01/11/2023 11:26:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_HE172007](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NOT NULL,
	[user_pass] [nvarchar](250) NOT NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category_HE172007] ([category_id], [category_name]) VALUES (1, N'Laptop')
INSERT [dbo].[category_HE172007] ([category_id], [category_name]) VALUES (2, N'Smartphone')
INSERT [dbo].[category_HE172007] ([category_id], [category_name]) VALUES (3, N'Camera')
INSERT [dbo].[category_HE172007] ([category_id], [category_name]) VALUES (4, N'Accessory')
GO
SET IDENTITY_INSERT [dbo].[product_HE172007] ON 

INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (2, 4, N'Bàn phím cơ không dây Logitech MX Mechanical', 3899000, N'Bàn phím cơ không dây Logitech MX Mechanical mang đến vẻ ngoài đẹp mắt với tông màu thời thượng, chất liệu bền bỉ. Mẫu bàn phím Logitech này còn trang bị phím switch cơ học cho cảm giác gõ chính xác cùng thời gian hoạt động lên tới 15 ngày sau một lần sạc.', 1000, N'pro_img/Ban_phim_co_khong_day_Logitech_MX_Mechanical.webp', NULL, NULL, 1, CAST(N'2023-10-24T22:50:28.913' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (3, 3, N'Camera DJI Osmo Action 4 Combo', 11690000, N'Camera hành động DJI Action 4 Combo là sản phẩm mới nhất được cho ra mắt bởi DJI tại thị trường Việt Nam. Sản phẩm camera hành trình DJI này với đầy đủ các phụ kiện đi kèm, bạn có thể sẵn sàng ghi lại những thước phim ấn tượng nhất mọi lúc mọi nơi.', 1000, N'pro_img/Camera_DJI_Osmo_Action_4_Combo.webp', NULL, 1, 1, CAST(N'2023-10-24T22:52:17.573' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (4, 3, N'Camera GoPro Hero 11', 9690000, N'Camera hành trình Gopro Hero 11 là siêu phẩm tiếp theo của Gopro đạt chất lượng hình ảnh cao chuyên biệt dành cho các tín đồ du lịch. Sản phẩm còn là người bạn đồng hành dành cho các phượt thủ không thể thiếu đó là một chiếc máy ảnh hành trình.', 1000, N'pro_img/Camera_GoPro_Hero_11.webp', NULL, NULL, 1, CAST(N'2023-10-24T22:56:42.710' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (5, 3, N'Camera GoPro Hero 12
', 11490000, N'GoPro Hero 12 Black là mẫu camera hành trình chất lượng đến từ thương hiệu GoPro. Camera với màn hình kích thước 2.27 inch cùng với đó là cụm camera chất lượng với độ phân giải 27.6 MP cùng một cảm biến kích thước lớn 1/1.9. Mặt sau camera là một màn hình phụ kích thước 1.4 inch hỗ trợ người dùng trong quá trình quay vlog.', 1000, N'pro_img/Camera_GoPro_Hero_12.webp', NULL, NULL, 1, CAST(N'2023-10-24T22:57:49.813' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (6, 3, N'Camera IP Wifi EZVIZ C6N 4MP ', 690000, N'Camera IP Hồng Ngoại Không Dây 4MP EZVIZ C6N với thiết kế nhỏ gọn, lắp ráp dễ dàng để giúp cho bạn có thể theo dõi được an ninh của nơi sinh sống. Sản phẩm camera Ezviz quan sát an ninh này giúp ghi hình sắc nét cùng công nghệ thông minh hiện đại như phát hiện bằng AI.', 1000, N'pro_img/Camera_IP_Wifi_EZVIZ_C6N_4MP.webp', NULL, 1, 1, CAST(N'2023-10-24T22:59:06.740' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (7, 3, N'Camera IP Wifi TP-Link Tapo C200 360° 1080P 2MP', 490000, N'Nhằm giúp bảo vệ ngôi nhà của bạn an toàn hơn đặc biệt là vào ban đêm lúc bạn ngủ hay khi đi vắng, camera IP WiFi TP-Link Tapo C200 1080p 2MP chính là một thiết bị đắc lực. Với nhiều chế độ quay và tính năng hoàn hảo, bạn có thể yên tâm quan sát ngôi nhà của mình.', 1000, N'pro_img/Camera_IP_Wifi_TP-Link_Tapo_C200_360°_1080P_2MP.webp', NULL, 1, 1, CAST(N'2023-10-24T23:00:46.707' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (8, 4, N'Củ sạc Anker Powerport III Nano 20W A2633', 295000, N'Bạn là người thường xuyên sử dụng các thiết bị điện tử cả ngày dài. Vấn đề mà bạn đang gặp phải là tình trạng hay hết pin nhưng khi sạc thời gian rất lâu. Vì vậy hàng sản xuất Anker đã cho ra đời sản phẩm sạc Anker PowerPort III Nano PD 20W A2633 phù hợp nhu cầu của bạn.', 1000, N'pro_img/Cu_sac_Anker_Powerport_III_Nano_20W_A2633.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:01:45.247' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (9, 4, N'Chuột có dây Gaming Logitech G102 LightSync Gen 2', 399000, N'Sở hữu công nghệ Lightsync, mang thiết kế 6 nút cổ điển cùng DPI lên đến 8.000, chuột Gaming Logitech G102 LightSync sẽ giúp bạn chinh phục mọi tựa game mà bạn yêu thích.', 1000, N'pro_img/Chuot_co_day_Gaming_Logitech_G102_LightSync_Gen_2.webp', NULL, 1, 1, CAST(N'2023-10-24T23:02:46.890' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (10, 4, N'Hub Ugreen USB 3.0 CM219 70336 4 cổng 1M', 320000, N'Bộ chia UGREEN USB 3.0 CM219 70336 4 cổng 1m tích hợp OTG, hỗ trợ kết nối những thiết bị chuột, bàn phím,... Và thiết kế của bộ chia này khá nhỏ gọn, tối giản, có thể để vào bên trong túi xách mà không tốn quá nhiều diện tích. ', 1000, N'pro_img/Hub_Ugreen_USB_3.0_CM219_70336_4_cong_1M.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:04:08.553' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (11, 2, N'iPhone 14 Pro Max 128GB', 26690000, N'iPhone 14 Pro Max sở hữu thiết kế màn hình Dynamic Island ấn tượng cùng màn hình OLED 6,7 inch hỗ trợ always-on display và hiệu năng vượt trội với chip A16 Bionic. Bên cạnh đó máy còn sở hữu nhiều nâng cấp về camera với cụm camera sau 48MP, camera trước 12MP dùng bộ nhớ RAM 6GB đa nhiệm vượt trội.', 1000, N'pro_img/iPhone_14_Pro_Max_128GB.webp', NULL, 1, 1, CAST(N'2023-10-24T23:05:54.167' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (12, 2, N'iPhone 15 Plus 128GB', 25990000, N'iPhone 15 Plus được đánh giá cao bởi màn hình Dynamic Island 6.7 inch với mặt kính lưng pha màu ấn tượng, chip A16 Bionic mạnh mẽ cùng cổng sạc USB-C cho khả năng sạc đầy nhanh chóng. Ngoài ra, phiên bản Plus thuộc series iPhone 15 còn sở hữu 5 phiên bản màu pastel thanh lịch phù hợp với nhiều đối tượng khách hàng: hồng, vàng, xanh lá, xanh dương, đen', 1000, N'pro_img/iPhone_15_Plus_128GB.webp', NULL, 1, 1, CAST(N'2023-10-24T23:07:06.460' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (13, 1, N'Laptop Asus E210MA GJ537W', 5290000, N'Laptop Asus E210MA-GJ537W N4020 sở hữu cấu hình mạnh mẽ với CPU N4020 RAM DDR4 4GB và ổ cứng 128G EMMC giúp cho máy có thể hoàn thành tốt những yêu cầu của người dùng trong học tập, làm việc hay giải trí. Cạnh đó, nhờ vào sự hỗ trợ của Card màn hình Intel UHD Graphics 600 mà laptop Asuscó thể thực hiện những tác vụ đồ họa cơ bản, tối ưu hóa hiệu năng và hoàn thành công việc tốt hơn.', 1000, N'pro_img/Laptop_Asus_E210MA_GJ537W.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:08:31.353' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (14, 1, N'Laptop Asus TUF Gaming F15 FX506HE-HN377W', 19990000, N'Laptop Asus TUF Gaming F15 FX506HE-HN377W một sản phẩm hoàn hảo giữa hiệu năng mạnh mẽ và thiết kế đẳng cấp. Do đó, hứa hẹn đây sẽ là một lựa chọn tuyệt vời cho những game thủ đang tìm kiếm một chiếc laptop Asus Gaming đa năng.

', 1000, N'pro_img/Laptop_Asus_TUF_Gaming_F15_FX506HE-HN377W.webp', NULL, 1, 1, CAST(N'2023-10-24T23:09:54.247' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (15, 1, N'Laptop Asus VivoBook 15 OLED A1505VA-L1114W', 17990000, N'Laptop Asus Vivobook 15 OLED A1505VA-L1114W mang đến những trải nghiệm làm việc và giải trí tuyệt vời khi sở hữu thông số cấu hình vô cùng ấn tượng. Thiết bị giúp bạn hoàn thành mọi công việc nhanh chóng khi tích hợp bộ vi xử lý hàng đầu. Với màn hình OLED rực rỡ, chiếc laptop Asus Vivobook cũng mở ra một thế giới giải trí vô cùng phong phú và chân thực.', 1000, N'pro_img/Laptop_Asus_VivoBook_15_OLED_A1505VA-L1114W.webp', NULL, 1, 1, CAST(N'2023-10-24T23:13:24.423' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (16, 1, N'Laptop Lenovo Ideapad 5 Pro 16ARH7', 19990000, N'Laptop Lenovo Ideapad 5 Pro 16ARH7 82SN003MVN thuộc dòng sản phẩm cao cấp mang đến hiệu suất hoạt động ấn tượng, cho khả năng đáp ứng đầy đủ mọi tác vụ. Bên cạnh đó laptop Lenovo Ideapad này còn tạo điểm nhấn ở màn hình đẹp mắt với chế độ chống chói và giảm ánh sáng xanh giúp bảo vệ thị lực khi phải làm việc trong thời gian dài.', 1000, N'pro_img/Laptop_Lenovo_Ideapad_5_Pro_16ARH7.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:14:33.053' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (17, 1, N'Laptop MSI Gaming Bravo 15 B7ED-010VN', 16990000, N'Laptop MSI gaming BRAVO 15 B7ED-010VN là dòng laptop gaming đến từ thương hiệu MSI. Sản phẩm laptop MSI gaming này với cấu hình mạnh mẽ có thể đáp ứng tốt các trải nghiệm gaming của người dùng.', 1000, N'pro_img/Laptop_MSI_Gaming_Bravo_15_B7ED-010VN.webp', NULL, 1, 1, CAST(N'2023-10-24T23:15:48.483' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (18, 3, N'Máy quay 4K chống rung DJI Osmo Pocket 2 Combo', 12390000, N'Camera DJI Pocket 2 Combo là giải pháp sáng tạo mang tính đột phá, bởi khả năng tích hợp giữa gimbal thu nhỏ và máy ảnh hiệu suất cao. Phiên bản nâng cấp lần này hứa hẹn sẽ mang đến một loạt tính năng mới nhằm đem lại nhiều trải nghiệm thú vị hơn nữa.', 1000, N'pro_img/May_quay_4K_chong_rung_DJI_Osmo_Pocket_2_Combo.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:17:23.413' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (19, 2, N'OnePlus Nord 3 5G 16GB 256GB', 12490000, N'OnePlus Nord 3 5G thiết kế màn hình đục lỗ, kích thước 6.74 inch, độ phân giải cao, tần số quét 120Hz. Đặc biệt, sản phẩm sở hữu con chip Dimensity 9000, trang bị 2 ống kính với cảm biến chính 50MP. Cuối cùng, thiết bị có viên pin 5.000 mAh, xuất xưởng với giao diện OxygenOS 13.1 mới nhất dựa trên hệ điều hành Android 13.', 1000, N'pro_img/OnePlus_Nord_3_5G_16GB_256GB.webp', NULL, 1, 1, CAST(N'2023-10-24T23:18:47.777' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (20, 2, N'Samsung Galaxy Z Flip5 256', 21990000, N'Samsung Galaxy Z Flip 5 có thiết kế màn hình rộng 6.7 inch và độ phân giải Full HD+ (1080 x 2640 Pixels), dung lượng RAM 8GB, bộ nhớ trong 256GB. Màn hình Dynamic AMOLED 2X của điện thoại này hiển thị rõ nét và sắc nét, mang đến trải nghiệm ấn tượng khi sử dụng.', 1000, N'pro_img/Samsung_Galaxy_Z_Flip5_512GB.webp', NULL, 1, 1, CAST(N'2023-10-24T23:20:53.020' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (21, 2, N'Samsung Galaxy Z Fold5 12GB 256GB', 36990000, N'Samsung Galaxy Z Fold5 là phân khúc smartphone gập đáng được mong chờ nhất trong năm 2023 khi sở hữu thiết kế đột phá cùng nhiều tính năng ấn tượng. Với màn hình gập mở linh hoạt, Z Fold5 mang tới cho bạn trải nghiệm sử dụng của cả điện thoại thông minh lẫn máy tính bảng. Bên cạnh đó, máy còn đi kèm với nhiều tính năng công nghệ hàng đầu, sẵn sàng phục vụ được những yêu cầu sử dụng phức tạp của người dùng.', 1000, N'pro_img/Samsung_Galaxy_Z_Fold5_12GB_256GB.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:22:59.677' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (22, 4, N'Thẻ nhớ Lexar 128GB Micro SDXC U3 V30 A1 100 MB/s', 249000, N'Thẻ nhớ Lexar MicroSDXC 128GB U3 V30 A1 được xem là giải pháp tối ưu nhất nếu như bạn muốn mở rộng không gian lưu trữ trên thiết bị của bạn. Thông qua các đặc điểm ấn tượng trên thẻ nhớ, chắc chắn phiên bản thẻ nhớ này sẽ đáp ứng nhu cầu của bạn trong mọi tình huống.', 1000, N'pro_img/The_nho_Lexar_512GB_Micro_SDXC_U3_V30_A1_100_MBS.webp', NULL, NULL, 1, CAST(N'2023-10-24T23:27:24.050' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (23, 4, N'Thẻ nhớ Micro SDXC Sandisk Extreme V30 A2 200MB/S 1TB', 3690000, N'Sandisk Extreme V30 A2 200MB/S 1TB phù hợp để lưu trữ các dữ liệu ở dung lượng lớn như camera hành trình, quay chụp phim khi làm công việc. Thẻ nhớ có thể tương thích với nhiều thiết bị khác nhau, hứa hẹn sẽ mang đến tiện ích hữu dụng.', 1000, N'pro_img/The_nho_Micro_SDXC_Sandisk_Extreme_V30_A2_200MBS _1TB.webp', NULL, 1, 1, CAST(N'2023-10-24T23:28:41.067' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (24, 2, N'Xiaomi Redmi Note 12 8GB 128GB', 4990000, N'Xiaomi Redmi Note 12 được Xiaomi cho ra mắt với nhiều phiên bản màu sắc khác nhau cho người dùng lựa chọn, tuy nhiên sắc vàng là màu sắc ấn tượng nhất trong series Redmi Note 12 này và hiện được bán độc quyền tại CellphoneS.', 1000, N'pro_img/Xiaomi_Redmi_Note_12_8GB_128GB.webp', 0, NULL, 1, CAST(N'2023-10-24T23:30:05.327' AS DateTime))
INSERT [dbo].[product_HE172007] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img], [discount], [hot], [createBy], [createDate]) VALUES (29, 1, N'Apple Macbook Pro 13 M2 2022 8GB 256GB', 29490000, N'Sau sự thành công của Macbook Pro M1, Apple tiếp tục cho ra mắt phiên bản nâng cấp với con chip mạnh hơn mang tên Macbook Pro M2 vào năm 2022. Macbook Pro M2 2022 sở hữu một hiệu năng vượt trội với con chip M2, card đồ họa 10 nhân GPU hứa hẹn mang lại cho người dùng những trải nghiệm vượt trội.', 1000, N'pro_img/Apple_Macbook_Pro_13_M2_2022_8GB_256GB.webp', 18, 1, 1, CAST(N'2023-10-27T01:33:54.590' AS DateTime))
SET IDENTITY_INSERT [dbo].[product_HE172007] OFF
GO
SET IDENTITY_INSERT [dbo].[users_HE172007] ON 

INSERT [dbo].[users_HE172007] ([user_id], [user_name], [user_pass], [isAdmin]) VALUES (1, N'Admin', N'1234', 1)
INSERT [dbo].[users_HE172007] ([user_id], [user_name], [user_pass], [isAdmin]) VALUES (2, N'user1', N'1234', 0)
SET IDENTITY_INSERT [dbo].[users_HE172007] OFF
GO
ALTER TABLE [dbo].[product_HE172007] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[bill_detail_HE172007]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill_HE172007] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail_HE172007]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product_HE172007] ([product_id])
GO
ALTER TABLE [dbo].[bill_HE172007]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_HE172007] ([user_id])
GO
ALTER TABLE [dbo].[bill_HE172007] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[product_color_HE172007]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product_HE172007] ([product_id])
GO
ALTER TABLE [dbo].[product_HE172007]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category_HE172007] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1756_Fa23_PROJECT] SET  READ_WRITE 
GO

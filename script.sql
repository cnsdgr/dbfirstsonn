USE [AA_Odev]
GO
/****** Object:  Table [dbo].[tblKategori]    Script Date: 27/04/2023 09:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KatagoriAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblKategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSatis]    Script Date: 27/04/2023 09:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSatis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detay] [nvarchar](350) NULL,
	[StisTarihi] [date] NULL,
	[Discount] [int] NULL,
	[UrunId] [int] NULL,
 CONSTRAINT [PK_tblSatis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUrun]    Script Date: 27/04/2023 09:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUrun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[Fiyat] [money] NULL,
	[Stok] [int] NULL,
	[KategoriId] [int] NULL,
 CONSTRAINT [PK_tblUrun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblKategori] ON 

INSERT [dbo].[tblKategori] ([Id], [KatagoriAdi]) VALUES (1, N'Elektronik')
INSERT [dbo].[tblKategori] ([Id], [KatagoriAdi]) VALUES (2, N'Kırtasiye')
INSERT [dbo].[tblKategori] ([Id], [KatagoriAdi]) VALUES (3, N'Giyim')
SET IDENTITY_INSERT [dbo].[tblKategori] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUrun] ON 

INSERT [dbo].[tblUrun] ([Id], [UrunAdi], [Fiyat], [Stok], [KategoriId]) VALUES (1, N'Bigisayar', 1000.0000, 20, 1)
INSERT [dbo].[tblUrun] ([Id], [UrunAdi], [Fiyat], [Stok], [KategoriId]) VALUES (2, N'Kalem', 200.0000, 70, 2)
INSERT [dbo].[tblUrun] ([Id], [UrunAdi], [Fiyat], [Stok], [KategoriId]) VALUES (3, N'Atkı', 300.0000, 25, 3)
INSERT [dbo].[tblUrun] ([Id], [UrunAdi], [Fiyat], [Stok], [KategoriId]) VALUES (4, N'silgi', 100.0000, 20, 2)
INSERT [dbo].[tblUrun] ([Id], [UrunAdi], [Fiyat], [Stok], [KategoriId]) VALUES (5, N'Atkı', 300.0000, 200, 3)
SET IDENTITY_INSERT [dbo].[tblUrun] OFF
GO
ALTER TABLE [dbo].[tblSatis]  WITH CHECK ADD  CONSTRAINT [FK_tblSatis_tblUrun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[tblUrun] ([Id])
GO
ALTER TABLE [dbo].[tblSatis] CHECK CONSTRAINT [FK_tblSatis_tblUrun]
GO
ALTER TABLE [dbo].[tblUrun]  WITH CHECK ADD  CONSTRAINT [FK_tblUrun_tblKategori] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[tblKategori] ([Id])
GO
ALTER TABLE [dbo].[tblUrun] CHECK CONSTRAINT [FK_tblUrun_tblKategori]
GO

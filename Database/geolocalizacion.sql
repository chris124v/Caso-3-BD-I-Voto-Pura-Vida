USE [Caso3]
GO
/****** Object:  Table [dbo].[VotuAdresses]    Script Date: 27/5/2025 22:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAdresses](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[postalCode] [varchar](10) NOT NULL,
	[direccion] [varchar](300) NULL,
	[createdAt] [datetime] NULL,
	[updateAt] [datetime] NULL,
	[point] [geography] NOT NULL,
	[distritoID] [int] NOT NULL,
 CONSTRAINT [PK_VotuAdresses] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCantones]    Script Date: 27/5/2025 22:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuCantones](
	[cantonesId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[provincesID] [int] NOT NULL,
 CONSTRAINT [PK_VotuCantones] PRIMARY KEY CLUSTERED 
(
	[cantonesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCountries]    Script Date: 27/5/2025 22:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuCountries](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[allowsVoting] [bit] NOT NULL,
 CONSTRAINT [PK_VotuCountries] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuDistritos]    Script Date: 27/5/2025 22:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuDistritos](
	[distritosId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[cantonesID] [int] NOT NULL,
 CONSTRAINT [PK_VotuDistritos] PRIMARY KEY CLUSTERED 
(
	[distritosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProvinces]    Script Date: 27/5/2025 22:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProvinces](
	[provincesId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[createdAt] [datetime] NULL,
	[updateAt] [datetime] NULL,
	[countryID] [int] NOT NULL,
 CONSTRAINT [PK_VotuProvinces] PRIMARY KEY CLUSTERED 
(
	[provincesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VotuCountries] ADD  CONSTRAINT [DF_VotuCountries_allowsVoting]  DEFAULT ((1)) FOR [allowsVoting]
GO
ALTER TABLE [dbo].[VotuAdresses]  WITH CHECK ADD  CONSTRAINT [DistritoIDFK1] FOREIGN KEY([distritoID])
REFERENCES [dbo].[VotuDistritos] ([distritosId])
GO
ALTER TABLE [dbo].[VotuAdresses] CHECK CONSTRAINT [DistritoIDFK1]
GO
ALTER TABLE [dbo].[VotuCantones]  WITH CHECK ADD  CONSTRAINT [ProvincesID1] FOREIGN KEY([provincesID])
REFERENCES [dbo].[VotuProvinces] ([provincesId])
GO
ALTER TABLE [dbo].[VotuCantones] CHECK CONSTRAINT [ProvincesID1]
GO
ALTER TABLE [dbo].[VotuDistritos]  WITH CHECK ADD  CONSTRAINT [FK_VotuDistritos_VotuCantones] FOREIGN KEY([cantonesID])
REFERENCES [dbo].[VotuCantones] ([cantonesId])
GO
ALTER TABLE [dbo].[VotuDistritos] CHECK CONSTRAINT [FK_VotuDistritos_VotuCantones]
GO
ALTER TABLE [dbo].[VotuProvinces]  WITH CHECK ADD  CONSTRAINT [CountryIDFK1] FOREIGN KEY([countryID])
REFERENCES [dbo].[VotuCountries] ([countryId])
GO
ALTER TABLE [dbo].[VotuProvinces] CHECK CONSTRAINT [CountryIDFK1]
GO

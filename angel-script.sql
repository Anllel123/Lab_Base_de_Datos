USE [AnlleloSG]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 08/09/2018 07:42:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autobus](
	[iId_Autobus] [int] NOT NULL,
	[imComp_Autobus] [image] NOT NULL,
	[iCapa_Autobus] [int] NOT NULL,
	[iId_Chofer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_Autobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 08/09/2018 07:42:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleto](
	[iFolio_Boleto] [int] NOT NULL,
	[tDestino_Boleto] [text] NOT NULL,
	[bEstado_Boleto] [bit] NOT NULL,
	[mPrecio_Boleto] [money] NOT NULL,
	[fTiempoCompra_Boleto] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iFolio_Boleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoletoImpreso]    Script Date: 08/09/2018 07:42:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoletoImpreso](
	[iId_BoletoImpreso] [int] NOT NULL,
	[DTCompra_Boleto] [datetime] NOT NULL,
	[iFolio_Boleto] [int] NOT NULL,
	[iIdNo_Cliente] [int] NOT NULL,
	[iId_Autobus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_BoletoImpreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 08/09/2018 07:42:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[iId_Chofer] [int] NOT NULL,
	[vNombre_Cli] [varchar](50) NOT NULL,
	[vPApellido_Cli] [varchar](50) NOT NULL,
	[vMApellido_Cli] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_Chofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/09/2018 07:42:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[iIdNo_Cliente] [int] NOT NULL,
	[vNombre_Cli] [varchar](50) NOT NULL,
	[vPApellido_Cli] [varchar](50) NOT NULL,
	[vMApellido_Cli] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdNo_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BoletoImpreso]  WITH CHECK ADD  CONSTRAINT [PK_Autobus] FOREIGN KEY([iId_Autobus])
REFERENCES [dbo].[Autobus] ([iId_Autobus])
GO
ALTER TABLE [dbo].[BoletoImpreso] CHECK CONSTRAINT [PK_Autobus]
GO
ALTER TABLE [dbo].[BoletoImpreso]  WITH CHECK ADD  CONSTRAINT [PK_Boleto] FOREIGN KEY([iFolio_Boleto])
REFERENCES [dbo].[Boleto] ([iFolio_Boleto])
GO
ALTER TABLE [dbo].[BoletoImpreso] CHECK CONSTRAINT [PK_Boleto]
GO

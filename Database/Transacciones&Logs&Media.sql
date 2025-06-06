USE [Caso3]
GO
/****** Object:  Table [dbo].[VotuAuditLogs]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAuditLogs](
	[AuditLogsId] [int] NOT NULL,
	[actionType] [varchar](30) NOT NULL,
	[entityType] [varchar](50) NOT NULL,
	[oldValueJSON] [nvarchar](max) NOT NULL,
	[newValueJSON] [nvarchar](max) NOT NULL,
	[timestamp] [timestamp] NOT NULL,
	[userId] [int] NOT NULL,
	[entityId] [int] NOT NULL,
 CONSTRAINT [PK_VotuAuditLogs] PRIMARY KEY CLUSTERED 
(
	[AuditLogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuAvailablePayments]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAvailablePayments](
	[AvailablePaymentId] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[token] [varbinary](250) NOT NULL,
	[expTokenDate] [date] NOT NULL,
	[maskAccount] [varchar](45) NOT NULL,
	[callBackURLGET] [varchar](100) NOT NULL,
	[callBackPOST] [varchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[PaymentMethodId] [int] NOT NULL,
	[configurationJSON] [nvarchar](max) NULL,
 CONSTRAINT [PK_VotuAvailablePayments] PRIMARY KEY CLUSTERED 
(
	[AvailablePaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCurrencies]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuCurrencies](
	[CurrencyId] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[acronym] [varchar](5) NOT NULL,
	[symbol] [varchar](1) NOT NULL,
 CONSTRAINT [PK_VotuCurrencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCurrenciesConversions]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuCurrenciesConversions](
	[ConversionId] [nchar](10) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[exchangeRate] [decimal](10, 6) NOT NULL,
	[enable] [bit] NOT NULL,
	[currentExchangeRate] [bit] NULL,
	[currencyIdSource] [int] NOT NULL,
	[currencyIdDestiny] [int] NOT NULL,
 CONSTRAINT [PK_VotuCurrenciesConversions] PRIMARY KEY CLUSTERED 
(
	[ConversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuLogs]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuLogs](
	[LogId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[trace] [int] NOT NULL,
	[reference1] [bigint] NULL,
	[reference2] [bigint] NULL,
	[value1] [bigint] NULL,
	[value2] [bigint] NULL,
	[checksum] [varbinary](255) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[LogsTypeId] [int] NOT NULL,
	[LogSeverityId] [int] NOT NULL,
 CONSTRAINT [PK_VotuLogs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuLogSeverities]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuLogSeverities](
	[LogSeverityId] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](80) NOT NULL,
	[code] [varchar](10) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuLogSeverities] PRIMARY KEY CLUSTERED 
(
	[LogSeverityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuLogsTypes]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuLogsTypes](
	[LogsTypeId] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[referenceDesc1] [varchar](80) NOT NULL,
	[referenceDesc2] [varchar](80) NOT NULL,
	[valueDesc1] [varchar](40) NOT NULL,
	[valueDesc2] [varchar](40) NOT NULL,
 CONSTRAINT [PK_VotuLogsTypes] PRIMARY KEY CLUSTERED 
(
	[LogsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMediaAccessLogs]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMediaAccessLogs](
	[accessLogId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[ipAddress] [varchar](45) NOT NULL,
	[macAddress] [varchar](45) NOT NULL,
	[mediaFileId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[MediaAccessLogTypeId] [int] NOT NULL,
 CONSTRAINT [PK_VotuMediaAccessLogs] PRIMARY KEY CLUSTERED 
(
	[accessLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMediaAccessLogTypes]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMediaAccessLogTypes](
	[MediaAccessLogTypeId] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](80) NULL,
	[code] [varchar](10) NOT NULL,
	[isSecurityRelevant] [bit] NOT NULL,
	[isReadOperation] [bit] NOT NULL,
	[isWriteOperation] [bit] NOT NULL,
 CONSTRAINT [PK_VotuMediaAccessLogTypes] PRIMARY KEY CLUSTERED 
(
	[MediaAccessLogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMediaFiles]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMediaFiles](
	[MediaFileId] [int] NOT NULL,
	[storagePath] [varchar](100) NOT NULL,
	[deleted] [bit] NOT NULL,
	[reference] [varchar](250) NOT NULL,
	[generationDate] [datetime] NOT NULL,
	[isEncrypted] [bit] NULL,
	[MediaTypeId] [int] NOT NULL,
 CONSTRAINT [PK_VotuMediaFiles] PRIMARY KEY CLUSTERED 
(
	[MediaFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMediaMetadata]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMediaMetadata](
	[MediaMetadataId] [int] NOT NULL,
	[fileSizeBytes] [bigint] NOT NULL,
	[mimeType] [varchar](100) NOT NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[durationSeconds] [int] NULL,
	[checksum] [varbinary](255) NOT NULL,
	[MediaFileId] [int] NOT NULL,
 CONSTRAINT [PK_VotuMediaMetadata] PRIMARY KEY CLUSTERED 
(
	[MediaMetadataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMediaTypes]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMediaTypes](
	[MediaTypeId] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[shortdesc] [varchar](60) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuMediaTypes] PRIMARY KEY CLUSTERED 
(
	[MediaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPaymentMethods]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPaymentMethods](
	[PaymentMethodId] [int] NOT NULL,
	[name] [varchar](35) NOT NULL,
	[apiURL] [varchar](100) NOT NULL,
	[secretKey] [varbinary](255) NOT NULL,
	[key] [varbinary](255) NOT NULL,
	[logoIconURL] [varchar](100) NULL,
	[enable] [bit] NOT NULL,
	[templateJSON] [varchar](100) NULL,
 CONSTRAINT [PK_VotuPaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPayments]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPayments](
	[PaymentId] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[actualAmount] [float] NOT NULL,
	[result] [bit] NOT NULL,
	[auth] [varbinary](300) NOT NULL,
	[chargeToken] [varbinary](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[checksum] [varbinary](255) NOT NULL,
	[exchangeRate] [float] NOT NULL,
	[convertedAmount] [float] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[PaymentsTypeErrorId] [int] NULL,
	[UserId] [int] NOT NULL,
	[AvailablePaymentId] [int] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
 CONSTRAINT [PK_VotuPayments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPaymentStatus]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPaymentStatus](
	[PaymentStatusId] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[description] [varchar](60) NULL,
 CONSTRAINT [PK_VotuPaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPaymentsTypeErrors]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPaymentsTypeErrors](
	[PaymentsTypeErrorId] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[description] [varchar](80) NOT NULL,
 CONSTRAINT [PK_VotuPaymentsTypeErrors] PRIMARY KEY CLUSTERED 
(
	[PaymentsTypeErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuRefunds]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuRefunds](
	[RefundId] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[reason] [varchar](80) NOT NULL,
	[date] [date] NOT NULL,
	[PaymentId] [int] NOT NULL,
 CONSTRAINT [PK_VotuRefunds] PRIMARY KEY CLUSTERED 
(
	[RefundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuTransactions]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuTransactions](
	[TransactionId] [bigint] NOT NULL,
	[amount] [float] NOT NULL,
	[description] [varchar](75) NOT NULL,
	[transactionDateTime] [datetime] NOT NULL,
	[postTime] [datetime] NOT NULL,
	[checksum] [varbinary](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[CurrencyTypeId] [int] NOT NULL,
	[TransactionTypeId] [int] NOT NULL,
	[PaymentId] [int] NOT NULL,
 CONSTRAINT [PK_VotuTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuTransactionTypes]    Script Date: 4/6/2025 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuTransactionTypes](
	[TransactionTypeId] [int] NOT NULL,
	[name] [varchar](35) NOT NULL,
	[description] [varchar](60) NOT NULL,
 CONSTRAINT [PK_VotuTransactionSubTypes] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VotuAvailablePayments]  WITH CHECK ADD  CONSTRAINT [FK_VotuAvailablePayments_VotuPaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[VotuPaymentMethods] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[VotuAvailablePayments] CHECK CONSTRAINT [FK_VotuAvailablePayments_VotuPaymentMethods]
GO
ALTER TABLE [dbo].[VotuCurrenciesConversions]  WITH CHECK ADD  CONSTRAINT [FK_VotuCurrenciesConversions_VotuCurrencies] FOREIGN KEY([currencyIdSource])
REFERENCES [dbo].[VotuCurrencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[VotuCurrenciesConversions] CHECK CONSTRAINT [FK_VotuCurrenciesConversions_VotuCurrencies]
GO
ALTER TABLE [dbo].[VotuCurrenciesConversions]  WITH CHECK ADD  CONSTRAINT [FK_VotuCurrenciesConversions_VotuCurrencies1] FOREIGN KEY([currencyIdDestiny])
REFERENCES [dbo].[VotuCurrencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[VotuCurrenciesConversions] CHECK CONSTRAINT [FK_VotuCurrenciesConversions_VotuCurrencies1]
GO
ALTER TABLE [dbo].[VotuLogs]  WITH CHECK ADD  CONSTRAINT [FK_VotuLogs_VotuLogSeverities] FOREIGN KEY([LogSeverityId])
REFERENCES [dbo].[VotuLogSeverities] ([LogSeverityId])
GO
ALTER TABLE [dbo].[VotuLogs] CHECK CONSTRAINT [FK_VotuLogs_VotuLogSeverities]
GO
ALTER TABLE [dbo].[VotuLogs]  WITH CHECK ADD  CONSTRAINT [FK_VotuLogs_VotuLogsTypes] FOREIGN KEY([LogsTypeId])
REFERENCES [dbo].[VotuLogsTypes] ([LogsTypeId])
GO
ALTER TABLE [dbo].[VotuLogs] CHECK CONSTRAINT [FK_VotuLogs_VotuLogsTypes]
GO
ALTER TABLE [dbo].[VotuMediaAccessLogs]  WITH CHECK ADD  CONSTRAINT [FK_VotuMediaAccessLogs_VotuMediaAccessLogTypes] FOREIGN KEY([MediaAccessLogTypeId])
REFERENCES [dbo].[VotuMediaAccessLogTypes] ([MediaAccessLogTypeId])
GO
ALTER TABLE [dbo].[VotuMediaAccessLogs] CHECK CONSTRAINT [FK_VotuMediaAccessLogs_VotuMediaAccessLogTypes]
GO
ALTER TABLE [dbo].[VotuMediaAccessLogs]  WITH CHECK ADD  CONSTRAINT [FK_VotuMediaAccessLogs_VotuMediaFiles] FOREIGN KEY([mediaFileId])
REFERENCES [dbo].[VotuMediaFiles] ([MediaFileId])
GO
ALTER TABLE [dbo].[VotuMediaAccessLogs] CHECK CONSTRAINT [FK_VotuMediaAccessLogs_VotuMediaFiles]
GO
ALTER TABLE [dbo].[VotuMediaFiles]  WITH CHECK ADD  CONSTRAINT [FK_VotuMediaFiles_VotuMediaTypes] FOREIGN KEY([MediaTypeId])
REFERENCES [dbo].[VotuMediaTypes] ([MediaTypeId])
GO
ALTER TABLE [dbo].[VotuMediaFiles] CHECK CONSTRAINT [FK_VotuMediaFiles_VotuMediaTypes]
GO
ALTER TABLE [dbo].[VotuMediaMetadata]  WITH CHECK ADD  CONSTRAINT [FK_VotuMediaMetadata_VotuMediaFiles] FOREIGN KEY([MediaFileId])
REFERENCES [dbo].[VotuMediaFiles] ([MediaFileId])
GO
ALTER TABLE [dbo].[VotuMediaMetadata] CHECK CONSTRAINT [FK_VotuMediaMetadata_VotuMediaFiles]
GO
ALTER TABLE [dbo].[VotuPayments]  WITH CHECK ADD  CONSTRAINT [FK_VotuPayments_VotuAvailablePayments] FOREIGN KEY([AvailablePaymentId])
REFERENCES [dbo].[VotuAvailablePayments] ([AvailablePaymentId])
GO
ALTER TABLE [dbo].[VotuPayments] CHECK CONSTRAINT [FK_VotuPayments_VotuAvailablePayments]
GO
ALTER TABLE [dbo].[VotuPayments]  WITH CHECK ADD  CONSTRAINT [FK_VotuPayments_VotuCurrencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[VotuCurrencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[VotuPayments] CHECK CONSTRAINT [FK_VotuPayments_VotuCurrencies]
GO
ALTER TABLE [dbo].[VotuPayments]  WITH CHECK ADD  CONSTRAINT [FK_VotuPayments_VotuPaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[VotuPaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[VotuPayments] CHECK CONSTRAINT [FK_VotuPayments_VotuPaymentStatus]
GO
ALTER TABLE [dbo].[VotuPayments]  WITH CHECK ADD  CONSTRAINT [FK_VotuPayments_VotuPaymentsTypeErrors] FOREIGN KEY([PaymentsTypeErrorId])
REFERENCES [dbo].[VotuPaymentsTypeErrors] ([PaymentsTypeErrorId])
GO
ALTER TABLE [dbo].[VotuPayments] CHECK CONSTRAINT [FK_VotuPayments_VotuPaymentsTypeErrors]
GO
ALTER TABLE [dbo].[VotuRefunds]  WITH CHECK ADD  CONSTRAINT [FK_VotuRefunds_VotuPayments] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[VotuPayments] ([PaymentId])
GO
ALTER TABLE [dbo].[VotuRefunds] CHECK CONSTRAINT [FK_VotuRefunds_VotuPayments]
GO
ALTER TABLE [dbo].[VotuTransactions]  WITH CHECK ADD  CONSTRAINT [FK_VotuTransactions_VotuPayments] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[VotuPayments] ([PaymentId])
GO
ALTER TABLE [dbo].[VotuTransactions] CHECK CONSTRAINT [FK_VotuTransactions_VotuPayments]
GO
ALTER TABLE [dbo].[VotuTransactions]  WITH CHECK ADD  CONSTRAINT [FK_VotuTransactions_VotuTransactionTypes] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[VotuTransactionTypes] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[VotuTransactions] CHECK CONSTRAINT [FK_VotuTransactions_VotuTransactionTypes]
GO

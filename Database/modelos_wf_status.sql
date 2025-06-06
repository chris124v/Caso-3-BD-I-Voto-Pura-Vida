USE [master]
GO
/****** Object:  Database [Caso3]    Script Date: 6/6/2025 17:21:40 ******/
CREATE DATABASE [Caso3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Caso3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Caso3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Caso3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Caso3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Caso3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Caso3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Caso3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Caso3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Caso3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Caso3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Caso3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Caso3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Caso3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Caso3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Caso3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Caso3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Caso3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Caso3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Caso3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Caso3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Caso3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Caso3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Caso3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Caso3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Caso3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Caso3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Caso3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Caso3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Caso3] SET RECOVERY FULL 
GO
ALTER DATABASE [Caso3] SET  MULTI_USER 
GO
ALTER DATABASE [Caso3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Caso3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Caso3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Caso3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Caso3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Caso3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Caso3', N'ON'
GO
ALTER DATABASE [Caso3] SET QUERY_STORE = ON
GO
ALTER DATABASE [Caso3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Caso3]
GO
/****** Object:  Table [dbo].[VotuAdresses]    Script Date: 6/6/2025 17:21:41 ******/
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
/****** Object:  Table [dbo].[VotuAIModels]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAIModels](
	[modelId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[provider] [varchar](50) NOT NULL,
	[version] [varchar](20) NOT NULL,
	[endpointUrl] [nvarchar](200) NOT NULL,
	[isEnabled] [bit] NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuAIModels] PRIMARY KEY CLUSTERED 
(
	[modelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuAITasks]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAITasks](
	[taskId] [bigint] IDENTITY(1,1) NOT NULL,
	[modelID] [int] NOT NULL,
	[taskTrigger] [varchar](30) NOT NULL,
	[entityTable] [varchar](50) NULL,
	[entityId] [bigint] NULL,
	[status] [varchar](10) NOT NULL,
	[requestedAt] [datetime2](6) NOT NULL,
	[startedAt] [datetime2](6) NULL,
	[completedAt] [datetime2](6) NULL,
 CONSTRAINT [PK_VotuAITasks] PRIMARY KEY CLUSTERED 
(
	[taskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCantones]    Script Date: 6/6/2025 17:21:41 ******/
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
/****** Object:  Table [dbo].[VotuCountries]    Script Date: 6/6/2025 17:21:41 ******/
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
/****** Object:  Table [dbo].[VotuCurrencies]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuCurrencies](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[acronym] [varchar](5) NOT NULL,
	[symbol] [varchar](1) NOT NULL,
 CONSTRAINT [PK_VotuCurrencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuDistritos]    Script Date: 6/6/2025 17:21:41 ******/
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
/****** Object:  Table [dbo].[VotuDocumentTypes]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuDocumentTypes](
	[docTypeId] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[name] [varchar](80) NOT NULL,
	[templateJSON] [nvarchar](max) NULL,
	[modelID] [int] NULL,
	[createdAt] [datetime2](6) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[docTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_VDT_code] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuEncriptionKeys]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuEncriptionKeys](
	[keyId] [int] IDENTITY(1,1) NOT NULL,
	[keyType] [varchar](8) NOT NULL,
	[keySizeBits] [smallint] NOT NULL,
	[publicKey] [varbinary](max) NULL,
	[vaultRef] [nvarchar](200) NOT NULL,
	[purpose] [varchar](6) NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
	[expiresAt] [datetime2](6) NULL,
	[isActive] [bit] NOT NULL,
	[comment] [nvarchar](200) NULL,
 CONSTRAINT [PK_VotuEncriptionKeys] PRIMARY KEY CLUSTERED 
(
	[keyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentities]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentities](
	[identityId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[identityType] [varchar](50) NOT NULL,
	[identityNumber] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[expiresAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
	[lastValidationDate] [datetime] NULL,
	[nextValidationRequired] [datetime] NULL,
	[validationFrequency] [int] NULL,
	[validationStatus] [varchar](20) NULL,
	[aiValidationTaskID] [bigint] NULL,
	[aiValidationScore] [decimal](5, 2) NULL,
	[aiValidationDetails] [varchar](1000) NULL,
	[requiresHumanValidation] [nchar](10) NULL,
	[documentHash] [varbinary](64) NULL,
	[encryptedMetadata] [varbinary](max) NULL,
 CONSTRAINT [PK_VotuIdentities] PRIMARY KEY CLUSTERED 
(
	[identityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentityDocuments]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentityDocuments](
	[identityDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[identityID] [int] NOT NULL,
	[documentType] [varchar](50) NOT NULL,
	[originalFileName] [varchar](300) NOT NULL,
	[fileExtension] [varchar](10) NOT NULL,
	[fileSizeBytes] [bigint] NOT NULL,
	[fileHash] [varbinary](64) NOT NULL,
	[encryptedContent] [varbinary](max) NOT NULL,
	[mimeType] [varchar](100) NOT NULL,
	[aiValidationTaskID] [bigint] NULL,
	[aiValidationResult] [varchar](20) NULL,
	[aiScore] [decimal](5, 2) NULL,
	[aiValidationDetails] [nvarchar](2000) NULL,
	[aiProcessedAt] [datetime2](7) NULL,
	[humanValidationRequired] [bit] NULL,
	[humanValidationResult] [varchar](20) NULL,
	[humanValidatorID] [int] NULL,
	[humanValidatedAt] [datetime] NULL,
	[humanComments] [varchar](400) NULL,
	[uploadedByUserID] [int] NOT NULL,
	[uploadedAt] [datetime] NULL,
	[expiresAt] [datetime2](7) NULL,
	[accesCount] [int] NULL,
	[lastAccessedAt] [datetime] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuIdentityDocuments] PRIMARY KEY CLUSTERED 
(
	[identityDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuKeyShares]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuKeyShares](
	[shareId] [int] IDENTITY(1,1) NOT NULL,
	[keyID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[sharePart] [varbinary](max) NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuKeyShares] PRIMARY KEY CLUSTERED 
(
	[shareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuOrganizations]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuOrganizations](
	[organizationId] [int] IDENTITY(1,1) NOT NULL,
	[legalId] [varchar](60) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[commercialName] [varchar](60) NULL,
	[description] [varchar](500) NULL,
	[websiteURL] [varchar](300) NULL,
	[email] [varchar](100) NULL,
	[phone] [nchar](10) NULL,
	[verificationStatus] [bit] NOT NULL,
	[verifiedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[addressID] [int] NOT NULL,
	[logoMediaID] [int] NULL,
	[organizationTypeID] [int] NOT NULL,
 CONSTRAINT [PK_VotuOrganizations] PRIMARY KEY CLUSTERED 
(
	[organizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuOrganizationTypes]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuOrganizationTypes](
	[organizationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](60) NOT NULL,
	[description] [varchar](60) NULL,
	[requiresValidation] [bit] NOT NULL,
	[canCreateProposals] [bit] NOT NULL,
	[canInvest] [bit] NOT NULL,
	[canValidate] [bit] NOT NULL,
	[feePercentage] [decimal](18, 2) NULL,
	[equityPercentage] [decimal](18, 2) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuOrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[organizationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPaymentMethods]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPaymentMethods](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[VotuPermissions]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPermissions](
	[permissionId] [int] IDENTITY(1,1) NOT NULL,
	[permissionName] [varchar](50) NOT NULL,
	[description] [varchar](250) NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_VotuPermissions] PRIMARY KEY CLUSTERED 
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProposals]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProposals](
	[proposalId] [int] IDENTITY(1,1) NOT NULL,
	[proposalCode] [varchar](20) NOT NULL,
	[title] [varchar](60) NOT NULL,
	[sumarry] [varchar](500) NOT NULL,
	[fullDescription] [varchar](max) NOT NULL,
	[currentVersion] [int] NOT NULL,
	[budgetRequired] [decimal](18, 2) NULL,
	[executionPlanJSON] [varchar](max) NULL,
	[disbursementPlanJSON] [varchar](max) NULL,
	[investmentDeadline] [datetime] NULL,
	[executionStartDate] [datetime] NULL,
	[executionEndDate] [datetime] NULL,
	[expectedROI] [decimal](18, 2) NULL,
	[impactAnalysisJSON] [varchar](max) NULL,
	[beneficiariesCount] [int] NULL,
	[geographicScope] [varchar](40) NULL,
	[hasGovernmentEndorsement] [int] NOT NULL,
	[governmentBenefitsJSON] [varchar](max) NULL,
	[employmentRequiremnets] [int] NULL,
	[locationRequirements] [varchar](500) NULL,
	[proposalHash] [varbinary](64) NOT NULL,
	[encryptedContent] [varbinary](max) NOT NULL,
	[createdAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[publishedAt] [datetime] NULL,
	[votingStartDate] [datetime] NULL,
	[votingEndDate] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[proposalTypeID] [int] NOT NULL,
	[createdByUserID] [int] NOT NULL,
	[organizationID] [int] NOT NULL,
	[proposalStatusID] [int] NOT NULL,
	[budgetCurrencyID] [int] NULL,
 CONSTRAINT [PK_VotuProposals] PRIMARY KEY CLUSTERED 
(
	[proposalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProposalStatus]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProposalStatus](
	[proposalStatusId] [int] IDENTITY(1,1) NOT NULL,
	[statusCode] [varchar](30) NOT NULL,
	[statusName] [varchar](100) NOT NULL,
	[statusCategory] [varchar](20) NOT NULL,
	[description] [varchar](500) NULL,
	[allowsEditing] [bit] NOT NULL,
	[allowsComments] [bit] NOT NULL,
	[allowsVoting] [bit] NOT NULL,
	[allowsInvestment] [bit] NOT NULL,
	[allowsFiscalization] [bit] NOT NULL,
	[isTerminalStatus] [bit] NOT NULL,
	[nextPossibleStatus] [varchar](500) NULL,
	[requiredDayInStatus] [int] NULL,
	[maxDaysInStatus] [int] NULL,
	[sortOrder] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuProposalStatus] PRIMARY KEY CLUSTERED 
(
	[proposalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProposalTypes]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProposalTypes](
	[proposalTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](60) NOT NULL,
	[category] [varchar](60) NOT NULL,
	[description] [varchar](500) NULL,
	[requiredDocuments] [varchar](1000) NOT NULL,
	[validationRules] [varchar](1000) NOT NULL,
	[requiresBudget] [bit] NOT NULL,
	[requiresExecutionPlan] [bit] NOT NULL,
	[requiresImpactAnalysis] [bit] NOT NULL,
	[requiresManualValidation] [bit] NOT NULL,
	[validatorRequired] [int] NULL,
	[minVotingDays] [int] NOT NULL,
	[maxVotingDays] [int] NOT NULL,
	[allosInvestment] [bit] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuProposalTypes] PRIMARY KEY CLUSTERED 
(
	[proposalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProvinces]    Script Date: 6/6/2025 17:21:41 ******/
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
/****** Object:  Table [dbo].[VotuRegistrationCaseDocs]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuRegistrationCaseDocs](
	[caseDocId] [int] IDENTITY(1,1) NOT NULL,
	[caseId] [int] NOT NULL,
	[documentID] [int] NOT NULL,
	[docRole] [varchar](30) NOT NULL,
	[isRequired] [bit] NOT NULL,
	[aiValidationStatus] [varchar](15) NOT NULL,
	[aiScore] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[caseDocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuRegistrationCases]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuRegistrationCases](
	[caseId] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [varchar](10) NOT NULL,
	[entityId] [int] NOT NULL,
	[caseType] [varchar](20) NOT NULL,
	[status] [varchar](15) NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
	[completedAt] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[caseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuRoles]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
	[description] [varchar](250) NULL,
	[createdAt] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
 CONSTRAINT [PK_VotuRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuRolesPermissions]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuRolesPermissions](
	[rolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
	[permissionID] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
 CONSTRAINT [PK_VotuRolesPermissions] PRIMARY KEY CLUSTERED 
(
	[rolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuSecurityEvents]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuSecurityEvents](
	[eventId] [bigint] IDENTITY(1,1) NOT NULL,
	[actorHash] [varbinary](64) NOT NULL,
	[eventType] [varchar](30) NOT NULL,
	[targetEntity] [varchar](50) NULL,
	[payloadHash] [varbinary](64) NULL,
	[ip] [varchar](45) NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuSecurityEvents] PRIMARY KEY CLUSTERED 
(
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuStatus]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuStatus](
	[statusId] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[descripción] [varchar](50) NOT NULL,
	[lastUpdate] [datetime] NOT NULL,
	[createAt] [datetime] NOT NULL,
 CONSTRAINT [PK_VotuStatus] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuUserKeys]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuUserKeys](
	[userKeyId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[keyID] [int] NOT NULL,
	[purpose] [varchar](6) NOT NULL,
	[isActive] [bit] NOT NULL,
	[assignedAt] [datetime2](6) NOT NULL,
	[revokedAt] [datetime2](6) NULL,
	[lastUsedAt] [datetime2](6) NULL,
	[comment] [nvarchar](200) NULL,
 CONSTRAINT [PK_VotuUserKeys] PRIMARY KEY CLUSTERED 
(
	[userKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuUserRoles]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuUserRoles](
	[userRoleId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdAt] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
 CONSTRAINT [PK_VotuUserRoles] PRIMARY KEY CLUSTERED 
(
	[userRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuUsers]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuUsers](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdAt] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
	[addressID] [int] NULL,
	[statusId] [int] NOT NULL,
	[lastLivenessCheck] [datetime2](7) NULL,
	[livenessCheckFrequencyD] [int] NULL,
 CONSTRAINT [PK_VotuUsers] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuVotes]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuVotes](
	[voteId] [bigint] IDENTITY(1,1) NOT NULL,
	[voterHash] [varbinary](64) NOT NULL,
	[voteEncrypted] [varbinary](max) NOT NULL,
	[voteHash] [varbinary](64) NOT NULL,
	[voteWeight] [decimal](5, 2) NOT NULL,
	[votedAt] [datetime] NOT NULL,
	[ipHash] [varbinary](32) NULL,
	[deviceFingerprint] [varbinary](64) NULL,
	[mfaVerified] [bit] NULL,
	[livenessCheckPassed] [bit] NULL,
	[proposalID] [int] NOT NULL,
	[votingSegmentID] [int] NULL,
 CONSTRAINT [PK_VotuVotes] PRIMARY KEY CLUSTERED 
(
	[voteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuVotingConfigurations]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuVotingConfigurations](
	[votingConfigurationsId] [int] IDENTITY(1,1) NOT NULL,
	[votingType] [varchar](30) NOT NULL,
	[votingStartDate] [datetime] NOT NULL,
	[votingEndDate] [datetime] NOT NULL,
	[earlyEnd] [bit] NOT NULL,
	[minimumVotes] [int] NULL,
	[minimumParticipationPercentage] [decimal](5, 2) NULL,
	[acceptanceThresholdType] [varchar](40) NOT NULL,
	[acceptanceThresholdValue] [decimal](5, 2) NOT NULL,
	[requiresMinimumPerSegment] [bit] NOT NULL,
	[notificationMethod] [varchar](30) NOT NULL,
	[notificationTemplateID] [int] NULL,
	[reminderDaysBefore] [int] NOT NULL,
	[allowedIPRanges] [varchar](1000) NULL,
	[votingHoursStart] [time](7) NULL,
	[votingHoursEnd] [time](7) NULL,
	[weekdaysOnly] [bit] NULL,
	[questionJSON] [varchar](max) NOT NULL,
	[allowComments] [bit] NOT NULL,
	[configurationHash] [varbinary](64) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[isLocked] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[proposalID] [int] NOT NULL,
	[configuredbyUserID] [int] NOT NULL,
	[approvedbyUserID] [int] NULL,
 CONSTRAINT [PK_VotuVotingConfigurations] PRIMARY KEY CLUSTERED 
(
	[votingConfigurationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuWorkflowAssignmentRules]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuWorkflowAssignmentRules](
	[ruleId] [int] IDENTITY(1,1) NOT NULL,
	[workflowId] [int] NOT NULL,
	[ruleName] [varchar](100) NOT NULL,
	[entityType] [varchar](20) NOT NULL,
	[triggerCondition] [nvarchar](1000) NOT NULL,
	[priority] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[effectiveFrom] [datetime2](6) NOT NULL,
	[effectiveTo] [datetime2](6) NULL,
	[createdAt] [datetime2](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ruleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuWorkflowDefinitions]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuWorkflowDefinitions](
	[workflowId] [int] IDENTITY(1,1) NOT NULL,
	[workflowCode] [varchar](30) NOT NULL,
	[workflowName] [varchar](100) NOT NULL,
	[description] [nvarchar](500) NULL,
	[triggerContext] [varchar](50) NOT NULL,
	[entityType] [varchar](20) NOT NULL,
	[isActive] [bit] NOT NULL,
	[version] [int] NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
	[createdByUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[workflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[workflowCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuWorkflowInstances]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuWorkflowInstances](
	[instanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[workflowId] [int] NOT NULL,
	[entityType] [varchar](20) NOT NULL,
	[entityId] [bigint] NOT NULL,
	[currentStepId] [int] NULL,
	[status] [varchar](20) NOT NULL,
	[priority] [varchar](10) NOT NULL,
	[startedAt] [datetime2](6) NOT NULL,
	[completedAt] [datetime2](6) NULL,
	[deadlineAt] [datetime2](6) NULL,
	[contextData] [nvarchar](max) NULL,
	[errorMessage] [nvarchar](1000) NULL,
	[retryCount] [int] NOT NULL,
	[maxRetries] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[instanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuWorkflowStepExecutions]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuWorkflowStepExecutions](
	[executionId] [bigint] IDENTITY(1,1) NOT NULL,
	[instanceId] [bigint] NOT NULL,
	[stepId] [int] NOT NULL,
	[executionOrder] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
	[result] [varchar](20) NULL,
	[startedAt] [datetime2](6) NOT NULL,
	[completedAt] [datetime2](6) NULL,
	[executedByUserID] [int] NULL,
	[aiTaskID] [bigint] NULL,
	[inputData] [nvarchar](max) NULL,
	[outputData] [nvarchar](max) NULL,
	[errorMessage] [nvarchar](1000) NULL,
	[processingTimeMs] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[executionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuWorkflowSteps]    Script Date: 6/6/2025 17:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuWorkflowSteps](
	[stepId] [int] IDENTITY(1,1) NOT NULL,
	[workflowId] [int] NOT NULL,
	[stepOrder] [int] NOT NULL,
	[stepCode] [varchar](30) NOT NULL,
	[stepName] [varchar](100) NOT NULL,
	[stepType] [varchar](20) NOT NULL,
	[isRequired] [bit] NOT NULL,
	[canSkip] [bit] NOT NULL,
	[timeoutHours] [int] NULL,
	[configurationJSON] [nvarchar](max) NULL,
	[nextStepConditions] [nvarchar](1000) NULL,
	[createdAt] [datetime2](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_VWS_workflow_code] UNIQUE NONCLUSTERED 
(
	[workflowId] ASC,
	[stepCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_VWS_workflow_order] UNIQUE NONCLUSTERED 
(
	[workflowId] ASC,
	[stepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_AITasks_running]    Script Date: 6/6/2025 17:21:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uq_AITasks_running] ON [dbo].[VotuAITasks]
(
	[modelID] ASC,
	[entityTable] ASC,
	[entityId] ASC
)
WHERE ([status]='RUNNING')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_VWI_status_entity]    Script Date: 6/6/2025 17:21:41 ******/
CREATE NONCLUSTERED INDEX [IX_VWI_status_entity] ON [dbo].[VotuWorkflowInstances]
(
	[status] ASC,
	[entityType] ASC,
	[entityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_VWI_workflow_status]    Script Date: 6/6/2025 17:21:41 ******/
CREATE NONCLUSTERED INDEX [IX_VWI_workflow_status] ON [dbo].[VotuWorkflowInstances]
(
	[workflowId] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VWSE_instance_step]    Script Date: 6/6/2025 17:21:41 ******/
CREATE NONCLUSTERED INDEX [IX_VWSE_instance_step] ON [dbo].[VotuWorkflowStepExecutions]
(
	[instanceId] ASC,
	[stepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_VWSE_status_started]    Script Date: 6/6/2025 17:21:41 ******/
CREATE NONCLUSTERED INDEX [IX_VWSE_status_started] ON [dbo].[VotuWorkflowStepExecutions]
(
	[status] ASC,
	[startedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VotuAIModels] ADD  CONSTRAINT [DF_VotuAIModels_isEnabled]  DEFAULT ((1)) FOR [isEnabled]
GO
ALTER TABLE [dbo].[VotuAIModels] ADD  CONSTRAINT [DF_VotuAIModels_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuAITasks] ADD  CONSTRAINT [DF_VotuAITasks_status]  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[VotuAITasks] ADD  CONSTRAINT [DF_VotuAITasks_requestedAt]  DEFAULT (sysutcdatetime()) FOR [requestedAt]
GO
ALTER TABLE [dbo].[VotuCountries] ADD  CONSTRAINT [DF_VotuCountries_allowsVoting]  DEFAULT ((1)) FOR [allowsVoting]
GO
ALTER TABLE [dbo].[VotuDocumentTypes] ADD  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuDocumentTypes] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuEncriptionKeys] ADD  CONSTRAINT [DF_VotuEncriptionKeys_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuEncriptionKeys] ADD  CONSTRAINT [DF_VotuEncriptionKeys_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuIdentities] ADD  CONSTRAINT [DF_VotuIdentities_validationFrequency]  DEFAULT ((365)) FOR [validationFrequency]
GO
ALTER TABLE [dbo].[VotuRegistrationCaseDocs] ADD  CONSTRAINT [DF_VRCD_aiStatus]  DEFAULT ('PENDING') FOR [aiValidationStatus]
GO
ALTER TABLE [dbo].[VotuRegistrationCases] ADD  CONSTRAINT [DF_VRC_status]  DEFAULT ('OPEN') FOR [status]
GO
ALTER TABLE [dbo].[VotuRegistrationCases] ADD  CONSTRAINT [DF_VRC_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuUsers] ADD  CONSTRAINT [DF_VotuUsers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuUsers] ADD  CONSTRAINT [DF_VotuUsers_livenessCheckFrequencyD]  DEFAULT ((365)) FOR [livenessCheckFrequencyD]
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules] ADD  DEFAULT ((1)) FOR [priority]
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules] ADD  DEFAULT (sysutcdatetime()) FOR [effectiveFrom]
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules] ADD  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuWorkflowDefinitions] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuWorkflowDefinitions] ADD  DEFAULT ((1)) FOR [version]
GO
ALTER TABLE [dbo].[VotuWorkflowDefinitions] ADD  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] ADD  DEFAULT ('STARTED') FOR [status]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] ADD  DEFAULT ('NORMAL') FOR [priority]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] ADD  DEFAULT (sysutcdatetime()) FOR [startedAt]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] ADD  DEFAULT ((0)) FOR [retryCount]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] ADD  DEFAULT ((3)) FOR [maxRetries]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] ADD  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] ADD  DEFAULT (sysutcdatetime()) FOR [startedAt]
GO
ALTER TABLE [dbo].[VotuWorkflowSteps] ADD  DEFAULT ((1)) FOR [isRequired]
GO
ALTER TABLE [dbo].[VotuWorkflowSteps] ADD  DEFAULT ((0)) FOR [canSkip]
GO
ALTER TABLE [dbo].[VotuWorkflowSteps] ADD  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuAdresses]  WITH CHECK ADD  CONSTRAINT [DistritoIDFK1] FOREIGN KEY([distritoID])
REFERENCES [dbo].[VotuDistritos] ([distritosId])
GO
ALTER TABLE [dbo].[VotuAdresses] CHECK CONSTRAINT [DistritoIDFK1]
GO
ALTER TABLE [dbo].[VotuAITasks]  WITH CHECK ADD  CONSTRAINT [modelIDFK1] FOREIGN KEY([modelID])
REFERENCES [dbo].[VotuAIModels] ([modelId])
GO
ALTER TABLE [dbo].[VotuAITasks] CHECK CONSTRAINT [modelIDFK1]
GO
ALTER TABLE [dbo].[VotuCantones]  WITH CHECK ADD  CONSTRAINT [ProvincesID1] FOREIGN KEY([provincesID])
REFERENCES [dbo].[VotuProvinces] ([provincesId])
GO
ALTER TABLE [dbo].[VotuCantones] CHECK CONSTRAINT [ProvincesID1]
GO
ALTER TABLE [dbo].[VotuDistritos]  WITH CHECK ADD  CONSTRAINT [cantoneIDFK1] FOREIGN KEY([cantonesID])
REFERENCES [dbo].[VotuCantones] ([cantonesId])
GO
ALTER TABLE [dbo].[VotuDistritos] CHECK CONSTRAINT [cantoneIDFK1]
GO
ALTER TABLE [dbo].[VotuDocumentTypes]  WITH CHECK ADD  CONSTRAINT [FK_VDT_modelID] FOREIGN KEY([modelID])
REFERENCES [dbo].[VotuAIModels] ([modelId])
GO
ALTER TABLE [dbo].[VotuDocumentTypes] CHECK CONSTRAINT [FK_VDT_modelID]
GO
ALTER TABLE [dbo].[VotuIdentities]  WITH CHECK ADD  CONSTRAINT [taskIDFK3] FOREIGN KEY([aiValidationTaskID])
REFERENCES [dbo].[VotuAITasks] ([taskId])
GO
ALTER TABLE [dbo].[VotuIdentities] CHECK CONSTRAINT [taskIDFK3]
GO
ALTER TABLE [dbo].[VotuIdentities]  WITH CHECK ADD  CONSTRAINT [userIDFK1] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuIdentities] CHECK CONSTRAINT [userIDFK1]
GO
ALTER TABLE [dbo].[VotuKeyShares]  WITH CHECK ADD  CONSTRAINT [keyIDFK2] FOREIGN KEY([keyID])
REFERENCES [dbo].[VotuEncriptionKeys] ([keyId])
GO
ALTER TABLE [dbo].[VotuKeyShares] CHECK CONSTRAINT [keyIDFK2]
GO
ALTER TABLE [dbo].[VotuKeyShares]  WITH CHECK ADD  CONSTRAINT [userIDFK5] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuKeyShares] CHECK CONSTRAINT [userIDFK5]
GO
ALTER TABLE [dbo].[VotuOrganizations]  WITH CHECK ADD  CONSTRAINT [addressIDFK2] FOREIGN KEY([addressID])
REFERENCES [dbo].[VotuAdresses] ([addressId])
GO
ALTER TABLE [dbo].[VotuOrganizations] CHECK CONSTRAINT [addressIDFK2]
GO
ALTER TABLE [dbo].[VotuOrganizations]  WITH CHECK ADD  CONSTRAINT [organizationTypeIDFK1] FOREIGN KEY([organizationTypeID])
REFERENCES [dbo].[VotuOrganizationTypes] ([organizationTypeId])
GO
ALTER TABLE [dbo].[VotuOrganizations] CHECK CONSTRAINT [organizationTypeIDFK1]
GO
ALTER TABLE [dbo].[VotuProposals]  WITH CHECK ADD  CONSTRAINT [createdByUserIDFK2] FOREIGN KEY([createdByUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuProposals] CHECK CONSTRAINT [createdByUserIDFK2]
GO
ALTER TABLE [dbo].[VotuProposals]  WITH CHECK ADD  CONSTRAINT [organizationIDFK1] FOREIGN KEY([organizationID])
REFERENCES [dbo].[VotuOrganizations] ([organizationId])
GO
ALTER TABLE [dbo].[VotuProposals] CHECK CONSTRAINT [organizationIDFK1]
GO
ALTER TABLE [dbo].[VotuProposals]  WITH CHECK ADD  CONSTRAINT [proposalStatusIDFK1] FOREIGN KEY([proposalStatusID])
REFERENCES [dbo].[VotuProposalStatus] ([proposalStatusId])
GO
ALTER TABLE [dbo].[VotuProposals] CHECK CONSTRAINT [proposalStatusIDFK1]
GO
ALTER TABLE [dbo].[VotuProposals]  WITH CHECK ADD  CONSTRAINT [proposalTypeIDFK1] FOREIGN KEY([proposalTypeID])
REFERENCES [dbo].[VotuProposalTypes] ([proposalTypeId])
GO
ALTER TABLE [dbo].[VotuProposals] CHECK CONSTRAINT [proposalTypeIDFK1]
GO
ALTER TABLE [dbo].[VotuProvinces]  WITH CHECK ADD  CONSTRAINT [CountryIDFK1] FOREIGN KEY([countryID])
REFERENCES [dbo].[VotuCountries] ([countryId])
GO
ALTER TABLE [dbo].[VotuProvinces] CHECK CONSTRAINT [CountryIDFK1]
GO
ALTER TABLE [dbo].[VotuRegistrationCaseDocs]  WITH CHECK ADD  CONSTRAINT [FK_VRCD_case] FOREIGN KEY([caseId])
REFERENCES [dbo].[VotuRegistrationCases] ([caseId])
GO
ALTER TABLE [dbo].[VotuRegistrationCaseDocs] CHECK CONSTRAINT [FK_VRCD_case]
GO
ALTER TABLE [dbo].[VotuRegistrationCaseDocs]  WITH CHECK ADD  CONSTRAINT [FK_VRCD_document] FOREIGN KEY([documentID])
REFERENCES [dbo].[VotuIdentityDocuments] ([identityDocumentId])
GO
ALTER TABLE [dbo].[VotuRegistrationCaseDocs] CHECK CONSTRAINT [FK_VRCD_document]
GO
ALTER TABLE [dbo].[VotuRolesPermissions]  WITH CHECK ADD  CONSTRAINT [permissionIDFK1] FOREIGN KEY([permissionID])
REFERENCES [dbo].[VotuPermissions] ([permissionId])
GO
ALTER TABLE [dbo].[VotuRolesPermissions] CHECK CONSTRAINT [permissionIDFK1]
GO
ALTER TABLE [dbo].[VotuRolesPermissions]  WITH CHECK ADD  CONSTRAINT [roleIDFK2] FOREIGN KEY([roleID])
REFERENCES [dbo].[VotuRoles] ([roleId])
GO
ALTER TABLE [dbo].[VotuRolesPermissions] CHECK CONSTRAINT [roleIDFK2]
GO
ALTER TABLE [dbo].[VotuUserKeys]  WITH CHECK ADD  CONSTRAINT [keyIDFK1] FOREIGN KEY([keyID])
REFERENCES [dbo].[VotuEncriptionKeys] ([keyId])
GO
ALTER TABLE [dbo].[VotuUserKeys] CHECK CONSTRAINT [keyIDFK1]
GO
ALTER TABLE [dbo].[VotuUserKeys]  WITH CHECK ADD  CONSTRAINT [userIDFK6] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuUserKeys] CHECK CONSTRAINT [userIDFK6]
GO
ALTER TABLE [dbo].[VotuUserRoles]  WITH CHECK ADD  CONSTRAINT [roleIDFK1] FOREIGN KEY([roleID])
REFERENCES [dbo].[VotuRoles] ([roleId])
GO
ALTER TABLE [dbo].[VotuUserRoles] CHECK CONSTRAINT [roleIDFK1]
GO
ALTER TABLE [dbo].[VotuUserRoles]  WITH CHECK ADD  CONSTRAINT [userIDFK2] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuUserRoles] CHECK CONSTRAINT [userIDFK2]
GO
ALTER TABLE [dbo].[VotuUsers]  WITH CHECK ADD  CONSTRAINT [addressIDFK1] FOREIGN KEY([addressID])
REFERENCES [dbo].[VotuAdresses] ([addressId])
GO
ALTER TABLE [dbo].[VotuUsers] CHECK CONSTRAINT [addressIDFK1]
GO
ALTER TABLE [dbo].[VotuUsers]  WITH CHECK ADD  CONSTRAINT [FK_VotuUsers_VotuStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[VotuStatus] ([statusId])
GO
ALTER TABLE [dbo].[VotuUsers] CHECK CONSTRAINT [FK_VotuUsers_VotuStatus]
GO
ALTER TABLE [dbo].[VotuVotes]  WITH CHECK ADD  CONSTRAINT [proposalIDFK1] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuVotes] CHECK CONSTRAINT [proposalIDFK1]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations]  WITH CHECK ADD  CONSTRAINT [configuredByUserIDFK1] FOREIGN KEY([configuredbyUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] CHECK CONSTRAINT [configuredByUserIDFK1]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations]  WITH CHECK ADD  CONSTRAINT [proposalIDFK2] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] CHECK CONSTRAINT [proposalIDFK2]
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules]  WITH CHECK ADD  CONSTRAINT [FK_VWAR_workflow] FOREIGN KEY([workflowId])
REFERENCES [dbo].[VotuWorkflowDefinitions] ([workflowId])
GO
ALTER TABLE [dbo].[VotuWorkflowAssignmentRules] CHECK CONSTRAINT [FK_VWAR_workflow]
GO
ALTER TABLE [dbo].[VotuWorkflowDefinitions]  WITH CHECK ADD  CONSTRAINT [FK_VWD_createdBy] FOREIGN KEY([createdByUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuWorkflowDefinitions] CHECK CONSTRAINT [FK_VWD_createdBy]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances]  WITH CHECK ADD  CONSTRAINT [FK_VWI_currentStep] FOREIGN KEY([currentStepId])
REFERENCES [dbo].[VotuWorkflowSteps] ([stepId])
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] CHECK CONSTRAINT [FK_VWI_currentStep]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances]  WITH CHECK ADD  CONSTRAINT [FK_VWI_workflow] FOREIGN KEY([workflowId])
REFERENCES [dbo].[VotuWorkflowDefinitions] ([workflowId])
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] CHECK CONSTRAINT [FK_VWI_workflow]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VWSE_aiTask] FOREIGN KEY([aiTaskID])
REFERENCES [dbo].[VotuAITasks] ([taskId])
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [FK_VWSE_aiTask]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VWSE_executedBy] FOREIGN KEY([executedByUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [FK_VWSE_executedBy]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VWSE_instance] FOREIGN KEY([instanceId])
REFERENCES [dbo].[VotuWorkflowInstances] ([instanceId])
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [FK_VWSE_instance]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [FK_VWSE_step] FOREIGN KEY([stepId])
REFERENCES [dbo].[VotuWorkflowSteps] ([stepId])
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [FK_VWSE_step]
GO
ALTER TABLE [dbo].[VotuWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [FK_VWS_workflow] FOREIGN KEY([workflowId])
REFERENCES [dbo].[VotuWorkflowDefinitions] ([workflowId])
GO
ALTER TABLE [dbo].[VotuWorkflowSteps] CHECK CONSTRAINT [FK_VWS_workflow]
GO
ALTER TABLE [dbo].[VotuAITasks]  WITH CHECK ADD CHECK  (([status]='ERROR' OR [status]='DONE' OR [status]='RUNNING' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[VotuAITasks]  WITH CHECK ADD CHECK  (([status]='ERROR' OR [status]='DONE' OR [status]='RUNNING' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[VotuEncriptionKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
ALTER TABLE [dbo].[VotuEncriptionKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
ALTER TABLE [dbo].[VotuRegistrationCases]  WITH CHECK ADD  CONSTRAINT [CK_VRC_entityType] CHECK  (([entityType]='ORG' OR [entityType]='PERSON'))
GO
ALTER TABLE [dbo].[VotuRegistrationCases] CHECK CONSTRAINT [CK_VRC_entityType]
GO
ALTER TABLE [dbo].[VotuRegistrationCases]  WITH CHECK ADD  CONSTRAINT [CK_VRC_status] CHECK  (([status]='REJECTED' OR [status]='APPROVED' OR [status]='NEEDS_MANUAL' OR [status]='VALIDATING' OR [status]='OPEN'))
GO
ALTER TABLE [dbo].[VotuRegistrationCases] CHECK CONSTRAINT [CK_VRC_status]
GO
ALTER TABLE [dbo].[VotuUserKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
ALTER TABLE [dbo].[VotuUserKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
ALTER TABLE [dbo].[VotuWorkflowInstances]  WITH CHECK ADD  CONSTRAINT [CK_VWI_priority] CHECK  (([priority]='URGENT' OR [priority]='HIGH' OR [priority]='NORMAL' OR [priority]='LOW'))
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] CHECK CONSTRAINT [CK_VWI_priority]
GO
ALTER TABLE [dbo].[VotuWorkflowInstances]  WITH CHECK ADD  CONSTRAINT [CK_VWI_status] CHECK  (([status]='TIMEOUT' OR [status]='CANCELLED' OR [status]='FAILED' OR [status]='COMPLETED' OR [status]='WAITING' OR [status]='IN_PROGRESS' OR [status]='STARTED'))
GO
ALTER TABLE [dbo].[VotuWorkflowInstances] CHECK CONSTRAINT [CK_VWI_status]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [CK_VWSE_result] CHECK  (([result]='ESCALATED' OR [result]='CONDITIONAL_PASS' OR [result]='PARTIAL' OR [result]='NEEDS_REVIEW' OR [result]='REJECTED' OR [result]='APPROVED'))
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [CK_VWSE_result]
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions]  WITH CHECK ADD  CONSTRAINT [CK_VWSE_status] CHECK  (([status]='SKIPPED' OR [status]='FAILED' OR [status]='COMPLETED' OR [status]='RUNNING' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[VotuWorkflowStepExecutions] CHECK CONSTRAINT [CK_VWSE_status]
GO
ALTER TABLE [dbo].[VotuWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [CK_VWS_stepType] CHECK  (([stepType]='MULTI_SIGNATURE' OR [stepType]='APPROVAL' OR [stepType]='NOTIFICATION' OR [stepType]='CONDITIONAL' OR [stepType]='AUTOMATIC' OR [stepType]='HUMAN_REVIEW' OR [stepType]='AI_VALIDATION'))
GO
ALTER TABLE [dbo].[VotuWorkflowSteps] CHECK CONSTRAINT [CK_VWS_stepType]
GO
USE [master]
GO
ALTER DATABASE [Caso3] SET  READ_WRITE 
GO

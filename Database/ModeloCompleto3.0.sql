USE [master]
GO
/****** Object:  Database [Caso3]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuAccessRestrictions]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAccessRestrictions](
	[restrictionId] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [varchar](10) NOT NULL,
	[entityId] [int] NOT NULL,
	[ruleType] [varchar](10) NOT NULL,
	[ruleDefinition] [nvarchar](400) NOT NULL,
	[activeFrom] [datetime2](6) NOT NULL,
	[activeTo] [datetime2](6) NULL,
	[isActive] [bit] NOT NULL,
	[comment] [nvarchar](200) NULL,
 CONSTRAINT [PK_VotuAccessRestrictions] PRIMARY KEY CLUSTERED 
(
	[restrictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuAdresses]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuAIModels]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuAITaskPayloads]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAITaskPayloads](
	[payloadId] [bigint] IDENTITY(1,1) NOT NULL,
	[taskID] [bigint] NOT NULL,
	[direction] [char](3) NOT NULL,
	[payload] [varbinary](max) NOT NULL,
	[sizeBytes] [int] NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuAITaskPayloads] PRIMARY KEY CLUSTERED 
(
	[payloadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuAITasks]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuAIValidationResults]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuAIValidationResults](
	[resultId] [bigint] IDENTITY(1,1) NOT NULL,
	[taskID] [bigint] NOT NULL,
	[isValid] [bit] NOT NULL,
	[score] [decimal](5, 2) NULL,
	[summary] [nvarchar](4000) NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuAIValidationResults] PRIMARY KEY CLUSTERED 
(
	[resultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCantones]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuComments]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuComments](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[parentCommentId] [int] NULL,
	[commentType] [varchar](30) NOT NULL,
	[isFiscalization] [bit] NOT NULL,
	[commentText] [varchar](2000) NOT NULL,
	[commentTextEncrypted] [varbinary](max) NULL,
	[attachedDocumentIds] [varchar](500) NULL,
	[validationStatus] [varchar](20) NOT NULL,
	[validatedByAI] [bit] NOT NULL,
	[moderatedAt] [datetime] NULL,
	[rejectionReason] [varchar](50) NULL,
	[fiscalizationSeverity] [varchar](20) NULL,
	[evidenceJSON] [varchar](max) NULL,
	[requiresVoting] [bit] NOT NULL,
	[likesCount] [int] NOT NULL,
	[isEdited] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[deletedAt] [datetime] NULL,
	[ipHash] [varbinary](32) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[proposalID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[aiTaskID] [bigint] NULL,
	[moderatorUserID] [int] NULL,
	[deletedByUserID] [int] NULL,
	[votingConfigurationID] [int] NULL,
 CONSTRAINT [PK_VotuComments] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuCountries]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuDistritos]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuEncriptionKeys]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuIdentities]    Script Date: 3/6/2025 22:15:11 ******/
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
	[aiValidationDetails] [nvarchar](1000) NULL,
	[requiresHumanValidation] [nchar](10) NULL,
	[documentHash] [varbinary](64) NULL,
	[encryptedMetadata] [varbinary](max) NULL,
 CONSTRAINT [PK_VotuIdentities] PRIMARY KEY CLUSTERED 
(
	[identityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentityChecks]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentityChecks](
	[checkId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[taskId] [bigint] NULL,
	[checkType] [varchar](30) NOT NULL,
	[result] [bit] NOT NULL,
	[score] [decimal](5, 2) NULL,
	[checkedAt] [datetime2](6) NOT NULL,
	[comment] [nvarchar](400) NULL,
 CONSTRAINT [PK_VotuIdentityChecks] PRIMARY KEY CLUSTERED 
(
	[checkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentityDocuments]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuIdentityValidationConfig]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentityValidationConfig](
	[configId] [int] IDENTITY(1,1) NOT NULL,
	[identityType] [varchar](50) NOT NULL,
	[userType] [varchar](30) NOT NULL,
	[requiredDocuments] [varchar](1000) NOT NULL,
	[optionalDocuments] [varchar](1000) NULL,
	[requiresAIValidation] [bit] NOT NULL,
	[aiConfidenceThreshold] [decimal](5, 2) NOT NULL,
	[aiModelsRequired] [varchar](200) NULL,
	[requiresHumanValidation] [bit] NOT NULL,
	[humanValidationTriggers] [varchar](500) NULL,
	[requiredValidatorCount] [int] NOT NULL,
	[validatorQualifications] [varchar](500) NULL,
	[requiresLivenessCheck] [bit] NOT NULL,
	[livenessCheckTypes] [varchar](300) NULL,
	[livenessThreshold] [decimal](5, 2) NOT NULL,
	[validationTimeoutHours] [int] NOT NULL,
	[renewalFrequencyDays] [int] NOT NULL,
	[gracePeriodDays] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[effectiveFrom] [datetime2](6) NOT NULL,
	[effectiveTo] [datetime2](6) NULL,
	[createdByUserID] [int] NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuIdentityValidationConfig] PRIMARY KEY CLUSTERED 
(
	[configId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentityValidationCycles]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentityValidationCycles](
	[cycleId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[cycleType] [varchar](20) NOT NULL,
	[triggerReason] [varchar](100) NULL,
	[status] [varchar](20) NOT NULL,
	[priority] [varchar](10) NOT NULL,
	[requiredSteps] [nvarchar](2000) NOT NULL,
	[completedSteps] [nvarchar](2000) NULL,
	[pendingSteps] [nvarchar](2000) NULL,
	[startedAt] [datetime2](6) NOT NULL,
	[deadlineAt] [datetime2](6) NULL,
	[completedAt] [datetime2](6) NULL,
	[lastActivityAt] [datetime2](6) NULL,
	[finalResult] [varchar](20) NULL,
	[overallScore] [decimal](5, 2) NULL,
	[validationNotes] [nvarchar](1000) NULL,
	[createdBySystemTask] [bit] NOT NULL,
	[initiatedByUserID] [int] NULL,
	[assignedValidatorID] [int] NULL,
 CONSTRAINT [PK_VotuIdentityValidationCycles] PRIMARY KEY CLUSTERED 
(
	[cycleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuIdentityValidations]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuIdentityValidations](
	[validationId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[validatorID] [int] NOT NULL,
	[status] [varchar](10) NOT NULL,
	[signedAt] [datetime2](6) NULL,
	[comment] [nvarchar](400) NULL,
	[validationType] [varchar](20) NULL,
	[requiredValidators] [int] NULL,
	[completedValidators] [int] NULL,
	[keySharesRequired] [int] NULL,
	[multiSigThreshold] [int] NULL,
	[validationDeadline] [datetime2](6) NULL,
	[priority] [varchar](10) NULL,
	[evidenceHash] [varbinary](64) NULL,
	[digitalSignature] [varbinary](max) NULL,
 CONSTRAINT [PK_VotuIdentityValidations] PRIMARY KEY CLUSTERED 
(
	[validationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuKeyShares]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuLedger]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuLedger](
	[ledgerId] [bigint] IDENTITY(1,1) NOT NULL,
	[tableName] [varchar](50) NOT NULL,
	[recordId] [bigint] NOT NULL,
	[prevHash] [varbinary](64) NULL,
	[currHash] [varbinary](64) NOT NULL,
	[sig] [varbinary](max) NOT NULL,
	[timestamp] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_VotuLedger] PRIMARY KEY CLUSTERED 
(
	[ledgerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuLivenessChecks]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuLivenessChecks](
	[livenessId] [bigint] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[validationCycleID] [int] NULL,
	[mfaMethodID] [int] NULL,
	[checkType] [varchar](30) NOT NULL,
	[challengeType] [varchar](30) NULL,
	[challengeData] [nvarchar](500) NULL,
	[responseHash] [varbinary](64) NULL,
	[encryptedResponse] [varbinary](max) NULL,
	[biometricTemplate] [varbinary](max) NULL,
	[passed] [bit] NOT NULL,
	[confidenceScore] [decimal](5, 2) NOT NULL,
	[analysisDetails] [nvarchar](1000) NULL,
	[failureReason] [varchar](100) NULL,
	[aiModelUsed] [varchar](50) NULL,
	[aiTaskID] [bigint] NULL,
	[processingTimeMs] [int] NULL,
	[ipAddress] [varchar](45) NULL,
	[userAgent] [varchar](500) NULL,
	[deviceFingerprint] [varbinary](64) NULL,
	[locationHash] [varbinary](32) NULL,
	[initiatedAt] [datetime2](6) NOT NULL,
	[completedAt] [datetime2](6) NULL,
	[expiresAt] [datetime2](6) NULL,
 CONSTRAINT [PK_VotuLivenessChecks] PRIMARY KEY CLUSTERED 
(
	[livenessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMFA]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMFA](
	[mfaId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[MFAtype] [varchar](50) NOT NULL,
	[lastUsed] [datetime] NULL,
	[lastUpdate] [datetime] NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_VotuMFA] PRIMARY KEY CLUSTERED 
(
	[mfaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMFAMethods]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMFAMethods](
	[mfaId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[methodType] [varchar](20) NOT NULL,
	[secret] [varbinary](256) NOT NULL,
	[addedAt] [datetime2](6) NOT NULL,
	[lastVerifiedAt] [datetime2](6) NULL,
	[isActive] [bit] NOT NULL,
	[comment] [nvarchar](200) NULL,
	[supportsLiveness] [bit] NULL,
	[livenessLastCheck] [datetime2](6) NULL,
	[livenessSuccessCount] [int] NULL,
	[livenessFailureCount] [int] NULL,
	[livenessThreshold] [decimal](5, 2) NULL,
	[deviceFingerPrint] [varbinary](64) NULL,
	[encryptedSecret] [varbinary](max) NULL,
 CONSTRAINT [PK_VotuMFAMethods] PRIMARY KEY CLUSTERED 
(
	[mfaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuMultiValidatorApprovals]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuMultiValidatorApprovals](
	[approvalId] [int] IDENTITY(1,1) NOT NULL,
	[validationID] [int] NOT NULL,
	[validatorUserID] [int] NOT NULL,
	[keyShareID] [int] NULL,
	[decision] [varchar](20) NOT NULL,
	[validatorComments] [nvarchar](1000) NULL,
	[confidenceLevel] [varchar](10) NULL,
	[digitalSignature] [varbinary](max) NULL,
	[signatureAlgorithm] [varchar](20) NULL,
	[publicKeyUsed] [varbinary](max) NULL,
	[documentsReviewed] [varchar](500) NULL,
	[evidenceHash] [varbinary](64) NULL,
	[assignedAt] [datetime2](6) NOT NULL,
	[reviewedAt] [datetime2](6) NULL,
	[signedAt] [datetime2](6) NULL,
	[deadlineAt] [datetime2](6) NULL,
	[isActive] [bit] NOT NULL,
	[overriddenBy] [int] NULL,
	[overriddenAt] [datetime2](6) NULL,
	[overrideReason] [nvarchar](500) NULL,
 CONSTRAINT [PK_VotuMultiValidatorApprovals] PRIMARY KEY CLUSTERED 
(
	[approvalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuNotificationTemplates]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuNotificationTemplates](
	[notiTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[templateCode] [varchar](50) NOT NULL,
	[templateName] [varchar](200) NOT NULL,
	[notificationType] [nchar](10) NOT NULL,
	[channelType] [varchar](20) NOT NULL,
	[subject] [varchar](500) NOT NULL,
	[bodyTemplate] [varchar](max) NOT NULL,
	[bodyTemplateHTML] [varchar](max) NULL,
	[variables] [varchar](1000) NOT NULL,
	[maxLength] [int] NULL,
	[priority] [varchar](10) NOT NULL,
	[expiresAfterHours] [int] NULL,
	[allowsUnsubscribe] [bit] NOT NULL,
	[requiresApproval] [bit] NOT NULL,
	[languageCode] [varchar](5) NOT NULL,
	[countrycode] [varchar](3) NOT NULL,
	[targetAudience] [varchar](50) NULL,
	[segmentCriteria] [varchar](1000) NULL,
	[createdByUserID] [int] NOT NULL,
	[approvedByUserID] [int] NULL,
	[lastUsedAt] [datetime] NULL,
	[usageCount] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_VotuNotificationTemplates_1] PRIMARY KEY CLUSTERED 
(
	[notiTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuOrganizations]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuOrganizationTypes]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuPepperSalts]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuPepperSalts](
	[saltId] [int] IDENTITY(1,1) NOT NULL,
	[saltPurpose] [varchar](20) NOT NULL,
	[saltValue] [varbinary](64) NOT NULL,
	[createdAt] [datetime2](6) NOT NULL,
	[rotatedAt] [datetime2](6) NULL,
	[isActive] [bit] NOT NULL,
	[comment] [nvarchar](200) NULL,
 CONSTRAINT [PK_VotuPepperSalts] PRIMARY KEY CLUSTERED 
(
	[saltId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuPermissions]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuProposalDocuments]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProposalDocuments](
	[proposalDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[documentType] [varchar](60) NOT NULL,
	[fileName] [varchar](300) NOT NULL,
	[fileExtension] [varchar](10) NOT NULL,
	[fileSizeBytes] [bigint] NOT NULL,
	[fileHash] [varbinary](64) NOT NULL,
	[encryptedContent] [varbinary](max) NOT NULL,
	[mimeType] [varchar](100) NOT NULL,
	[validationStatus] [varchar](30) NOT NULL,
	[validationMessage] [varchar](1000) NULL,
	[validatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[proposalID] [int] NOT NULL,
	[uploadedByUserID] [int] NULL,
	[aiValidationTaskID] [int] NULL,
 CONSTRAINT [PK_VotuProposalDocuments] PRIMARY KEY CLUSTERED 
(
	[proposalDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProposals]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuProposalStatus]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuProposalTypes]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuProposalValidations]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuProposalValidations](
	[proposalValidationId] [int] IDENTITY(1,1) NOT NULL,
	[validationType] [varchar](20) NOT NULL,
	[validationResult] [varchar](20) NOT NULL,
	[score] [decimal](5, 2) NULL,
	[validationCriteria] [varchar](max) NOT NULL,
	[comments] [varchar](500) NULL,
	[requiredChanges] [varchar](1000) NULL,
	[validatedAt] [datetime] NOT NULL,
	[signatureHash] [varbinary](256) NULL,
	[isActive] [bit] NOT NULL,
	[proposalID] [int] NOT NULL,
	[validationUserID] [int] NOT NULL,
	[validatorKeyShareID] [int] NULL,
	[aiTaskID] [int] NULL,
 CONSTRAINT [PK_VotuProposalValidations] PRIMARY KEY CLUSTERED 
(
	[proposalValidationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProvinces]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuRoles]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuRolesPermissions]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuSecurityEvents]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuUserKeys]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuUserOrganizations]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuUserOrganizations](
	[userOrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[role] [varchar](60) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[canCreateProposals] [bit] NOT NULL,
	[canManageOrganization] [bit] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[userID] [int] NOT NULL,
	[organizationID] [int] NOT NULL,
 CONSTRAINT [PK_VotuUserOrganizations] PRIMARY KEY CLUSTERED 
(
	[userOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuUserRoles]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuUsers]    Script Date: 3/6/2025 22:15:11 ******/
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
 CONSTRAINT [PK_VotuUsers] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuVotes]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuVotingConfigurations]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Table [dbo].[VotuVotingResults]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuVotingResults](
	[voteResultsId] [int] IDENTITY(1,1) NOT NULL,
	[voteCount] [int] NOT NULL,
	[weightedVoteCount] [decimal](18, 2) NOT NULL,
	[percentage] [decimal](5, 2) NOT NULL,
	[segmentParticipation] [decimal](5, 2) NULL,
	[lastCalculatedAt] [datetime] NOT NULL,
	[calculationHash] [varbinary](64) NOT NULL,
	[isPartialResult] [bit] NOT NULL,
	[isFinalResult] [bit] NOT NULL,
	[proposalID] [int] NOT NULL,
	[votingSegmentID] [int] NULL,
	[questionID] [varchar](50) NOT NULL,
	[optionID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VotuVotingResults] PRIMARY KEY CLUSTERED 
(
	[voteResultsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuVotingSegments]    Script Date: 3/6/2025 22:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotuVotingSegments](
	[votingSegmentId] [int] IDENTITY(1,1) NOT NULL,
	[segmentName] [varchar](100) NOT NULL,
	[segmentType] [varchar](30) NOT NULL,
	[ageMin] [int] NULL,
	[ageMax] [int] NULL,
	[genderFilter] [varchar](10) NULL,
	[educationLevels] [varchar](500) NULL,
	[professions] [varchar](1000) NULL,
	[nationalityRequired] [varchar](3) NULL,
	[voteWeight] [decimal](5, 2) NOT NULL,
	[minimumParticipation] [int] NOT NULL,
	[userIdentifiersList] [varchar](max) NULL,
	[createdAt] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[votingConfigurationsID] [int] NOT NULL,
	[countryID] [int] NULL,
	[provinceID] [int] NULL,
	[cantonID] [int] NULL,
	[districtID] [int] NULL,
	[organizationsIds] [varchar](500) NULL,
	[institutionTypes] [varchar](500) NULL,
 CONSTRAINT [PK_VotuVotingSegments] PRIMARY KEY CLUSTERED 
(
	[votingSegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_AITasks_running]    Script Date: 3/6/2025 22:15:11 ******/
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
/****** Object:  Index [uq_VotuEncriptionKeys_active]    Script Date: 3/6/2025 22:15:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uq_VotuEncriptionKeys_active] ON [dbo].[VotuEncriptionKeys]
(
	[keyType] ASC,
	[purpose] ASC
)
WHERE ([isActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_VotuPepperSalts_active]    Script Date: 3/6/2025 22:15:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uq_VotuPepperSalts_active] ON [dbo].[VotuPepperSalts]
(
	[saltPurpose] ASC
)
WHERE ([isActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_VotuSecurityEvents_actor]    Script Date: 3/6/2025 22:15:11 ******/
CREATE NONCLUSTERED INDEX [ix_VotuSecurityEvents_actor] ON [dbo].[VotuSecurityEvents]
(
	[actorHash] ASC,
	[createdAt] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_VotuUserKeys_active]    Script Date: 3/6/2025 22:15:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uq_VotuUserKeys_active] ON [dbo].[VotuUserKeys]
(
	[userID] ASC,
	[purpose] ASC
)
WHERE ([isActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VotuAccessRestrictions] ADD  CONSTRAINT [DF_VotuAccessRestrictions_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuAIModels] ADD  CONSTRAINT [DF_VotuAIModels_isEnabled]  DEFAULT ((1)) FOR [isEnabled]
GO
ALTER TABLE [dbo].[VotuAIModels] ADD  CONSTRAINT [DF_VotuAIModels_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuAITaskPayloads] ADD  CONSTRAINT [DF_VotuAITaskPayloads_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuAITasks] ADD  CONSTRAINT [DF_VotuAITasks_status]  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[VotuAITasks] ADD  CONSTRAINT [DF_VotuAITasks_requestedAt]  DEFAULT (sysutcdatetime()) FOR [requestedAt]
GO
ALTER TABLE [dbo].[VotuAIValidationResults] ADD  CONSTRAINT [DF_VotuAIValidationResults_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_isFiscalization]  DEFAULT ((0)) FOR [isFiscalization]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_validatedByAI]  DEFAULT ((0)) FOR [validatedByAI]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_requiresVoting]  DEFAULT ((0)) FOR [requiresVoting]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_likesCount]  DEFAULT ((0)) FOR [likesCount]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_isEdited]  DEFAULT ((0)) FOR [isEdited]
GO
ALTER TABLE [dbo].[VotuComments] ADD  CONSTRAINT [DF_VotuComments_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[VotuCountries] ADD  CONSTRAINT [DF_VotuCountries_allowsVoting]  DEFAULT ((1)) FOR [allowsVoting]
GO
ALTER TABLE [dbo].[VotuEncriptionKeys] ADD  CONSTRAINT [DF_VotuEncriptionKeys_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuEncriptionKeys] ADD  CONSTRAINT [DF_VotuEncriptionKeys_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuIdentities] ADD  CONSTRAINT [DF_VotuIdentities_validationFrequency]  DEFAULT ((365)) FOR [validationFrequency]
GO
ALTER TABLE [dbo].[VotuIdentityChecks] ADD  CONSTRAINT [DF_VotuIdentityChecks_checkedAt]  DEFAULT (sysutcdatetime()) FOR [checkedAt]
GO
ALTER TABLE [dbo].[VotuIdentityDocuments] ADD  CONSTRAINT [DF_VotuIdentityDocuments_humanValidationRequired]  DEFAULT ((0)) FOR [humanValidationRequired]
GO
ALTER TABLE [dbo].[VotuIdentityDocuments] ADD  CONSTRAINT [DF_VotuIdentityDocuments_accesCount]  DEFAULT ((0)) FOR [accesCount]
GO
ALTER TABLE [dbo].[VotuIdentityDocuments] ADD  CONSTRAINT [DF_VotuIdentityDocuments_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuIdentityValidationConfig] ADD  CONSTRAINT [DF__VotuIdent__requi__59904A2C]  DEFAULT ((1)) FOR [requiresAIValidation]
GO
ALTER TABLE [dbo].[VotuIdentityValidationConfig] ADD  CONSTRAINT [DF__VotuIdent__requi__5A846E65]  DEFAULT ((0)) FOR [requiresHumanValidation]
GO
ALTER TABLE [dbo].[VotuIdentityValidationConfig] ADD  CONSTRAINT [DF__VotuIdent__requi__5B78929E]  DEFAULT ((1)) FOR [requiresLivenessCheck]
GO
ALTER TABLE [dbo].[VotuIdentityValidationConfig] ADD  CONSTRAINT [DF__VotuIdent__isAct__5C6CB6D7]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuIdentityValidationCycles] ADD  DEFAULT ((1)) FOR [createdBySystemTask]
GO
ALTER TABLE [dbo].[VotuIdentityValidations] ADD  CONSTRAINT [DF_VotuIdentityValidations_requiredValidators]  DEFAULT ((1)) FOR [requiredValidators]
GO
ALTER TABLE [dbo].[VotuIdentityValidations] ADD  CONSTRAINT [DF_VotuIdentityValidations_completedValidators]  DEFAULT ((0)) FOR [completedValidators]
GO
ALTER TABLE [dbo].[VotuKeyShares] ADD  CONSTRAINT [DF_VotuKeyShares_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuLedger] ADD  CONSTRAINT [DF_VotuLedger_timestamp]  DEFAULT (sysutcdatetime()) FOR [timestamp]
GO
ALTER TABLE [dbo].[VotuMFA] ADD  CONSTRAINT [DF_VotuMFA_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_addedAt]  DEFAULT (sysutcdatetime()) FOR [addedAt]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_supportsLiveness]  DEFAULT ((0)) FOR [supportsLiveness]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_livenessSuccessCount]  DEFAULT ((0)) FOR [livenessSuccessCount]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_livenessFailureCount]  DEFAULT ((0)) FOR [livenessFailureCount]
GO
ALTER TABLE [dbo].[VotuMFAMethods] ADD  CONSTRAINT [DF_VotuMFAMethods_livenessThreshold]  DEFAULT ((0.85)) FOR [livenessThreshold]
GO
ALTER TABLE [dbo].[VotuMultiValidatorApprovals] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_priority]  DEFAULT ('NORMAL') FOR [priority]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_allowsUnsubscribe]  DEFAULT ((1)) FOR [allowsUnsubscribe]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_requiresApproval]  DEFAULT ((0)) FOR [requiresApproval]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_languageCode]  DEFAULT ('es-CR') FOR [languageCode]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_countrycode]  DEFAULT ('CR') FOR [countrycode]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_usageCount]  DEFAULT ((0)) FOR [usageCount]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] ADD  CONSTRAINT [DF_VotuNotificationTemplates_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuOrganizations] ADD  CONSTRAINT [DF_VotuOrganizations_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VotuOrganizationTypes] ADD  CONSTRAINT [DF_VotuOrganizationTypes_requiresValidation]  DEFAULT ((0)) FOR [requiresValidation]
GO
ALTER TABLE [dbo].[VotuOrganizationTypes] ADD  CONSTRAINT [DF_VotuOrganizationTypes_canCreateProposals]  DEFAULT ((1)) FOR [canCreateProposals]
GO
ALTER TABLE [dbo].[VotuOrganizationTypes] ADD  CONSTRAINT [DF_VotuOrganizationTypes_canInvest]  DEFAULT ((1)) FOR [canInvest]
GO
ALTER TABLE [dbo].[VotuOrganizationTypes] ADD  CONSTRAINT [DF_VotuOrganizationTypes_canValidate]  DEFAULT ((0)) FOR [canValidate]
GO
ALTER TABLE [dbo].[VotuPepperSalts] ADD  CONSTRAINT [DF_VotuPepperSalts_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuPepperSalts] ADD  CONSTRAINT [DF_VotuPepperSalts_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuProposalDocuments] ADD  CONSTRAINT [DF_VotuProposalDocuments_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuProposals] ADD  CONSTRAINT [DF_VotuProposals_currentVersion]  DEFAULT ((1)) FOR [currentVersion]
GO
ALTER TABLE [dbo].[VotuProposals] ADD  CONSTRAINT [DF_VotuProposals_hasGovernmentEndorsement]  DEFAULT ((0)) FOR [hasGovernmentEndorsement]
GO
ALTER TABLE [dbo].[VotuProposals] ADD  CONSTRAINT [DF_VotuProposals_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_allowsEditing]  DEFAULT ((0)) FOR [allowsEditing]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_allowsComments]  DEFAULT ((0)) FOR [allowsComments]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_allowsVoting]  DEFAULT ((0)) FOR [allowsVoting]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_allowsInvestment]  DEFAULT ((0)) FOR [allowsInvestment]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_allowsFiscalization]  DEFAULT ((0)) FOR [allowsFiscalization]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_isTerminalStatus]  DEFAULT ((0)) FOR [isTerminalStatus]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_sortOrder]  DEFAULT ((0)) FOR [sortOrder]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuProposalStatus] ADD  CONSTRAINT [DF_VotuProposalStatus_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_requiresBudget]  DEFAULT ((0)) FOR [requiresBudget]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_requiresExecutionPlan]  DEFAULT ((0)) FOR [requiresExecutionPlan]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_requiresImpactAnalysis]  DEFAULT ((0)) FOR [requiresImpactAnalysis]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_requiresManualValidation]  DEFAULT ((0)) FOR [requiresManualValidation]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_minVotingDays]  DEFAULT ((10)) FOR [minVotingDays]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_maxVotingDays]  DEFAULT ((40)) FOR [maxVotingDays]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_allosInvestment]  DEFAULT ((1)) FOR [allosInvestment]
GO
ALTER TABLE [dbo].[VotuProposalTypes] ADD  CONSTRAINT [DF_VotuProposalTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VotuProposalValidations] ADD  CONSTRAINT [DF_VotuProposalValidations_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuSecurityEvents] ADD  CONSTRAINT [DF_VotuSecurityEvents_createdAt]  DEFAULT (sysutcdatetime()) FOR [createdAt]
GO
ALTER TABLE [dbo].[VotuUserKeys] ADD  CONSTRAINT [DF_VotuUserKeys_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuUserKeys] ADD  CONSTRAINT [DF_VotuUserKeys_assignedAt]  DEFAULT (sysutcdatetime()) FOR [assignedAt]
GO
ALTER TABLE [dbo].[VotuUserOrganizations] ADD  CONSTRAINT [DF_VotuUserOrganizations_canCreateProposals]  DEFAULT ((0)) FOR [canCreateProposals]
GO
ALTER TABLE [dbo].[VotuUserOrganizations] ADD  CONSTRAINT [DF_VotuUserOrganizations_canManageOrganization]  DEFAULT ((0)) FOR [canManageOrganization]
GO
ALTER TABLE [dbo].[VotuUserOrganizations] ADD  CONSTRAINT [DF_VotuUserOrganizations_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuUserRoles] ADD  CONSTRAINT [DF_VotuUserRoles_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuUsers] ADD  CONSTRAINT [DF_VotuUsers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuVotes] ADD  CONSTRAINT [DF_VotuVotes_voteWeight]  DEFAULT ((1.00)) FOR [voteWeight]
GO
ALTER TABLE [dbo].[VotuVotes] ADD  CONSTRAINT [DF_VotuVotes_mfaVerified]  DEFAULT ((1)) FOR [mfaVerified]
GO
ALTER TABLE [dbo].[VotuVotes] ADD  CONSTRAINT [DF_VotuVotes_livenessCheckPassed]  DEFAULT ((1)) FOR [livenessCheckPassed]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_earlyEnd]  DEFAULT ((0)) FOR [earlyEnd]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_requiresMinimumPerSegment]  DEFAULT ((0)) FOR [requiresMinimumPerSegment]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_reminderDaysBefore]  DEFAULT ((3)) FOR [reminderDaysBefore]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_weekdaysOnly]  DEFAULT ((0)) FOR [weekdaysOnly]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_allowComments]  DEFAULT ((1)) FOR [allowComments]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_isLocked]  DEFAULT ((0)) FOR [isLocked]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] ADD  CONSTRAINT [DF_VotuVotingConfigurations_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_voteCount]  DEFAULT ((0)) FOR [voteCount]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_weightedVoteCount]  DEFAULT ((0.00)) FOR [weightedVoteCount]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_percentage]  DEFAULT ((0.00)) FOR [percentage]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_lastCalculatedAt]  DEFAULT (getdate()) FOR [lastCalculatedAt]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_isPartialResult]  DEFAULT ((1)) FOR [isPartialResult]
GO
ALTER TABLE [dbo].[VotuVotingResults] ADD  CONSTRAINT [DF_VotuVotingResults_isFinalResult]  DEFAULT ((0)) FOR [isFinalResult]
GO
ALTER TABLE [dbo].[VotuVotingSegments] ADD  CONSTRAINT [DF_VotuVotingSegments_voteWeight]  DEFAULT ((1.00)) FOR [voteWeight]
GO
ALTER TABLE [dbo].[VotuVotingSegments] ADD  CONSTRAINT [DF_VotuVotingSegments_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VotuAdresses]  WITH CHECK ADD  CONSTRAINT [DistritoIDFK1] FOREIGN KEY([distritoID])
REFERENCES [dbo].[VotuDistritos] ([distritosId])
GO
ALTER TABLE [dbo].[VotuAdresses] CHECK CONSTRAINT [DistritoIDFK1]
GO
ALTER TABLE [dbo].[VotuAITaskPayloads]  WITH CHECK ADD  CONSTRAINT [taskIDFK1] FOREIGN KEY([taskID])
REFERENCES [dbo].[VotuAITasks] ([taskId])
GO
ALTER TABLE [dbo].[VotuAITaskPayloads] CHECK CONSTRAINT [taskIDFK1]
GO
ALTER TABLE [dbo].[VotuAITasks]  WITH CHECK ADD  CONSTRAINT [modelIDFK1] FOREIGN KEY([modelID])
REFERENCES [dbo].[VotuAIModels] ([modelId])
GO
ALTER TABLE [dbo].[VotuAITasks] CHECK CONSTRAINT [modelIDFK1]
GO
ALTER TABLE [dbo].[VotuAIValidationResults]  WITH CHECK ADD  CONSTRAINT [taskIDFK2] FOREIGN KEY([taskID])
REFERENCES [dbo].[VotuAITasks] ([taskId])
GO
ALTER TABLE [dbo].[VotuAIValidationResults] CHECK CONSTRAINT [taskIDFK2]
GO
ALTER TABLE [dbo].[VotuCantones]  WITH CHECK ADD  CONSTRAINT [ProvincesID1] FOREIGN KEY([provincesID])
REFERENCES [dbo].[VotuProvinces] ([provincesId])
GO
ALTER TABLE [dbo].[VotuCantones] CHECK CONSTRAINT [ProvincesID1]
GO
ALTER TABLE [dbo].[VotuComments]  WITH CHECK ADD  CONSTRAINT [moderatorUserIDFK1] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuComments] CHECK CONSTRAINT [moderatorUserIDFK1]
GO
ALTER TABLE [dbo].[VotuComments]  WITH CHECK ADD  CONSTRAINT [parentCommentIDFK1] FOREIGN KEY([parentCommentId])
REFERENCES [dbo].[VotuComments] ([commentId])
GO
ALTER TABLE [dbo].[VotuComments] CHECK CONSTRAINT [parentCommentIDFK1]
GO
ALTER TABLE [dbo].[VotuComments]  WITH CHECK ADD  CONSTRAINT [proposalIDFK5] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuComments] CHECK CONSTRAINT [proposalIDFK5]
GO
ALTER TABLE [dbo].[VotuComments]  WITH CHECK ADD  CONSTRAINT [userIDFK11] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuComments] CHECK CONSTRAINT [userIDFK11]
GO
ALTER TABLE [dbo].[VotuComments]  WITH CHECK ADD  CONSTRAINT [votingConfigurationID2] FOREIGN KEY([votingConfigurationID])
REFERENCES [dbo].[VotuVotingConfigurations] ([votingConfigurationsId])
GO
ALTER TABLE [dbo].[VotuComments] CHECK CONSTRAINT [votingConfigurationID2]
GO
ALTER TABLE [dbo].[VotuDistritos]  WITH CHECK ADD  CONSTRAINT [cantoneIDFK1] FOREIGN KEY([cantonesID])
REFERENCES [dbo].[VotuCantones] ([cantonesId])
GO
ALTER TABLE [dbo].[VotuDistritos] CHECK CONSTRAINT [cantoneIDFK1]
GO
ALTER TABLE [dbo].[VotuIdentities]  WITH CHECK ADD  CONSTRAINT [userIDFK1] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuIdentities] CHECK CONSTRAINT [userIDFK1]
GO
ALTER TABLE [dbo].[VotuIdentityChecks]  WITH CHECK ADD  CONSTRAINT [userIDFK8] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuIdentityChecks] CHECK CONSTRAINT [userIDFK8]
GO
ALTER TABLE [dbo].[VotuIdentityValidations]  WITH CHECK ADD  CONSTRAINT [userIDFK7] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuIdentityValidations] CHECK CONSTRAINT [userIDFK7]
GO
ALTER TABLE [dbo].[VotuIdentityValidations]  WITH CHECK ADD  CONSTRAINT [validatorIDFK1] FOREIGN KEY([validatorID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuIdentityValidations] CHECK CONSTRAINT [validatorIDFK1]
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
ALTER TABLE [dbo].[VotuMFA]  WITH CHECK ADD  CONSTRAINT [userIDFK3] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuMFA] CHECK CONSTRAINT [userIDFK3]
GO
ALTER TABLE [dbo].[VotuMFAMethods]  WITH CHECK ADD  CONSTRAINT [userIDFK4] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuMFAMethods] CHECK CONSTRAINT [userIDFK4]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates]  WITH CHECK ADD  CONSTRAINT [approvedByUserIDFK1] FOREIGN KEY([approvedByUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] CHECK CONSTRAINT [approvedByUserIDFK1]
GO
ALTER TABLE [dbo].[VotuNotificationTemplates]  WITH CHECK ADD  CONSTRAINT [createdByUserFK2] FOREIGN KEY([createdByUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuNotificationTemplates] CHECK CONSTRAINT [createdByUserFK2]
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
ALTER TABLE [dbo].[VotuProposalValidations]  WITH CHECK ADD  CONSTRAINT [proposalIDFK4] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuProposalValidations] CHECK CONSTRAINT [proposalIDFK4]
GO
ALTER TABLE [dbo].[VotuProposalValidations]  WITH CHECK ADD  CONSTRAINT [userIDFK9] FOREIGN KEY([validationUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuProposalValidations] CHECK CONSTRAINT [userIDFK9]
GO
ALTER TABLE [dbo].[VotuProvinces]  WITH CHECK ADD  CONSTRAINT [CountryIDFK1] FOREIGN KEY([countryID])
REFERENCES [dbo].[VotuCountries] ([countryId])
GO
ALTER TABLE [dbo].[VotuProvinces] CHECK CONSTRAINT [CountryIDFK1]
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
ALTER TABLE [dbo].[VotuUserOrganizations]  WITH CHECK ADD  CONSTRAINT [organizationIDFK2] FOREIGN KEY([organizationID])
REFERENCES [dbo].[VotuOrganizations] ([organizationId])
GO
ALTER TABLE [dbo].[VotuUserOrganizations] CHECK CONSTRAINT [organizationIDFK2]
GO
ALTER TABLE [dbo].[VotuUserOrganizations]  WITH CHECK ADD  CONSTRAINT [userIDFK10] FOREIGN KEY([userID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuUserOrganizations] CHECK CONSTRAINT [userIDFK10]
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
ALTER TABLE [dbo].[VotuVotes]  WITH CHECK ADD  CONSTRAINT [proposalIDFK1] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuVotes] CHECK CONSTRAINT [proposalIDFK1]
GO
ALTER TABLE [dbo].[VotuVotes]  WITH CHECK ADD  CONSTRAINT [votingSegmentIDFK1] FOREIGN KEY([votingSegmentID])
REFERENCES [dbo].[VotuVotingSegments] ([votingSegmentId])
GO
ALTER TABLE [dbo].[VotuVotes] CHECK CONSTRAINT [votingSegmentIDFK1]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations]  WITH CHECK ADD  CONSTRAINT [configuredByUserIDFK1] FOREIGN KEY([configuredbyUserID])
REFERENCES [dbo].[VotuUsers] ([userId])
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] CHECK CONSTRAINT [configuredByUserIDFK1]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations]  WITH CHECK ADD  CONSTRAINT [notiTemplateIDFK1] FOREIGN KEY([notificationTemplateID])
REFERENCES [dbo].[VotuNotificationTemplates] ([notiTemplateId])
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] CHECK CONSTRAINT [notiTemplateIDFK1]
GO
ALTER TABLE [dbo].[VotuVotingConfigurations]  WITH CHECK ADD  CONSTRAINT [proposalIDFK2] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuVotingConfigurations] CHECK CONSTRAINT [proposalIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingResults]  WITH CHECK ADD  CONSTRAINT [proposalIDFK3] FOREIGN KEY([proposalID])
REFERENCES [dbo].[VotuProposals] ([proposalId])
GO
ALTER TABLE [dbo].[VotuVotingResults] CHECK CONSTRAINT [proposalIDFK3]
GO
ALTER TABLE [dbo].[VotuVotingResults]  WITH CHECK ADD  CONSTRAINT [votingSegmentIDFK2] FOREIGN KEY([votingSegmentID])
REFERENCES [dbo].[VotuVotingSegments] ([votingSegmentId])
GO
ALTER TABLE [dbo].[VotuVotingResults] CHECK CONSTRAINT [votingSegmentIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingSegments]  WITH CHECK ADD  CONSTRAINT [cantonIDFK2] FOREIGN KEY([cantonID])
REFERENCES [dbo].[VotuCantones] ([cantonesId])
GO
ALTER TABLE [dbo].[VotuVotingSegments] CHECK CONSTRAINT [cantonIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingSegments]  WITH CHECK ADD  CONSTRAINT [countryIDFK2] FOREIGN KEY([countryID])
REFERENCES [dbo].[VotuCountries] ([countryId])
GO
ALTER TABLE [dbo].[VotuVotingSegments] CHECK CONSTRAINT [countryIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingSegments]  WITH CHECK ADD  CONSTRAINT [distritoIDFK2] FOREIGN KEY([districtID])
REFERENCES [dbo].[VotuDistritos] ([distritosId])
GO
ALTER TABLE [dbo].[VotuVotingSegments] CHECK CONSTRAINT [distritoIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingSegments]  WITH CHECK ADD  CONSTRAINT [provinceIDFK2] FOREIGN KEY([provinceID])
REFERENCES [dbo].[VotuProvinces] ([provincesId])
GO
ALTER TABLE [dbo].[VotuVotingSegments] CHECK CONSTRAINT [provinceIDFK2]
GO
ALTER TABLE [dbo].[VotuVotingSegments]  WITH CHECK ADD  CONSTRAINT [votingConfigurationsIDFK1] FOREIGN KEY([votingConfigurationsID])
REFERENCES [dbo].[VotuVotingConfigurations] ([votingConfigurationsId])
GO
ALTER TABLE [dbo].[VotuVotingSegments] CHECK CONSTRAINT [votingConfigurationsIDFK1]
GO
ALTER TABLE [dbo].[VotuAITasks]  WITH CHECK ADD CHECK  (([status]='ERROR' OR [status]='DONE' OR [status]='RUNNING' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[VotuEncriptionKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
ALTER TABLE [dbo].[VotuIdentityValidations]  WITH CHECK ADD CHECK  (([status]='REJECTED' OR [status]='APPROVED' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[VotuUserKeys]  WITH CHECK ADD CHECK  (([purpose]='BOTH' OR [purpose]='SIG' OR [purpose]='ENC'))
GO
USE [master]
GO
ALTER DATABASE [Caso3] SET  READ_WRITE 
GO

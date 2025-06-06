USE [Caso3]
GO
/****** Object:  Table [dbo].[VotuOrganizations]    Script Date: 2/6/2025 23:09:56 ******/
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
 CONSTRAINT [PK_VotuOrganizations] PRIMARY KEY CLUSTERED 
(
	[organizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuOrganizationTypes]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuProposalDocuments]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuProposals]    Script Date: 2/6/2025 23:09:56 ******/
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
	[statusID] [int] NOT NULL,
	[budgetCurrencyID] [int] NULL,
 CONSTRAINT [PK_VotuProposals] PRIMARY KEY CLUSTERED 
(
	[proposalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuProposalStatus]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuProposalTypes]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuProposalValidations]    Script Date: 2/6/2025 23:09:56 ******/
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
	[validationUserID] [int] NULL,
	[validatorKeyShareID] [int] NULL,
	[aiTaskID] [int] NULL,
 CONSTRAINT [PK_VotuProposalValidations] PRIMARY KEY CLUSTERED 
(
	[proposalValidationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotuUserOrganizations]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuUserRoles]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuUsers]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuVotes]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuVotingConfigurations]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuVotingResults]    Script Date: 2/6/2025 23:09:56 ******/
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
/****** Object:  Table [dbo].[VotuVotingSegments]    Script Date: 2/6/2025 23:09:56 ******/
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
	[organizationsIDs] [varchar](500) NULL,
	[institutionTypes] [varchar](500) NULL,
 CONSTRAINT [PK_VotuVotingSegments] PRIMARY KEY CLUSTERED 
(
	[votingSegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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

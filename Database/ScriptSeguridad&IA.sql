USE Caso3
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.VotuEncriptionKeys','U') IS NULL
CREATE TABLE dbo.VotuEncriptionKeys(
    KeyId INT IDENTITY(1,1) PRIMARY KEY,
    KeyType VARCHAR(8) NOT NULL,
    KeySizeBits SMALLINT NOT NULL,
    publicKey VARBINARY(MAX) NULL,
    vaultRef NVARCHAR(200) NOT NULL,
    purpose VARCHAR(6) NOT NULL CHECK (purpose IN ('ENC','SIG','BOTH')),
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    expiresAt DATETIME2(6) NULL,
    isActive BIT NOT NULL DEFAULT 1,
    comment NVARCHAR(200) NULL
)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='uq_VotuEncriptionKeys_active' AND object_id=OBJECT_ID('dbo.VotuEncriptionKeys'))
CREATE UNIQUE INDEX uq_VotuEncriptionKeys_active ON dbo.VotuEncriptionKeys(KeyType,purpose) WHERE isActive=1
GO

IF OBJECT_ID('dbo.VotuUserKeys','U') IS NULL
CREATE TABLE dbo.VotuUserKeys(
    userKeyId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    KeyId INT NOT NULL,
    purpose VARCHAR(6) NOT NULL CHECK (purpose IN ('ENC','SIG','BOTH')),
    isActive BIT NOT NULL DEFAULT 1,
    assignedAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    revokedAt DATETIME2(6) NULL,
    lastUsedAt DATETIME2(6) NULL,
    comment NVARCHAR(200) NULL,
    FOREIGN KEY(KeyId) REFERENCES dbo.VotuEncriptionKeys(KeyId),
    FOREIGN KEY(userId) REFERENCES dbo.VotuUsers(userId)
)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='uq_VotuUserKeys_active' AND object_id=OBJECT_ID('dbo.VotuUserKeys'))
CREATE UNIQUE INDEX uq_VotuUserKeys_active ON dbo.VotuUserKeys(userId,purpose) WHERE isActive=1
GO

IF OBJECT_ID('dbo.VotuPepperSalts','U') IS NULL
CREATE TABLE dbo.VotuPepperSalts(
    saltId INT IDENTITY(1,1) PRIMARY KEY,
    saltPurpose VARCHAR(20) NOT NULL,
    saltValue VARBINARY(64) NOT NULL,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    rotatedAt DATETIME2(6) NULL,
    isActive BIT NOT NULL DEFAULT 1,
    comment NVARCHAR(200) NULL
)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='uq_VotuPepperSalts_active' AND object_id=OBJECT_ID('dbo.VotuPepperSalts'))
CREATE UNIQUE INDEX uq_VotuPepperSalts_active ON dbo.VotuPepperSalts(saltPurpose) WHERE isActive=1
GO

IF OBJECT_ID('dbo.VotuMFAMethods','U') IS NULL
CREATE TABLE dbo.VotuMFAMethods(
    mfaId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    methodType VARCHAR(20) NOT NULL,
    secret VARBINARY(256) NOT NULL,
    addedAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    lastVerifiedAt DATETIME2(6) NULL,
    isActive BIT NOT NULL DEFAULT 1,
    comment NVARCHAR(200) NULL,
    FOREIGN KEY(userId) REFERENCES dbo.VotuUsers(userId)
)
GO

IF OBJECT_ID('dbo.VotuIdentityChecks','U') IS NULL
CREATE TABLE dbo.VotuIdentityChecks(
    checkId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    taskId BIGINT NULL,
    checkType VARCHAR(30) NOT NULL,
    result BIT NOT NULL,
    score DECIMAL(5,2) NULL,
    checkedAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    comment NVARCHAR(400) NULL,
    FOREIGN KEY(userId) REFERENCES dbo.VotuUsers(userId)
)
GO

IF OBJECT_ID('dbo.VotuIdentityValidations','U') IS NULL
CREATE TABLE dbo.VotuIdentityValidations(
    validationId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    validatorId INT NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('PENDING','APPROVED','REJECTED')),
    signedAt DATETIME2(6) NULL,
    comment NVARCHAR(400) NULL,
    FOREIGN KEY(userId) REFERENCES dbo.VotuUsers(userId),
    FOREIGN KEY(validatorId) REFERENCES dbo.VotuUsers(userId)
)
GO

IF OBJECT_ID('dbo.VotuAccessRestrictions','U') IS NULL
CREATE TABLE dbo.VotuAccessRestrictions(
    restrictionId INT IDENTITY(1,1) PRIMARY KEY,
    entityType VARCHAR(10) NOT NULL,
    entityId INT NOT NULL,
    ruleType VARCHAR(10) NOT NULL,
    ruleDefinition NVARCHAR(400) NOT NULL,
    activeFrom DATETIME2(6) NOT NULL,
    activeTo DATETIME2(6) NULL,
    isActive BIT NOT NULL DEFAULT 1,
    comment NVARCHAR(200) NULL
)
GO

IF OBJECT_ID('dbo.VotuSecurityEvents','U') IS NULL
CREATE TABLE dbo.VotuSecurityEvents(
    eventId BIGINT IDENTITY(1,1) PRIMARY KEY,
    actorHash VARBINARY(64) NOT NULL,
    eventType VARCHAR(30) NOT NULL,
    targetEntity VARCHAR(50) NULL,
    payloadHash VARBINARY(64) NULL,
    ip VARCHAR(45) NULL,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME()
)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='ix_VotuSecurityEvents_actor' AND object_id=OBJECT_ID('dbo.VotuSecurityEvents'))
CREATE INDEX ix_VotuSecurityEvents_actor ON dbo.VotuSecurityEvents(actorHash,createdAt DESC)
GO

IF OBJECT_ID('dbo.VotuLedger','U') IS NULL
CREATE TABLE dbo.VotuLedger(
    ledgerId BIGINT IDENTITY(1,1) PRIMARY KEY,
    tableName VARCHAR(50) NOT NULL,
    recordId BIGINT NOT NULL,
    prevHash VARBINARY(64) NULL,
    currHash VARBINARY(64) NOT NULL,
    sig VARBINARY(MAX) NOT NULL,
    timestamp DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME()
)
GO

IF OBJECT_ID('dbo.VotuKeyShares','U') IS NULL
CREATE TABLE dbo.VotuKeyShares(
    shareId INT IDENTITY(1,1) PRIMARY KEY,
    KeyId INT NOT NULL,
    userId INT NOT NULL,
    sharePart VARBINARY(MAX) NOT NULL,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY(KeyId) REFERENCES dbo.VotuEncriptionKeys(KeyId),
    FOREIGN KEY(userId) REFERENCES dbo.VotuUsers(userId)
)
GO

IF OBJECT_ID('dbo.VotuAIModels','U') IS NULL
CREATE TABLE dbo.VotuAIModels(
    modelId INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    provider VARCHAR(50) NOT NULL,
    version VARCHAR(20) NOT NULL,
    endpointUrl NVARCHAR(200) NOT NULL,
    isEnabled BIT NOT NULL DEFAULT 1,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME()
)
GO

IF OBJECT_ID('dbo.VotuAITasks','U') IS NULL
CREATE TABLE dbo.VotuAITasks(
    taskId BIGINT IDENTITY(1,1) PRIMARY KEY,
    modelId INT NOT NULL,
    taskTrigger VARCHAR(30) NOT NULL,
    entityTable VARCHAR(50) NULL,
    entityId BIGINT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'PENDING' CHECK (status IN ('PENDING','RUNNING','DONE','ERROR')),
    requestedAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    startedAt DATETIME2(6) NULL,
    completedAt DATETIME2(6) NULL,
    FOREIGN KEY(modelId) REFERENCES dbo.VotuAIModels(modelId)
)
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='uq_AITasks_running' AND object_id=OBJECT_ID('dbo.VotuAITasks'))
CREATE UNIQUE INDEX uq_AITasks_running ON dbo.VotuAITasks(modelId,entityTable,entityId) WHERE status='RUNNING'
GO

IF OBJECT_ID('dbo.VotuAITaskPayloads','U') IS NULL
CREATE TABLE dbo.VotuAITaskPayloads(
    payloadId BIGINT IDENTITY(1,1) PRIMARY KEY,
    taskId BIGINT NOT NULL,
    direction CHAR(3) NOT NULL,
    payload VARBINARY(MAX) NOT NULL,
    sizeBytes INT NULL,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY(taskId) REFERENCES dbo.VotuAITasks(taskId)
)
GO

IF OBJECT_ID('dbo.VotuAIValidationResults','U') IS NULL
CREATE TABLE dbo.VotuAIValidationResults(
    resultId BIGINT IDENTITY(1,1) PRIMARY KEY,
    taskId BIGINT NOT NULL,
    isValid BIT NOT NULL,
    score DECIMAL(5,2) NULL,
    summary NVARCHAR(4000) NULL,
    createdAt DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY(taskId) REFERENCES dbo.VotuAITasks(taskId)
)
GO
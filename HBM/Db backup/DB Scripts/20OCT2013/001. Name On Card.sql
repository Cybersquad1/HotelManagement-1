/*
   Monday, October 21, 20137:07:13 AM
   User: sa
   Server: (local)
   Database: HBM
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Customer
	DROP CONSTRAINT FK_Customer_Status
GO
ALTER TABLE dbo.Status SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Customer
	DROP CONSTRAINT FK_Customer_GuestType
GO
ALTER TABLE dbo.GuestType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Customer
	DROP CONSTRAINT FK_Customer_Company
GO
ALTER TABLE dbo.Company SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Customer
	(
	CustomerId int NOT NULL IDENTITY (1, 1),
	CompanyId int NOT NULL,
	CustomerName nvarchar(100) NOT NULL,
	MemberCode nvarchar(50) NOT NULL,
	Gender varchar(10) NOT NULL,
	GuestTypeId int NOT NULL,
	Phone nvarchar(25) NULL,
	Fax nvarchar(25) NULL,
	Mobile nvarchar(25) NULL,
	Email nvarchar(50) NULL,
	CompanyName nvarchar(100) NULL,
	CompanyAddress nvarchar(150) NULL,
	CompanyNotes nvarchar(MAX) NULL,
	BillingAddress nvarchar(MAX) NULL,
	BillingCity nvarchar(50) NULL,
	BillingState nvarchar(50) NULL,
	BillingCountry nvarchar(50) NULL,
	BillingPostCode nvarchar(50) NULL,
	PassportNumber nvarchar(50) NULL,
	PassportCountryOfIssue nvarchar(50) NULL,
	PassportExpirationDate datetime NULL,
	CCType int NULL,
	CCNo int NULL,
	CCExpirationDate datetime NULL,
	CCNameOnCard nvarchar(100) NULL,
	Car nvarchar(50) NULL,
	CarLicensePlate nvarchar(50) NULL,
	DriverLicense nvarchar(50) NULL,
	StatusId int NOT NULL,
	CreatedUser int NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedUser int NULL,
	UpdatedDate datetime NULL,
	IsDeleted bit NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Customer SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Customer ON
GO
IF EXISTS(SELECT * FROM dbo.Customer)
	 EXEC('INSERT INTO dbo.Tmp_Customer (CustomerId, CompanyId, CustomerName, MemberCode, Gender, GuestTypeId, Phone, Fax, Mobile, Email, CompanyName, CompanyAddress, CompanyNotes, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostCode, PassportNumber, PassportCountryOfIssue, PassportExpirationDate, CCType, CCNo, CCExpirationDate, CCNameOnCard, Car, CarLicensePlate, DriverLicense, StatusId, CreatedUser, CreatedDate, UpdatedUser, UpdatedDate, IsDeleted)
		SELECT CustomerId, CompanyId, CustomerName, MemberCode, Gender, GuestTypeId, Phone, Fax, Mobile, Email, CompanyName, CompanyAddress, CompanyNotes, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostCode, PassportNumber, PassportCountryOfIssue, PassportExpirationDate, CCType, CCNo, CCExpirationDate, CONVERT(nvarchar(100), CCNameOnCard), Car, CarLicensePlate, DriverLicense, StatusId, CreatedUser, CreatedDate, UpdatedUser, UpdatedDate, IsDeleted FROM dbo.Customer WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Customer OFF
GO
ALTER TABLE dbo.Reservation
	DROP CONSTRAINT FK_Reservation_Customer
GO
DROP TABLE dbo.Customer
GO
EXECUTE sp_rename N'dbo.Tmp_Customer', N'Customer', 'OBJECT' 
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	CustomerId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	FK_Customer_Company FOREIGN KEY
	(
	CompanyId
	) REFERENCES dbo.Company
	(
	CompanyId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	FK_Customer_GuestType FOREIGN KEY
	(
	GuestTypeId
	) REFERENCES dbo.GuestType
	(
	GuestTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	FK_Customer_Status FOREIGN KEY
	(
	StatusId
	) REFERENCES dbo.Status
	(
	StatusId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Reservation ADD CONSTRAINT
	FK_Reservation_Customer FOREIGN KEY
	(
	CustomerId
	) REFERENCES dbo.Customer
	(
	CustomerId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Reservation SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

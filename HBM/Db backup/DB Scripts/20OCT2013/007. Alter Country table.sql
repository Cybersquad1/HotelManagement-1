/*
   Monday, October 21, 20137:46:03 AM
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
CREATE TABLE dbo.Tmp_Country
	(
	CountryId int NOT NULL IDENTITY (1, 1),
	CountryCode nchar(2) NOT NULL,
	CountryName nvarchar(100) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Country SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Country ON
GO
IF EXISTS(SELECT * FROM dbo.Country)
	 EXEC('INSERT INTO dbo.Tmp_Country (CountryId, CountryCode, CountryName)
		SELECT CountryId, CountryCode, CountryName FROM dbo.Country WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Country OFF
GO
DROP TABLE dbo.Country
GO
EXECUTE sp_rename N'dbo.Tmp_Country', N'Country', 'OBJECT' 
GO
ALTER TABLE dbo.Country ADD CONSTRAINT
	PK_Country PRIMARY KEY CLUSTERED 
	(
	CountryId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Country', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Country', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Country', 'Object', 'CONTROL') as Contr_Per 